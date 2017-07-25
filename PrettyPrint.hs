module PrettyPrint where

-- Módulos propios
import Common

-- Módulos prestados
import Text.PrettyPrint.HughesPJ as PJ

-- Funciones --
---------------

printContainer :: Container -> Doc
printContainer c = text ((nc c) ++ " ") <>
                   parens (int (rid c)) <>
                   text " : " <>
                   float (abs (p1x c - p2x c)) <>
                   text " x " <>
                   float (abs (p1y c - p2y c))

printContainers cs = printList cs printContainer
                     
printMyPointL' :: [MyPoint] -> Doc
printMyPointL' []           = text "" 
printMyPointL' [p]          = parens (float (fst p) <>
                                      text "," <>
                                      float (snd p))
printMyPointL' (p1:(p2:mp)) = parens (float (fst p1) <>
                                      text "," <>
                                      float (snd p1)) <>
                              text ", " <>
                              printMyPointL' (p2:mp) 

printPolygon :: Polygon -> Doc
printPolygon po = text (pn po) <>
                  text " : " <>
                  brackets (printMyPointL' (p po))

printPolygons ps = printList ps printPolygon

printList :: [a] -> (a -> Doc) -> Doc
printList [] _     = text ""
printList (x:xs) f = f x <>
                     text "\n" <>
                     printList xs f
                 
