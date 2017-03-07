module Main where

-- Módulos propios
import Common
import Parse
import Parse_SVG
import Rectangles

-- Módulos prestados 
import Data.List
import Graphics.Gloss
import Graphics.SVG.ReadPath
import System.IO
import System.Environment
import System.Console.Readline
import Control.Exception

-- Data definitions --
----------------------
data Command = Help
               | Load String 
               | DefPol String
               | DefCon String
               | Noop
               | Draw deriving Show

data State   = S {env :: [Def]} 

---------------------

main :: IO ()
main = do printHello
          printOpt
          opt <- getArgs
          readEvalPrintLoop opt (S {env = []})

printHello :: IO ()
printHello = do putStrLn "\n*** Intérprete de polígonos ***" 
                putStrLn ":? para desplegar ayuda"

printOpt :: IO ()
printOpt = do putStrLn "\nModos de uso (ingrese la letra que se encuentra entre paréntesis de la opción deseada): "
              putStrLn "(I) <Intérprete> - Intérprete"
              putStrLn "(A) <Archivo>    - Comandos desde archivos"
              putStrLn "(S) <SVG>        - A partir de archivos svg\n"

readEvalPrintLoop :: [String] -> State -> IO ()
readEvalPrintLoop args s = 
    do maybeLine <- readline "»> "
       case maybeLine of
        Nothing   -> return ()
        Just ""   -> readEvalPrintLoop args s
        Just line -> do addHistory line
                        setMode line args s
                        readEvalPrintLoop args s

setMode :: String -> [String] -> State -> IO ()
setMode line args s
    | isPrefixOf "I" line = interpreter
    | isPrefixOf "A" line = fromFiles args s
    | isPrefixOf "S" line = fromSVG args s   
    | otherwise           = putStrLn "*** Opción inválida, reintente"
                               
interpreter :: IO ()
interpreter = putStrLn "Intérprete"

fromFiles :: [String] -> State -> IO ()
fromFiles args s = 
    do maybeLine <- readline "Archivo »> "
       case maybeLine of
        Nothing   -> return ()
        Just ""   -> fromFiles args s 
        Just line -> case line of
                        "end" -> do printOpt
                                    readEvalPrintLoop args s 
                        _     -> do addHistory line
                                    str <- catch (readFile line)
                                                 (\e -> do let err = show (e :: IOException)
                                                           hPutStr stderr ("*** Error al abrir el archivo " ++ line ++ "\n")
                                                           return "")
                                    fromFiles args s

fromSVG :: [String] -> State -> IO ()
fromSVG args s = 
    do maybeLine <- readline "Archivo SVG »> "
       case maybeLine of
        Nothing   -> return ()
        Just ""   -> fromFiles args s 
        Just line -> case line of
                        "end" -> do printOpt
                                    readEvalPrintLoop args s 
                        _     -> do addHistory line
                                    str <- catch (readFile line)
                                                 (\e -> do let err = show (e :: IOException)
                                                           hPutStr stderr ("*** Error al abrir el archivo SVG " ++ line ++ "\n")
                                                           return "")
                                    str' <- pSVG str parsesvg 
                                    case str' of
                                        Nothing -> putStrLn "Alo"
                                        Just v  -> do l <- mapM pathFromString v
                                                      print l
                                    fromSVG args s

parse :: String -> (String -> Parse.PR a) -> IO (Maybe a)
parse str f = case f str of
                Parse.Ok v     -> return (Just v)
                Parse.Failed s -> do putStrLn ("\n" ++ s)
                                     return Nothing

pSVG :: String -> (String -> Parse_SVG.PR a) -> IO (Maybe a)
pSVG str f = case f str of
                Parse_SVG.Ok v     -> return (Just v)
                Parse_SVG.Failed s -> do putStrLn ("\n" ++ s)
                                         return Nothing

--parseSvgFile :: FilePath -> IO (Maybe [PathCommand])
--parseSvgFile f = do x <- readFile
