{-# LANGUAGE DeriveGeneric #-}

module Main where

-- Módulos propios
import Common
import Eval
import Parse
import Parse_SVG
import ParseSVGElements as PSE
import PrettyPrint
import Rectangles

-- Módulos prestados 
import Control.Exception
import Control.Monad.ST

import Data.ByteString as BS
import Data.Hashable
import qualified Data.HashTable.ST.Cuckoo as C
import qualified Data.HashTable.IO as H
import Data.List as L
import Data.Maybe (fromJust, isJust, isNothing)
import Data.String as S
import Data.Text as T
import Data.STRef

import GHC.Generics (Generic)
import Graphics.Gloss
import Graphics.SVG.ReadPath

import Text.XmlHtml as XML

import System.IO as SIO
import System.Environment
import System.Console.Readline
import System.Directory (doesFileExist)


-- Data definitions --
----------------------

type HashTable k v = H.CuckooHashTable k v

--bla = newSTReif

data Search  = R -- Rectangle
               | Po -- Polygon
               | Pa -- Path
               | All -- Everything 
            deriving Show 

data State   = S { k :: Float, nuc :: Int, sc :: IO (HashTable Key Container), sp :: Polygons } --deriving Show

data Key     = K MyPoint Int deriving (Generic, Show)

instance Eq Key where
    K p1 id1 == K p2 id2 = p1 == p2

instance Hashable Key where
    hash (K p id) = floor (fst p * snd p)

-- Code --
----------

--main :: IO ()
--main = print "Main"

main :: IO ()
main = do printHello
          args <- getArgs
          readEvalPrintLoop args (S {k = 0, nuc = 0, sc = H.new, sp = []})

printHello :: IO ()
printHello = do SIO.putStrLn "\n*** Intérprete de polígonos ***" 
                SIO.putStrLn ":? para desplegar ayuda\n"

printHelp :: IO ()
printHelp = do SIO.putStrLn "\nLista de comandos:"
               SIO.putStrLn ":?           -> Ayuda"
               SIO.putStrLn ":b           -> Imprimir las definiciones actuales"
               SIO.putStrLn ":c           -> Borrar todas las definiciones realizadas (tanto de archivos como en el intérprete)"
               SIO.putStrLn ":sk v        -> Fijar el valor del kerf en v"
               SIO.putStrLn ":l f         -> Cargar el archivo f"
               SIO.putStrLn ":lc f        -> Cargar los rectángulos definidos en el archivo SVG f"
               SIO.putStrLn ":lpo f       -> Cargar los polígonos definidos en el archivo SVG f"
               SIO.putStrLn ":lpa f       -> Cargar los paths definidos en el archivo SVG f"
               SIO.putStrLn ":la f        -> Cargar los rectángulos, polígonos y paths definidos en el archivo SVG f"
               SIO.putStrLn ":dp c        -> Definir el rectángulo c desde el intérprete"
               SIO.putStrLn ":dp p        -> Definir el polígono p desde el intérprete"
               SIO.putStrLn $ ":d c m t p s -> Ejecutar el algoritmo con todos los elementos cargados (c: contenedor seleccionado" ++ 
                              "\n                m: cardinal del conjunto poblacional, t: cantidad de iteraciones, p : probilidad de" ++
                              "\n                rotación, s: nombre del archivo de destino)"
               

readEvalPrintLoop :: [String] -> State -> IO ()
readEvalPrintLoop args s = 
    do maybeLine <- readline ">> "
       case maybeLine of
           Nothing   -> return ()
           Just ":q" -> return ()
           Just line -> do addHistory line                             
                           s' <- parseCommands line s
                           c  <- sc s'
                           l  <- H.toList c
                           SIO.putStrLn ""
                           print l
                           print (sp s')
                           SIO.putStrLn ""
                           readEvalPrintLoop args s'

parseCommands :: String -> State -> IO State
parseCommands str s
    | L.null w  = return s
    | otherwise = case L.head w of
                    ":?"   -> do printHelp
                                 return s
                    ":b"   -> do print (sp s)
                                 return s
                    ":c"   -> return (s {k = 0, nuc = 0, sc = H.new, sp = []})
                    ":sk"  -> case parseFloat t' of
                                Parse.Ok v       -> 
                                    checkKerf v s
                                Parse.Failed str -> 
                                    do SIO.putStrLn str
                                       return s
                    ":l"   -> parseFiles t s
                    ":lc"  -> parseSVGFiles t s R
                    ":lpo" -> parseSVGFiles t s Po
                    ":lpa" -> parseSVGFiles t s Pa
                    ":la"  -> parseSVGFiles t s All
                    ":dp"  -> case parseDefs t' 1 of
                                Parse.Ok v       -> 
                                    checkPolygons (L.map evalDefP v) s
                                Parse.Failed str -> 
                                    do SIO.putStrLn str
                                       return s
                    ":dc"  -> case parseDefs t' 1 of
                                Parse.Ok v       -> 
                                    checkCons (L.map evalDefC v) s
                                Parse.Failed str -> 
                                    do SIO.putStrLn str
                                       return s
                    ":d"   -> do evalState s t 
                                 return s
                    _      -> do SIO.putStrLn "Comando desconocido, por favor reintente"
                                 return s
    where w  = L.words str
          t  = L.tail w
          t' = S.unwords t

-- Chequeo de tipos --
----------------------

checkKerf :: Float -> State -> IO State
checkKerf v s = if v >= 0
                then return (s {k = v})
                else do SIO.putStrLn "El valor del kerf debe ser mayor o igual a 0"
                        return s

checkCons :: Containers -> State -> IO State
checkCons cs s = if L.null n
                 then res
                 else do SIO.putStrLn "Los siguientes contenedores no son válidos: "
                         print n -- PRETTYPRINTER
                         res
    where (j, n) = sepJN cs checkCon 
          res    = return (s {sc = insertC (sc s) (nuc s) j, nuc = L.length j + nuc s + 1})

insertC :: IO (HashTable Key Container) -> Int -> Containers -> IO (HashTable Key Container)
insertC ht _ []     = ht
insertC ht n (c:cs) = do ht' <- ht
                         H.insert ht' (K (width_r c, height_r c) n) (c {rid = n})
                         insertC (return ht') (n + 1) cs
                         return ht' 

checkPolygons ps s = catch (checkPols ps s checkPol)
                           (\e -> do let err = show (e :: ErrorCall)
                                     checkPols ps s checkPolSlow)

checkPols ps s f = if L.null n
                   then res 
                   else do SIO.putStrLn "Los siguientes polígonos no son válidos: "
                           print n -- PRETTYPRINTER
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

-- Comando :d --
----------------                
 
evalState :: State -> [String] -> IO ()  
evalState s str = do a <- parseArgs str
                     case a of 
                        Just (c, m, t, p, s) -> 
                            return ()
                        _                    -> return ()


parseArgs :: [String] -> IO (Maybe (Int, Int, Int, Float, String))
parseArgs [c, m, t, p, s] = 
    case reads c :: [(Int, String)] of
        [(n, "")] -> 
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
                                                            False -> return (Just (n, n1, n2, v, st))
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
parseSVGFile f s t = do SIO.putStrLn $ "Abriendo " ++ f ++ "..."
                        if L.isSuffixOf ".svg" f
                        then do str <- catch (BS.readFile f)
                                       (\e -> do let err = show (e :: IOException)
                                                 SIO.hPutStr stderr ("*** Error: no se pudo abrir" ++ err ++ "\n")
                                                 return "")
                                case parseXML "" str of
                                     Left st -> do SIO.putStrLn $ f ++ st
                                                   return s
                                     Right d -> let dcon = docContent d
                                                in case t of
                                                    R   -> parse (L.map T.unpack (getElements dcon lookR "rect")) s t
                                                    Po  -> parse (L.map T.unpack (getElements dcon lookP "polygon")) s t
                                                    Pa  -> parse (L.map T.unpack (getElements dcon lookD "path")) s t
                                                    All -> do s'  <- parse (L.map T.unpack (getElements dcon lookR "rect")) s R
                                                              s'' <- parse (L.map T.unpack (getElements dcon lookP "polygon")) s' Po
                                                              parse (L.map T.unpack (getElements dcon lookD "path")) s'' Pa
                        else do SIO.putStrLn "*** Error: no es un archivo SVG"
                                return s

parse []     s t = return s
parse (x:xs) s t = case t of 
                    R  -> case parseRect x of
                            PSE.Ok v       ->
                                do s' <- checkCons [evalRect v] s
                                   parse xs s' t
                            PSE.Failed str ->
                                parse xs s t                                         
                    Po -> case parsePolygon x of
                            PSE.Ok v       ->
                                do s' <- checkPolygons [evalSVGPol v (k s)] s 
                                   parse xs s' t
                            PSE.Failed str ->
                                parse xs s t                                                              
                    Pa -> case parsePath x of                                        
                            PSE.Ok v       ->
                                do s' <- checkPolygons [evalPath v (k s)] s
                                   parse xs s' t
                            PSE.Failed str ->
                                parse xs s t                                         


parseFiles :: [String] -> State -> IO State
parseFiles [] s     = return s
parseFiles (f:fs) s = do s' <- parseFile f s
                         parseFiles fs s'  

parseFile :: String -> State -> IO State
parseFile f s = do SIO.putStrLn $ "Abriendo " ++ f ++ "..."
                   str <- catch (SIO.readFile f)
                                (\e -> do let err = show (e :: IOException)
                                          SIO.hPutStr stderr ("*** Error: no se pudo abrir " ++ err ++ "\n")
                                          return "")  
                   case parseMac str of
                        Parse.Failed st -> do SIO.putStrLn $ f ++ ": " ++ st
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
