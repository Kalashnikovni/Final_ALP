{
module Parse_SVG where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Graphics.SVG.ReadPath
import Control.Applicative 
import Control.Monad (liftM, ap)
}

%name parseSVG SVGExp

%tokentype { Token }
%error     { parseError }
%monad     { E } { thenE } { returnE }

%token
    D           { TD         }
    STRING      { TString $$ }
    PATH        { TPath      }   

%right ':'

%%

SVGExp : PATH DExp SVGExp { $2 : $3 }
       |                  { []      }

DExp   : D STRING         { D $2 }
 

{

data E a = Ok a | Failed String

thenE :: E a -> (a -> E b) -> E b
m `thenE` k = 
   case m of 
       Ok a     -> k a
       Failed e -> Failed e

returnE :: a -> E a
returnE a = Ok a

failE :: String -> E a
failE err = Failed err

catchE :: E a -> (String -> E a) -> E a
catchE m k = 
   case m of
      Ok a     -> Ok a
      Failed e -> k e

parseError :: [Token] -> E a
parseError _ = failE "Parse error"

data Token   
    = TD
    | TPath
    | TString String 
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer :: String -> [Token]
lexer []        = []
lexer (c:('d':cs)) = if isSpace c || c == '\n' then lexerD cs else lexer cs
lexer ('\n':cs) = lexer cs
lexer (c:cs)
    | isSpace c = lexer cs
    | c == '<'  = lexPath cs
    | otherwise = lexer cs

lexPath :: String -> [Token]
lexPath []     = []
lexPath (c:cs) = case span isAlpha (c:cs) of
                    ("path", res) -> TPath : lexer res
                    (_, res)      -> lexer res

lexerD :: String -> [Token]
lexerD [] = []
lexerD (c:cs)      
    | isSpace c = lexerD cs
    | c == '='  = let (x, res) = (takeWhile (/= '\"') (drop 1 cs), dropWhile (/= '\"') (drop 1 cs))
                  in TD : (TString x : lexer res)
    | otherwise = lexer cs

}
