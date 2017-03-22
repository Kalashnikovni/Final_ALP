{
module Parse_Path where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Monad (liftM, ap)
import Control.Applicative (Applicative(..))
}

%name parseF FloatExp
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

%%

FloatExp : '-' FLOAT { -$2 }
         | FLOAT     { $1  }

SPath :: { [PathCommand] }
SPath : M FloatExp FloatExp Path     { M_abs ($2, $3) : $4 }
      | m FloatExp FloatExp Path     { M_rel ($2, $3) : $4 }
      | M FloatExp ',' FloatExp Path { M_abs ($2, $4) : $5 }
      | m FloatExp ',' FloatExp Path { M_rel ($2, $4) : $5 }

Path  :: { [PathCommand] }
Path  : h FloatExp Path              { H_rel $2 : $3    }
      | H FloatExp Path              { H_rel $2 : $3    }
      | v FloatExp Path              { V_abs $2 : $3    }
      | V FloatExp Path              { V_abs $2 : $3    }
      | l FloatExp FloatExp Path     { L_rel ($2, $3) : $4    }
      | L FloatExp FloatExp Path     { L_abs ($2, $3) : $4    }
      | l FloatExp ',' FloatExp Path { L_rel ($2, $4) : $5    }
      | L FloatExp ',' FloatExp Path { L_abs ($2, $4) : $5    }
      | FloatExp FloatExp Path       { Complete ($1, $2) : $3 }
      | FloatExp ',' FloatExp Path   { Complete ($1, $3) : $4 }
      | Z                            { [Z]                    }

{

data PR a = Ok a 
            | Failed String deriving Show

instance Functor PR where
    fmap = liftM

instance Applicative PR where
    pure  = return
    (<*>) = ap

instance Monad PR where
    return x         = Ok x
    (Ok x) >>= f     = f x
    (Failed s) >>= f = Failed s 

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
    | TString String
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []       = cont TEof []
lexer cont ('m':cs) = cont Tm cs
lexer cont ('M':cs) = cont TM cs
lexer cont ('h':cs) = cont Th cs
lexer cont ('H':cs) = cont TH cs
lexer cont ('v':cs) = cont Tv cs
lexer cont ('V':cs) = cont TV cs
lexer cont ('l':cs) = cont Tl cs
lexer cont ('L':cs) = cont TL cs
lexer cont ('z':cs) = cont TZ cs
lexer cont ('Z':cs) = cont TZ cs
lexer cont ('-':cs) = cont TMinus cs
lexer cont (',':cs) = cont TComma cs
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

parseFloat s = parseF s 1

}
