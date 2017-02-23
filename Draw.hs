module Draw where

import Rectangles
import Graphics.Gloss

r_to_path :: Rectangle -> Picture
r_to_path r = line [(x1, y1), (x1, y2), (x2, y2), (x2, y1), (x1, y1)]
    where x1 = p1x r
          x2 = p2x r
          y1 = p1y r
          y2 = p2y r

solution :: [Rectangle] -> Rectangle -> IO ()
solution lr c = display (FullScreen (1000, 1000)) white (pictures (map r_to_path (c : lr))) 

