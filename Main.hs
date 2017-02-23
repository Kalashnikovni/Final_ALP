module Main where

-- Módulos propios
import Rectangles

-- Módulos prestados 
import System.IO
import System.Environment

-- Data definitions --
----------------------
data Command = Help
               | Load Mode 
               | PolygonComm [Point]
               | Container [Point]
               | Draw 

data Mode    = Interactive String
               | File String

---------------------

main :: IO ()
main = do printHello
          printHelp
          args <- getArgs
          evalcomm args

printHello :: IO ()
printHello = do putStrLn "*** Intérprete de polígonos ***" 
                putStrLn ":? para desplegar ayuda"

printHelp :: IO ()
printHelp = do putStrLn "Comandos: "
               putStrLn ":l {file} - Cargar archivo"
               --putStrLn ":r - Volver a cargar archivo actual"
               putStrLn ":p {[Point]} - Definir polígono"
               putStrLn ":c {[Point]} - Definir contenedor (rectangular)"
               putStrLn ":d {polygon} - Dibujar polígono"

evalcomm :: String -> IO ()
 
