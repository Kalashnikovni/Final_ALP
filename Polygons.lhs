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
> pip [x] pi          = True 
> pip (x : y : xs) pi = (f (which_quadrant pi x) (which_quadrant pi y)) && (pip (y : xs) pi)
>   where f 1 b = b == 1 || b == 2
>         f 2 b = b == 2 || b == 3
>         f 3 b = b == 3 || b == 4
>         f 4 b = b == 4 || b == 1
>         f _ _ = False

Determina a qué cuadrante "pertenece" el vector cuyo origen es el primer punto que se le pasa como argumento,
y cuyo extremo es el punto pasado como segundo argumento. Se considera como uno al cuadrante superior derecho,
y se continua numerando en el sentido de las agujas del reloj.

> which_quadrant :: Point -> Point -> Int 
> which_quadrant (x1, y1) (x2, y2)
>   | x2 > x1 && y2 > y1 = 1
>   | x2 > x1            = 2
>   | y2 < y1            = 3
>   | otherwise          = 4            
