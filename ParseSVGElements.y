{
module ParseSVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
}

%name parseR Rect
%name parsePo Polygon
%name parsePa Path 

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
    NAME   { TName $$   }
    SCALE  { TScale     }
    SKEWX  { TSkewX     }
    SKEWY  { TSkewY     }
    MATRIX { TMatrix    }
    TRANSLATE { TTranslate }
    ROTATE    { TRotate    }

%%

FloatExp : '-' FLOAT { -$2 }
         | FLOAT     { $1  }

Point :: { MyPoint }
Point : FloatExp FloatExp     { ($1, $2) }
      | FloatExp ',' FloatExp { ($1, $3) }

PointList :: { [MyPoint] }
PointList :                 { []      }
          | Point PointList { $1 : $2 } 

Sufix : TransformList Name { ($1, $2) }

Name :      { "" }
     | NAME { $1 }

SufixS : ScaleList Name { ($1, $2) }

Transform : TRANSLATE FloatExp                                                               { Thrash                     }
          | TRANSLATE Point                                                                  { Thrash                     }
          | ROTATE FloatExp                                                                  { Thrash                     }
          | SCALE FloatExp                                                                   { Scale $2                   }
          | SKEWX FloatExp                                                                   { SkewX $2                   }
          | SKEWY FloatExp                                                                   { SkewY $2                   }
          | MATRIX FloatExp ',' FloatExp ',' FloatExp ',' FloatExp ',' FloatExp ',' FloatExp { Matrix $2 $4 $6 $8 $10 $12 } 

TransformList :                         { []      }
              | Transform TransformList { $1 : $2 }

ScaleList :                          { []            }
          | SCALE FloatExp ScaleList { Scale $2 : $3 }

Rect  :: { Rect }
Rect  : FloatExp FloatExp SufixS { Rect {h = $1, w = $2, tr = fst $3, nr = snd $3} }

Polygon :: { SVGPolygon }
Polygon : PointList Sufix { Pol {po = $1, tpo = fst $2, npo = snd $2} }

SPath :: { [PathCommand] }
SPath : M Point PathL { M_abs $2 : $3 }
      | m Point PathL { M_rel $2 : $3 }

PathL :: { [PathCommand] }
PathL : h FloatExp PathL { H_rel $2 : $3    }
      | H FloatExp PathL { H_rel $2 : $3    }
      | v FloatExp PathL { V_abs $2 : $3    }
      | V FloatExp PathL { V_abs $2 : $3    }
      | l Point PathL    { L_rel $2 : $3    }
      | L Point PathL    { L_abs $2 : $3    }
      | Point PathL      { Complete $1 : $2 }
      | Z                { [Z]              }

Path  :: { Path }
Path  : SPath Sufix { Path {pa = $1, tpa = fst $2, npa = snd $2} }

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
    | TName String
    | TScale
    | TSkewX
    | TSkewY
    | TMatrix
    | TTranslate
    | TRotate
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []        = cont TEof []
lexer cont ('\n':cs) = \l -> lexer cont cs (l + 1)
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | isSpace c = lexer cont cs
    | isAlpha c = lexString cont (c:cs)
lexer cont ('-':cs)  = cont TMinus cs
lexer cont (',':cs)  = cont TComma cs
lexer cont ('(':cs)  = lexer cont cs
lexer cont (')':cs)  = lexer cont cs

lexNum cont [] = cont TEof []
lexNum cont cs = if null res 
                 then fromInt 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in cont (TFloat ((read int :: Float) 
                                    + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else fromInt
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = cont (TFloat (read int :: Float)) res

lexString cont [] = cont TEof []
lexString cont cs = case span isAlpha cs of
                        ("m", res)        -> cont Tm res
                        ("M", res)        -> cont TM res
                        ("h", res)        -> cont Th res
                        ("H", res)        -> cont TH res
                        ("v", res)        -> cont Tv res
                        ("V", res)        -> cont TV res
                        ("l", res)        -> cont Tl res
                        ("L", res)        -> cont TL res
                        ("z", res)        -> cont TZ res
                        ("Z", res)        -> cont TZ res
                        ("scale", res)    -> cont TScale res
                        ("skewX", res)    -> cont TSkewX res 
                        ("skewY", res)    -> cont TSkewY res 
                        ("matrix", res)   -> cont TMatrix res
                        ("translate",res) -> cont TTranslate res
                        ("rotate", res)   -> cont TRotate res
                        (ran, res)        -> let (name, res') = span isAlphaNum (ran ++ res)
                                             in cont (TName name) res'
                

parseRect s    = parseR s 1

parsePath s    = parsePa s 1  

parsePolygon s = parsePo s 1  

}
