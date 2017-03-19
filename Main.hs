module Main where

-- Módulos propios
import Common
import Parse
import Parse_SVG
import Parse_Path
import Rectangles

-- Módulos prestados 
import Data.List as List
import Data.ByteString as BS
import Data.Text as Text

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

data State   = S { env :: Machine } 

-- Code --
----------

main :: IO ()
main = print "Main"

{-main :: IO ()
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
    in do x <- compileFiles args

compileFiles :: [String] -> State -> IO State
compileFiles [] s       = return (S {env = Kerf 0 []})
compileFiles (f : fs) s = do x <- compileFile
-}

compileFile :: String -> State -> IO State
compileFile f s = do SIO.putStrLn $ "Abriendo " ++ f ++ "..."
                     if List.isSuffixOf ".svg" f
                     then do str <- catch (BS.readFile f)
                                    (\e -> do let err = show (e :: IOException)
                                              SIO.hPutStr stderr ("*** Error: no se pudo abrir" ++ err)
                                              return "")
                             case parseXML "" str of
                                Left st -> return s
                                Right d -> let dcon = docContent d
                                               c    = get_elements dcon lookc "rect"
                                               po   = get_elements dcon lookp "polygon"
                                               pa   = get_elements dcon lookd "path"
                                           in return s
                     else do str <- catch (SIO.readFile f)
                                          (\e -> do let err = show (e :: IOException)
                                                    SIO.hPutStr stderr ("*** Error: no se pudo abrir " ++ err)
                                                    return "")  
                             case parseMac str of
                                Parse.Failed st -> do SIO.putStrLn $ "\n" ++ st
                                                      return s 
                                Parse.Ok v      -> return s

evalFile = print "Hey!"
