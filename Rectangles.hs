-- ===================================================================
-- ===== Implementación de funciones referidas a los rectángulos =====
-- ===================================================================

module Rectangles where

-- Módulos propios
import Common

-- Módulos prestados
import AI.GeneticAlgorithm.Simple

import Control.DeepSeq
import Control.Monad.Random.Class
import Control.Monad.State.Lazy as StateMonad
import Control.Monad.Loops 

import Data.List as L

import GHC.Float

import System.Environment
import System.IO.Unsafe as Unsafe
import System.Random as Random

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
newtype Con = Con (Containers, Container, Float)

geneticAlgorithm :: Containers -> Container -> Int -> Int -> Float -> Maybe Containers 
geneticAlgorithm lr c m t pm 
    | and (map (\x -> checkInside x c) res) = Just res 
    | otherwise                             = Nothing
    where res = getContainers (runGA (mkStdGen 100) m (float2Double pm) (populationLoop (Con (lr, c, pm)) c m) (stopf t))

populationLoop lr@(Con (cs, cc, pm)) c m
    | m == 0    = return (Con ([], cc, pm))
    | otherwise = do let ran = blAlgorithm cs c [] 
                     return (Con (ran, cc, pm))

getContainers (Con (a, _, _)) = a
                     
stopf t a i = i < t 

instance NFData Container where
    rnf x = seq x ()

instance NFData Con where
    rnf x = seq x ()

instance Chromosome Con where
    crossover (Con (cs1, c1, pm1)) (Con (cs2, c2, pm2)) = 
        do p <- getRandomR (1, length cs1 - 1)
           q <- getRandomR (1, length cs1 - p)
           let c1' = take q (drop p cs1) 
           return [Con (c1' ++ (cs2 \\ c1'), c1, pm1)]

    mutation (Con (cs, c, pm)) = 
        do g  <- mut cs pm
           r1 <- getRandomR (0, length cs - 1)
           r2 <- getRandomR (0, length cs - 1)
           return (Con (swap r1 r2 g, c, pm))

    fitness (Con (cs, c, pm)) = float2Double (fitnessFunction cs c) 

-- Chequeo si efectivamente todos los rectángulos se encuentran dentro del contenedor
-- El segundo argumento es el contenedor
checkInside :: Container -> Container -> Bool
checkInside r c = if p1x r >= p1x c && p1y r >= p1y c && p2x r <= p2x c && p2y r <= p2y c
                  then True
                  else False 

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

mut [] _      = return []
mut (l:lr) pm = do p   <- getRandomR (0.0, 1.0)
                   res <- mut lr pm
                   return ((if p < pm
                            then rotate90 l
                            else l) : res) 

-- Se asume que x < y
swap :: Int -> Int -> [a] -> [a]
swap x y xs = (take x xs) ++ [xs !! y] ++ take (y - x - 1) (drop (x + 1) xs) ++ [xs !! x] ++ take (length xs - y) (drop (y + 1) xs)   

rotate90 :: Container -> Container
rotate90 r = C {p1x = x,
                p1y = y,
                p2x = x + heightR r,
                p2y = y + widthR r,
                rid = rid r,
                nc  = nc r} 
    where x = p1x r
          y = p1y r

------------------------------
-- END of genetic algorithm --
------------------------------  

