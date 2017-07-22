-- =======================================================
-- ===== Última etapa donde se acercan los polígonos =====
-- =======================================================

module Shrink where

-- Módulos propios
import Common as C
import Eval (getSegs)

-- Módulos prestados
import Data.List as L
import Data.Maybe (isJust)

import Graphics.Gloss.Geometry.Line (intersectSegSeg)

-- Tipos de datos --
--------------------

type SpPolygons = (Polygons, Polygons)

data Direction = Hor | Ver deriving (Eq, Show)

constant = 1.0

-- Código --
------------

shrink :: SpPolygons -> Polygons
shrink (ps, [])   = ps
shrink ([], q:qs) = shrink ([q], qs)
shrink (ps, q:qs)
    | snd (minY (p q)) > 0 = recBottom ps q qs
    | otherwise            = recLeft ps q qs

recBottom :: Polygons -> C.Polygon -> Polygons -> Polygons
recBottom bef pol aft = if pol == new 
                        then shrink (bef ++ [pol], aft)  
                        else recLeft bef new aft 
    where new = bottom bef pol

recLeft bef pol aft = if pol == new
                      then shrink (bef ++ [pol], aft)
                      else recBottom bef new aft
    where new = left bef pol

bottom bef pol
    | or (L.map (polygonCutA pol) bef) || 
      (snd (minY (p pol)) < 0) = pol
    | otherwise                = bottom bef (translate pol constant Ver) 

left bef pol  
    | or (L.map (polygonCutA pol) bef) 
      || (fst (minX (p pol)) < 0) = pol 
    | otherwise                   = left bef (translate pol constant Hor)

translate :: C.Polygon -> Float -> Direction -> C.Polygon
translate pol i d 
    | d == Ver   = pol {p = L.map (\(x, y) -> (x, y - i)) points}
    | otherwise  = pol {p = L.map (\(x, y) -> (x - i, y)) points}
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

-- Polygon cut algorithm --
---------------------------

polygonCutA :: C.Polygon -> C.Polygon -> Bool
polygonCutA pol1 pol2 
    | b         = or [isJust (intersectSegSeg (fst e1) (snd e1) (fst e2) (snd e2)) | e1 <- edges1, e2 <- edges2]
    | otherwise = False
    where b       = not (L.null (p pol1) || L.null (p pol2))
          points1 = p pol1
          edges1  = getSegs (points1 ++ [L.head points1])
          points2 = p pol2
          edges2  = getSegs (points2 ++ [L.head points2])
