-- =======================================================
-- ===== Última etapa donde se acercan los polígonos =====
-- =======================================================

module Shrink where

-- Módulos propios
import Common as C
import Eval (getSegs)

-- Módulos prestados
import Control.Lens

import Data.Ext
import Data.Geometry.Point
import Data.Geometry.Polygon
import Data.List as L
import Data.Maybe (isJust)

import Graphics.Gloss.Geometry.Line (intersectSegSeg)

-- Definiciones de tipos de datos --
------------------------------------

type SpPolygons = (Polygons, Polygons)

data Direction  = Hor | Ver deriving (Eq, Show)

constant = 1.0

-- Funciones --
---------------

shrink :: SpPolygons -> Polygons
shrink (ps, [])   = ps
shrink ([], q:qs) = shrink ([q], qs)
shrink (ps, q:qs) = shrink (ps ++ [pickBest (oneShrink ps q : (map (oneShrink ps) valid))], qs)
    where r1         = reflect q
          r2         = reflect r1
          r3         = reflect r2
          (valid, _) = partition isValidReflect [r1, r2, r3]

isValidReflect :: C.Polygon -> Bool
isValidReflect pol = (minX points >= 0) && (minY points >= 0)
    where points = p pol

pickBest :: Polygons -> C.Polygon
pickBest ps = head (sortOn (minY . p) ps)

-- Gira 90° al polígono
reflect :: C.Polygon -> C.Polygon
reflect pol = pol {p = translate (-tx) (-ty) (map (\(x, y) -> (-y, x)) (translate tx ty points))}
    where points   = p pol
          cen      = centroid (fromPoints (map (\(x, y) -> point2 x y :+ ()) points)) 
          (tx, ty) = (cen ^. xCoord, cen ^. yCoord)

translate :: Float -> Float -> [MyPoint] -> [MyPoint]
translate tx ty points = map (\(x,y) -> (x - tx, y - ty)) points

oneShrink :: Polygons -> C.Polygon -> C.Polygon
oneShrink ps pol
    | snd (minY (p pol)) > 0 = recBottom ps pol 
    | otherwise              = recLeft ps pol
          
recBottom :: Polygons -> C.Polygon -> C.Polygon
recBottom bef pol = if pol == new 
                    then pol  
                    else recLeft bef new 
    where new = bottom bef pol

recLeft :: Polygons -> C.Polygon -> C.Polygon
recLeft bef pol = if pol == new
                  then pol
                  else recBottom bef new
    where new = left bef pol

bottom :: Polygons -> C.Polygon -> C.Polygon
bottom bef pol
    | or (L.map (polygonCutA pol) bef) || 
      (snd (minY points) <= 0) = pol {p = translate 0 (-constant) points}
    | otherwise                = bottom bef (pol {p = translate 0 constant points}) 
    where points = p pol

left :: Polygons -> C.Polygon -> C.Polygon
left bef pol  
    | or (L.map (polygonCutA pol) bef) || 
      (fst (minX points) <= 0) = pol {p = translate (-constant) 0 points} 
    | otherwise                = left bef (pol {p = translate constant 0 points})
    where points = p pol

minX :: [MyPoint] -> MyPoint
minX points = minimumBy byX points

byX :: MyPoint -> MyPoint -> Ordering
byX (x1, y1) (x2, y2) = if x1 < x2 
                        then LT
                        else if x1 == x2
                             then EQ
                             else GT

minY :: [MyPoint] -> MyPoint
minY points = minimumBy byY points 

byY :: MyPoint -> MyPoint -> Ordering
byY (x1, y1) (x2, y2) = if y1 < y2 
                        then LT
                        else if y1 == y2
                             then EQ
                             else GT

-- Polygon cut algorithm 

polygonCutA :: C.Polygon -> C.Polygon -> Bool
polygonCutA pol1 pol2 
    | b         = or [isJust (intersectSegSeg (fst e1) (snd e1) (fst e2) (snd e2)) | e1 <- edges1, e2 <- edges2]
    | otherwise = False
    where b       = not (L.null (p pol1) || L.null (p pol2))
          points1 = p pol1
          edges1  = getSegs (points1 ++ [L.head points1])
          points2 = p pol2
          edges2  = getSegs (points2 ++ [L.head points2])


