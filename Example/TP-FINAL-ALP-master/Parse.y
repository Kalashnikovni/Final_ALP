{

module Parse where
import Data.Char
import Representacion
import Data.Time
--import Eval
import System.Console.Readline
import Control.Monad.Except

}

%name parseExpr
%tokentype { Token }
%error { parseError }
%monad { IO } { (>>=) } { return }

%token
	string	 { TokenString $$ }
	float	 { TokenFloat $$ }
	date	 { TokenDate $$ }
	celda    { TokenCelda $$ }
	'.'	 { TokenPunto }
	','	 { TokenComa }
	'='	 { TokenEval }
	'"'	 { TokenComilla }
	'=='     { TokenIg  }
	'<'      { TokenMenor }
	'>'      { TokenMayor }
	'<='     { TokenMenorIg }
	'>='     { TokenMayorIg }
	'&'	 { TokenAnd }
	'|'	 { TokenOr }
	'+'	 { TokenMas }
	'-'	 { TokenMenos }
	'*'	 { TokenPor }
	'/'	 { TokenDiv }
	'(' 	 { TokenParIzq }
	')'	 { TokenParDer }
	'['	 { TokenCorIzq }
	']'	 { TokenCorDer }
	'^'	 { TokenPot }
	':'	 { TokenDoblePunto }
	'!'      { TokenAdm }
	suma	 { TokenSUMATORIA }
	si	 { TokenSI }
	concat   { TokenCONCATENACION }
	contarsi { TokenCONTARSI }
	absoluto { TokenABSOLUTO }
	ahora    { TokenTODAY }
	true 	 { TokenTRUE }
	false	 { TokenFALSE }
	difdias	 { TokenDIFDAYS }
	easterday { TokenEASTERDAY }
	difyears { TokenDIFYEARS }
	distrexpn { TokenDISTREXPN }
%%

Exp : string				 			{ Str $1}
    | float				   			{ Fl $1 }
    | true				 			{ Bo True }
    | false				 			{ Bo False }
    | date							{ Date $1 }
    | '-' float				 			{ Fl (-1*$2) }
    | '=' ExpEval		 	 			{ Eval $2 }

ExpEval : ExpEval '==' ExpEvalT	 	 			{ Ig $1 $3}
	| ExpEval '<' ExpEvalT		 			{ Menor $1 $3}			
	| ExpEval '>' ExpEvalT		 			{ Mayor $1 $3}
	| ExpEval '<=' ExpEvalT		 			{ MenorIg $1 $3 }
	| ExpEval '>=' ExpEvalT		 			{ MayorIg $1 $3 }
	| ExpEval '&' ExpEvalT		 			{ And $1 $3 }
	| ExpEval '|' ExpEvalT		 			{ Or $1 $3 }
	| ExpEval '+' ExpEvalT 		 			{ Mas $1 $3 }
	| ExpEval '-' ExpEvalT		 			{ Menos $1 $3 } 
	| ExpEvalT			 			{ $1 }

ExpEvalT : ExpEvalT '*' ExpEvalF	 			{ Por $1 $3 }
	 | ExpEvalT '^' ExpEvalF	 			{ Potencia $1 $3 }
	 | ExpEvalT '/' ExpEvalF	 			{ Div $1 $3 }
	 | ExpEvalF			 			{ $1 }

ExpEvalF : float			 			{ EFl $1 }
	 | celda   	 		 			{ Var $1 }
	 | celda ':' celda		 			{ Ran $1 $3 }
	 | true				 			{ EBo True }
	 | '"' string '"'	 	 			{ EStr $2 }
	 | false			 			{ EBo False }
	 | '(' ExpEval ')'		 			{ $2 }
	 | suma '(' ExpList		 			{ Suma $3 }
	 | concat '(' ExpList		 			{ Concat $3 }
	 | contarsi '(' ExpEval ',' ExpEval ')'                 { ContarSi $3 $5}
	 | absoluto '(' ExpEval ')'	 			{ Abs $3 }
	 | si '(' ExpEval ',' ExpEval ',' ExpEval ')' 		{ Si $3 $5 $7 }
	 | '-' ExpEvalF			 			{ Opuesto $2 }
	 | ahora '(' ')'				        { Hoy }
	 | '!'                           			{ SimboloLigadura }
	 | date							{ EDate $1 }
	 | difdias '(' ExpEval ',' ExpEval ')'			{ DiasEntre $3 $5 }
	 | difyears '(' ExpEval ',' ExpEval ')'			{ CantYears $3 $5 }
	 | easterday '(' ExpEval ')'                            { DiaPascua $3 }
	 | distrexpn '(' ExpEval ',' ExpEval ',' ExpEval ')'    { DistrExpN $3 $5 $7 }						


