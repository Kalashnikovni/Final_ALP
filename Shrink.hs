-- =======================================================
-- ===== Última etapa donde se acercan los polígonos =====
-- =======================================================

{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Shrink where

-- Módulos propios
import Common as C
import GA (checkInside)
import Eval

-- Módulos prestados
import Algorithms.Geometry.LineSegmentIntersection.BentleyOttmann as BO
import Algorithms.Geometry.LineSegmentIntersection.Naive as N

import Control.Lens
import Control.Parallel
import Control.Parallel.Strategies

import Data.CircularSeq as CSeq
import Data.Discrimination.Sorting as Dis
import Data.Ext
import Data.Geometry as G
import Data.List as L
import Data.List.NonEmpty as NE

import Graphics.Gloss.Geometry.Line

-- Tipos de datos --
--------------------

type SpPolygons = (Polygons, Polygons)

data Direction = Hor | Ver deriving (Eq, Show)

constant = 3.0

-- Código --
------------

shrink :: SpPolygons -> Polygons
shrink (ps, [])   = ps
shrink ([], q:qs) = shrink ([q], qs) 
shrink (ps, q:qs) = bottom ps q qs constant

bottom bef pol aft dis
    | polygonCutAS pol (combinePolygons bef) = shrink (bef ++ [translate pol (-dis) Ver], aft)
    | otherwise                             = left bef (translate pol dis Ver) aft (dis + 3.0)

left bef pol aft dis
    | polygonCutAS pol (combinePolygons bef) = shrink (bef ++ [translate pol (-dis) Hor], aft)
    | otherwise                             = bottom bef (translate pol dis Hor) aft (dis + 3.0)

translate :: C.Polygon -> Float -> Direction -> C.Polygon
translate pol i d 
    | d == Ver  = pol {p = L.map (\(x, y) -> (x, y - i)) points}
    | otherwise = pol {p = L.map (\(x, y) -> (x - i, y)) points}
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

-- Unión de polígonos --
------------------------

combinePolygons :: Polygons -> C.Polygon
combinePolygons ps = C.P {p = L.map (\x -> (x ^. xCoord, x ^. yCoord)) (byAngle (minYCoord lop) lop), pn = ""}
    where lop = listOfPoints ps

byAngle :: Point 2 Float -> [Point 2 Float] -> [Point 2 Float] 
byAngle pt points = Dis.sortWith (\x -> round (100000000 * angleVV (toVector pt x) (v2 1 0)) :: Int) points

--byAngle :: Point 2 Float -> [Point 2 Float] -> [Point 2 Float] 
--byAngle pt points = sortOn (\x -> angleVV (toVector pt x) (v2 1 0)) points

-- Primer arg: origen, segundo arg: extremo
toVector :: Point 2 Float -> Point 2 Float -> Vector 2 Float
toVector p1 p2 = (point2 (p2 ^. xCoord - p1 ^. xCoord) (p2 ^. yCoord - p1 ^. yCoord)) ^. vector

listOfPoints :: Polygons -> [Point 2 Float]
listOfPoints ps = concat (parMap rseq (\x -> (parMap rseq (\y -> toGPoint y) (p x))) ps)

toGPoint :: MyPoint -> Point 2 Float
toGPoint (x, y) = point2 x y 

minYCoord :: [Point 2 Float] -> Point 2 Float  
minYCoord [pt]         = pt
minYCoord (p1:(p2:ps)) = if y1 < y2
                         then minYCoord (p1:ps)
                         else if y1 > y2
                              then minYCoord (p2:ps)
                              else if (p1 ^. xCoord) < (p2 ^. xCoord)
                                   then minYCoord (p1:ps)
                                   else minYCoord (p2:ps) 
    where y1 = p1 ^. yCoord 
          y2 = p2 ^. yCoord

angleVV :: Vector 2 Float -> Vector 2 Float -> Float
angleVV v1 v2 = (G.dot v1 v2) / ((norm v1) * (norm v2))

-- Polygon cut algorithm --
---------------------------

polygonCutA :: C.Polygon -> C.Polygon -> Bool
polygonCutA pol1 pol2 
    | b          = L.length (N.intersections (edges1 ++ edges2)) /= (L.length (N.intersections edges1) + L.length (N.intersections edges2))
    | otherwise  = False 
    where f      = NE.toList . CSeq.toNonEmpty
          b      = not (null (p pol1) || null (p pol2))
          edges1 = if b 
                   then f (toEdges (CSeq.fromList (L.map toSeqPoint (p pol1))))
                   else []
          edges2 = if b
                   then f (toEdges (CSeq.fromList (L.map toSeqPoint (p pol2))))
                   else []

polygonCutAS :: C.Polygon -> C.Polygon -> Bool
polygonCutAS pol1 pol2 
    | b          = L.length (slowInter (edges1 ++ edges2)) /= (L.length edges1 + L.length edges2)
    | otherwise  = False 
    where b      = not (null (p pol1) || null (p pol2))
          edges1 = getSegs (p pol1)
          edges2 = getSegs (p pol2)

slowInter :: [(MyPoint, MyPoint)] -> [Int]
slowInter []     = []
slowInter (l:ls) = slowLoop l ls ++ slowInter ls

slowLoop :: (MyPoint, MyPoint) -> [(MyPoint, MyPoint)] -> [Int]
slowLoop p [] = []
slowLoop p (x:xs) 
    | intersectSegSeg (fst p) (snd p) (fst x) (snd x) == Nothing = slowLoop p xs
    | otherwise = 1 : (slowLoop p xs)

--toSeqPoint :: MyPoint -> Point 2 Float FIXME: give type
toSeqPoint (x, y) = point2 x y :+ ()


