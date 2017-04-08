module Main where

-- Módulos propios
import Common
import Parse
import Parse_SVG
import ParseSVGElements as PSE
import Eval
import Rectangles

-- Módulos prestados 
import Data.List as L
import Data.ByteString as BS
import Data.Text as T
import Data.String as S

import Text.XmlHtml as XML

import Graphics.Gloss
import Graphics.SVG.ReadPath

import System.IO as SIO
import System.Environment
import System.Console.Readline

import Control.Exception

-- Data definitions --
----------------------
data Command = Noop
               | Help -- :?
               | SetKerf String -- :sk 
               | Load [String] -- :l
               | LoadSVGC [String] -- :lsc
               | LoadSVGPo [String] -- :lspo
               | LoadSVGPa [String] -- :lspa
               | LoadSVGAll [String] -- :lsa
               | DefPol String -- :dp
               | DefCon String -- :dc
               | Draw -- :d
            deriving Show

data Search  = R -- Rectangle
               | Po -- Polygon
               | Pa -- Path
               | All -- Everything 
            deriving Show 

data State   = S { k :: Float, defs :: [Def], svg :: [SVG] } deriving Show

-- Code --
----------

--main :: IO ()
--main = print "Main"

main :: IO ()
main = do printHello
          args <- getArgs
          readEvalPrintLoop args (S {k = 0, defs = [], svg = []})

printHello :: IO ()
printHello = do SIO.putStrLn "\n*** Intérprete de polígonos ***" 
                SIO.putStrLn ":? para desplegar ayuda\n"

printHelp :: IO ()
printHelp = do SIO.putStrLn "\nLista de comandos:"
               SIO.putStrLn ":? -- Ayuda"
               SIO.putStrLn ":sk v -- Fijar el valor del kerf en v"
               SIO.putStrLn ":l f -- Cargar el archivo f"
               SIO.putStrLn ":lc f -- Cargar los rectángulos definidos en el archivo SVG f"
               SIO.putStrLn ":lpo f -- Cargar los polígonos definidos en el archivo SVG f"
               SIO.putStrLn ":lpa f -- Cargar los paths definidos en el archivo SVG f"
               SIO.putStrLn ":la f -- Cargar los rectángulos, polígonos y paths definidos en el archivo SVG f"
               SIO.putStrLn ":dp c -- Definir el rectángulo c desde el intérprete"
               SIO.putStrLn ":dp p -- Definir el polígono p desde el intérprete"
               SIO.putStrLn ":d -- Ejecutar el algoritmo con todos los elementos cargados\n"
               

readEvalPrintLoop :: [String] -> State -> IO ()
readEvalPrintLoop args s = 
    do maybeLine <- readline ">> "
       case maybeLine of
           Nothing   -> return ()
           Just ":q" -> return ()
           Just line -> do addHistory line                             
                           s' <- parseCommands line s
                           print s'
                           readEvalPrintLoop args s'

parseCommands :: String -> State -> IO State
parseCommands str s
    | L.null w  = return s
    | otherwise = case L.head w of
                    ":?"   -> do printHelp
                                 return s
                    ":sk"  -> case parseFloat t' of
                                Parse.Ok v       -> return (s {k = v})
                                Parse.Failed str -> do SIO.putStrLn str
                                                       return s
                    ":l"   -> parseFiles t s
                    ":lc"  -> parseSVGFiles t s R
                    ":lpo" -> parseSVGFiles t s Po
                    ":lpa" -> parseSVGFiles t s Pa
                    ":la"  -> parseSVGFiles t s All
                    ":dp"  -> case parseDefs t' 1 of
                                Parse.Ok v       -> return (s {defs = v})
                                Parse.Failed str -> do SIO.putStrLn str
                                                       return s
                    ":dc"  -> case parseDefs t' 1 of
                                Parse.Ok v       -> return (s {defs = v})
                                Parse.Failed str -> do SIO.putStrLn str
                                                       return s
                    ":d"   -> return s
                    _      -> do SIO.putStrLn "Comando desconocido, por favor reintente"
                                 return s
    where w  = L.words str
          t  = L.tail w
          t' = S.unwords t
                 
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
                                                              s'' <-parse (L.map T.unpack (getElements dcon lookP "polygon")) s' Po
                                                              parse (L.map T.unpack (getElements dcon lookD "path")) s'' Pa
                        else do SIO.putStrLn "*** Error: no es un archivo SVG"
                                return s

parse []     s t = return s
parse (x:xs) s t = case t of 
                    R  -> do s' <- parse' x parseRect s SVGR
                             parse xs s' t                                        
                    Po -> do s' <- parse' x parsePolygon s SVGPo
                             parse xs s' t                                        
                    Pa -> do s' <- parse' x parsePath s SVGPa
                             parse xs s' t                                        

parse' x p s f = case p x of
                     PSE.Failed st -> do SIO.putStrLn st
                                         return s
                     PSE.Ok v      -> return (s {svg = f v : svg s})

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
                        Parse.Ok v      -> return (s {k = getKerf v, defs = getDefs v ++ defs s})

getDefs :: Machine -> [Def]
getDefs (Kerf _ ds) = ds

getKerf :: Machine -> Float
getKerf (Kerf k _) = k
