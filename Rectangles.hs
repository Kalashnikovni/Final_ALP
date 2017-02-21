-- ===================================================================
-- ===== Implementación de funciones referidas a los rectángulos =====
-- ===================================================================

module Rectangles where

import Polygons
import Data.List as L
--import SeqArray as SA 
import System.Environment
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

random_l = (randomRs (0, 1) (mkStdGen 0)) :: [Float]

random_n = randoms (mkStdGen 0) :: [Int]

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
                          y = if null l then p1y c else p2y (maximumBy by_2ypos l)
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
                        x = if null l then p1x c else p2x (maximumBy by_2xpos l)
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
-- El tercer argumento es el cardinal del conjunto poblacional
-- El cuarto argumento es la cantidad de iteraciones del algoritmo genético
-- El quinto argumento es la probabilidad de rotación
genetic_algorithm :: [Rectangle] -> Rectangle -> Int -> Int -> Float -> ([Rectangle], Float)
genetic_algorithm lr c m t pm = let n          = length lr
                                    pi1        = sort_r lr
                                    res        = bl_algorithm pi1 c []
                                    a1         = [(pi1, fitness_function pi1 c)]
                                    population = a1 ++ population_loop (permutations lr) c m 
                                    loop       = main_loop population c m t pm 
                                                 (take (t * (n + 2)) (drop m random_n)) (take (2 * t * (n + 1)) random_l) 
                                in maximumBy by_fitness loop

sort_r :: [Rectangle] -> [Rectangle]
sort_r lr = sortBy compare_width_r lr

-- El segundo argumento es el contenedor
fitness_function :: [Rectangle] -> Rectangle -> Float 
fitness_function lr c = area_r c - fitness_function' (sortBy by_2xpos lr) c (p1x c)

-- El tercer argumento guarda "hasta dónde se avanzó" en el eje de las x's
fitness_function' :: [Rectangle] -> Rectangle -> Float -> Float
fitness_function' [] _ _    = 0
fitness_function' xs c oldx = (p2y slt - p1y c) * (newx - oldx) +
                              fitness_function' (xs \\ (filter (\y -> p2x y <= newx) xs)) c newx
    where slt  = select_left_top xs
          newx = p2x slt

select_left_top :: [Rectangle] -> Rectangle 
select_left_top (x : xs) = if null eq then x else maximumBy by_2ypos eq
    where eq = filter (\y -> p2x x == p2x y) xs

by_1xpos :: Rectangle -> Rectangle -> Ordering
by_1xpos r1 r2 = if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT
    where x1 = p1x r1
          x2 = p1x r2

population_loop :: [[Rectangle]] -> Rectangle -> Int -> [([Rectangle], Float)]
population_loop lr c m 
    | m == 0    = []
    | otherwise = (ran, fitness_function ran c) : (population_loop lr c (m - 1)) 
    where ran = bl_algorithm (lr !! (mod (random_n !! m) (length lr))) c []

-- El primer argumento representa a cada configuracion junto con su fitness
-- El segundo argumento es el contenedor
-- El tercer argumento es el cardinal de la poblacion
-- El cuarto argumento es la cantidad de iteraciones del loop
-- El quinto argumento es la probabilidad de mutación
-- El sexto argumento es una lista de numeros flotantes random entre 0 y 1
-- El séptimo argumento es una lista de numeros enteros random
main_loop :: [([Rectangle], Float)] -> Rectangle -> Int -> Int -> Float -> [Int] -> [Float] -> [([Rectangle], Float)]
main_loop pop c m t pm r_n r_l
    | t == 0    = pop
    | otherwise = main_loop new_pop c m (t - 1) pm (drop (n + 2) r_n) (drop (2 * n) r_l)
    where example = fst (head pop)
          n       = length example 
          pi      = map (\x -> map (\y -> rid y) (fst x)) pop
          (a, b)  = prop_selection pi m r_l
          new     = crossover a b r_n
          new_r   = to_lr new example 
          mut_n   = mutation_normal new_r pm (drop 2 r_n) (drop 2 r_l)
          mut     = mutation mut_n pm (drop n r_l)
          last    = bl_algorithm mut c []
          new_pop = replace_worst pop (last, fitness_function last c)

