{
module Parse where
    
-- Módulos propios
import AST

-- Módulos prestados
import Data.Char
import Graphics.Gloss
import Control.Applicative 
import Control.Monad (liftM, ap)
}

%name parseDef DefExp
%name parseDefs Defs
%name parseExample Container

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
    '['         { TSBracketO }
    ']'         { TSBracketC }
    '('         { TParenO    }
    ')'         { TParenC    } 
    NAME        { TName $$   }
    POL         { TPol       }           
    CON         { TCon       }
    FLOAT       { TFloat $$  }
    X           { TX         }
    Y           { TY         }
    P1          { TPoint1    }
    P2          { TPoint2    }

%left X Y
%left FLOAT

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

PointList  : '[' ']'             { []      }
           | Point ':' PointList { $1 : $3 }

Polygon    :: { Polygon }
Polygon    : Point ':' Point ':' Point ':' PointList { P ($1 : ($3 : ($5 : $7))) }

Polygons   :: { Polygons }
Polygons   : '[' ']'              { Ps [] }
           | Polygon ':' Polygons { case $3 of
                                        Ps xs -> Ps ($1 : xs)
                                        _     -> Ps [] }

Container  :: { Container }
Container  : P1 Point P2 Point   { C $2 $4 }

Containers :: { Containers }
Containers : '[' ']'                  { Cs [] }
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
    deriving Show

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
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = TSBracketO : lexList cs
lexer (']':cs) = TSBracketC : lexer cs
lexer (',':cs) = TComma : lexer cs
lexer (':':cs) = TColon : lexer cs

lexNum :: String -> (String -> [Token]) -> [Token]
lexNum [] _ = []
lexNum cs f = if null res 
              then fromInt
              else if fres == '.' 
                   then let (float, res') = span isDigit (drop 1 res) 
                   in TFloat ((read int :: Float) + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float))) : (f res')  
                   else if fres == ' ' then fromInt else [] 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = TFloat (read int :: Float) : (f res)

lexString :: String -> [Token]
lexString [] = []
lexString (c:cs) = case span isAlpha of
                    ("pdef", res) -> TPol : lexer res
                    ("cdef", res) -> TCon : lexer res
                    ("P1", res)   -> TPoint1 : lexer res
                    ("P2", res)   -> TPoint2 : lexer res
                    ("X", res)    -> TX : lexer res
                    ("Y", res)    -> TY : lexer res   

{-lexer :: String -> [Token]
lexer []        = []
lexer (c : cs) 
    | isSpace c = lexer cs
    | isAlpha c = lexString (c:cs)
    | isDigit c = lexNum (c:cs) lexer
lexer ('\n':cs) = lexer cs
--lexer ('P':('1':cs)) = TPoint1 : lexPoint1 cs
--lexer ('P':('2':cs)) = TPoint2 : lexPoint1 cs
lexer ('+':cs) = TPlus : lexer cs
lexer ('-':cs) = TMinus : lexer cs
lexer ('*':cs) = TTimes : lexer cs
lexer ('/':cs) = TDiv : lexer cs
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = TSBracketO : lexList cs
lexer (']':cs) = TSBracketC : lexer cs
lexer (',':cs) = TComma : lexer cs
lexer (':':cs) = TColon : lexer cs

lexNum :: String -> (String -> [Token]) -> [Token]
lexNum [] _ = []
lexNum cs f = if null res 
              then fromInt
              else if fres == '.' 
                   then let (float, res') = span isDigit (drop 1 res) 
                   in TFloat ((read int :: Float) + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float))) : (f res')  
                   else if fres == ' ' then fromInt else [] 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = TFloat (read int :: Float) : (f res)

lexPoint1 :: String -> (String -> [Token]) -> [Token]
lexPoint1 []       f = []
lexPoint1 ('X':cs) f = TX : lexPoint2 cs lexPoint1 
lexPoint1 ('Y':cs) f = TY : lexPoint2 cs f
lexPoint1 (c:cs)
    | isSpace c = lexPoint1 cs

lexPoint2 :: String -> (String -> [Token]) -> [Token]
lexPoint2 [] _     = []
lexPoint2 (c:cs) f
    | isSpace c = lexPoint2 cs f
    | isDigit c = lexNum (c:cs) f

lexString :: String -> [Token]
lexString []     = []
lexString (c:cs) = 
    | isSpace c = lexString cs
    | otherwise = case span isAlpha cs of
                    ("pdef", res) -> TPol : lexString res 
                    ("cdef", res) -> TCon : lexString res
                    (name, res)   -> TName name : lexDef res

lexDef :: String -> [Token]
lexDef []     = []
lexDef (c:cs) 
    | isSpace c = lexDef cs 
    | otherwise = case c of
                    '=' -> TEqual 
                    _   -> [] 

lexList :: String -> [Token]
lexList []     = []
lexList (c:cs) 
    | isSpace c = lexList cs
    | c == 'X'  = lexPolygon (c:cs)
    | c == 'P'  = lexContainer (c:cs)
    | otherwise = []

lexPolygon :: String -> [Token]
lexPolygon []       = []
lexPolygon ('X':cs) = lexComma (lexPoint1 ('X':cs) lexPolygon)

lexComma :: String -> (String -> [Token]) -> [Token]
lexComma [] = []
lexComma (c:cs)
    | isSpace c = lexComma cs
    | c == ','  = TComma : 
-}

}
