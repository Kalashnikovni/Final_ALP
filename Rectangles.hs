-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

module Rectangles where

import Polygons
import Data.List as List
import System.Random as Random
import System.IO.Unsafe as Unsafe

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- El int representa el id del rectángulo.
type Rectangle = ((Float, Float), (Float, Float), Int)

--rectangle_to_path :: Rectangle -> Path

sort_r :: [Rectangle] -> [Rectangle]
sort_r lr = List.sortBy compare_width_r lr

compare_width_r :: Rectangle -> Rectangle -> Ordering
compare_width_r r1 r2 = if w1 > w2 then LT else
                            if w1 == w2 then EQ else GT  
    where w1 = width_r r1
          w2 = width_r r2

width_r :: Rectangle -> Float 
width_r r = let ((x1, _), (x2, _), _) = r
            in abs (x1 - x2)

height_r :: Rectangle -> Float
height_r r = let ((_, y1), (_, y2), _) = r
             in abs (y1 - y2)       

-- El segundo argumento es el contenedor
--bl_algorithm :: [Rectangle] -> Rectangle -> [[Rectangle]]
--bl_algorithm lr c = let r' = place_right_top r c 
--                        fr = bl_algorithm' r' 

-- El segundo argumento es el contenedor
place_right_top :: Rectangle -> Rectangle -> Rectangle 
place_right_top r c = let ((_, _), (_, _), idr) = r
                          ((x21, y21), (x22, y22), idc) = c
                      in ((x22 - width_r r, y22), (x22, y22 + height_r r), idr)

-- El segundo argumento es el contenedor
-- El tercer argumento es una lista de los rectángulos ya acomodados
shift_bottom :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
shift_bottom r c lr = let ((a, d), (cc, e), id)  = r
                          ((_, b), (_, _), _)    = c
                          m                      = ((a, b), (cc, d), -1)
                          l                      = rs_within r m lr 
                          ((_, _), (_, y2), _)   = if List.null l then ((0, 0), (0, d), 0) else maximumBy by_ypos l
                      in ((a, y2), (cc, y2 + height_r r), id)
     
by_ypos :: Rectangle -> Rectangle -> Ordering
by_ypos r1 r2 = let ((_, _), (_, y1), _) = r1
                    ((_, _), (_, y2), _) = r2
                in if y1 > y2 then GT else
                      if y1 == y2 then EQ else LT  

-- El segundo argumento es el area "de movimiento"
rs_within :: Rectangle -> Rectangle -> [Rectangle] -> [Rectangle]
rs_within r m lr = let ((x1, y1), (x2, y2), _)   = m
                   in filter (\((_, _), (a, b), _) -> (x1 <= a) && (a <= x2) && (y1 <= b) && (b <= y2)) lr

shift_left :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
shift_left r c lr = let ((e, b), (cc, d), id)  = r 
                        ((_, _), (a, _), _)    = c
                        m                      = ((a, b), (cc, d), -1)
                        l                      = rs_within r m lr
                        ((_, _), (x2, _), _)   = if List.null l then ((0, 0), (a, 0), 0) else maximumBy by_xpos l 
                    in ((x2, b), (x2 + width_r r, d), id)
                    
by_xpos :: Rectangle -> Rectangle -> Ordering
by_xpos r1 r2 = let ((_, _), (x1, _), _) = r1
                    ((_, _), (x2, _), _) = r2
                in if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT

--fitness_function :: 
--fitness_function

select_random_r :: [Rectangle] -> Rectangle
select_random_r lr = lr !! (unsafePerformIO (randomRIO (0, List.length lr - 1)))  

--genetic_algorithm :: [Rectangles] -> ???
--genetic_algorithm lr = let pi1 = sort_rectangles lr
--                           res = bl_algorithm pi1
 
