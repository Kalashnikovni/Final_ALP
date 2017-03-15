module ParseFiles where

import Data.Char
import Representacion



data Assign = Empty
	| Let Celda String
	| Cat Assign Assign
	deriving (Show)

parseCelda :: String -> IO (Celda,String)
parseCelda cs 
	| cs!!0 == ' ' = parseCelda (tail cs)
	| otherwise = if t3 == ("",0) then ioError (userError "parse error1") else return (t3 ,rest')
		where (columna,rest) = span (\x -> isAlpha x) cs
		      t1 	  = map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a'))) columna
		      (fila,rest') = if rest == [] then ("",[]) else span isDigit rest 
		      t2	 = if fila /= "" then read (fila) else -555
		      t3 	 = if (t2 /= -555) && (length t1 == 1) && (t2 <= 99) then (t1,t2) else ("",0)

parseFile :: String -> IO Assign
parseFile [] = return Empty
parseFile (c:cs) 
	| c == ' ' || c == '\n' = parseFile cs
	| otherwise = parseFile' (c:cs)

parseFile' :: String -> IO Assign
parseFile' cs = do (cell,rest') <- parseCelda cs
		   parseFile'' cell rest'


parseFile'' :: Celda -> String -> IO Assign
parseFile'' cell [] = return Empty
parseFile'' cell (c:cs) 
		| c == ' ' || c == '\n' = parseFile'' cell cs
		| c == ':' = parseFile''' cell cs

parseFile''' :: Celda -> String -> IO Assign
parseFile''' cell [] = return Empty
parseFile''' cell str
		| str!!0 == ' ' = parseFile''' cell (tail str)
		| otherwise = case span (\x -> x /= ';') str of
	 		 (exps,rest) -> if exps == "" then do assign <- parseFile (tail rest)	
							      return (Cat Empty assign)
						      else if (rest == "") then ioError (userError "parse error4")
						           else if (tail rest == "") then return (Let cell exps) 
								else do assign <- parseFile (tail rest)
									return (Cat (Let cell exps) assign)

						
			 
