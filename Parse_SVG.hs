{-# LANGUAGE OverloadedStrings #-}

module Parse_SVG where

import Data.ByteString as BS
import Data.List as List
import Data.Text as Text

import Text.XmlHtml as XML

get_elements :: [Node] -> (Node -> Text) -> Text -> [Text] 
get_elements [] _ _   = []
get_elements (n : ns) f s
    | isElement n = if elementTag n == s
                    then (f n) : (get_elements ns f s ++ eC)
                    else get_elements ns f s ++ eC
    | otherwise   = get_elements ns f s
    where eC = get_elements (elementChildren n) f s

lookd :: Node -> Text
lookd n 
    | List.null d = ""
    | otherwise   = snd (d !! 0) 
    where d = Prelude.filter (\(x, y) -> x == "d") (elementAttrs n) 

lookc :: Node -> Text
lookc n 
    | List.null w || List.null h = ""
    | otherwise                  = Text.append (snd (w !! 0)) (Text.cons ' ' (snd (h !! 0)))
    where w = Prelude.filter (\(x, y) -> x == "width") (elementAttrs n)
          h = Prelude.filter (\(x, y) -> x == "height") (elementAttrs n)

lookp :: Node -> Text
lookp n 
    | List.null p = ""
    | otherwise   = snd (p !! 0) 
    where p = Prelude.filter (\(x, y) -> x == "points") (elementAttrs n)

