-- ===================================================================
-- ===== Implementación de funciones referidas a los rectángulos =====
-- ===================================================================

module Rectangles where

-- Módulos propios
import Common

-- Módulos prestados
--import Polygons
import Data.List as L
--import SeqArray as SA 
import System.Environment
import System.Random as Random
import System.IO.Unsafe as Unsafe
import Control.Monad.State.Lazy as StateMonad

compare_width_r :: Container -> Container -> Ordering
compare_width_r r1 r2 = if w1 > w2 then LT else
                            if w1 == w2 then EQ else GT  
    where w1 = width_r r1
          w2 = width_r r2

width_r :: Container -> Float 
width_r r = p2x r - p1x r

height_r :: Container -> Float
height_r r = p2y r - p1y r

area_r :: Container -> Float
area_r r = height_r r * width_r r       

random_l = (randomRs (0, 1) (mkStdGen 0)) :: [Float]

random_n = randoms (mkStdGen 0) :: [Int]

---------------------------
-- START of BL algorithm --
---------------------------

-- El tercer argumento es la lista de rectángulos ya acomodados
bl_algorithm :: [Container] -> Container -> [Container] -> [Container] 
bl_algorithm []       c lr = []
bl_algorithm (x : xs) c lr = x' : (bl_algorithm xs c (x' : lr))
    where x' = r_bottom (place_right_top x c) c lr

r_bottom :: Container -> Container -> [Container] -> Container
r_bottom r c lr = if r == sb then sb else r_left sb c lr
    where sb = shift_bottom r c lr

r_left :: Container -> Container -> [Container] -> Container
r_left r c lr = if r == sl then sl else r_bottom sl c lr
    where sl = shift_left r c lr

-- El segundo argumento es el contenedor
place_right_top :: Container -> Container -> Container 
place_right_top r c = C {p1x = x - width_r r,
                         p1y = y,
                         p2x = x,
                         p2y = y + height_r r,
                         rid = rid r}
    where x = p2x c
          y = p2y c 

-- El segundo argumento es el contenedor
-- El tercer argumento es una lista de los rectángulos ya acomodados
shift_bottom :: Container -> Container -> [Container] -> Container
shift_bottom r c lr = let m = C {p1x = p1x r,
                                 p1y = p1y c,
                                 p2x = p2x r,
                                 p2y = p1y r,
                                 rid = -1}
                          l = filter (\lre -> not ((p1x lre == p2x m) || (p2x lre == p1x m))) (rs_within m lr)
                          y = if null l then p1y c else p2y (maximumBy by_2ypos l)
                      in r {p1y = y, p2y = y + height_r r}
 
by_2ypos :: Container -> Container -> Ordering
by_2ypos r1 r2 = if y1 > y2 then GT else
                    if y1 == y2 then EQ else LT  
    where y1 = p2y r1
          y2 = p2y r2

-- El segundo argumento es el area "de movimiento"
rs_within :: Container -> [Container] -> [Container]
rs_within m lr = filter (\lre -> not ((p2x m < p1x lre) || (p2y m < p1y lre) 
                                 || (p2x lre < p1x m) || (p2y lre < p1y m))) lr

shift_left :: Container -> Container -> [Container] -> Container
shift_left r c lr = let m = C {p1x = p1x c,
                               p1y = p1y r,
                               p2x = p1x r,
                               p2y = p2y r,
                               rid = -1}
                        l = filter (\lre -> not ((p1y lre == p2y m) || (p2y lre == p1y m))) (rs_within m lr)
                        x = if null l then p1x c else p2x (maximumBy by_2xpos l)
                    in r {p1x = x, p2x = x + width_r r}

by_2xpos :: Container -> Container -> Ordering
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

to_lr :: [Int] -> [Container] -> [Container]
to_lr [] _        = []
to_lr (x : xs) lr = filter (\y -> x == rid y) lr ++ (to_lr xs lr)

-- El segundo argumento es el contenedor
-- El tercer argumento es el cardinal del conjunto poblacional
-- El cuarto argumento es la cantidad de iteraciones del algoritmo genético
-- El quinto argumento es la probabilidad de rotación
genetic_algorithm :: [Container] -> Container -> Int -> Int -> Float -> [Container]
genetic_algorithm lr c m t pm = let n          = length lr
                                    pi1        = sort_r lr
                                    res        = bl_algorithm pi1 c []
                                    a1         = [(res, fitness_function res c)]
                                    population = a1 ++ population_loop (permutations lr) c m 
                                    loop       = main_loop population c m t pm 
                                                 (take (t * (n + 2)) (drop m random_n)) (take (2 * t * (n + 1)) random_l) 
                                in fst (maximumBy by_fitness loop)

sort_r :: [Container] -> [Container]
sort_r lr = sortBy compare_width_r lr

