-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

-- Se comienza dando la "coordenada" de un punto inicial del polígono, y de allí las coordenadas de los vértices
-- que siguen en sentido horario.

-- Se trabajará con polígonos simples

module Polygons where 

import qualified Rectangles as Rec
import Data.List as List
--import Data.Vector
import Data.Matrix as Matrix
import Data.Either
import Graphics.Gloss as Gloss
import Control.Monad.Except as Exc

-- ================== --
-- Funciones de error --
-- ================== --

self_cut :: Polygon -> Bool
self_cut

-- Start point, End point
segment_intersection :: (Point, Point) -> (Point, Point) -> Bool 
segment_intersection (p1, p2) (p3, p4) = 

-- ==================== --
-- Funciones de cálculo --
-- ==================== --

polygon   = Polygon

polygons  = Polygons

translate = T

-- La rotación la pensamos a partir del último punto del polígono (el tercer argumento de L)
rotate    = R

scale     = S

combine   = C

-- No importa que escalar el polígono tenga translación, puesto que el área del rectángulo será la misma
min_rectangle :: Polygon -> Rectangle
min_rectangle (L p1 p2 p3) = let x = [fst p1, fst p2, fst p3]
                                 y = [snd p1, snd p2, snd p3]
                             in R {p1x = minimum x,
                                   p1y = minimum y,
                                   p2x = maximum x,
                                   p2y = maximum y,
                                   rid = -1}
min_rectangle (P pt pn)    = let r = min_rectangle pn
                                 x = fst pt
                                 y = snd pt
                             in R {p1x = min x (p1x r),
                                   p1y = min y (p1y r),
                                   p2x = max x (p2x r),
                                   p2y = max y (p2y r),
                                   rid = -1}
min_rectangle (T pt pn)    = min_rectangle pn
--min_rectangle (R ang pn)   =
min_rectangle (S fac pn)   = 


--pip :: Point -> Polygon -> Bool
--pip pt (L pt2)    = True
--pip pt (P pt2 pn) = 
--pip pt (T pt2 pn)  = pip (fst pt - fst pt2, snd pt - snd pt2) pn 
--pip pt (R ang pn)  = pip pt pn 
--pip pt (S fac pn)  = pip () pn
--pip pt (C pn1 pn2) = pip pt pn1 || pip pt pn2

{-
-- Funciones de acceso al tipo de datos "Point".
get_px :: Point -> Float
get_px (x, y) = x

get_py :: Point -> Float
get_py (x, y) = y

--(Point in Polygon) Chequeamos si un punto se encuentra "dentro" de un polígono dado.
pip :: Path -> Point -> Bool
pip py pi = [1, 2, 3, 4] == List.map head (group (sort (pip' py pi)))

pip' :: Path -> Point -> [Int]
pip' [x] pi          = [which_quadrant pi x] 
pip' (x : y : xs) pi = (f (which_quadrant pi x) (which_quadrant pi y)) : (pip' (y : xs) pi)
  where f 1 b = if b == 1 || b == 2 then 1 else 11 
        f 2 b = if b == 2 || b == 3 then 2 else 12
        f 3 b = if b == 3 || b == 4 then 3 else 13
        f 4 b = if b == 4 || b == 1 then 4 else 14
        f _ _ = 0

--Determina a qué cuadrante "pertenece" el vector cuyo origen es el primer punto que se le pasa como argumento,
--y cuyo extremo es el punto pasado como segundo argumento. Se considera como uno al cuadrante superior derecho,
--y se continua numerando en el sentido de las agujas del reloj.
which_quadrant :: Point -> Point -> Int 
which_quadrant (x1, y1) (x2, y2)
  | x2 > x1 && y2 > y1 = 1
  | x2 > x1            = 2
  | y2 < y1            = 3
  | otherwise          = 4            

--Chequeamos si un polígono contiene algún punto de otro polígono.
pol_contains :: Path -> Path -> Bool
pol_contains [] p2         = False
pol_contains (x : xs)   p2 = pip p2 x || pol_contains xs p2

--Calculamos el area de un poligono
pol_area :: Path -> Float
pol_area py = abs (pol_area' (py ++ [head py])) / 2 

pol_area' :: Path -> Float
pol_area' [x, y]           = get_px x * get_py y - get_py x * get_px y 
pol_area' (x : y : z : xs) = (get_px x * get_py y - get_py x * get_px y) + pol_area' (y : z : xs) 

--"Movemos" un polígono en el plano. Desplazamiento con respecto a la posición dada.
pol_move :: Path -> (Float, Float) -> Path
pol_move xs (x, y) = List.map (\(a, b) -> (x + a, y + b)) xs 

--"Movemos" un polígono en el plano. Se acomoda en la posición dada como argumento.
pol_move_to :: Path -> (Float, Float) -> Path
pol_move_to py (x, y)
    | x > hx && y > hy = pol_move py (mv1, mv2) 
    | x > hx           = pol_move py (mv1, -mv2) 
    | y < hy           = pol_move py (-mv1, -mv2)
    | otherwise        = pol_move py (-mv1, mv2)
    where (hx, hy) = List.head py 
          mv1      = abs (hx - x)
          mv2      = abs (hy - y)

--Escalamos un poligono. El punto de referencia será el primero del arreglo. El porcentaje de escalado toma
--como referencia el área del polígono.
pol_scale :: Path -> Float -> Path
pol_scale py per = let k    = sqrt (per / 100)
                       py'  = List.map (\(x, y) -> scaleMatrix k (Matrix.fromList 2 1 [x, y])) py
                       py'' = List.map (\m -> let [a, b] = Matrix.toList m
                                              in (a, b)) py'
                   in pol_move_to py'' (List.head py)

--Rotamos un polígono; el ángulo de rotación debe expresarse en radianes
pol_rotate :: Path -> Float -> Path
pol_rotate py rad = List.map (\(x, y) -> (x * c - y * s, y * c + x * s)) py
    where c = cos rad
          s = sin rad
-}
