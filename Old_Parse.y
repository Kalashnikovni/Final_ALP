{
module Parse where
    
-- Módulos propios
import AST

-- Módulos prestados
import Data.Char
import Data.List
import Graphics.Gloss
import Control.Applicative 
import Control.Monad (liftM, ap)
}

%name parseDef DefExp
%name parseDefs Defs
%name parseEx DefExp

%tokentype { Token }
%error     { parseError }
%monad     { E } { thenE } { returnE }

%token
    '+'         { TPlus      }
    '-'         { TMinus     }
    '*'         { TTimes     }
    '/'         { TDiv       }
    '='         { TEqual     }
    ':'         { TColon     }
    '('         { TParenO    }
    ')'         { TParenC    } 
    'x'         { TCopy      }
    ','         { TComma     }
    ';'         { TPComma    }
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

DefExp     : POL NAME '=' Polygon   { Dp $2 $4 1 }
           | CON NAME '=' Container { Dc $2 $4 1 }  

NatExp     :: { Int }
           : NatExp '+' NTerm   { $1 + $3 }
           | NatExp '-' NTerm   { $1 - $3 }
           | NTerm              { $1 }

NTerm      :: { Int }
           : NTerm '*' NAtom   { $1 + $3 }
           | NTerm '/' NAtom   { $1 + $3 }
           | NAtom             { $1      }

NAtom      :: { Int }
           : INT               { abs $1 }
           | '(' NatExp ')'    { $2     }
       
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
         
Point      :: { Point }
Point      : X FloatExp Y FloatExp { ($2, $4) }

PointList  : EMPTYL              { []      }
           | Point ':' PointList { $1 : $3 }

Polygon    :: { Polygon }
Polygon    : Point ':' Point ':' Point ':' PointList { P ($1 : ($3 : ($5 : $7))) }

Container  :: { Container }
Container  : P1 Point P2 Point   { C $2 $4 }

Defs       : DefExp ',' Defs { $1 : $3 }
           |                 { []      }
           | POL NAME '=' Polygon 'x' NatExp   SCALE FloatExp ';' Defs { copytimes (Dp $2 $4 $8) $6 ++ $10 }
           | CON NAME '=' Container 'x' NatExp SCALE FloatExp ';' Defs { copytimes (Dc $2 $4 $8) $6 ++ $10 }  


{

copytimes :: a -> Int -> [a]
copytimes v times
    | times == 0 = []
    | otherwise  = v : (copytimes v (times - 1))

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

printError :: E a -> IO (Maybe a)
printError (Ok v)     = return (Just v)
printError (Failed s) = do putStrLn "Error"
                           return Nothing

data Token  
    = TPlus      
    | TMinus     
    | TTimes     
    | TDiv       
    | TEqual
    | TCopy
    | TPoint     
    | TColon     
    | TComma
    | TPComma
    | TSBracketO 
    | TSBracketC 
    | TParenO    
    | TParenC     
    | TConcat
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
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer :: String -> [Token]
lexer []        = []
lexer ('\n':cs) = lexer cs
lexer (c:cs)
    | isSpace c = lexer cs
    | isAlpha c = lexString (c:cs)
    | isDigit c = lexNum (c:cs) lexer
lexer ('+':cs) = TPlus : lexer cs
lexer ('-':cs) = TMinus : lexer cs
lexer ('*':cs) = TTimes : lexer cs
lexer ('/':cs) = TDiv : lexer cs
lexer ('=':cs) = TEqual : lexer cs
lexer ('x':cs) = TCopy : lexer cs
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = lexer cs
lexer (']':cs) = lexer cs
lexer (',':cs) = TComma : lexer cs
lexer (';':cs) = TPComma : lexer cs

lexNum :: String -> (String -> [Token]) -> [Token]
lexNum [] _ = []
lexNum cs f = if null res 
              then fromInt 
              else if fres == '.' 
                   then let (float, res') = span isDigit (drop 1 res) 
                   in TFloat ((read int :: Float) + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float))) : (f res')  
                   else fromInt 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = TFloat (read int :: Float) : (f res)

lexString :: String -> [Token]
lexString []     = []
lexString (c:cs) = case span isAlpha (c:cs) of
                    ("pdef", res)  -> TPol : lexer res
                    ("cdef", res)  -> TCon : lexer res
                    ("X", res)     -> TX : lexer res
                    ("Y", res)     -> TY : lexer res   
                    ("x", res)     -> TCopy : lexNat res
                    ("scale", res) -> TScale : lexer res
                    (po, res)      -> if po == "P"
                                      then let (num, res') = span isDigit res
                                           in if num == "1" 
                                              then TPoint1 : lexer res'
                                              else if num == "2"
                                                   then TPoint2 : lexer res'
                                                   else [] 
                                      else let (name, res') = span isAlphaNum (po ++ res)
                                           in TName name : lexer res'  

lexNat :: String -> [Token]
lexNat [] = []
lexNat (c:cs)
    | isSpace c = lexNat cs
    | isDigit c = let (num, res) = span isDigit (c:cs)
                  in TNat (read num :: Int) : lexer res 
}
