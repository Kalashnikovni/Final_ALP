-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

module Polygons where 

-- Módulos propios
import Common
import Rectangles (widthR, heightR)

-- Módulos prestados
import Data.List

-- Embeber los polígonos en rectángulos -- 
------------------------------------------

rCons = 16 :: Float

-- Devuelve los puntos del poligono como si el eje estuviera definido por el p1 del contenedor
embedPols :: Polygons -> Containers
embedPols []      = []
embedPols (po:ps) = c : (embedPols ps)
    where c = (embedPol po (floor rCons)) {rid = length ps}

-- Probamos con 16 posiciones en total
embedPol :: Polygon -> Int -> Container
embedPol po 0   = minRect po
embedPol po den 
    | areaCon (minRect po) < areaCon (minRect po') = embedPol po (den - 1)
    | otherwise                                    = embedPol po' (den - 1) 
    where po' = po {p = (rotatePoints (p po) (((fromIntegral den) * 2 * pi) / rCons))}

areaCon :: Container -> Float
areaCon c = abs (p1x c - p2x c) * abs (p1y c - p2y c)

minRect :: Polygon -> Container
minRect po = C {p1x = 0,
                p1y = 0,
                p2x = fst (maximumBy byXPos points) - fst (minimumBy byXPos points),
                p2y = snd (maximumBy byYPos points) - snd (minimumBy byYPos points),
                nc  = pn po}
    where points = p po

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

rotate :: Containers -> Polygons -> Polygons
rotate _ []       = []
rotate cs (po:ps) = case c' of
                        Just v ->
                            (po {p = rotatePoints (p po) (pi / 2)}) : (Polygons.rotate (delete v cs) ps) 
                        Nothing ->
                            []
    where c' = find (\x -> nc x == pn po) cs 


-- Sacamos los rectángulos y ponemos los polígonos --
-----------------------------------------------------

-- Primero necesito saber cuáles rectángulos fueron rotados
-- Rectángulos nuevos
-- Rectángulos originales
getRotateds :: Containers -> Containers -> IO Containers
getRotateds [] _      = return []
getRotateds (x:xs) ys = case compareCons x ys of
                            Just v  -> do x <- getRotateds xs ys
                                          return (v : x)
                            Nothing -> getRotateds xs ys

compareCons :: Container -> Containers -> Maybe Container  
compareCons x []     = Nothing
compareCons x (y:ys) = if isSame x y
                       then Just x
                       else compareCons x ys

isSame :: Container -> Container -> Bool
isSame c1 c2 = rid c1 == rid c2 && abs (widthR c1 - heightR c2) <= 0.001 && abs (heightR c1 - widthR c2) <= 0.001 

-- Todos los rectángulos
-- Rectángulos rotados
takeOut :: Containers -> Polygons -> Polygons 
takeOut _ []       = []
takeOut cs (po:ps) = case c' of
                        Just v  -> 
                            (po {p = translatePoints (p po) (p1x v, p1y v)}) : (takeOut (delete v cs) ps) 
                        Nothing -> 
                            []
    where c' = find (\x -> nc x == pn po) cs  

translatePoints :: [MyPoint] -> MyPoint -> [MyPoint]
translatePoints p t = map (\(x,y) -> (x + fst t, y + snd t)) p

-- Fucs. auxiliares --
----------------------

getContainers :: Containers -> [Int] -> IO Containers
getContainers _ []      = return []
getContainers cs (x:xs) = case find (\y -> rid y == x) cs of
                            Just v  -> do res <- getContainers cs xs
                                          return (v : res) 
                            Nothing -> getContainers cs xs 

