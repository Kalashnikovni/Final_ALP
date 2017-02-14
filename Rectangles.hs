-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

module Rectangles where

import Polygons
import Data.List as List
import System.Random as Random
import System.IO.Unsafe as Unsafe

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- Es decir, con un vector del cuadrante I.
-- El int representa el id del rectángulo.
--type Rectangle = ((Float, Float), (Float, Float), Int)
data Rectangle = R {p1x :: Float,
                    p1y :: Float,
                    p2x :: Float,
                    p2y :: Float,
                    rid :: Int} deriving (Show, Eq)

--rectangle_to_path :: Rectangle -> Path

sort_r :: [Rectangle] -> [Rectangle]
sort_r lr = List.sortBy compare_width_r lr

compare_width_r :: Rectangle -> Rectangle -> Ordering
compare_width_r r1 r2 = if w1 > w2 then LT else
                            if w1 == w2 then EQ else GT  
    where w1 = width_r r1
          w2 = width_r r2

width_r :: Rectangle -> Float 
width_r r = p2x r - p1x r

height_r :: Rectangle -> Float
height_r r = p2y r - p1y r
       

---------------------------
-- START of BL algorithm --
---------------------------

-- El segundo argumento es el contenedor
--bl_algorithm :: [Rectangle] -> Rectangle -> [[Rectangle]]
--bl_algorithm lr c = map (\lre -> place_r lre c []) (List.permutations lr)  

-- El tercer argumento es la lista de rectángulos ya acomodados
bl_algorithm :: [Rectangle] -> Rectangle -> [Rectangle] -> [Rectangle] 
bl_algorithm []       c lr = []
bl_algorithm (x : xs) c lr = x' : (bl_algorithm xs c (x' : lr))
    where x' = r_bottom (place_right_top x c) c lr

r_bottom :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
r_bottom r c lr = if r == sb then sb else r_left sb c lr
    where sb = shift_bottom r c lr

r_left :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
r_left r c lr = if r == sl then sl else r_bottom sl c lr
    where sl = shift_left r c lr

-- El segundo argumento es el contenedor
place_right_top :: Rectangle -> Rectangle -> Rectangle 
place_right_top r c = R {p1x = x - width_r r,
                         p1y = y,
                         p2x = x,
                         p2y = y + height_r r,
                         rid = rid r}
    where x = p2x c
          y = p2y c 

-- El segundo argumento es el contenedor
-- El tercer argumento es una lista de los rectángulos ya acomodados
shift_bottom :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
shift_bottom r c lr = let m = R {p1x = p1x r,
                                 p1y = p1y c,
                                 p2x = p2x r,
                                 p2y = p1y r,
                                 rid = -1}
                          l = filter (\lre -> not ((p1x lre == p2x m) || (p2x lre == p1x m))) (rs_within r m lr)
                          y = if List.null l then p1y c else p2y (maximumBy by_ypos l)
                      in r {p1y = y, p2y = y + height_r r}
 
by_ypos :: Rectangle -> Rectangle -> Ordering
by_ypos r1 r2 = if y1 > y2 then GT else
                    if y1 == y2 then EQ else LT  
    where y1 = p2y r1
          y2 = p2y r2

-- El segundo argumento es el area "de movimiento"
rs_within :: Rectangle -> Rectangle -> [Rectangle] -> [Rectangle]
rs_within r m lr = filter (\lre -> not ((p2x m < p1x lre) || (p2y m < p1y lre) 
                                   || (p2x lre < p1x m) || (p2y lre < p1y m))) lr

shift_left :: Rectangle -> Rectangle -> [Rectangle] -> Rectangle
shift_left r c lr = let m = R {p1x = p1x c,
                               p1y = p1y r,
                               p2x = p1x r,
                               p2y = p2y r,
                               rid = -1}
                        l = filter (\lre -> not ((p1y lre == p2y m) || (p2y lre == p1y m))) (rs_within r m lr)
                        x = if List.null l then p1x c else p2x (maximumBy by_xpos l)
                    in r {p1x = x, p2x = x + width_r r}

by_xpos :: Rectangle -> Rectangle -> Ordering
by_xpos r1 r2 = if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT
    where x1 = p2x r1
          x2 = p2x r2

-------------------------
-- END of BL algorithm --
-------------------------

--fitness_function :: 
--fitness_function

select_random_r :: [Rectangle] -> Rectangle
select_random_r lr = lr !! (unsafePerformIO (randomRIO (0, List.length lr - 1)))  

--genetic_algorithm :: [Rectangles] -> ???
--genetic_algorithm lr = let pi1 = sort_rectangles lr
--                           res = bl_algorithm pi1

-- ***************** --
-- Sector de pruebas --
-- ***************** --
r1 = R {p1x = 0, p1y = 0, p2x = 3, p2y = 3, rid = 1}
r2 = R {p1x = 10, p1y = 0, p2x = 15, p2y = 7, rid = 2}
r3 = R {p1x = 0, p1y = 0, p2x = 10, p2y = 5, rid = 3}
r4 = R {p1x = 0, p1y = 5, p2x = 7, p2y = 14, rid = 4}
c  = R {p1x = 0, p1y = 0, p2x = 17, p2y = 20, rid = 0}
