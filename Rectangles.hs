-- ===================================================================
-- ===== Implementación de funciones referidas a los rectángulos =====
-- ===================================================================

-- TODO: usar Control.Monad.Loops

module Rectangles where

-- Módulos propios
import Common

-- Módulos prestados
import Data.List as L

import Control.Monad.State.Lazy as StateMonad
import Control.Monad.Loops -- iterateWhile para gaalgorithm

import System.Environment
import System.IO.Unsafe as Unsafe
import System.Random as Random

-- Data definitions --
----------------------

-- Funciones auxiliares --
--------------------------

compareWidthR :: Container -> Container -> Ordering
compareWidthR r1 r2 = if w1 > w2 then LT else
                            if w1 == w2 then EQ else GT  
    where w1 = widthR r1
          w2 = widthR r2

widthR :: Container -> Float 
widthR r = p2x r - p1x r

heightR :: Container -> Float
heightR r = p2y r - p1y r

areaR :: Container -> Float
areaR r = heightR r * widthR r       

randomL = (randomRs (0, 1) (mkStdGen 0)) :: [Float]

randomN = randoms (mkStdGen 0) :: [Int]

---------------------------
-- START of BL algorithm --
---------------------------

-- El tercer argumento es la lista de rectángulos ya acomodados
blAlgorithm :: Containers -> Container -> Containers -> Containers 
blAlgorithm []       c lr = []
blAlgorithm (x : xs) c lr = x' : (blAlgorithm xs c (x' : lr))
    where x' = rBottom (placeRightTop x c) c lr

rBottom :: Container -> Container -> Containers -> Container
rBottom r c lr = if r == sb 
                 then sb 
                 else rLeft sb c lr
    where sb = shiftBottom r c lr

rLeft :: Container -> Container -> Containers -> Container
rLeft r c lr = if r == sl 
               then sl 
               else rBottom sl c lr
    where sl = shiftLeft r c lr

-- El segundo argumento es el contenedor
placeRightTop :: Container -> Container -> Container 
placeRightTop r c = C {p1x = x - widthR r,
                       p1y = y,
                       p2x = x,
                       p2y = y + heightR r,
                       rid = rid r,
                       nc  = nc r}
    where x = p2x c
          y = p2y c 

-- El segundo argumento es el contenedor
-- El tercer argumento es una lista de los rectángulos ya acomodados
shiftBottom :: Container -> Container -> Containers -> Container
shiftBottom r c lr = let m = C {p1x = p1x r,
                                p1y = p1y c,
                                p2x = p2x r,
                                p2y = p1y r,
                                rid = -1,
                                nc  = ""}
                         l = filter (\lre -> not ((p1x lre == p2x m) || (p2x lre == p1x m))) (rsWithin m lr)
                         y = if null l then p1y c else p2y (maximumBy by2ypos l)
                     in r {p1y = y, p2y = y + heightR r}
 
by2ypos :: Container -> Container -> Ordering
by2ypos r1 r2 = if y1 > y2 
                then GT 
                else if y1 == y2 
                     then EQ 
                     else LT  
    where y1 = p2y r1
          y2 = p2y r2

-- El segundo argumento es el area "de movimiento"
rsWithin :: Container -> Containers -> Containers
rsWithin m lr = filter (\lre -> not ((p2x m < p1x lre) || (p2y m < p1y lre) 
                                 || (p2x lre < p1x m) || (p2y lre < p1y m))) lr

shiftLeft :: Container -> Container -> [Container] -> Container
shiftLeft r c lr = let m = C {p1x = p1x c,
                              p1y = p1y r,
                              p2x = p1x r,
                              p2y = p2y r,
                              rid = -1,
                              nc  = ""}
                       l = filter (\lre -> not ((p1y lre == p2y m) || (p2y lre == p1y m))) (rsWithin m lr)
                       x = if null l then p1x c else p2x (maximumBy by2xpos l)
                   in r {p1x = x, p2x = x + widthR r}

by2xpos :: Container -> Container -> Ordering
by2xpos r1 r2 = if x1 > x2 then GT else
                      if x1 == x2 then EQ else LT
    where x1 = p2x r1
          x2 = p2x r2

-------------------------
-- END of BL algorithm --
-------------------------

--------------------------------
-- START of genetic algorithm --
--------------------------------

toLr :: [Int] -> Containers -> Containers
toLr [] _        = []
toLr (x : xs) lr = filter (\y -> x == rid y) lr ++ (toLr xs lr)

-- Chequeo si efectivamente todos los rectángulos se encuentran dentro del contenedor
checkInside :: Container -> Container -> Bool
checkInside r c = if p1x r >= p1x c && p1y r >= p1y c && p2x r <= p2x c && p2y r <= p2y c
                  then True
                  else False 

getBest :: [Containers] -> Container -> Maybe Containers
getBest []     c = Nothing
getBest (l:lr) c = if and (map (\x -> checkInside x c) l)
                   then Just l
                   else getBest lr c

