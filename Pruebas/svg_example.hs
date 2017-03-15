import Graphics.SVG.ReadPath
import Data.Char

f (s:('d':('=':xs))) = if isSpace s || s == '\n' then takeWhile (/= '\"') (drop 1 xs) else f xs
f (x:xs)             = f xs
f _                  = []

file = do x <- readFile "drawing.svg"
          s <- pathFromString (f x)
          case s of
            [] -> return Nothing
            _  -> return (Just s)
