module PreetyPrint where

import Representacion
import Valores
import DepTree


printValor :: Typ -> Valor -> IO ()
printValor TNumeric v = print (num v)
printValor TString v = print (str v)
printValor TBoolean v = print (boo v)
printValor TDate v = print (dat v)
printValor TUnit v = case (err v) of
			Ok -> putStrLn ""
			Err s -> print (Err s)





pp :: Grafo -> IO ()
pp g = do putStrLn "-------------------"
	  aplicar g (\a -> if (strexpr a) /= "" then pp' a else return ())
      where pp' infocelda = do putStr "celda: "
			       putStr (fst (celda infocelda))
			       print (snd (celda infocelda))
			       putStr "string: "
			       print (strexpr infocelda)
			       putStr "valor: "
			       printValor (typ infocelda) (valor infocelda)
			       putStrLn "-------------------"


