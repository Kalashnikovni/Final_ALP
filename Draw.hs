module Draw where

import Common

import Data.Text

import Text.Blaze.Internal as I
import Text.Blaze.Svg11 as S
import Text.Blaze.Svg11.Attributes as A
import Text.Blaze.Svg.Renderer.Pretty

import Graphics.Gloss

{-r_to_path :: Rectangle -> Picture
r_to_path r = line [(x1, y1), (x1, y2), (x2, y2), (x2, y1), (x1, y1)]
    where x1 = p1x r
          x2 = p2x r
          y1 = p1y r
          y2 = p2y r

solution :: [Rectangle] -> Rectangle -> IO ()
solution lr c = display (FullScreen (1000, 1000)) white (pictures (map r_to_path (c : lr))) 
-}

-- Margen del contenedor con respecto a la imagen
margin = 10

margin2 = margin / 2

draw :: Container -> [[MyPoint]] -> String
draw c ps = renderSvg $
            S.docTypeSvg ! 
            A.version "1.1" ! 
            A.width (textValue (pack (show (p2x c - p1x c + margin)))) ! 
            A.height (textValue (pack (show (p2y c - p1y c + margin)))) $ 
            do drawContainer c
               makePaths ps

drawContainer :: Container -> S.Svg
drawContainer c = S.path ! 
                  A.fill "none" !
                  A.stroke "black" !
                  A.strokeWidth "1" !
                  A.d (mkPath (do m (p1x c + margin2) (p1y c + margin2)
                                  l (p2x c + margin2) (p1y c + margin2)
                                  l (p2x c + margin2) (p2y c + margin2)
                                  l (p1x c + margin2) (p2y c + margin2)
                                  S.z))

makePath :: [MyPoint] -> S.Path
makePath []     = S.z
makePath (p:ps) = do l (fst p + margin2) (snd p + margin2)  
                     makePath ps

makePaths :: [[MyPoint]] -> S.Svg
makePaths []     = S.string ""
makePaths (p:ps) = do (S.path ! 
                       A.fill "none" !
                       A.stroke "black" ! 
                       A.strokeWidth "1" ! 
                       A.d (mkPath (do m (fst (Prelude.head p) + margin2) (snd (Prelude.head p) + margin2)
                                       makePath (Prelude.tail p))))
                      makePaths ps 

