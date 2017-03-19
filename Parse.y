
{
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Applicative 
import Control.Monad (liftM, ap)
}

%name parseDef DefExp
%name parseDefs Defs
%name parseM Machine

%tokentype { Token }
%error     { parseError }
%monad     { P } { thenE } { returnE }
%lexer     { lexer } { TEof }

%token
    '+'         { TPlus      }
    '-'         { TMinus     }
    '*'         { TTimes     }
    '/'         { TDiv       }
    '='         { TEqual     }
    '('         { TParenO    }
    ')'         { TParenC    } 
    'x'         { TCopy      }
    KERF        { TKerf      }
    NAME        { TName $$   }
    POL         { TPol       }           
    SCALE       { TScale     }
    CON         { TCon       }
    FLOAT       { TFloat $$  }
    INT         { TNat $$    }
    X           { TX         }
    Y           { TY         }
    P1          { TPoint1    }
    P2          { TPoint2    }
    EMPTYL      { TEmpty     }

%right ':'

%%

Machine    : KERF FloatExp Defs { Kerf $2 $3 }

DefExp     : POL NAME '=' Polygon   { Dp $2 $4 1 }
           | CON NAME '=' Container { Dc $2 $4 1 }  
 
FloatExp   :: { Float }
FloatExp   : FloatExp '+' Term { $1 + $3 }
           | FloatExp '-' Term { $1 - $3 }
           | Term              { $1      }

Term      :: { Float }
Term       : Term '*' Factor { $1 * $3 }
           | Term '/' Factor { $1 / $3 } 
           | Factor          { $1      }

Factor     :: { Float }
Factor     : '-' Atom   { - $2 }
           | Atom       { $1   }

Atom       :: { Float }
Atom       : FLOAT            { $1 } 
           | '(' FloatExp ')' { $2 }
         
Point      :: { MyPoint }
Point      : X FloatExp Y FloatExp { ($2, $4) }

PointList  : EMPTYL          { []      }
           | Point PointList { $1 : $2 }

Polygon    :: { Polygon }
Polygon    : Point Point Point PointList { P ($1 : ($2 : ($3 : $4))) }

Container  :: { Container }
Container  : P1 Point P2 Point   { C { p1x = fst $2, p1y = snd $2, p2x = fst $4, p2y = snd $4, rid = 0 } }

Defs       : DefExp Defs                                     { $1 : $2                          }
           |                                                 { []                               }
           | POL NAME '=' Polygon 'x' INT SCALE FLOAT Defs   { copytimes (Dp $2 $4 $8) $6 ++ $9 }
           | CON NAME '=' Container 'x' INT SCALE FLOAT Defs { copytimes (Dc $2 $4 $8) $6 ++ $9 } 


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

{-printError :: E a -> IO (Maybe a)
printError (Ok v)     = return (Just v)
printError (Failed s) = do putStrLn "Error"
                           return Nothing-}

data Token  
    = TPlus      
    | TMinus     
    | TTimes     
    | TDiv       
    | TEqual
    | TCopy
    | TPoint     
    | TParenO    
    | TParenC     
    | TKerf
    | TPol
    | TScale
    | TCon
    | TName String
    | TFloat Float
    | TNat Int
    | TX
    | TY
    | TPointL    
    | TPolygon   
    | TPolygonL  
    | TPoint1    
    | TPoint2    
    | TContainer 
    | TEmpty
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
lexer cont ('+':cs)       = cont TPlus cs
lexer cont ('-':cs)       = cont TMinus cs
lexer cont ('*':cs)       = cont TTimes cs
lexer cont ('/':cs)       = cont TDiv cs
lexer cont ('=':cs)       = cont TEqual cs
lexer cont ('(':cs)       = cont TParenO cs
lexer cont (')':cs)       = cont TParenC cs
lexer cont ('[':cs)       = lexer cont cs
lexer cont (']':cs)       = cont TEmpty cs

lexNum cont [] = cont TEof []
lexNum cont cs = if null res 
                 then fromInt 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in cont (TFloat ((read int :: Float) + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else fromInt 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = cont (TNat (read int :: Int)) res

lexString cont []     = cont TEof []
lexString cont (c:cs) = case span isAlpha (c:cs) of
                         ("kerf", res)  -> cont TKerf res
                         ("pdef", res)  -> cont TPol res
                         ("cdef", res)  -> cont TCon res
                         ("X", res)     -> cont TX res
                         ("Y", res)     -> cont TY res   
                         ("copy", res)  -> cont TCopy res
                         ("scale", res) -> cont TScale res
                         (po, res)      -> if po == "P"
                                           then let (num, res') = span isDigit res
                                                in if num == "1" 
                                                   then cont TPoint1 res'
                                                   else if num == "2"
                                                        then cont TPoint2 res'
                                                        else cont TEof [] 
                                           else let (name, res') = span isAlphaNum (po ++ res)
                                                in cont (TName name) res'  

lexNat cont [] = cont TEof []
lexNat cont (c:cs)
    | isSpace c = lexNat cont cs
    | isDigit c = let (num, res) = span isDigit (c:cs)
                  in cont (TNat (read num :: Int)) res 

parseMac s = parseM s 1

}
