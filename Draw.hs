-- ============================================================
-- ===== Módulo para dibujar los polígonos en formato SVG =====
-- ============================================================

{-# LANGUAGE OverloadedStrings #-}

module Draw where

-- Módulos propios
import Common
import Eval (addKerf, areaSigned)

-- Módulos prestados
import Control.Lens ((^.))

import Data.Ext 
import Data.Geometry.Point (CCW(..), point2, xCoord, yCoord)
import Data.Geometry.Polygon (centroid, fromPoints)
import Data.List as L (head, length, map, maximumBy, null, tail)
import Data.Text

import Text.Blaze.Internal as I
import Text.Blaze.Svg11 as S
import Text.Blaze.Svg11.Attributes as A
import Text.Blaze.Svg.Renderer.Pretty

-- Definiciones de constantes --
--------------------------------

margin = 10

margin2 = margin / 2

-- Funciones --
---------------

draw :: Container -> Polygons -> Float -> String
draw c ps k = renderSvg $
              S.docTypeSvg ! 
              A.version "1.1" ! 
              A.fill "white" !
              A.width (textValue (pack (show (p2x c - p1x c + margin)))) ! 
              A.height (textValue (pack (show (p2y c - p1y c + margin)))) $ 
              do drawContainer c
                 makePaths listpoints (L.map pn ps) "black"
                 makePaths (Prelude.map (\x -> p (addKerf k notAreaSigned (pol x))) listpoints) 
                           (L.map (\x -> []) ps) "green"
                 (S.path ! -- Dibuja líneas de corte
                  A.fill "none" !
                  A.stroke "red" !
                  A.strokeWidth "1" !
                  A.d (mkPath (do m (x + margin2) margin2
                                  l (x + margin2) (y + margin2)
                                  l margin2 (y + margin2))))
    where listpoints = L.map p ps 
          pol        = \y -> P {p = y, pn = ""}
          (x, y)     = getSolution listpoints

notAreaSigned :: [MyPoint] -> CCW
notAreaSigned ps
    | areaSigned ps == CW = CCW
    | otherwise           = CW

drawContainer :: Container -> S.Svg
drawContainer c = S.path ! 
                  A.fill "white" !
                  A.stroke "black" !
                  A.strokeWidth "1" !
                  A.d (mkPath (do m (p1x c + margin2) (p1y c + margin2)
                                  l (p2x c + margin2) (p1y c + margin2)
                                  l (p2x c + margin2) (p2y c + margin2)
                                  l (p1x c + margin2) (p2y c + margin2)
                                  S.z))

-- Obtenemos máxima abcisa y ordenada por donde se debe cortar en el aserradero
getSolution :: [[MyPoint]] -> (Float, Float) 
getSolution listpoints = (fst (maximumBy byFst ps'), snd (maximumBy bySnd ps')) 
    where ps' = Prelude.concat listpoints

byFst :: Ord a => (a, b) -> (a, b) -> Ordering
byFst (x, _) (y, _) = if x > y
                      then GT
                      else if x == y 
                           then EQ
                           else LT

bySnd :: Ord a => (b, a) -> (b, a) -> Ordering
bySnd (_, x) (_, y) = byFst (x, x) (y, y)

makePath :: [MyPoint] -> S.Path
makePath []     = S.z
makePath (p:ps) = do l (fst p) (snd p)
                     makePath ps

-- El segundo argumento es el color de las líneas
makePaths :: [[MyPoint]] -> [String] -> AttributeValue -> S.Svg
makePaths [] _ _             = S.string ""
makePaths (p:ps) names color = do (S.path ! 
                                   A.fill "none" !
                                   transform "translate (5,5)" !
                                   A.stroke color ! 
                                   A.strokeWidth "1" ! 
                                   A.d (mkPath (do m (fst (Prelude.head p)) (snd (Prelude.head p))
                                                   makePath (Prelude.tail p))))
                                  if L.null h
                                  then makePaths ps (L.tail names) color
                                  else do (S.text_ (text (pack h)) !
                                           A.x (stringValue (show (cenx - l))) !
                                           A.y (stringValue (show ceny)) !
                                           A.fill "black" !
                                           A.fontSize "30")
                                          makePaths ps (L.tail names) color 
    where (cenx, ceny) = myCentroid p
          h            = L.head names
          l            = fromIntegral (L.length h * 7)

-- Buscamos el centroide para escribir el nombre del polígono
myCentroid :: [MyPoint] -> MyPoint
myCentroid points = (cen ^. xCoord, cen ^. yCoord)
    where cen = centroid (fromPoints (L.map (\(x,y) -> point2 x y :+ ()) points))

