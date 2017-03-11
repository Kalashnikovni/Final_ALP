module Common where

-- Tipos para polígonos desde línea de comando --
-------------------------------------------------

type MyPoint       = (Float, Float)

newtype Polygon    = P [MyPoint] deriving Show

newtype Polygons   = Ps [Polygon] deriving Show

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- Es decir, con un vector del cuadrante I.
-- El int representa el id del rectángulo.
data Container     = C {p1x :: Float,
                        p1y :: Float,
                        p2x :: Float,
                        p2y :: Float,
                        rid :: Int} deriving (Show, Eq) 
                 
newtype Containers = Cs [Container] deriving Show

data Def           = Dp String Polygon Float -- ID, def. del polígono y escalamiento 
                     | Dc String Container Float deriving Show

data Machine       = Kerf Float [Def] deriving Show

-- Tipos para archivos SVG --
-----------------------------

data SVGCommand = M_abs MyPoint
                | M_rel MyPoint
                | L_abs MyPoint
                | L_rel MyPoint
                | Complete MyPoint -- Usado para los espacios sin comando
                | Z 
             deriving Show 

type SVG = [SVGCommand]