fitness_function :: [Container] -> Container -> Float
fitness_function lr c = sum (map area_r (ff lr c' \\ lr)) + area_r c - area_r c'  
    where max_x = p2x (maximumBy by_2xpos lr)
          max_y = p2y (maximumBy by_2ypos lr)
          c'    = C {p1x = p1x c,
                     p1y = p1y c,
                     p2x = max_x,
                     p2y = max_y,
                     rid = rid c}

ff :: [Container] -> Container -> [Container]
ff lr c = up ++ (filter (\x -> and (map (\y -> null (rs_within x [y])) up)) right)
    where up    = (up_r (sort_r lr) c lr) \\ lr
          right = (right_r lr  c lr) \\ lr

up_r :: [Container] -> Container -> [Container] -> [Container]
up_r [] _ all       = all
up_r (l : lr) c all = up_r lr c ((if null above then [up] else c_u) ++ all)  
    where up       = get_up l c
          above    = filter (\x -> p1x x /= p2x l && p1x l /= p2x x && x /= l) (rs_within up all)
          (m1, m2) = cover_up above
          c_u      = if minus (p2x l) m2 == 0 then [] else [up {p1x = m2}]  

right_r :: [Container] -> Container -> [Container] -> [Container]
right_r [] _ all       = all
right_r (l : lr) c all = right_r lr c ((if null side then [right] else c_r) ++ all)  
    where right    = get_right l c
          side     = filter (\x -> p1y x /= p2y l && p1y l /= p2y x && x /= l) (rs_within right all)
          (m1, m2) = cover_right side
          c_r      = if minus (p2y l) m2 == 0 then [] else [right {p1y = m2}]  

get_up :: Container -> Container -> Container
get_up r c = C {p1x = p1x r,
                p1y = p2y r,
                p2x = p2x r,
                p2y = p2y c,
                rid = -1}

get_right :: Container -> Container -> Container
get_right r c = C {p1x = p2x r, 
                   p1y = p1y r,
                   p2x = p2x c,
                   p2y = p2y r,
                   rid = -1}

cover_up :: [Container] -> (Float, Float)
cover_up []               = (0, 0)
cover_up [l]              = (p1x l, p2x l)
cover_up (l1 : (l2 : lr)) = if x1 <= b then (min a x1, max b (p2x l1)) else (a, b) 
    where (a, b) = cover_up (l2 : lr)
          x1     = p1x l1

cover_right :: [Container] -> (Float, Float)
cover_right []               = (0, 0)
cover_right [l]              = (p1y l, p2y l)
cover_right (l1 : (l2 : lr)) = if y1 <= b then (min a y1, max b (p2y l1)) else (a, b) 
    where (a, b) = cover_right (l2 : lr)
          y1     = p1y l1

minus :: Float -> Float -> Float
minus x y 
    | x > y     = x - y
    | otherwise = 0

population_loop :: [[Container]] -> Container -> Int -> [([Container], Float)]
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
main_loop :: [([Container], Float)] -> Container -> Int -> Int -> Float -> [Int] -> [Float] -> [([Container], Float)]
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

mutation_normal :: [Container] -> Float -> [Int] -> [Float] -> [Container]
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

mutation :: [Container] -> Float -> [Float] -> [Container]
mutation [] _ _          = []
mutation (l : lr) pm r_l = (if head r_l < pm then rotate_90 l else l) : (mutation lr pm (drop 1 r_l)) 

rotate_90 :: Container -> Container
rotate_90 r = C {p1x = x,
                 p1y = y,
                 p2x = x + height_r r,
                 p2y = y + width_r r,
                 rid = rid r} 
    where x = p1x r
          y = p1y r

replace_worst :: [([Container], Float)] -> ([Container], Float) -> [([Container], Float)]
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
r1 = C {p1x = 0, p1y = 0, p2x = 3, p2y = 3, rid = 1}
r2 = C {p1x = 10, p1y = 0, p2x = 15, p2y = 7, rid = 2}
r3 = C {p1x = 0, p1y = 0, p2x = 10, p2y = 5, rid = 3}
r4 = C {p1x = 0, p1y = 5, p2x = 7, p2y = 14, rid = 4}
c1 = C {p1x = 0, p1y = 0, p2x = 17, p2y = 20, nc = "c1", rid = 0}

cc = C {p1x = 0, p1y = 0, p2x = 20, p2y = 20, nc = "cc", rid = 0}
a1 = C {p1x = 0, p1y = 0, p2x = 5, p2y = 16, rid = 1}
a2 = C {p1x = 8, p1y = 0, p2x = 17, p2y = 14, rid = 2}
a3 = C {p1x = 5, p1y = 0, p2x = 8, p2y = 3, rid = 3}
a4 = C {p1x = 5, p1y = 14, p2x = 10, p2y = 16, rid = 4}

