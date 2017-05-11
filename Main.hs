{-# LANGUAGE OverloadedStrings #-}

module Main where

-- Módulos propios
import Common
import Draw
import Eval
import Parse
import Parse_SVG
import ParseSVGElements as PSE
import Polygons as Pol --(embedPols, takeOut, rotate, getRotateds, getContainers)
import PrettyPrint as PP
import Rectangles

-- Módulos prestados 
import Control.Exception
import Control.Monad.ST

import Data.ByteString as BS (readFile)
import Data.Char (isSpace)
import Data.List as L
import Data.Maybe (fromJust, isJust, isNothing)
import Data.Set as Set
import Data.String as S
import Data.Text as T (unpack, append)

import Graphics.SVG.ReadPath

import Text.PrettyPrint.HughesPJ as PJ (render, float)
import Text.XmlHtml as XML

import System.IO as SIO
import System.Environment
import System.Console.Readline
import System.Directory (doesFileExist)


-- Data definitions --
----------------------

data Command = Help
             | Browse
             | Clear
             | SetK String
             | Load String
             | LoadC String
             | LoadPo String
             | LoadLines String
             | LoadPa String
             | LoadAll String
             | DefC String
             | DefP String
             | Draw String
             | Noop

data Search  = R -- Rectangle
               | Po -- Polygon
               | Pl -- Polyline
               | Pa -- Path
               | All -- Everything 
            deriving Show 

data State   = S { k :: Float, nuc :: Int, sc :: Set Container, sp :: Polygons } --deriving Show

-- Code --
----------

main :: IO ()
main = do printHello
          args <- getArgs
          readEvalPrintLoop args (S {k = 0, nuc = 0, sc = Set.empty, sp = []})

printHello :: IO ()
printHello = do SIO.putStrLn "\n*** Intérprete de polígonos ***" 
                SIO.putStrLn ":? para desplegar ayuda\n"
 
readEvalPrintLoop :: [String] -> State -> IO ()
readEvalPrintLoop args s = 
    do maybeLine <- readline ">> "
       case maybeLine of
           Nothing   -> return ()
           Just ":q" -> return ()
           Just line -> do addHistory line                             
                           c  <- interpretCommand line
                           s' <- handleCommand c s
                           readEvalPrintLoop args s'

data InteractiveCommand = Cmd [String] String (String -> Command) String  

commands :: [InteractiveCommand]
commands = 
    [Cmd [":help", ":?"] "" (const Help) "-> Ayuda",
     Cmd [":browse", ":b"] "" (const Browse) "-> Imprimir las definiciones actuales",
     Cmd [":clear", ":c"] "" (const Clear) "-> Borrar todas las definiciones realizadas (tanto de archivos como en el intérprete)",
     Cmd [":setkerf", ":sk"] "<float>" SetK "-> Fijar el valor del kerf a <float>",
     Cmd [":load",":l"] "<file>" Load "-> Cargar el archivo <file>",
     Cmd [":loadcontainers", ":lc"] "<file>" LoadC "-> Cargar los rectángulos definidos en el archivo SVG <file>",
     Cmd [":loadpolygons", ":lpo"] "<file>" LoadPo "-> Cargar los polígonos definidos en el archivo SVG <file>",
     Cmd [":loadpolylines",":lpl"] "<file>" LoadLines "-> Cargar los polylines definidos en el archivo SVG <file>",
     Cmd [":loadpaths",":lpa"] "<file>" LoadPa "-> Cargar los paths definidos en el archivo SVG <file>",
     Cmd [":loadall", ":la"] "<file>" LoadAll "-> Cargar los rectángulos, polígonos y paths definidos en el archivo SVG <file>",
     Cmd [":defc", ":dc"] "<expr>" DefC "-> Definir el rectángulo <expr> desde el intérprete",
     Cmd [":defp ", "dp"] "<expr>" DefP "-> Definir el polígono <expr> desde el intérprete",
     Cmd [":draw", ":d"] "<c> <m> <t> <p> <s>" Draw 
                         ("-> Ejecutar el algoritmo con todos los elementos cargados (c: contenedor seleccionado, " ++ 
                          "m: cardinal del conjunto poblacional, t: cantidad de iteraciones, p : probilidad de " ++
                          "rotación, s: nombre del archivo de destino)")]


interpretCommand :: String -> IO Command
interpretCommand s = if isPrefixOf ":" s 
                     then do let (cmd, t) = break isSpace s
                                 t'       = dropWhile isSpace t
                             let matching = L.filter (\(Cmd cs _ _ _) -> any (cmd ==) cs) commands
                             case matching of
                                [] -> 
                                    do putStrLn "Comando desconocido, por favor reintente" 
                                       return Noop
                                [Cmd _ _ f _] ->
                                    return (f t')
                                _ -> do putStrLn ("Comando ambiguo")
                                        return Noop
                     else do putStrLn "Comando desconocido, por favor reintente"
                             return Noop

handleCommand :: Command -> State -> IO State
handleCommand cmd s = 
    case cmd of
        Help        -> do printHelp
                          return s
        Browse      -> do printEnv s
                          return s
        Clear       -> return (s {k = 0, sc = Set.empty, nuc = 0, sp = []})  
        SetK k      -> case parseFloat k of
                        Parse.Ok v       -> 
                            checkKerf v s
                        Parse.Failed str -> 
                            do putStrLn str
                               return s
        Load f      -> parseFiles (words f) s
        LoadC f     -> parseSVGFiles (words f) s R
        LoadPo f    -> parseSVGFiles (words f) s Po
        LoadLines f -> parseSVGFiles (words f) s Pl
        LoadPa f    -> parseSVGFiles (words f) s Pa
        LoadAll f   -> parseSVGFiles (words f) s All
        DefP e      -> case parseDefs e 1 of
                        Parse.Ok v       -> 
                            checkPolygons (L.map evalDefP v) s
                        Parse.Failed str -> 
                            do SIO.putStrLn str
                               return s
        DefC e      -> case parseDefs e 1 of
                        Parse.Ok v       -> 
                            checkCons (L.map evalDefC v) s
                        Parse.Failed str -> 
                            do SIO.putStrLn str
                               return s
        Draw a      -> do evalState (words a) s 
                          return s
        Noop        -> return s

printHelp :: IO ()
printHelp = do putStrLn "Los comandos disponibles son los siguientes:"
               putStrLn ""
               mapM_ putStrLn (L.map (\x -> Main.complete (concat (intersperse ", " (getNames x))) ++ getHelp x) commands)

complete :: String -> String
complete s = s ++ (replicate (25 - length s) ' ')

getNames :: InteractiveCommand -> [String]
getNames (Cmd s _ _ _) = s

getHelp :: InteractiveCommand -> String
getHelp (Cmd _ _ _ h) = h

printEnv :: State -> IO ()
printEnv s = do putStr "Kerf: "
                print (k s)
                putStrLn ""
                putStrLn "Contenedores: "
                putStrLn (PJ.render (printContainers (toList (sc s))))
                putStrLn "Polígonos: "
                putStrLn (PJ.render (printPolygons (sp s)))

-- Comando :d --
----------------                
 
evalState :: [String] -> State -> IO ()  
evalState str s = do a <- parseArgs str
                     case a of 
                        Just (c, m, t, pro, str') -> 
                            do let eP  = embedPols (sp s)
                               let con = findMin (Set.filter (\x -> rid x == c) (sc s))
                               let res = geneticAlgorithm (L.map fstThree eP) con m t pro 
                               case res of
                                Just v  ->
                                    do r <- getRotateds v (L.map fstThree eP)
                                       pols <- getPols eP r v
                                       SIO.writeFile str' (draw con (L.map p pols))
                                       return ()
                                Nothing ->
                                    do SIO.putStrLn "Noup!"
                                       print con
                                       return ()
                        _                    -> 
                            return ()

fstThree :: (a, b, c) -> a
fstThree (a, b, c) = a 

-- El polígono actual a introducir
-- Containers rotados
-- Containers del algoritmo genetico
getPols :: [(Container, Polygon, Polygon)] -> [Int] -> Containers -> IO Polygons
getPols [] cr cga                = return []
getPols ((c, po, por):ps) cr cga 
    | notElem (rid c) cr = do res <- getPols ps cr cga
                              return (po {p = L.map (\(x, y) -> (x + p1x v, y + p1y v)) (p po)} : res)
    | otherwise          = do res <- getPols ps cr cga
                              return (por {p = L.map (\(x, y) -> (x + p1x v, y + p1y v)) (p por)} : res) 
    where Just v = find (\x -> rid x == rid c) cga


--BORRAR
fromC :: Container -> [MyPoint]
fromC c = [(p1x c, p1y c), (p2x c, p1y c), (p2x c, p2y c), (p1x c, p2y c)]

parseArgs :: [String] -> IO (Maybe (Int, Int, Int, Float, String))
parseArgs [c, m, t, p, s] = 
    case reads c :: [(Int, String)] of
        [(c, "")] -> 
            case reads m :: [(Int, String)] of
                [(n1, "")] -> 
                    case reads t :: [(Int, String)] of
                        [(n2, "")] ->
                            case parseFloat p of
                                Parse.Ok v       ->
                                    case reads s :: [(String, String)] of
                                        [(st, "")] -> do b <- doesFileExist st
                                                         case b of
                                                            True  -> do SIO.putStrLn "\nArchivo existente, elija otro nombre\n"
                                                                        return Nothing
                                                            False -> if n1 < 1 || n2 < 1 || v < 0 || v > 1
                                                                     then printiarg
                                                                     else return (Just (c, n1, n2, v, st))
                                Parse.Failed str -> do SIO.putStrLn str
                                                       return Nothing
                        _                  -> printiarg 
                _                   -> printiarg
        _                 -> printiarg
parseArgs _ = printiarg 

printiarg :: IO (Maybe a)
printiarg = do SIO.putStrLn invalidarg
               return Nothing

invalidarg = "\nArgumento inválido, por favor reintente\n"

-- Parsing de archivos --
-------------------------

parseSVGFiles :: [String] -> State -> Search -> IO State
parseSVGFiles [] s _     = return s
parseSVGFiles (f:fs) s t = do s' <- parseSVGFile f s t
                              parseSVGFiles fs s' t 

-- El tercer argumento es para saber qué clase de elementos se busca dentro del archivo SVG
parseSVGFile :: String -> State -> Search -> IO State
parseSVGFile f s t = do putStrLn $ "Abriendo " ++ f ++ "..."
                        if L.isSuffixOf ".svg" f
                        then do str <- catch (BS.readFile f)
                                       (\e -> do let err = show (e :: IOException)
                                                 SIO.hPutStr stderr ("*** Error: no se pudo abrir" ++ err ++ "\n")
                                                 return "")
                                case parseXML "" str of
                                     Left st -> do putStrLn $ f ++ st
                                                   return s
                                     Right d -> 
                                        let dcon = docContent d
                                            r    = L.map T.unpack (getElements dcon lookR "rect")
                                            po   = L.map T.unpack (getElements dcon lookP "polygon")
                                            pl   = L.map T.unpack (L.map (T.append "pl ") (getElements dcon lookP "polyline")) 
                                            pa   = L.map T.unpack (getElements dcon lookD "path")
                                        in case t of
                                            R   -> parse r s t
                                            Po  -> parse po s t
                                            Pl  -> parse pl s t
                                            Pa  -> parse pa s t
                                            All -> do s'   <- parse r s R
                                                      s''  <- parse po s' Po
                                                      s''' <- parse pl s'' Pl
                                                      parse pa s''' Pa
                        else do putStrLn "*** Error: no es un archivo SVG"
                                return s

parse []     s t = return s
parse (x:xs) s t = case t of 
                    R  -> case parseRect x of
                            PSE.Ok v       ->
                                do s' <- checkCons [evalRect v] s
                                   parse xs s' t
                            PSE.Failed str ->
                                do SIO.putStrLn str
                                   parse xs s t                                         
                    Po -> case parsePolygon x of
                            PSE.Ok v       ->
                                do s' <- checkPolygons [evalSVGPol v (k s)] s 
                                   parse xs s' t
                            PSE.Failed str ->
                                do SIO.putStrLn str
                                   parse xs s t                                                              
                    Pl -> case parsePolyLine x of
                            PSE.Ok v       ->
                                do s' <- checkPolygons [evalSVGPol v (k s)] s 
                                   parse xs s' t
                            PSE.Failed str ->
                                do SIO.putStrLn str
                                   parse xs s t                                                              
                    Pa -> case parsePath x of                                        
                            PSE.Ok v       ->
                                do s' <- checkPolygons [evalPath v (k s)] s
                                   parse xs s' t
                            PSE.Failed str ->
                                do SIO.putStrLn str
                                   parse xs s t                                         


parseFiles :: [String] -> State -> IO State
parseFiles [] s     = return s
parseFiles (f:fs) s = do s' <- parseFile f s
                         parseFiles fs s'  

parseFile :: String -> State -> IO State
parseFile f s = do putStrLn $ "Abriendo " ++ f ++ "..."
                   str <- catch (SIO.readFile f)
                                (\e -> do let err = show (e :: IOException)
                                          hPutStr stderr ("*** Error: no se pudo abrir " ++ err ++ "\n")
                                          return "")  
                   if str == ""
                   then return s
                   else case parseMac str of
                            Parse.Failed st -> do putStrLn $ f ++ ": " ++ st
                                                  return s 
                            Parse.Ok v      -> do s1 <- checkKerf (getKerf v) s
                                                  s2 <- checkCons (fst (evalMac v)) s1
                                                  checkPolygons (snd (evalMac v)) s2 

getDefs :: Machine -> [Def]
getDefs (Kerf _ ds) = ds

getKerf :: Machine -> Float
getKerf (Kerf k _) = k

setKerf :: Machine -> Float -> Machine
setKerf (Kerf _ ds) k = Kerf k ds  

-- Chequeo de tipos --
----------------------

checkKerf :: Float -> State -> IO State
checkKerf v s = if v >= 0
                then return (s {k = v})
                else do putStrLn "El valor del kerf debe ser mayor o igual a 0"
                        return s

checkCons :: Containers -> State -> IO State
checkCons cs s = if L.null n
                 then res
                 else do putStrLn "Los siguientes contenedores no son válidos: "
                         putStrLn $ PJ.render (printContainers n) 
                         res
    where (j, n) = sepJN cs checkCon 
          res    = return (insertC j s)

insertC :: Containers -> State -> State
insertC [] s     = s  
insertC (c:cs) s = insertC cs (s {sc = Set.insert (c {rid = nuc s}) (sc s), nuc = nuc s + 1}) 

checkPolygons ps s = catch (checkPols ps s checkPol)
                           (\e -> do let err = show (e :: ErrorCall)
                                     checkPols ps s checkPolSlow)

checkPols ps s f = if L.null n
                   then res 
                   else do putStrLn "Los siguientes polígonos no son válidos: "
                           putStrLn $ PJ.render (printPolygons n) 
                           res 
    where (j, n) = sepJN ps f 
          res    = return (s {sp = sp s ++ j})

-- El lado izquierdo son los polígonos legales
sepJN :: [a] -> (a -> Maybe a) -> ([a], [a])
sepJN []     f = ([], [])
sepJN (x:xs) f = case f x of
                    Just v  -> (v : (fst s'), snd s') 
                    Nothing -> (fst s', x : (snd s'))
    where s' = sepJN xs f