-- El segundo argumento es el contenedor
-- El tercer argumento es el cardinal del conjunto poblacional
-- El cuarto argumento es la cantidad de iteraciones del algoritmo genético
-- El quinto argumento es la probabilidad de rotación
{-geneticAlgorithm :: Containers -> Container -> Int -> Int -> Float -> Maybe Containers
geneticAlgorithm lr c m t pm = let n          = length lr
                                   pi1        = sortR lr
                                   res        = blAlgorithm pi1 c []
                                   a1         = [(res, fitnessFunction res c)]
                                   population = a1 ++ populationLoop (permutations lr) c m 
                                   loop       = mainLoop population c m t pm 
                                                (take (t * (n + 2)) (drop m randomN)) (take (2 * t * (n + 1)) randomL) 
                               in getBest (map fst (reverse (sortBy byFitness loop))) c
-}

geneticAlgorithm :: Containers -> Container -> Int -> Int -> Float -> Maybe Containers
geneticAlgorithm lr c m t pm = let n          = length lr

sortR :: Containers -> Containers
sortR lr = sortBy compareWidthR lr

fitnessFunction :: Containers -> Container -> Float
fitnessFunction lr c = sum (map areaR (ff lr c' \\ lr)) + areaR c - areaR c'  
    where maxX = p2x (maximumBy by2xpos lr)
          maxY = p2y (maximumBy by2ypos lr)
          c'    = C {p1x = p1x c,
                     p1y = p1y c,
                     p2x = maxX,
                     p2y = maxY,
                     rid = rid c,
                     nc  = nc c}

ff :: Containers -> Container -> Containers
ff lr c = up ++ (filter (\x -> and (map (\y -> null (rsWithin x [y])) up)) right)
    where up    = (upR (sortR lr) c lr) \\ lr
          right = (rightR lr  c lr) \\ lr

upR :: Containers -> Container -> Containers -> Containers
upR [] _ all       = all
upR (l : lr) c all = upR lr c ((if null above then [up] else c_u) ++ all)  
    where up       = getUp l c
          above    = filter (\x -> p1x x /= p2x l && p1x l /= p2x x && x /= l) (rsWithin up all)
          (m1, m2) = coverUp above
          c_u      = if minus (p2x l) m2 == 0 then [] else [up {p1x = m2}]  

rightR :: Containers -> Container -> Containers -> Containers
rightR [] _ all       = all
rightR (l : lr) c all = rightR lr c ((if null side then [right] else c_r) ++ all)  
    where right    = getRight l c
          side     = filter (\x -> p1y x /= p2y l && p1y l /= p2y x && x /= l) (rsWithin right all)
          (m1, m2) = coverRight side
          c_r      = if minus (p2y l) m2 == 0 then [] else [right {p1y = m2}]  

getUp :: Container -> Container -> Container
getUp r c = C {p1x = p1x r,
               p1y = p2y r,
               p2x = p2x r,
               p2y = p2y c,
               rid = -1,
               nc  = ""}

getRight :: Container -> Container -> Container
getRight r c = C {p1x = p2x r, 
                  p1y = p1y r,
                  p2x = p2x c,
                  p2y = p2y r,
                  rid = -1,
                  nc  = ""}

coverUp :: Containers -> (Float, Float)
coverUp []               = (0, 0)
coverUp [l]              = (p1x l, p2x l)
coverUp (l1 : (l2 : lr)) = if x1 <= b then (min a x1, max b (p2x l1)) else (a, b) 
    where (a, b) = coverUp (l2 : lr)
          x1     = p1x l1

coverRight :: Containers -> (Float, Float)
coverRight []               = (0, 0)
coverRight [l]              = (p1y l, p2y l)
coverRight (l1 : (l2 : lr)) = if y1 <= b then (min a y1, max b (p2y l1)) else (a, b) 
    where (a, b) = coverRight (l2 : lr)
          y1     = p1y l1

minus :: Float -> Float -> Float
minus x y 
    | x > y     = x - y
    | otherwise = 0

{-populationLoop :: [Containers] -> Container -> Int -> [(Containers, Float)]
populationLoop lr c m 
    | m == 0    = []
    | otherwise = (ran, fitnessFunction ran c) : (populationLoop lr c (m - 1)) 
    where ran = blAlgorithm (lr !! (mod (randomN !! m) (length lr))) c []
-}

populationLoop :: [Containers] -> Container -> Int -> IO [(Containers, Float)]
populationLoop lr c m
    | m == 0    = return []
    | otherwise = do x   <- populationLoop lr c (m - 1)
                     n   <- randomIO :: IO Float
                     let ran = blAlgorithm (lr !! (floor (n * (fromIntegral (length lr))))) c [] 
                     return ((ran, fitnessFunction ran c) : x)

-- El primer argumento representa a cada configuracion junto con su fitness
-- El segundo argumento es el contenedor
-- El tercer argumento es el cardinal de la poblacion
-- El cuarto argumento es la cantidad de iteraciones del loop
-- El quinto argumento es la probabilidad de mutación
-- El sexto argumento es una lista de numeros flotantes random entre 0 y 1
-- El séptimo argumento es una lista de numeros enteros random
mainLoop :: [(Containers, Float)] -> Container -> Int -> Int -> Float -> [Int] -> [Float] -> [(Containers, Float)]
mainLoop pop c m t pm r_n r_l
    | t == 0    = pop
    | otherwise = mainLoop new_pop c m (t - 1) pm (drop (n + 2) r_n) (drop (2 * n) r_l)
    where example   = fst (head pop)
          n         = length example 
          pi        = map (\x -> map (\y -> rid y) (fst x)) pop
          (a, b)    = propSelection pi m r_l
          new       = crossover a b r_n
          new_r     = toLr new example 
          mut_n     = mutationNormal new_r pm (drop 2 r_n) (drop 2 r_l)
          mut       = mutation mut_n pm (drop n r_l)
          last      = blAlgorithm mut c []
          new_pop   = replaceWorst pop (last, fitnessFunction last c)


{-mainLoop :: [(Containers, Float)] -> Container -> Int -> Int -> Float -> [Int] -> [Float] -> [(Containers, Float)]
mainLoop pop c m t pm r_n r_l =
    iterateWhile (t > 0) ()-}

propSelection :: [[Int]] -> Int -> [Float] -> ([Int], [Int])
propSelection lr m r_l = let (p1, p2) = (head r_l, head (tail r_l))
                             a       = length (filter (\x -> x <= p1) lim)
                             b       = length (filter (\x -> x <= p2) lim) 
                         in (lr !! a, lr !! b )
    where lim = createL m

createL :: Int -> [Float]
createL m = map (\x -> (fromIntegral x :: Float) / (fromIntegral m :: Float)) [0..m]

crossover :: [Int] -> [Int] -> [Int] -> [Int]
crossover i1 i2 r_n = i1' ++ (i2 \\ i1')  
    where p   = mod (head r_n) (length i1) 
          q   = mod (head (tail r_n)) (length i1 - p) + 1
          i1' = take q (drop p i1)

