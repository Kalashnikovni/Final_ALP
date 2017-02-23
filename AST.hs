module AST where

-- Módulos prestados
import Graphics.Gloss

type Segment  = (Point, Point)

data Pol      = P Point Pol | L Point Point Point 
                | T Point Pol -- Translate  
                | S Float Pol deriving Show -- Scale

data Polygon  = R Float Pol

data PolError = ThreeInLine -- Error que indica que tres puntos consecutivos se encuentran sobre la misma recta
                | SelfCut -- Error que indica que dos lados del polígono se intersecan en un punto que no es
                          -- un vértice del mismo

type PolMonad = Either PolError

data Polygons = C Polygon Polygon | E deriving Show -- Combine

