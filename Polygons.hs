-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

-- Se comienza dando la "coordenada" de un punto inicial del polígono, y de allí las coordenadas de los vértices
-- que siguen en sentido horario.

module Polygons where 

import Data.List as List
--import Data.Vector
import Data.Matrix as Matrix

type Point   = (Double, Double) 
type Polygon = [Point]

-- Funciones de acceso al tipo de datos "Point".
get_px :: Point -> Double
get_px (x, y) = x

get_py :: Point -> Double
get_py (x, y) = y

--(Point in Polygon) Chequeamos si un punto se encuentra "dentro" de un polígono dado.
pip :: Polygon -> Point -> Bool
pip py pi = [1, 2, 3, 4] == List.map head (group (sort (pip' py pi)))

pip' :: Polygon -> Point -> [Int]
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
pol_contains :: Polygon -> Polygon -> Bool
pol_contains [] p2         = False
pol_contains (x : xs)   p2 = pip p2 x || pol_contains xs p2

--Calculamos el area de un poligono
pol_area :: Polygon -> Double
pol_area py = abs (pol_area' (py ++ [head py])) / 2 

pol_area' :: Polygon -> Double
pol_area' [x, y]           = get_px x * get_py y - get_py x * get_px y 
pol_area' (x : y : z : xs) = (get_px x * get_py y - get_py x * get_px y) + pol_area' (y : z : xs) 

--"Movemos" un polígono en el plano. Desplazamiento con respecto a la posición dada.
pol_move :: Polygon -> (Double, Double) -> Polygon
pol_move xs (x, y) = List.map (\(a, b) -> (x + a, y + b)) xs 

--"Movemos" un polígono en el plano. Se acomoda en la posición dada como argumento.
pol_move_to :: Polygon -> (Double, Double) -> Polygon
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
pol_scale :: Polygon -> Double -> Polygon
pol_scale py per = let k    = sqrt (per / 100)
                       py'  = List.map (\(x, y) -> scaleMatrix k (Matrix.fromList 2 1 [x, y])) py
                       py'' = List.map (\m -> let [a, b] = Matrix.toList m
                                              in (a, b)) py'
                   in pol_move_to py'' (List.head py)

--Rotamos un polígono; el ángulo de rotación debe expresarse en radianes
pol_rotate :: Polygon -> Double -> Polygon
pol_rotate py rad = List.map (\(x, y) -> (x * c - y * s, y * c + x * s)) py
    where c = cos rad
          s = sin rad



