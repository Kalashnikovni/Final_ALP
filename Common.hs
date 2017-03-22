module Common where

-- Tipos para polígonos desde línea de comando --
-------------------------------------------------

type MyPoint    = (Float, Float)

type Polygon    = [MyPoint]  

type Polygons   = [Polygon] 

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- Es decir, con un vector del cuadrante I.
-- El int representa el id del rectángulo.
data Container  = C {p1x :: Float,
                     p1y :: Float,
                     p2x :: Float,
                     p2y :: Float,
                     rid :: Int} deriving (Show, Eq) 
                 
type Containers = [Container] 

data Def        = Dc String Container Float
                  | Dp String Polygon Float -- ID (solo para el usuario), def. del polígono y escalamiento 
               deriving Show

data Machine    = Kerf Float [Def] deriving Show

-- Tipos para archivos SVG --
-----------------------------

data PathCommand = M_rel MyPoint
                 | M_abs MyPoint
                 | H_rel Float
                 | H_abs Float
                 | V_rel Float
                 | V_abs Float
                 | L_rel MyPoint
                 | L_abs MyPoint
                 | Complete MyPoint -- Usado para los espacios sin comando
                 | Z 
              deriving Show 
