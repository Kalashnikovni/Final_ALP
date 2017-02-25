module AST where

-- Módulos prestados
import Graphics.Gloss 

data Def        = Dp String Polygon
                  | Dc String Container deriving Show

data Polygon    = P [Point] deriving Show

data Polygons   = Ps [Polygon] deriving Show

data Container  = C Point Point deriving Show 
                 
data Containers = Cs [Container] deriving Show

--data Exp        = E Polygons Containers deriving Show

--data Exp        = E Containers Polygons deriving Show

--data NumExp    = IE Int -- IntExp
--                 | FE Float -- FloatExp 

{-data Digit = Zero 
             | One 
             | Two 
             | Three 
             | Four 
             | Five 
             | Six 
             | Seven 
             | Eight 
             | Nine

data Nat    = Digit
              | Digit Nat 

data IntExp = Cons Integer
              | SMinus IntExp
              | Plus IntExp IntExp
              | Minus IntExp IntExp
              | Times IntExp IntExp
              | Div IntExp IntExp

data FloatExp = F IntExp Nat

data 

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
-}