ExpList : ExpEval ')'			 			{ [$1] }
	| ExpEval ',' ExpList		 			{ $1:$3 } 

{



parseError :: [Token] -> IO a
parseError _ = ioError (error "Parse error")




data Token = TokenString String
	   | TokenFloat Float
	   | TokenCelda (String,Int)
	   | TokenDate Day
	   | TokenPunto
	   | TokenComa
	   | TokenEval 
	   | TokenComilla 
	   | TokenIg  
	   | TokenMenor
	   | TokenMayor
	   | TokenMenorIg
	   | TokenMayorIg
	   | TokenAnd
	   | TokenOr
	   | TokenSI
	   | TokenDoblePunto
	   | TokenMas 
	   | TokenMenos 
	   | TokenPor 
	   | TokenAdm
	   | TokenDiv 
	   | TokenParIzq 
	   | TokenParDer
	   | TokenCONTARSI 
	   | TokenCorIzq
	   | TokenCorDer 
	   | TokenPot
	   | TokenSUMATORIA 
	   | TokenCONCATENACION 
	   | TokenABSOLUTO 
	   | TokenTODAY
	   | TokenDIFDAYS
	   | TokenTRUE
	   | TokenFALSE
	   | TokenEASTERDAY
	   | TokenDIFYEARS 
	   | TokenDISTREXPN
	deriving(Show)




lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
	| isDigit c = lexer1 (c:cs)
	| c == '-'  = lexer1 (c:cs)
	| c == '='  = TokenEval : (lexer2 cs)
	| isSpace c = lexer cs 
    	| otherwise = [TokenString (c:cs)]

lexer1 :: String -> [Token]
lexer1 [] = []
lexer1 cs = if cs!!0 /= '-' then
	    if rest0 == [] then [TokenFloat (read (num))] else
		if rest0!!0 == '.' then 
			if rest1 == [] then [TokenFloat (read (num ++ num1) / 10^(length num1))] else [TokenString cs] 
		else if rest0!!0 == '/' then if rest1 /= [] && rest1!!0 == '/' then if rest2 == [] then [TokenDate (fromGregorian (read num2) (read num1) (read num))]
										                   else [TokenString cs]
								               else [TokenString cs]
				        else [TokenString cs]
	    else
	    if rest5 == [] then [TokenMenos,TokenFloat (read (num4))] else
		if rest5!!0 == '.' then 
			if rest6 == [] then [TokenMenos,TokenFloat (read (num4 ++ num5) / 10^(length num5))] else [TokenString cs] 
		else [TokenString cs]
		where (num,rest0) = span (\x -> isDigit x || isSpace x) cs  -- 23 "/392/132"
		      (num1,rest1) = span (\x -> isDigit x || isSpace x) (tail rest0) -- 392 "/132"
		      (num2,rest2) = span (\x -> isDigit x || isSpace x) (tail rest1) -- 132
		      cs' = tail cs 
		      (spaces,rest4) = span (\i -> i == ' ') cs' 
		      (num4,rest5) = span (\x -> isDigit x || isSpace x) rest4 
		      (num5,rest6) = span (\x -> isDigit x || isSpace x) (tail rest5)


lexer2 :: String -> [Token]
lexer2 [] = []
lexer2 (c:cs) 
      | isSpace c = lexer2 cs
      | isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda 'a' (c:cs)
      | isAlpha c = lexFunc (c:cs)
      | isDigit c = lexNum (c:cs)
      | c == '-' = TokenMenos : lexer2 cs
      | c == '.' = TokenPunto : lexer2 cs
      | c == ',' = TokenComa : lexer2 cs
      | c == '"' = TokenComilla : lexer3 cs []
      | c == '=' = if cs!!0 == '=' then TokenIg : lexer2 (tail cs) else [TokenString (c:cs)]
      | c == '<' = if cs!!0 == '=' then TokenMenorIg : lexer2 (tail cs) else TokenMenor : lexer2 cs
      | c == '>' = if cs!!0 == '=' then TokenMayorIg : lexer2 (tail cs) else TokenMayor : lexer2 cs
      | c == '&' = TokenAnd : lexer2 cs
      | c == '|' = TokenOr : lexer2 cs
      | c == '+' = TokenMas : lexer2 cs
      | c == '!' = TokenAdm : lexer2 cs
      | c == '-' = TokenMenos : lexer2 cs
      | c == '*' = TokenPor : lexer2 cs
      | c == '^' = TokenPot : lexer2 cs
      | c == ':' = TokenDoblePunto : lexer2 cs
      | c == '/' = TokenDiv : lexer2 cs
      | c == '(' = TokenParIzq : lexer2 cs
      | c == ')' = TokenParDer : lexer2 cs
      | otherwise = [TokenString (c:cs)]


lexerFuncDays :: String -> [Token]
lexerFuncDays [] = []
lexerFuncDays (c:cs) 
	| isSpace c = lexerFuncDays cs
	| isAlpha c && (fromEnum c <= fromEnum 'Z' && fromEnum c >= fromEnum 'A') = lexCelda 'b' (c:cs)
	| isDigit c = lexerDay (c:cs)
	| c == ','  = TokenComa : lexerFuncDays cs
	| c == '('  = TokenParIzq : lexerFuncDays cs
        | c == ')'  = TokenParDer : lexer2 cs
	| otherwise = [TokenString [c]] ++ lexer2 cs

lexerDay :: String -> [Token]
lexerDay [] = []
lexerDay cs = if rest0!!0 == '/' then if rest1 /= [] && rest1!!0 == '/' then[TokenDate (fromGregorian (read num2) (read num1) (read num))] ++ lexerFuncDays rest2
								        else [TokenString cs]
			         else [TokenString cs]
	        where (num,rest0) = span (\x -> isDigit x || isSpace x) cs  -- 23 "/392/132"
		      (num1,rest1) = span (\x -> isDigit x || isSpace x) (tail rest0) -- 392 "/132"
		      (num2,rest2) = span (\x -> isDigit x || isSpace x) (tail rest1) -- 132

lexer3 :: String -> String -> [Token]
lexer3 [] _ = []
lexer3 ('"':cs) str = (TokenString str) : TokenComilla : lexer2 cs
lexer3 (c:cs) str = lexer3 cs (str++[c])

lexNum cs = if rest /= [] && rest!!0 == '.' then TokenFloat (read (num ++ num1) / 10^(length num1)) : lexer2 rest'  else TokenFloat (read num) : lexer2 rest
      where (num,rest) = span isDigit cs
	    (num1,rest') = span isDigit (tail rest)


lexFunc cs =
   case span isAlpha cs of
      ("suma",rest) -> TokenSUMATORIA : lexer2 rest
      ("si",rest) -> TokenSI : lexer2 rest
      ("concat",rest)  -> TokenCONCATENACION : lexer2 rest
      ("contarSi",rest) -> TokenCONTARSI : lexer2 rest
      ("abs",rest) -> TokenABSOLUTO : lexer2 rest
      ("true",rest) -> TokenTRUE : lexer2 rest
      ("false",rest) -> TokenFALSE : lexer2 rest
      ("hoy",rest) -> TokenTODAY : lexer2 rest
      ("diasEntre",rest) -> TokenDIFDAYS : lexerFuncDays rest
      ("diaPascua",rest) -> TokenEASTERDAY : lexer2 rest
      ("aniosEntre",rest) -> TokenDIFYEARS : lexerFuncDays rest
      ("distribExp",rest) -> TokenDISTREXPN : lexer2 rest
      (otherstr,rest) -> (TokenString otherstr) : lexer2 rest

lexCelda :: Char -> String -> [Token]
lexCelda b [] = []
lexCelda b cs = if b == 'a' then t3 : lexer2 rest' else t3 : lexerFuncDays rest' 
		where (columna,rest) = span (\x -> isAlpha x) cs
		      t1 	  = map (\x -> if (fromEnum x <= fromEnum 'Z' && fromEnum x >= fromEnum 'A') then x else chr (fromEnum x + (fromEnum 'A' - fromEnum 'a'))) columna
		      (fila,rest') = if rest == [] then ("",[]) else span isDigit rest 
		      t2	 = if fila /= "" then read (fila) else -555
		      t3 	 = if (t2 /= -555) && (length t1 == 1) && (t2 <= 99) then TokenCelda (t1,t2) else TokenString (t1++"-555")
		       

}


















