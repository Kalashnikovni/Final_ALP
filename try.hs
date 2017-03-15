{-# LANGUAGE OverloadedStrings #-}

module Try where

import Text.XmlHtml as XML
import Data.ByteString as BS
import Data.Text as Text

main = do arg <- Prelude.getLine
          x   <- BS.readFile arg  
          case parseXML "Error" x of
            Left s  -> Prelude.putStrLn s
            Right d -> print $ get_paths (docContent d)

get_paths :: [Node] -> [Text] 
get_paths []       = []
get_paths (n : ns)
    | isElement n = if elementTag n == "path"
                    then (lookd n) : (get_paths ns ++ eC)
                    else get_paths ns ++ eC
    | otherwise   = get_paths ns
    where eC = get_paths (elementChildren n)

lookd :: Node -> Text
lookd n = snd $ Prelude.head (Prelude.filter (\(x, y) -> x == "d") (elementAttrs n)) 

{-
get_path_element :: Element -> Maybe Text
get_path_element d = if nameLocalName (elementName d) == "path"
                     then get_path_attributes (elementAttributes d)
                     else Nothing   

get_path_attributes :: Map Name Text -> Maybe Text
get_path_attributes d = Map.lookup (Name {nameLocalName = Text.singleton 'd', nameNamespace = Nothing, namePrefix = Nothing}) d 

get_paths_node :: [Node] -> [Maybe Text]
get_paths_node []                     = []
get_paths_node ((NodeElement e) : ns) = (get_path_element e) : (get_paths_node ns)
get_paths_node (_ : ns)               = get_paths_node ns
-}
