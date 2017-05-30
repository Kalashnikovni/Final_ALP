{-# LANGUAGE OverloadedStrings #-}

module Draw where

import Common
import Eval (addKerf, areaSigned)

import Data.List (maximumBy)
import Data.Text

import Text.Blaze.Internal as I
import Text.Blaze.Svg11 as S
import Text.Blaze.Svg11.Attributes as A
import Text.Blaze.Svg.Renderer.Pretty

-- Margen del contenedor con respecto a la imagen
margin = 10

margin2 = margin / 2

-- Quitamos el kerf para que se note cómo quedan los polígonos
-- TODO: kerf negativo
draw :: Container -> [[MyPoint]] -> Float -> String
draw c ps k = renderSvg $
              S.docTypeSvg ! 
              A.version "1.1" ! 
              A.fill "white" !
              A.width (textValue (pack (show (p2x c - p1x c + margin)))) ! 
              A.height (textValue (pack (show (p2y c - p1y c + margin)))) $ 
              do drawContainer c
                 makePaths ps "black"
                 makePaths (Prelude.map (\x -> p (addKerf k (\x -> areaSigned x > 0) (pol x))) ps) "green"
                 (S.path ! -- Dibuja líneas de corte
                  A.fill "none" !
                  A.stroke "red" !
                  A.strokeWidth "1" !
                  A.d (mkPath (do m (x + margin2) margin2
                                  l (x + margin2) (y + margin2)
                                  l margin2 (y + margin2))))
    where pol    = \y -> P {p = y, pn = ""}
          (x, y) = getSolution ps

-- Obtenemos máxima abcisa y ordenada para obtener la abcisa y la ordenada para el maderero
getSolution :: [[MyPoint]] -> (Float, Float) 
getSolution ps = (fst (maximumBy byFst ps'), snd (maximumBy bySnd ps')) 
    where ps' = Prelude.concat ps

byFst :: Ord a => (a, b) -> (a, b) -> Ordering
byFst (x, _) (y, _) = if x > y
                      then GT
                      else if x == y 
                           then EQ
                           else LT

bySnd :: Ord a => (b, a) -> (b, a) -> Ordering
bySnd (_, x) (_, y) = byFst (x, x) (y, y)

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

makePath :: [MyPoint] -> S.Path
makePath []     = S.z
makePath (p:ps) = do l (fst p) (snd p)
                     makePath ps

-- El segundo argumento es el color de las líneas
makePaths :: [[MyPoint]] -> AttributeValue -> S.Svg
makePaths []     s = S.string ""
makePaths (p:ps) s = do (S.path ! 
                         A.fill "none" !
                         transform "translate (5,5)" !
                         A.stroke s ! 
                         A.strokeWidth "1" ! 
                         A.d (mkPath (do m (fst (Prelude.head p)) (snd (Prelude.head p))
                                         makePath (Prelude.tail p))))
                        makePaths ps s 

