{
module Parse_Path where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
}

%name parseR Rect
%name parseP SPath 

%tokentype { Token }
%error     { parseError }
%monad     { P } { thenE } { returnE }
%lexer     { lexer } { TEof }

%token
    m      { Tm         }       
    M      { TM         }
    h      { Th         }       
    H      { TH         }       
    v      { Tv         }
    V      { TV         }
    l      { Tl         }
    L      { TL         }
    Z      { TZ         }
    '-'    { TMinus     }  
    ','    { TComma     }  
    FLOAT  { TFloat $$  }
    EMPTYL { TEmpty     }

%%

FloatExp : '-' FLOAT { -$2 }
         | FLOAT     { $1  }

Point :: { MyPoint }
Point : FloatExp FloatExp     { ($1, $2) }
      | FloatExp ',' FloatExp { ($1, $3) }

Rect  :: { Container }
Rect  : FloatExp FloatExp { C {p1x = 0, p1y = 0, p2x = $1, p2y = $2, rid = 0} }

Polygon :: { Polygon }
Polygon : EMPTYL        { []      }
        | Point Polygon { $1 : $2 } 

SPath :: { [PathCommand] }
SPath : M Point Path     { M_abs $2 : $3 }
      | m Point Path     { M_rel $2 : $3 }

Path  :: { [PathCommand] }
Path  : h FloatExp Path { H_rel $2 : $3    }
      | H FloatExp Path { H_rel $2 : $3    }
      | v FloatExp Path { V_abs $2 : $3    }
      | V FloatExp Path { V_abs $2 : $3    }
      | l Point Path    { L_rel $2 : $3    }
      | L Point Path    { L_abs $2 : $3    }
      | Point Path      { Complete $1 : $2 }
      | Z               { [Z]              }

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
parseError _ = \s l -> failE ("Error de parseo en la linea " ++ show l) s l

data Token   
    = Tm
    | TM
    | Th
    | TH
    | Tv
    | TV
    | Tl
    | TL
    | TZ
    | TMinus
    | TComma
    | TFloat Float
    | TEmpty
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []        = cont TEof []
lexer cont ('\n':cs) = \l -> lexer cont cs (l + 1)
lexer cont ('m':cs)  = cont Tm cs
lexer cont ('M':cs)  = cont TM cs
lexer cont ('h':cs)  = cont Th cs
lexer cont ('H':cs)  = cont TH cs
lexer cont ('v':cs)  = cont Tv cs
lexer cont ('V':cs)  = cont TV cs
lexer cont ('l':cs)  = cont Tl cs
lexer cont ('L':cs)  = cont TL cs
lexer cont ('z':cs)  = cont TZ cs
lexer cont ('Z':cs)  = cont TZ cs
lexer cont ('-':cs)  = cont TMinus cs
lexer cont (',':cs)  = cont TComma cs
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | isSpace c = lexer cont cs
    | otherwise = cont TEof []

lexNum cont [] = cont TEof []
lexNum cont cs = if null res 
                 then cont TEof [] 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in cont (TFloat ((read int :: Float) 
                                    + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else cont TEof [] 
    where (int, res) = span isDigit cs  
          fres       = head res

parsePath s = parseP s 1  

parseRect s = parseR s 1

}
