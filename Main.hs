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

import Text.XmlHtml as XML

import Graphics.Gloss
import Graphics.SVG.ReadPath

import System.IO as SIO
import System.Environment
import System.Console.Readline

import Control.Exception

-- Data definitions --
----------------------
data Command = Help
               | Load String 
               | LoadSVGC String
               | LoadSVGP String
               | DefPol String
               | DefCon String
               | Noop
               | Draw deriving Show

data Search  = R -- Rectangle
               | Po -- Polygon
               | Pa -- Path
               | All deriving Show -- Everything

data State   = S { k :: Float, defs :: [Def], svg :: [SVG] } deriving Show

-- Code --
----------

--main :: IO ()
--main = print "Main"

main :: IO ()
main = do printHello
          args <- getArgs
          readEvalPrintLoop args (S {env = []})

printHello :: IO ()
printHello = do putStrLn "\n*** Intérprete de polígonos ***" 
                putStrLn ":? para desplegar ayuda"

readEvalPrintLoop :: [String] -> State -> IO ()
readEvalPrintLoop args s = 
    let loop = do maybeLine <- readline ""
                  case maybeLine of
                    Nothing   -> return ()
                    Just ""   -> return()
                    Just line -> do addHistory line                             
                                    readEvalPrintLoop args s
    in do x <- parseFiles args

parseFiles :: [String] -> State -> IO State
parseFiles [] s       = return s
parseFiles (f : fs) s = do x <- parseFile

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
                                                    All -> do parse (L.map T.unpack (getElements dcon lookR "rect")) s R
                                                              parse (L.map T.unpack (getElements dcon lookP "polygon")) s Po
                                                              parse (L.map T.unpack (getElements dcon lookD "path")) s P
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

