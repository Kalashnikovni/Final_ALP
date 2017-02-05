=================================================================
===== Implementación de funciones referidas a los polígonos =====
=================================================================

Se comienza dando la "coordenada" de un punto inicial del polígono, y de allí las coordenadas de los vértices
que siguen en sentido horario.

> module Polygons where 

> import Data.List

> type Point   = (Double, Double) 
> type Polygon = [Point]

Funciones de acceso al tipo de datos "Point".

> get_px :: Point -> Double
> get_px (x, y) = x

> get_py :: Point -> Double
> get_py (x, y) = y

(Point in Polygon) Chequeamos si un punto se encuentra "dentro" de un polígono dado.

> pip :: Polygon -> Point -> Bool
> pip py pi = [1, 2, 3, 4] == map head (group (sort (pip' py pi)))

> pip' :: Polygon -> Point -> [Int]
> pip' [x] pi          = [which_quadrant pi x] 
> pip' (x : y : xs) pi = (f (which_quadrant pi x) (which_quadrant pi y)) : (pip' (y : xs) pi)
>   where f 1 b = if b == 1 || b == 2 then 1 else 11 
>         f 2 b = if b == 2 || b == 3 then 2 else 12
>         f 3 b = if b == 3 || b == 4 then 3 else 13
>         f 4 b = if b == 4 || b == 1 then 4 else 14
>         f _ _ = 0

Determina a qué cuadrante "pertenece" el vector cuyo origen es el primer punto que se le pasa como argumento,
y cuyo extremo es el punto pasado como segundo argumento. Se considera como uno al cuadrante superior derecho,
y se continua numerando en el sentido de las agujas del reloj.

> which_quadrant :: Point -> Point -> Int 
> which_quadrant (x1, y1) (x2, y2)
>   | x2 > x1 && y2 > y1 = 1
>   | x2 > x1            = 2
>   | y2 < y1            = 3
>   | otherwise          = 4            

Chequeamos si un polígono contiene a otro.

> pol_contains :: Polygon -> Polygon -> Bool
> pol_contains [] p2         = False
> pol_contains (x : xs)   p2 = pip p2 x || pol_intersection xs p2