prop_selection :: [[Int]] -> Int -> [Float] -> ([Int], [Int])
prop_selection lr m r_l = let (p1, p2) = (head r_l, head (tail r_l))
                              a        = length (filter (\x -> x <= p1) lim)
                              b        = length (filter (\x -> x <= p2) lim) 
                          in (lr !! a, lr !! b )
    where lim = create_l m

create_l :: Int -> [Float]
create_l m = map (\x -> (fromIntegral x :: Float) / (fromIntegral m :: Float)) [0..m]

crossover :: [Int] -> [Int] -> [Int] -> [Int]
crossover i1 i2 r_n = i1' ++ (i2 \\ i1')  
    where p   = mod (head r_n) (length i1) 
          q   = mod (head (tail r_n)) (length i1 - p) + 1
          i1' = take q (drop p i1)

mutation_normal :: [Rectangle] -> Float -> [Int] -> [Float] -> [Rectangle]
mutation_normal []       _ _ _ = []
mutation_normal (l : lr) pm r_n r_l = if head random_l < pm 
                                        then (lr !! ran) : (mutation_normal (tail (swap 0 ran lr)) pm r_n' r_l')  
                                        else l : (mutation_normal lr pm r_n' r_l')
    where ran  = mod (head r_n) (length lr)
          r_n' = drop 1 r_n
          r_l' = drop 1 r_l

-- Se asume que x < y
swap :: Int -> Int -> [a] -> [a]
swap x y xs = (take x xs) ++ [xs !! y] ++ take (y - x - 1) (drop (x + 1) xs) ++ [xs !! x] ++ take (length xs - y) (drop (y + 1) xs)   

mutation :: [Rectangle] -> Float -> [Float] -> [Rectangle]
mutation [] _ _          = []
mutation (l : lr) pm r_l = (if head r_l < pm then rotate_90 l else l) : (mutation lr pm (drop 1 r_l)) 

rotate_90 :: Rectangle -> Rectangle
rotate_90 r = R {p1x = x,
                 p1y = y,
                 p2x = x + height_r r,
                 p2y = y + width_r r,
                 rid = rid r} 
    where x = p1x r
          y = p1y r

replace_worst :: [([Rectangle], Float)] -> ([Rectangle], Float) -> [([Rectangle], Float)]
replace_worst pop new = (pop \\ [minimumBy by_fitness pop]) ++ [new]

by_fitness :: ([a], Float) -> ([a], Float) -> Ordering
by_fitness (l1, f1) (l2, f2) = if f1 > f2 then GT
                                else if f1 == f2 then EQ else LT

------------------------------
-- END of genetic algorithm --
------------------------------  
          
--------------------------
-- END of main function --
--------------------------

-- ***************** --
-- Sector de pruebas --
-- ***************** --
r1 = R {p1x = 0, p1y = 0, p2x = 3, p2y = 3, rid = 1}
r2 = R {p1x = 10, p1y = 0, p2x = 15, p2y = 7, rid = 2}
r3 = R {p1x = 0, p1y = 0, p2x = 10, p2y = 5, rid = 3}
r4 = R {p1x = 0, p1y = 5, p2x = 7, p2y = 14, rid = 4}
c1 = R {p1x = 0, p1y = 0, p2x = 17, p2y = 20, rid = 0}

cc = R {p1x = 0, p1y = 0, p2x = 20, p2y = 20, rid = 0}
a1 = R {p1x = 0, p1y = 0, p2x = 5, p2y = 16, rid = 1}
a2 = R {p1x = 8, p1y = 0, p2x = 17, p2y = 14, rid = 2}
a3 = R {p1x = 5, p1y = 0, p2x = 8, p2y = 3, rid = 3}
a4 = R {p1x = 5, p1y = 14, p2x = 10, p2y = 16, rid = 4}

