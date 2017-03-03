-- =================================================================
-- ===== Implementación de funciones referidas a los polígonos =====
-- =================================================================

-- Se comienza dando la "coordenada" de un punto inicial del polígono, y de allí las coordenadas de los vértices
-- que siguen en sentido horario.

-- Se trabajará con polígonos simples

module Polygons where 

-- Módulos propios
import Common

-- Módulos prestados
-- import qualified Rectangles as Rec
import Data.List as List
-- import Data.Vector
import Data.Matrix as Matrix
import Data.Either
import Graphics.Gloss as Gloss
import Graphics.Gloss.Geometry.Line as GlossLine
import Control.Monad.Except as Exc

-- ============================ --
-- Chequeo de polígonos válidos --
-- ============================ --

valid_pol :: Polygon -> Maybe Polygon
valid_pol (P xs)
    | length xs < 3 = Nothing
    | otherwise     = if valid_pol' (xs ++ [head xs]) then Just (P xs) else Nothing

valid_pol' :: [Point] -> Bool
valid_pol' (x:(y:ys)) = not (Polygons.compare x y ys) && (valid_pol' (y:ys))
valid_pol' _          = True

compare :: Point -> Point -> [Point] -> Bool   
compare x y (z1:(z2:zs)) = case intersectSegSeg x y z1 z2 of
                            Nothing -> Polygons.compare x y (z2:zs)
                            Just p  -> if p == x || p == y then False else True  
compare x y _            = False



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
