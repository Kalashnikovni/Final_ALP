-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

module Polygons where 

-- Módulos propios
import Common
import GA (widthR, heightR)

-- Módulos prestados
import Data.List

import Graphics.Gloss.Geometry.Line (intersectSegSeg, intersectLineLine)

-- Definición de tipos de datos --
----------------------------------

type Order = Int

rCons = 16 :: Float

-- Funciones -- 
---------------

-- Devuelve los puntos del poligono como si el eje estuviera definido por el p1 del contenedor
-- Las tripletas representan: Contenedor, polígono con eje en el container, polígono rotado con el eje en el container
embedPols :: Polygons -> [(Container, Polygon, Polygon)]
embedPols []      = []
embedPols (po:ps) = (a {rid = length ps}, b, c) : (embedPols ps)
    where (a, b, c) = (embedPol po (floor rCons)) 

-- Probamos con 16 posiciones en total
embedPol :: Polygon -> Int -> (Container, Polygon, Polygon)
embedPol po 0   = (fst mR, snd mR, snd (minRect (po {p = rotatePoints (p po) (pi / 2)})))
    where mR  = minRect po
embedPol po den 
    | areaCon (fst mR) < areaCon (fst (minRect po')) = embedPol po (den - 1)
    | otherwise                                      = embedPol po' (den - 1) 
    where po' = po {p = (rotatePoints (p po) (((fromIntegral den) * 2 * pi) / rCons))}
          mR  = minRect po

areaCon :: Container -> Float
areaCon c = abs (p1x c - p2x c) * abs (p1y c - p2y c)

minRect :: Polygon -> (Container, Polygon)
minRect po = (C {p1x = 0,
                 p1y = 0,
                 p2x = fst (maximumBy byXPos points) - minX,
                 p2y = snd (maximumBy byYPos points) - minY,
                 rid = -10,
                 nc  = pn po}, po {p = map (\(x,y) -> (x - minX, y - minY)) points})
    where points = p po
          minX   = fst (minimumBy byXPos points)
          minY   = snd (minimumBy byYPos points)

byXPos :: MyPoint -> MyPoint -> Ordering
byXPos p1 p2 = if fst p1 < fst p2
               then LT
               else if fst p1 > fst p2
                    then GT
                    else EQ

byYPos :: MyPoint -> MyPoint -> Ordering
byYPos p1 p2 = if snd p1 < snd p2
               then LT
               else if snd p1 > snd p2
                    then GT
                    else EQ

-- Ángulo medido en radianes
rotatePoints :: [MyPoint] -> Float -> [MyPoint]
rotatePoints p r = map (\(x,y) -> (c * x - s * y, c * y + s * x)) p  
    where c = cos r
          s = sin r

-- ** Sacamos los rectángulos y ponemos los polígonos **

-- El polígono actual a introducir
-- Containers rotados
-- Containers del algoritmo genetico
getPols :: [(Container, Polygon, Polygon)] -> [Int] -> Containers -> IO [(Polygon, Order)]
getPols [] cr cga                = return []
getPols ((c, po, por):ps) cr cga 
    | notElem (rid c) cr = do res <- getPols ps cr cga
                              return ((po {p = map (\(x, y) -> (x + p1x v, y + p1y v)) (p po)}, rid c) : res)
    | otherwise          = do res <- getPols ps cr cga
                              return ((por {p = map (\(x, y) -> (x + p1x v, y + p1y v)) (p por)}, rid c) : res) 
    where Just v = find (\x -> rid x == rid c) cga

-- Devuelve los polígonos en el orden del algoritmo genético
orderByGA :: [(Polygon, Order)] -> [Order] -> IO Polygons
orderByGA _ []      = return []
orderByGA ps (x:xs) = do res <- orderByGA ps xs
                         case find (\y -> snd y == x) ps of 
                            Just v  -> 
                                return (fst v : res)
                            Nothing -> 
                                return []

-- Primero necesito saber cuáles rectángulos fueron rotados
-- Rectángulos nuevos
-- Rectángulos originales
getRotateds :: Containers -> Containers -> IO [Int]
getRotateds [] _      = return []
getRotateds (x:xs) ys = case compareCons x ys of
                            Just v  -> do x <- getRotateds xs ys
                                          return (rid v : x)
                            Nothing -> getRotateds xs ys

compareCons :: Container -> Containers -> Maybe Container  
compareCons x []     = Nothing
compareCons x (y:ys) = if isSame x y
                       then Just x
                       else compareCons x ys

isSame :: Container -> Container -> Bool
isSame c1 c2 = rid c1 == rid c2 && abs (widthR c1 - heightR c2) <= 0.001 && abs (heightR c1 - widthR c2) <= 0.001 

