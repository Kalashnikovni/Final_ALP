module Common where

type MyPoint       = (Float, Float)

data Def           = Dp String Polygon Float -- ID, def. del polígono y escalamiento 
                     | Dc String Container Float deriving Show

newtype Polygon    = P [MyPoint] deriving Show

newtype Polygons   = Ps [Polygon] deriving Show

data Container     = C {p1x :: Float,
                        p1y :: Float,
                        p2x :: Float,
                        p2y :: Float,
                        rid :: Int} deriving (Show, Eq) 
                 
newtype Containers = Cs [Container] deriving Show

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- Es decir, con un vector del cuadrante I.
-- El int representa el id del rectángulo.
{-data Rectangle = R {p1x :: Float,
                    p1y :: Float,
                    p2x :: Float,
                    p2y :: Float,
                    rid :: Int} deriving (Show, Eq)
-}

-- Tipos para archivos SVG --
-----------------------------
newtype DExp = D String deriving Show

type SVGExp  = [DExp]
