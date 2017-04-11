module PrettyPrint where

-- Módulos propios
import Common

-- Módulos prestados
import Text.PrettyPrint.HughesPJ as PJ

printContainer :: Container -> Doc
printContainer c = text ((nc c) ++ " ") <>
                   parens (int (rid c)) <>
                   text " : " <>
                   PJ.float (abs (p1x c - p2x c)) <>
                   text " x " <>
                   PJ.float (abs (p1y c - p2y c))

printContainers cs = printList cs printContainer
                     
printMyPointL' :: [MyPoint] -> Doc
printMyPointL' []     = text "" 
printMyPointL' (p:mp) = text "(" <>
                        PJ.float (fst p) <>
                        text "," <>
                        PJ.float (snd p) <>
                        text ")" <>
                        text ", " <>
                        printMyPointL' mp 

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
                 
