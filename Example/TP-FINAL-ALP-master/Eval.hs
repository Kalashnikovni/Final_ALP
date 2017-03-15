module Eval where

import Representacion
import DepTree
import qualified Data.Set as S
import Parse
import Valores
import Data.Char
import Data.Time
import System.IO.Error

 
 
parsear :: String -> IO Exp
parsear "" = return (Unit ())
parsear s =  parseExpr (lexer s)



evaluar :: Celda -> Grafo -> IO ()
evaluar c g =  do i <- infocelda c g
	          eliminarVecinos g i
	          (do nuevaExpr <- parsear (strexpr i)
	              (t,v) <- evalExpr c nuevaExpr g
	              actualizarCelda c t (strexpr i) v g)
	             `catchIOError` (\e -> do {(t,v) <- raiseErr "PARSE ERROR"; actualizarCelda c t (strexpr i) v g})



evalExpr :: Celda -> Exp -> Grafo -> IO (Typ,Valor)
evalExpr ce (Str s) g = returnStr s
evalExpr ce (Fl f) g = returnNum f
evalExpr ce (Bo b) g = returnBool b
evalExpr ce (Date d) g = returnDay d
evalExpr ce (Unit ()) g = newVal
evalExpr ce (Eval e) g = (evalExpr' ce e g)
			 `catchIOError` (\e -> case (ioeGetErrorString e) of
						s ->  raiseErr s)


evalExpr' :: Celda -> ExpEval -> Grafo -> IO (Typ,Valor)
evalExpr' ce (Var dep) g =  do i <- infocelda dep g
			       i' <- infocelda ce g 
			       b <- existeCamino ce dep g
			       if b then do ginsertaDependencia i i' g
					    raiseErr "CICLO DETECTADO" 
				    else do ginsertaDependencia i i' g 
					    e <- parsear (strexpr i) 
					    r <- evalExpr dep e g
					    return r
-----------------------------------------------
evalExpr' ce (Ran c1 c2) g = raiseErr "VALOR"
-----------------------------------------------			     
evalExpr' ce (EStr s) g = returnStr s

-----------------------------------------------
evalExpr' ce (EFl f) g = returnNum f
-----------------------------------------------
evalExpr' ce (EBo b) g = returnBool b
-----------------------------------------------
evalExpr' ce (EDate d) g = returnDay d
-----------------------------------------------
evalExpr' ce (Mas e1 e2) g = do v1 <- evalExpr' ce e1 g
			        v2 <- evalExpr' ce e2 g
			        n1 <- getNum v1
				n2 <- getNum v2
				returnNum (n1+n2)
-----------------------------------------------			        
evalExpr' ce (Menos e1 e2) g = do v1 <- evalExpr' ce e1 g
			          v2 <- evalExpr' ce e2 g
			          n1 <- getNum v1
				  n2 <- getNum v2
				  returnNum (n1-n2)			          
-----------------------------------------------			          
evalExpr' ce (Por e1 e2) g = do v1 <- evalExpr' ce e1 g
			        v2 <- evalExpr' ce e2 g
			        n1 <- getNum v1
				n2 <- getNum v2
				returnNum (n1*n2)
-----------------------------------------------			        
evalExpr' ce (Div e1 e2) g =  do v1 <- evalExpr' ce e1 g
			         v2 <- evalExpr' ce e2 g
			         n1 <- getNum v1
				 n2 <- getNum v2
				 if n2 == 0 then raiseErr "DIVISION POR CERO"
				 	    else returnNum (n1*n2)
			         
-----------------------------------------------

evalExpr' ce (Ig e1 e2) g =do a <- evalExpr' ce e1 g
			      b <- evalExpr' ce e2 g
			      returnBool (a == b)
-----------------------------------------------
evalExpr' ce (Menor e1 e2) g =do v1 <- evalExpr' ce  e1 g
			         v2 <- evalExpr' ce e2 g
			         n1 <- getNum v1
				 n2 <- getNum v2
				 returnBool (n1 < n2)
-----------------------------------------------


evalExpr' ce (Mayor e1 e2 ) g = do v1 <- evalExpr' ce  e1 g
			           v2 <- evalExpr' ce e2 g
			           n1 <- getNum v1
				   n2 <- getNum v2
				   returnBool (n1 > n2)

-----------------------------------------------


evalExpr' ce (MenorIg e1 e2) g =do v1 <- evalExpr' ce  e1 g
			           v2 <- evalExpr' ce e2 g
			           n1 <- getNum v1
				   n2 <- getNum v2
				   returnBool (n1 <= n2)


-----------------------------------------------

evalExpr' ce (MayorIg e1 e2 ) g = do v1 <- evalExpr' ce  e1 g
			             v2 <- evalExpr' ce e2 g
			             n1 <- getNum v1
				     n2 <- getNum v2
				     returnBool (n1 >= n2)

-----------------------------------------------


evalExpr' ce (And e1 e2) g = do v1 <- evalExpr' ce  e1 g
			        v2 <- evalExpr' ce e2 g
			        b1 <- getBool v1
				b2 <- getBool v2
				returnBool (b1 && b2)

-----------------------------------------------

evalExpr' ce (Or e1 e2) g = do v1 <- evalExpr' ce  e1 g
			       v2 <- evalExpr' ce e2 g
			       b1 <- getBool v1
			       b2 <- getBool v2
			       returnBool (b1 || b2)
			      
			      
-----------------------------------------------


evalExpr' ce (Suma []) g = returnNum 0
evalExpr' ce (Suma [Ran c1 c2]) g = do cellList <- armarLista c1 c2 g
				       evalExpr' ce (Suma cellList) g
evalExpr' ce (Suma (e:xs)) g= do v1 <- evalExpr' ce  e g
		                 v <- evalExpr' ce (Suma xs) g
			         n1 <- getNum v1
				 n <- getNum v
			         returnNum (n1+n)

-----------------------------------------------

			         
evalExpr' ce (Abs e) g = do v <- evalExpr' ce e g
		            n <- getNum v
			    if n < 0 then returnNum (-1*n) else returnNum n			    
		            

-----------------------------------------------
		            
evalExpr' ce  (Concat []) g = returnStr ""
evalExpr' ce  (Concat [Ran c1 c2]) g = do cellList <- armarLista c1 c2 g
					  evalExpr' ce (Concat cellList) g
evalExpr' ce  (Concat (e:xs)) g = do v1 <- evalExpr' ce  e g
		                     v <- evalExpr' ce (Concat xs) g
			             s1 <- getStr v1
				     s <- getStr v
			             returnStr (s1++s)
			             
-----------------------------------------------

			             
evalExpr' ce (Opuesto e) g = do v <- evalExpr' ce e g
		                n <- getNum v
			        returnNum (-1*n)	
-----------------------------------------------

evalExpr' ce (Si e1 e2 e3) g = do v <- evalExpr' ce e1 g
				  v1 <- evalExpr' ce e2 g
				  v2 <- evalExpr' ce e3 g
				  b <- getBool v
				  if b then return v1 else return v2

-----------------------------------------------
evalExpr' ce (Potencia e1 e2) g = do v1 <- evalExpr' ce e1 g
				     v2 <- evalExpr' ce e2 g
				     n1 <- getNum v1
				     n2 <- getNum v2
				     returnNum (n1**n2)

-----------------------------------------------

evalExpr' ce (ContarSi e1 (Ran c1 c2)) g = do cellList <- armarLista c1 c2 g
                                              contarSi ce e1 cellList g
evalExpr' ce (ContarSi e1 (Var c)) g = evalExpr' ce (Si (sustituirSimb c e1) (EFl 1) (EFl 0)) g
evalExpr' ce (ContarSi e1 e2) g = raiseErr "VALOR"

-----------------------------------------------

evalExpr' ce Hoy g = do t <- getCurrentTime
			returnDay (utctDay t)

-----------------------------------------------
evalExpr' ce (DiasEntre e1 e2) g = do v1 <- evalExpr' ce e1 g
				      v2 <- evalExpr' ce e2 g
				      d1 <- getDay v1
				      d2 <- getDay v2
				      returnNum (diasEntre d1 d2)
------------------------------------------------
evalExpr' ce (DiaPascua e1) g = do v <- evalExpr' ce e1 g
				   y <- getNum v
			           let year = floor y
				       a = mod year 19
				       b = div year 100
				       c = mod year 100
				       d = div b 4
				       e = mod b 4
				       f = div (b+8) 25
				       g' = div (b-f+1) 3
				       h = mod (19*a+b-d-g'+15) 30
				       i = div c 4
				       k = mod c 4
				       l = mod (32+2*e+2*i-h-k) 7
				       m = div (a + 11*h + 22*l) 451
				       n = h + l - 7*m+114
				       month = div n 31
				       day = 1 + (n - (month*31)) in returnDay (fromGregorian (fromIntegral year) month day)



------------------------------------------------
evalExpr' ce (CantYears e1 e2) g = do v1 <- evalExpr' ce e1 g
				      v2 <- evalExpr' ce e2 g
				      d1 <- getDay v1
				      d2 <- getDay v2
				      returnNum (aniosEntre d1 d2)

------------------------------------------------
evalExpr' ce (DistrExpN e1 e2 e3) g = do v1 <- evalExpr' ce e1 g
					 v2 <- evalExpr' ce e2 g 
					 v3 <- evalExpr' ce e3 g
					 x <- getNum v1
					 lambda <- getNum v2
					 c <- getNum v3
					 case c of
					     0 -> returnNum (lambda * ((exp 1)**(-1*lambda*x)))
					     _ -> returnNum (1 - ((exp 1)**(-1*lambda*x)))







armarLista :: Celda -> Celda -> Grafo -> IO [ExpEval]
armarLista (c1,n1) (c2,n2) g = if c1 == c2 then if n1 == n2 then do return [Var (c2,n2)] 
					                    else if n1 > n2 then return [] 
									    else do explist <- armarLista (c1,n1+1) (c2,n2) g
										    return (Var (c2,n1) : explist)
					   else if (fromEnum (c1!!0)) > (fromEnum (c2!!0)) then return []
						else do explist1 <- armarLista (c1,n1) (c1,n2) g
							explist2 <- armarLista ([chr (fromEnum (c1!!0)+1)],n1) (c2,n2) g
							return (explist1 ++ explist2)









contarSi :: Celda -> ExpEval -> [ExpEval] -> Grafo -> IO (Typ,Valor)
contarSi ce e1 [] g = returnNum 0
contarSi ce e1 ((Var c):xs) g = do v1 <- evalExpr' ce (sustituirSimb c e1) g --condición que tiene que cumplir la celda
                                   v <- contarSi ce e1 xs g -- número de celdas que cumplen la condición
				   b <- getBool v1
				   n <- getNum v
				   if b then returnNum (1+n) else returnNum n




lengthYear :: Integer -> Int
lengthYear y = if isLeapYear y then 366 else 365 

diasEntre :: Day -> Day -> Float
diasEntre x y = let (y1,m1,d1) = toGregorian x
		    (y2,m2,d2) = toGregorian y in
		               if y1 == y2 then if m1 == m2 then fromIntegral (d2 - d1)
							    else fromIntegral(
								 d2 + -- dias anteriores del dia en el mes m2
								 foldl (\a b -> gregorianMonthLength y2 b + a) 0 [m1+1..m2-1] + -- dias de los meses posteriores a m1 y anteriores a m2
							         (gregorianMonthLength y1 m1 - d1) -- dias posteriores del dia en el mes m1
								 )
					   else fromIntegral (
                                                d2 + -- dias anteriores del dia en el mes m2
						foldl (\a b -> gregorianMonthLength y2 b + a) 0 [1..m2-1] + -- dias de Enero hasta dias del mes anterior
						foldl (\a b -> lengthYear b + a) 0 [y1+1..y2-1] + -- todos los dias de los años entre y1 e y2
						foldl (\a b -> gregorianMonthLength y1 b + a) 0 [m1+1..12] + -- dias desde el mes actual hasta Diciembre
						(gregorianMonthLength y1 m1 - d1) -- dias posteriores del dia en el mes m1
						)

aniosEntre :: Day -> Day -> Float
aniosEntre x y = let (y1,m1,d1) = toGregorian x
		     (y2,m2,d2) = toGregorian y in
		                if m2 > m1 then fromIntegral (y2 - y1)
					   else if m2 < m1 then fromIntegral (y2 - y1 -1)
							   else if d2 < d1 then fromIntegral (y2 - y1 -1)
									   else fromIntegral (y2 - y1)                                           
 
 




						
			     -- Hay que tratar de no hacer calculos innecesarios
			     -- Arbol de dependencias
			     -- backend



