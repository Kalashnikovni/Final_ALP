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
    '++'        { TConcat    } 
    NAME        { TName $$   }
    POL         { TPol       }           
    CON         { TCon       }
    FLOAT       { TFloat $$  }
    X           { TX         }
    Y           { TY         }
    P1          { TPoint1    }
    P2          { TPoint2    }
    EMPTYL      { TEmpty     }

%right ':'
%left  '++'

%%

DefExp     : POL NAME '=' Polygon   { Dp $2 $4 }
           | CON NAME '=' Container { Dc $2 $4 }  

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

Polygons   :: { Polygons }
Polygons   : EMPTYL                { Ps [] }
           | Polygon '++' Polygons { case $3 of
                                        Ps xs -> Ps ($1 : xs)
                                        _     -> Ps [] }

Container  :: { Container }
Container  : P1 Point P2 Point   { C $2 $4 }

Containers :: { Containers }
Containers : EMPTYL                   { Cs [] }
           | Container ':' Containers { case $3 of
                                            Cs xs -> Cs ($1 : xs)
                                            _     -> Cs []}

Defs       : DefExp Defs { $1 : $2 }
           |             { []      }


{

{-instance Functor HappyIdentity where
  fmap = liftM

instance Applicative HappyIdentity where
  pure  = return
  (<*>) = ap-}

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
    | TPoint     
    | TColon     
    | TSBracketO 
    | TSBracketC 
    | TParenO    
    | TParenC     
    | TConcat
    | TPol
    | TCon
    | TName String
    | TFloat Float
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
lexer []       = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isAlpha c = lexString (c:cs)
    | isDigit c = lexNum (c:cs) lexer
lexer ('+':cs) = TPlus : lexer cs
lexer ('-':cs) = TMinus : lexer cs
lexer ('*':cs) = TTimes : lexer cs
lexer ('/':cs) = TDiv : lexer cs
lexer ('=':cs) = TEqual : lexer cs
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = lexList cs
lexer (']':cs) = getRBracket1 cs ++ lexer cs
lexer (',':cs) = getRBracket2 cs ++ lexer cs

getRBracket1 :: String -> [Token]
getRBracket1 [] = [TColon, TEmpty]
getRBracket1 (c:cs)
    | isSpace c = getRBracket1 cs
    | c == ']'  = [TColon, TEmpty, TConcat, TEmpty]
    | otherwise = [TColon, TEmpty]

getRBracket2 :: String -> [Token]
getRBracket2 [] = []
getRBracket2 (c:cs)
    | isSpace c = getRBracket2 cs
    | c == '['  = [TConcat]
    | otherwise = [TColon]

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
                    ("pdef", res) -> TPol : lexer res
                    ("cdef", res) -> TCon : lexer res
                    ("X", res)    -> TX : lexer res
                    ("Y", res)    -> TY : lexer res   
                    (po, res)     -> if po == "P"
                                     then let (num, res') = span isDigit res
                                          in if num == "1" 
                                             then TPoint1 : lexer res'
                                             else if num == "2"
                                                  then TPoint2 : lexer res'
                                                  else [] 
                                     else let (name, res') = span isAlphaNum (po ++ res)
                                          in TName name : lexer res'  

lexList :: String -> [Token]
lexList []     = []
lexList (c:cs) = case span (\x -> isAlpha x || isDigit x || isPunctuation x) (c:cs) of
                    ("X", res)  -> TX : lexer res
                    ("[", res)  -> TConcat : lexer res 
                    ("P1", res) -> TPoint1 : lexer res
                    _           -> lexer (c:cs)

}
