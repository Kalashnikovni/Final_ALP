module Eval where

-- Módulos propios
import Common

-- Módulos prestados
import Data.Either

-- Definitions --
-----------------

evalDefC :: Def -> Container
evalDefC (Dc _ c s) = (C {p1x = s * p1x c,
                          p1y = s * p1y c,
                          p2x = s * p2x c,
                          p2y = s * p2y c})

evalDefP :: Def -> Polygon
evalDefP (Dp _ (P p) s) = P (map (\(x,y) -> (x * s, y * s)) p)

-- Machine --
-------------

evalMac :: Machine -> (Containers, Polygons)
evalMac (Kerf k ds) = let (c, p)   = (filter isContainer ds, filter isPolygon ds)
                      in (Cs (map evalDefC c), Ps (map evalDefP p))

isContainer :: Def -> Bool
isContainer (Dc _ _ _) = True
isContainer _          = False

isPolygon :: Def -> Bool
isPolygon (Dp _ _ _) = True
isPolygon _          = False

-- SVGFiles --
--------------

evalPath :: [PathCommand] -> Polygon
evalPath ps = P (eP ps (0,0) True)

-- El bool es True si el comando es absoluto, y False en caso contrario
eP :: [PathCommand] -> MyPoint -> Bool -> [MyPoint]
eP []             _ b     = []
eP (M_rel p : ps) _ b     = p : (eP ps p False)
eP (M_abs p : ps) _ b     = p : (eP ps p True)
eP (H_rel f : ps) p' b    = let np = (fst p' + f, snd p')
                                  in np : (eP ps np b) 
eP (H_abs f : ps) p' b    = let np = (f, snd p')
                                  in np : (eP ps np b) 
eP (V_rel f : ps) p' b    = let np = (fst p', snd p' + f)
                                  in np : (eP ps np b) 
eP (V_abs f : ps) p' b    = let np = (fst p', f)
                                  in np : (eP ps np b) 
eP (L_rel p : ps) p' b    = let np = (fst p' + fst p, snd p' + snd p)
                                  in np : (eP ps np b)
eP (L_abs p : ps) _ b     = p : (eP ps p b)
eP (Complete p : ps) p' b = if b then eP (L_abs p : ps) p' b else eP (L_rel p : ps) p' b
eP (Z : _) _ _            = []

--evalSVG ::  
--evalSVG = 

--check_pol :: Polygon -> Maybe Polygon 
--check_pol
