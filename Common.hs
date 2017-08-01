-- ========================================
-- ===== Definición de tipos de datos =====
-- ========================================

module Common where

-- Tipos para polígonos desde línea de comando --
-------------------------------------------------

type MyPoint    = (Float, Float)

data Polygon    = P {p   :: [MyPoint],
                     pn  :: String} deriving (Eq, Show)  

type Polygons   = [Polygon] 

-- Representamos un rectángulo de acuerdo a su diagonal "de izquierda a derecha, de abajo hacia arriba". 
-- Es decir, con un vector del cuadrante I.
-- El int representa el id del rectángulo.
data Container  = C {p1x :: Float,
                     p1y :: Float,
                     p2x :: Float,
                     p2y :: Float,
                     nc  :: String,
                     rid :: Int} deriving (Eq, Show)

instance Ord Container where
    x <= y = rid x <= rid y
                 
type Containers = [Container]

data Def        = Dc Container Float
                  | Dp Polygon Float -- ID (solo para el usuario), def. del polígono y escalamiento 
               deriving Show

data Machine    = Kerf Float [Def] deriving Show

-- Tipos para archivos SVG --
-----------------------------

data Transform   = Scale Float
                 | SkewX Float
                 | SkewY Float
                 | Matrix Float Float Float Float Float Float 
                 | Thrash
              deriving Show

data Rect        = Rect {w  :: Float,
                         h  :: Float,
                         tr :: [Transform],
                         nr :: String} deriving Show 

data SVGPolygon  = Pol {po  :: [MyPoint],
                        tpo :: [Transform],
                        npo :: String} deriving Show 

data PathCommand = M_rel MyPoint
                 | M_abs MyPoint
                 | H_rel Float
                 | H_abs Float
                 | V_rel Float
                 | V_abs Float
                 | L_rel MyPoint
                 | L_abs MyPoint
                 | Complete MyPoint -- Usado para los espacios sin completar
                 | Z 
              deriving Show 

data Path        = Path {pa  :: [PathCommand],
                         tpa :: [Transform],
                         npa :: String} deriving Show

data SVG         = SVGR Rect
                 | SVGPo SVGPolygon
                 | SVGPa Path
              deriving Show
