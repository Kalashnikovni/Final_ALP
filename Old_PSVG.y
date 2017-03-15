{
module Parse_SVG where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Monad (liftM, ap)
import Control.Applicative (Applicative(..))
}

%name parsePath SPath 
%name parseRect Rect

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
    FLOAT  { TFloat $$  }
    WIDTH  { TWidth     }
    HEIGHT { THeight    }

%%

Rect : WIDTH FloatExp HEIGHT FloatExp  { C { p1x = 0, p1y = 0, p2x = $2, p2y = $4, rid = 0 } }

FloatExp : '-' FLOAT { -$2 }
         | FLOAT     { $1  }

SPath :: { SVG }
SPath : M FloatExp FloatExp Path { M_abs ($2, $3) : $4 }
      | m FloatExp FloatExp Path { M_abs ($2, $3) : $4 }

Path  :: { SVG }
Path  : m FloatExp FloatExp Path { M_rel ($2, $3) : $4    }
      | M FloatExp FloatExp Path { M_abs ($2, $3) : $4    }
      | h FloatExp Path          { H_abs $2 : $3          }
      | H FloatExp Path          { H_rel $2 : $3          }
      | v FloatExp Path          { V_abs $2 : $3          }
      | V FloatExp Path          { V_rel $2 : $3          }
      | l FloatExp FloatExp Path { L_rel ($2, $3) : $4    }
      | L FloatExp FloatExp Path { L_abs ($2, $3) : $4    }
      | FloatExp FloatExp Path   { Complete ($1, $2) : $3 }
      | Z                        { [Z]                    }

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
    | TFloat Float
    | TWidth
    | THeight
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

get_paths :: String -> [String]
get_paths [] = []
get_paths (c:cs)
    | isPrefixOf " d=" (c:cs)  = takeWhile (/= '"') cs' : get_paths (dropWhile (/= '"') cs')
    | isPrefixOf "\nd=" (c:cs) = takeWhile (/= '"') cs' : get_paths (dropWhile (/= '"') cs')
    | otherwise                = get_paths cs
    where cs' = drop 3 cs

get_rects :: String -> [String]
get_rects [] = []
get_rects (c:cs)
    | isPrefixOf "<rect" (c:cs)  = takeWhile (/= '>') cs' : get_rects (dropWhile (/= '/') cs')
    | otherwise                  = get_rects cs
    where cs' = drop 5 cs

lexer cont []       = cont TEof []
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | isAlpha c = lexString cont (c:cs)
    | isSpace c = lexer cont cs
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
lexer cont (c:cs)   = lexer cont cs

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

lexString cont [] = cont TEof []
lexString cont cs = case span isAlpha cs of
                        ("width=", res) -> cont TWidth res
                        ("height=",res) -> cont THeight res
                        (s, res)        -> lexer cont res 

parseSVGP s = myConcat (map (\x -> parsePath x 1) (get_paths s))  

parseSVGR s = map (\x -> parseRect x 1) (get_rects s)

myConcat :: [PR SVG] -> PR [SVG]
myConcat []     = Ok []
myConcat (x:xs) = case x of 
                    Ok v     -> do res <- myConcat xs
                                   return (v : res)
                    Failed s -> Failed s

}
