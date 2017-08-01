{
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
}

%name parseF FloatExp
%name parseC SContainer
%name parseDefs Defs
%name parseM Machine

%tokentype { Token }
%error     { parseError }
%monad     { P } { thenE } { returnE }
%lexer     { lexer } { TEof }

%token
    '~'         { TPSep      }
    '-'         { TMinus     }
    '='         { TEqual     }
    '['         { TRBracketO }
    ']'         { TRBracketC }
    ','         { TComma     }
    NAME        { TName $$   }
    NAT         { TNat $$    }
    FLOAT       { TFloat $$  }
    X           { TX         }
    KERF        { TKerf      }
    CON         { TCon       }
    POL         { TPol       }           
    COPY        { TCopy      }
    SCALE       { TScale     }

%%

FloatExp   : '-' FLOAT { -$2 }
           | FLOAT     { $1  }

Point      :: { MyPoint }
Point      : FloatExp '~' FloatExp  { ($1, $3) }

Polygon    :: { [MyPoint] }
Polygon    : Point             { [$1]    }
           | Point ',' Polygon { $1 : $3 }

BPolygon   :: { [MyPoint] }
BPolygon   : '[' ']'         { [] }
           | '[' Polygon ']' { $2 }

Container  :: { Container }
Container  : FLOAT X FLOAT   { C { p1x = 0, p1y = 0, p2x = $1, p2y = $3, rid = 0, nc = ""} }

SContainer :: { Container }
           : NAME '=' FLOAT X FLOAT {C {p1x = 0, p1y = 0, p2x = $3, p2y = $5, nc = $1} }

DefExp     : POL NAME '=' BPolygon  { Dp (P {p = $4, pn = $2}) 1 }
           | CON NAME '=' Container { Dc ($4 {nc = $2}) 1        }  

Defs       :                                                  { []                                               }
           | DefExp Defs                                      { $1 : $2                                          }
           | POL NAME '=' BPolygon COPY NAT SCALE FLOAT Defs  { copytimes (Dp (P {p = $4, pn = $2}) $8) $6 ++ $9 }
           | CON NAME '=' Container COPY NAT SCALE FLOAT Defs { copytimes (Dc ($4 {nc = $2}) $8) $6 ++ $9        } 

Machine    : KERF FloatExp Defs { Kerf $2 $3 }

{

copytimes :: a -> Int -> [a]
copytimes v times
    | times == 0 = []
    | otherwise  = v : (copytimes v (times - 1))

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
parseError _ = \s l -> failE ("Error de parseo en la linea " ++ show l) s l

data Token  
    = TPSep
    | TMinus     
    | TEqual
    | TRBracketO
    | TRBracketC 
    | TComma
    | TName String
    | TNat Int
    | TFloat Float
    | TX
    | TKerf
    | TCon
    | TPoint1    
    | TPoint2    
    | TPol
    | TCopy
    | TScale
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []             = cont TEof []
lexer cont ('\n':cs)      = \l -> lexer cont cs (l + 1)
lexer cont (c:cs)
    | isSpace c = lexer cont cs
    | isAlpha c = lexString cont (c:cs)
    | isDigit c = lexNum cont (c:cs) 
lexer cont ('-':('-':cs)) = lexer cont (dropWhile (/= '\n') cs)
lexer cont ('~':cs)       = cont TPSep cs
lexer cont ('-':cs)       = cont TMinus cs
lexer cont ('=':cs)       = cont TEqual cs
lexer cont ('[':cs)       = cont TRBracketO cs
lexer cont (']':cs)       = cont TRBracketC cs
lexer cont (',':cs)       = cont TComma cs

lexNum cont [] = cont TEof []
lexNum cont cs = if null res 
                 then fromInt 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in case float of
                                [] -> cont TEof []
                                _  -> cont (TFloat ((read int :: Float) + ((read float :: Float) 
                                            / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else fromInt 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = cont (TNat (read int :: Int)) res

lexString cont []     = cont TEof []
lexString cont (c:cs) = case span isAlpha (c:cs) of
                         ("kerf", res)  -> cont TKerf res
                         ("pdef", res)  -> cont TPol res
                         ("cdef", res)  -> cont TCon res
                         ("x", res)     -> cont TX res
                         ("copy", res)  -> cont TCopy res
                         ("scale", res) -> cont TScale res
                         (po, res)      -> let (name, res') = span isAlphaNum (po ++ res)
                                           in cont (TName name) res'  

parseMac s = parseM s 1

parseFloat s = parseF s 1

}
