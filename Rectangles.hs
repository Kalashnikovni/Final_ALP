-- ===================================================================
-- ===== Implementación de funciones referidas a los rectángulos =====
-- ===================================================================

module Rectangles where

import Polygons
import Data.List as List
import System.Random as Random
import System.IO.Unsafe as Unsafe
import Control.Monad.State.Lazy as StateMonad

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

compare_width_r :: Rectangle -> Rectangle -> Ordering
compare_width_r r1 r2 = if w1 > w2 then LT else
                            if w1 == w2 then EQ else GT  
    where w1 = width_r r1
          w2 = width_r r2

width_r :: Rectangle -> Float 
width_r r = p2x r - p1x r

height_r :: Rectangle -> Float
height_r r = p2y r - p1y r

area_r :: Rectangle -> Float
area_r r = height_r r * width_r r       


---------------------------
-- START of BL algorithm --
---------------------------

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
                          y = if List.null l then p1y c else p2y (maximumBy by_2ypos l)
                      in r {p1y = y, p2y = y + height_r r}
 
by_2ypos :: Rectangle -> Rectangle -> Ordering
by_2ypos r1 r2 = if y1 > y2 then GT else
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
                        x = if List.null l then p1x c else p2x (maximumBy by_2xpos l)
                    in r {p1x = x, p2x = x + width_r r}

by_2xpos :: Rectangle -> Rectangle -> Ordering
by_2xpos r1 r2 = if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT
    where x1 = p2x r1
          x2 = p2x r2

-------------------------
-- END of BL algorithm --
-------------------------

--------------------------------
-- START of genetic algorithm --
--------------------------------

to_permutation :: [Rectangle] -> [Int]
to_permutation lr = map (\x -> rid x) lr

to_lr :: [Int] -> [Rectangle] -> [Rectangle]
to_lr [] _        = []
to_lr (x : xs) lr = filter (\y -> x == rid y) lr ++ (to_lr xs lr)

-- El segundo argumento es el contenedor
genetic_algorithm :: [Rectangle] -> Rectangle -> Int -> Int -> [([Rectangle], Float)]
genetic_algorithm lr c m t = let pi1        = sort_r lr
                                 res        = bl_algorithm pi1 c []
                                 a1         = [(pi1, fitness_function pi1 c)]
                                 population = a1 ++ population_loop (permutations lr) c m 
                                 loop       = main_loop population m t 
                             in population

sort_r :: [Rectangle] -> [Rectangle]
sort_r lr = List.sortBy compare_width_r lr

-- El segundo argumento es el contenedor
fitness_function :: [Rectangle] -> Rectangle -> Float 
fitness_function lr c = area_r c - fitness_function' (sortBy by_1xpos lr) c (p1x c)

-- El tercer argumento guarda "hasta dónde se avanzó" en el eje de las x's
fitness_function' :: [Rectangle] -> Rectangle -> Float -> Float
fitness_function' [] _ _    = 0
fitness_function' xs c oldx = (p2y slt - p1y c) * (newx - oldx) +
                              fitness_function' (xs \\ (filter (\y -> p2x y <= newx) xs)) c newx
    where slt  = select_left_top xs
          newx = p2x slt

select_left_top :: [Rectangle] -> Rectangle 
select_left_top (x : xs) = if List.null eq then x else maximumBy by_2ypos eq
    where eq = filter (\y -> p1x x == p1x y) xs

by_1xpos :: Rectangle -> Rectangle -> Ordering
by_1xpos r1 r2 = if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT
    where x1 = p1x r1
          x2 = p1x r2

population_loop :: [[Rectangle]] -> Rectangle -> Int -> [([Rectangle], Float)]
population_loop lr c m 
    | m == 0    = []
    | otherwise = (ran, fitness_function ran c) : (population_loop lr c (m - 1)) 
    where ran = bl_algorithm (select_random lr) c []

select_random :: [[a]] -> [a]
select_random lr = lr !! (unsafePerformIO (randomRIO (0, List.length lr - 1)))  

select_random_n :: (Float, Float) 
select_random_n = if n1 == 1 || n2 == 1 then select_random_n else (n1, n2)
    where n1 = unsafePerformIO (randomRIO (0, 1))
          n2 = unsafePerformIO (randomRIO (0, 1))

main_loop :: [([Rectangle], Float)] -> Int -> Int -> [([Rectangle], Float)]
main_loop pop m t 
    | t == 0    = pop
    | otherwise = pop--replace_worst pop ()
    where pi      = map (\x -> map (\y -> rid y) (fst x)) pop
          (a, b)  = prop_selection pi m
          --new     = mutation (normal_mutation (crossover i1 i2))   

prop_selection :: [[Int]] -> Int -> ([Int], [Int])
prop_selection lr m = let (p1, p2) = select_random_n
                          a        = length (filter (\x -> x <= p1) lim)
                          b        = length (filter (\x -> x <= p2) lim) 
                      in (lr !! a, lr !! b )
    where lim = create_l m

create_l :: Int -> [Float]
create_l m = map (\x -> (fromIntegral x :: Float) / (fromIntegral m :: Float)) [0..m]

crossover :: [Int] -> [Int] -> [Int]
crossover i1 i2 = i1' ++ (i2 \\ i1')  
    where p   = unsafePerformIO (randomRIO (1, length i1)) 
          q   = unsafePerformIO (randomRIO (p, length i1))
          i1' = take (p - q) i1

------------------------------
-- END of genetic algorithm --
------------------------------


-- ***************** --
-- Sector de pruebas --
-- ***************** --
r1 = R {p1x = 0, p1y = 0, p2x = 3, p2y = 3, rid = 1}
r2 = R {p1x = 10, p1y = 0, p2x = 15, p2y = 7, rid = 2}
r3 = R {p1x = 0, p1y = 0, p2x = 10, p2y = 5, rid = 3}
r4 = R {p1x = 0, p1y = 5, p2x = 7, p2y = 14, rid = 4}
c  = R {p1x = 0, p1y = 0, p2x = 17, p2y = 20, rid = 0}

cc = R {p1x = 0, p1y = 0, p2x = 20, p2y = 20, rid = 0}
a1 = R {p1x = 0, p1y = 0, p2x = 5, p2y = 16, rid = 1}
a2 = R {p1x = 8, p1y = 0, p2x = 17, p2y = 14, rid = 2}
a3 = R {p1x = 5, p1y = 0, p2x = 8, p2y = 3, rid = 3}
a4 = R {p1x = 5, p1y = 14, p2x = 10, p2y = 16, rid = 4}