mutationNormal :: Containers -> Float -> [Int] -> [Float] -> Containers
mutationNormal []       _ _ _ = []
mutationNormal (l : lr) pm r_n r_l = if head randomL < pm 
                                     then (lr !! ran) : (mutationNormal (tail (swap 0 ran lr)) pm r_n' r_l')  
                                     else l : (mutationNormal lr pm r_n' r_l')
    where ran  = mod (head r_n) (length lr)
          r_n' = drop 1 r_n
          r_l' = drop 1 r_l

-- Se asume que x < y
swap :: Int -> Int -> [a] -> [a]
swap x y xs = (take x xs) ++ [xs !! y] ++ take (y - x - 1) (drop (x + 1) xs) ++ [xs !! x] ++ take (length xs - y) (drop (y + 1) xs)   

mutation :: Containers -> Float -> [Float] -> Containers
mutation [] _ _          = []
mutation (l : lr) pm r_l = (if head r_l < pm then rotate90 l else l) : (mutation lr pm (drop 1 r_l)) 

rotate90 :: Container -> Container
rotate90 r = C {p1x = x,
                p1y = y,
                p2x = x + heightR r,
                p2y = y + widthR r,
                rid = rid r,
                nc  = nc r} 
    where x = p1x r
          y = p1y r

-- FIXME: si hay empate, quitar el de "máxima altura"
replaceWorst :: [(Containers, Float)] -> (Containers, Float) -> [(Containers, Float)]
replaceWorst pop new = (pop \\ [minimumBy byFitness pop]) ++ [new]

byFitness :: ([a], Float) -> ([a], Float) -> Ordering
byFitness (l1, f1) (l2, f2) = if f1 > f2 
                              then GT
                              else if f1 == f2 
                                   then EQ 
                                   else LT

------------------------------
-- END of genetic algorithm --
------------------------------  
          
--------------------------
-- END of main function --
--------------------------

-- ***************** --
-- Sector de pruebas --
-- ***************** --
{-r1 = C {p1x = 0, p1y = 0, p2x = 3, p2y = 3, rid = 1}
r2 = C {p1x = 10, p1y = 0, p2x = 15, p2y = 7, rid = 2}
r3 = C {p1x = 0, p1y = 0, p2x = 10, p2y = 5, rid = 3}
r4 = C {p1x = 0, p1y = 5, p2x = 7, p2y = 14, rid = 4}
c1 = C {p1x = 0, p1y = 0, p2x = 17, p2y = 20, nc = "c1", rid = 0}

cc = C {p1x = 0, p1y = 0, p2x = 20, p2y = 20, nc = "cc", rid = 0}
a1 = C {p1x = 0, p1y = 0, p2x = 5, p2y = 16, rid = 1}
a2 = C {p1x = 8, p1y = 0, p2x = 17, p2y = 14, rid = 2}
a3 = C {p1x = 5, p1y = 0, p2x = 8, p2y = 3, rid = 3}
a4 = C {p1x = 5, p1y = 14, p2x = 10, p2y = 16, rid = 4}
-}

