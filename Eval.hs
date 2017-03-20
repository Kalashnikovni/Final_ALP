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
-------------i-

--evalSVG ::  
--evalSVG = 

--check_pol :: Polygon -> Maybe Polygon 
--check_pol
