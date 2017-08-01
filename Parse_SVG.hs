-- ============================================
-- ===== Módulo para parsear archivos SVG =====
-- ============================================

{-# LANGUAGE OverloadedStrings #-}

module Parse_SVG where


-- Módulos prestados
import Data.ByteString as BS
import Data.List as L
import Data.Text as T

import Text.XmlHtml as XML

-- Funciones --
---------------

getElements :: [Node] -> (Node -> Text) -> Text -> [Text] 
getElements [] _ _   = []
getElements (n : ns) f s
    | isElement n = if elementTag n == s
                    then (f n) : (getElements ns f s ++ eC)
                    else getElements ns f s ++ eC
    | otherwise   = getElements ns f s
    where eC = getElements (elementChildren n) f s

getValue :: Node -> Text -> Text
getValue n s
    | L.null vs = ""
    | otherwise = snd (L.head vs) 
    where vs = L.filter (\(x,y) -> x == s) (elementAttrs n)

lookR :: Node -> Text
lookR n 
    | T.null w || T.null h = ""
    | otherwise            = T.append w (T.cons ' ' (T.append h (T.cons ' ' (T.append t (T.cons ' ' id)))))
    where w  = getValue n "width"
          h  = getValue n "height"
          t  = getValue n "transform"
          id = getValue n "id"    

lookP :: Node -> Text
lookP n 
    | T.null p  = ""
    | otherwise = T.append p (T.cons ' ' (T.append t (T.cons ' ' id))) 
    where p  = getValue n "points"
          t  = getValue n "transform"
          id = getValue n "id" 

lookD :: Node -> Text
lookD n 
    | T.null d  = ""
    | otherwise = T.append d (T.cons ' ' (T.append t (T.cons ' ' id))) 
    where d  = getValue n "d"
          t  = getValue n "transform"
          id = getValue n "id" 

