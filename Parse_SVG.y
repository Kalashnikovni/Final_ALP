{
module Parse_SVG where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
}

%name parseSVG SVGExp

%tokentype { Token }
%error     { parseError }
%monad     { P } { thenE } { returnE }
%lexer     { lexer } { TEof }

%token
    STRING      { TString $$ }
    PATH        { TPath      }   

%%

SVGExp : PATH STRING SVGExp { $2 : $3 }
       |                    { []      }
 

{

data PR a = Ok a 
            | Failed String deriving Show

type LineNumber = Int

type P a  = String -> LineNumber -> PR a 

returnE :: a -> P a
returnE v = \s l -> Ok v

thenE :: P a -> (a -> P b) -> P b
thenE m k = \s l -> case m s l of
                        Ok v      -> k v s l
                        Failed s' -> Failed s'

failE :: String -> P a
failE v = \s l -> Failed v

catchE :: P a -> (String -> P a) -> P a
catchE m k = \s l -> case m s l of
                        Ok v      -> Ok v
                        Failed s' -> k s' s l

parseError :: Token -> P a
parseError _ = \s l -> failE ("Error de parseo en la línea " ++ show l) s l

data Token   
    = TPath
    | TString String 
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []           = cont TEof []
lexer cont (c:('d':cs)) = if isSpace c || c == '\n' then lexerD cont cs else lexer cont cs
lexer cont ('\n':cs)    = \l -> lexer cont cs (l + 1)
lexer cont (c:cs)
    | isSpace c = lexer cont cs
    | c == '<'  = lexPath cont cs
    | otherwise = lexer cont cs

lexerD cont [] = cont TEof []
lexerD cont (c:cs)      
    | isSpace c = lexerD cont cs
    | c == '='  = let (x, res) = (takeWhile (/= '\"') (drop 1 cs), dropWhile (/= '\"') (drop 1 cs))
                  in cont (TString x) res
    | otherwise = lexer cont cs

lexPath cont []     = cont TEof []
lexPath cont (c:cs) = case span isAlpha (c:cs) of
                        ("path", res) -> cont TPath res
                        (_, res)      -> lexer cont res

parsesvg s = parseSVG s 1

}
