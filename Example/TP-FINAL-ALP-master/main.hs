module Main where


import Representacion
import Eval
import DepTree
import Parse
import Valores
import System.Console.Readline
import System.IO
import System.IO.Error
import Data.Char
import System.Environment 
import ParseFiles
import PreetyPrint

   
-- Printer del selector de celdas
printCellSelector :: Bool -> Celda -> IO String
printCellSelector True (c,n) = return ("Seleccione una celda (con las flechas)>  "++c++show n)
printCellSelector False (c,n) = return (c++show n)

guardarHaciaArchivo :: Grafo -> String -> IO ()
guardarHaciaArchivo g s = do writeFile s ""
			     aplicar g (\info -> appendFile s ((fst (celda info))++show(snd (celda info))++": "++(strexpr info)++";\n")) 

-- Direcciones
data Directions = U | D | L | R | None
	deriving (Eq)

-- Obtiene del teclado una dirección dada una flecha
dir :: IO Directions
dir   = do hSetEcho stdin False
	   x1 <- getChar
	   if x1 == '\ESC' then do x2 <- getChar 
				   if x2 == '[' then do x3 <- getChar
						        if x3 == 'C' then return R
						        else if x3 == 'A' then return U
						        else if x3 == 'D' then return L
						        else if x3 == 'B' then return D
						        else if x3 == '\n' then return None
							else dir--do putStr "PARADO"
							        --return ()
					        else if x2 == '\n' then return None
						else dir--do putStr "PARADO"
				                     --   return ()         
                           else if x1 == '\n' then return None
			   else if x1 == 'q' || x1 == 'Q' then ioError (userError "---Terminado---") 
			   else if x1 == 'g' || x1 == 'G' then ioError (userError "---Guardando---") else dir

-- Dada una celda inicial, cambia hacia las celdas vecinas
cambiar :: Celda -> IO Celda
cambiar c = do putStr "\ESC[2K"
	       putStr "\ESC[1G"
	       s <- printCellSelector True c
	       putStr s
	       d <- dir
	       if d /= None then cambiar (cambiar' c d) else return c


cambiar' :: Celda -> Directions -> Celda
cambiar' (c,1) U = (c,1)
cambiar' ("A",n) L = ("A",n)
cambiar' (c,99) D = (c,99)
cambiar' ("Z",n) R = ("Z",n)
cambiar' (c,n) L = ([chr (fromEnum (c!!0) - 1)],n)
cambiar' (c,n) R = ([chr (fromEnum (c!!0) + 1)],n)
cambiar' (c,n) U = (c,n-1)
cambiar' (c,n) D = (c,n+1)
cambiar' (c,n) None = (c,n)



-- El interprete con un grafo como estado
interprete :: Grafo -> IO ()
interprete gra     =(do putStrLn "/////////////////////"
			c <- cambiar ("A",1)
			hSetEcho stdin True
                        e <- (parseExpr ([TokenEval] ++ [TokenCelda c]))
		        case e of
		                (Eval (Var c)) -> do putStrLn ""
		                                     y <- readline "Expresion> "
		                                     case y of
		                                           Nothing -> return ()
		                                           Just "_exit" -> ioError (userError "---Terminado---") 
							   Just "_save" -> ioError (userError "---Guardando---")
		                      			   Just str1 -> do actualizarCelda c TUnit str1 nuevoValor gra --let e = parseExpr (lexer str1) in
		 		      			                   gra <- bfs c gra evaluar
				      			                   putStrLn "/////////////////////"
				     	 		                   pp gra 
				      		  	                   interprete gra
		                _              -> ioError (error("sintax error")))
		       `catchIOError` (\e -> case (ioeGetErrorString e) of
						"---Guardando---" -> do putStrLn "\n---Guardando---"
									hSetEcho stdin True
								        s <- readline "Nombre Archivo> "
									case s of
									      Nothing -> return ()
									      Just str -> do guardarHaciaArchivo gra (str++".calc")
								        		     return ()
						other		  -> ioError (userError other))


readAssign :: Assign -> Grafo -> IO ()
readAssign Empty g = return ()
readAssign (Let cell exps) g = (do actualizarCelda cell TUnit exps nuevoValor g --let e = parseExpr (lexer str1) in
		 	           g <- bfs cell g evaluar
				   return ()) `catchIOError` (\e -> do { strcell <- printCellSelector False cell; main' ("ERROR DE PARSEO EN LA CELDA "++strcell++"\n")})
readAssign (Cat a1 a2) g = do readAssign a1 g
			      readAssign a2 g







mostrarMenu :: String -> IO ()
mostrarMenu e =do putStr "\ESC[2J"
	          hSetEcho stdin False
	          putStr e
	          putStrLn "Ingrese modo de uso:"
	          putStrLn "1- Interprete"
	          putStrLn "2- Interprete a partir de archivo"
	          putStrLn "3- Salir"
	          

getOp :: IO Char
getOp = do c <- getChar
	   return c


procesarOpc :: Char -> IO Grafo
procesarOpc op = case op of
		    '1'      ->   do g <- nuevoGrafo
	  		             return g
	            '2'      ->   do hSetEcho stdin True
				     s <- readline "Archivo> "
				     case s of
					 Nothing -> ioError (userError "file not passed")
					 Just str -> let n = length str - 5 in
							      case (take n str,drop n str) of
								   (str',".calc") -> (do g <- nuevoGrafo
										         s <- readFile str
										         a <- parseFile s
										         readAssign a g
										         pp g
										         return g)
						           	   (str',otherstr) -> ioError (userError "not valid file")
		    '3'      ->  ioError (userError "---Terminado---") 
		    n        ->  ioError (userError "not valid option")
		   


main' :: String -> IO ()
main' s = (do mostrarMenu s
	      op <- getOp
              g <- procesarOpc op
	      interprete g)
             `catchIOError` (\e -> case (ioeGetErrorString e) of
				  	"---Terminado---" -> do putStrLn "\n---Terminado---"
			 					return ()				       
                            		"does not exist"  -> main' "ARCHIVO NO EXISTENTE\n"
					"not valid option" -> main' "OPCION NO VALIDA, INTENTE DE VUELTA\n"
					"not valid file" -> main' "ARCHIVO NO VALIDO, INTENTE DE VUELTA\n"
					"file not passed" -> main' "ARCHIVO NO PASADO, INTENTE DE VUELTA\n"
					"parse error1" -> main' "Parseo de error\n"
					"parse error4" -> main' "Falta un ; (punto y coma)\n"
					_	       -> error "ERROR\n")
					   
main :: IO ()
main = main' ""                
                        


