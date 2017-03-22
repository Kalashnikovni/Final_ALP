{-# OPTIONS_GHC -w #-}
module Parse_Path where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Monad (liftM, ap)
import Control.Applicative (Applicative(..))

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 ([PathCommand])

action_0 (17) = happyShift action_3
action_0 (19) = happyShift action_8
action_0 (5) = happyGoto action_7
action_0 _ = happyFail

action_1 (8) = happyShift action_5
action_1 (9) = happyShift action_6
action_1 (6) = happyGoto action_4
action_1 _ = happyFail

action_2 (17) = happyShift action_3
action_2 _ = happyFail

action_3 (19) = happyShift action_11
action_3 _ = happyFail

action_4 (20) = happyAccept
action_4 _ = happyFail

action_5 (17) = happyShift action_3
action_5 (19) = happyShift action_8
action_5 (5) = happyGoto action_10
action_5 _ = happyFail

action_6 (17) = happyShift action_3
action_6 (19) = happyShift action_8
action_6 (5) = happyGoto action_9
action_6 _ = happyFail

action_7 (20) = happyAccept
action_7 _ = happyFail

action_8 _ = happyReduce_3

action_9 (17) = happyShift action_3
action_9 (18) = happyShift action_15
action_9 (19) = happyShift action_8
action_9 (5) = happyGoto action_14
action_9 _ = happyFail

action_10 (17) = happyShift action_3
action_10 (18) = happyShift action_13
action_10 (19) = happyShift action_8
action_10 (5) = happyGoto action_12
action_10 _ = happyFail

action_11 _ = happyReduce_2

action_12 (10) = happyShift action_19
action_12 (11) = happyShift action_20
action_12 (12) = happyShift action_21
action_12 (13) = happyShift action_22
action_12 (14) = happyShift action_23
action_12 (15) = happyShift action_24
action_12 (16) = happyShift action_25
action_12 (17) = happyShift action_3
action_12 (19) = happyShift action_8
action_12 (5) = happyGoto action_17
action_12 (7) = happyGoto action_27
action_12 _ = happyFail

action_13 (17) = happyShift action_3
action_13 (19) = happyShift action_8
action_13 (5) = happyGoto action_26
action_13 _ = happyFail

action_14 (10) = happyShift action_19
action_14 (11) = happyShift action_20
action_14 (12) = happyShift action_21
action_14 (13) = happyShift action_22
action_14 (14) = happyShift action_23
action_14 (15) = happyShift action_24
action_14 (16) = happyShift action_25
action_14 (17) = happyShift action_3
action_14 (19) = happyShift action_8
action_14 (5) = happyGoto action_17
action_14 (7) = happyGoto action_18
action_14 _ = happyFail

action_15 (17) = happyShift action_3
action_15 (19) = happyShift action_8
action_15 (5) = happyGoto action_16
action_15 _ = happyFail

action_16 (10) = happyShift action_19
action_16 (11) = happyShift action_20
action_16 (12) = happyShift action_21
action_16 (13) = happyShift action_22
action_16 (14) = happyShift action_23
action_16 (15) = happyShift action_24
action_16 (16) = happyShift action_25
action_16 (17) = happyShift action_3
action_16 (19) = happyShift action_8
action_16 (5) = happyGoto action_17
action_16 (7) = happyGoto action_37
action_16 _ = happyFail

action_17 (17) = happyShift action_3
action_17 (18) = happyShift action_36
action_17 (19) = happyShift action_8
action_17 (5) = happyGoto action_35
action_17 _ = happyFail

action_18 _ = happyReduce_4

action_19 (17) = happyShift action_3
action_19 (19) = happyShift action_8
action_19 (5) = happyGoto action_34
action_19 _ = happyFail

action_20 (17) = happyShift action_3
action_20 (19) = happyShift action_8
action_20 (5) = happyGoto action_33
action_20 _ = happyFail

action_21 (17) = happyShift action_3
action_21 (19) = happyShift action_8
action_21 (5) = happyGoto action_32
action_21 _ = happyFail

action_22 (17) = happyShift action_3
action_22 (19) = happyShift action_8
action_22 (5) = happyGoto action_31
action_22 _ = happyFail

action_23 (17) = happyShift action_3
action_23 (19) = happyShift action_8
action_23 (5) = happyGoto action_30
action_23 _ = happyFail

action_24 (17) = happyShift action_3
action_24 (19) = happyShift action_8
action_24 (5) = happyGoto action_29
action_24 _ = happyFail

action_25 _ = happyReduce_18

action_26 (10) = happyShift action_19
action_26 (11) = happyShift action_20
action_26 (12) = happyShift action_21
action_26 (13) = happyShift action_22
action_26 (14) = happyShift action_23
action_26 (15) = happyShift action_24
action_26 (16) = happyShift action_25
action_26 (17) = happyShift action_3
action_26 (19) = happyShift action_8
action_26 (5) = happyGoto action_17
action_26 (7) = happyGoto action_28
action_26 _ = happyFail

action_27 _ = happyReduce_5

action_28 _ = happyReduce_7

action_29 (17) = happyShift action_3
action_29 (18) = happyShift action_47
action_29 (19) = happyShift action_8
action_29 (5) = happyGoto action_46
action_29 _ = happyFail

action_30 (17) = happyShift action_3
action_30 (18) = happyShift action_45
action_30 (19) = happyShift action_8
action_30 (5) = happyGoto action_44
action_30 _ = happyFail

action_31 (10) = happyShift action_19
action_31 (11) = happyShift action_20
action_31 (12) = happyShift action_21
action_31 (13) = happyShift action_22
action_31 (14) = happyShift action_23
action_31 (15) = happyShift action_24
action_31 (16) = happyShift action_25
action_31 (17) = happyShift action_3
action_31 (19) = happyShift action_8
action_31 (5) = happyGoto action_17
action_31 (7) = happyGoto action_43
action_31 _ = happyFail

action_32 (10) = happyShift action_19
action_32 (11) = happyShift action_20
action_32 (12) = happyShift action_21
action_32 (13) = happyShift action_22
action_32 (14) = happyShift action_23
action_32 (15) = happyShift action_24
action_32 (16) = happyShift action_25
action_32 (17) = happyShift action_3
action_32 (19) = happyShift action_8
action_32 (5) = happyGoto action_17
action_32 (7) = happyGoto action_42
action_32 _ = happyFail

action_33 (10) = happyShift action_19
action_33 (11) = happyShift action_20
action_33 (12) = happyShift action_21
action_33 (13) = happyShift action_22
action_33 (14) = happyShift action_23
action_33 (15) = happyShift action_24
action_33 (16) = happyShift action_25
action_33 (17) = happyShift action_3
action_33 (19) = happyShift action_8
action_33 (5) = happyGoto action_17
action_33 (7) = happyGoto action_41
action_33 _ = happyFail

action_34 (10) = happyShift action_19
action_34 (11) = happyShift action_20
action_34 (12) = happyShift action_21
action_34 (13) = happyShift action_22
action_34 (14) = happyShift action_23
action_34 (15) = happyShift action_24
action_34 (16) = happyShift action_25
action_34 (17) = happyShift action_3
action_34 (19) = happyShift action_8
action_34 (5) = happyGoto action_17
action_34 (7) = happyGoto action_40
action_34 _ = happyFail

action_35 (10) = happyShift action_19
action_35 (11) = happyShift action_20
action_35 (12) = happyShift action_21
action_35 (13) = happyShift action_22
action_35 (14) = happyShift action_23
action_35 (15) = happyShift action_24
action_35 (16) = happyShift action_25
action_35 (17) = happyShift action_3
action_35 (19) = happyShift action_8
action_35 (5) = happyGoto action_17
action_35 (7) = happyGoto action_39
action_35 _ = happyFail

action_36 (17) = happyShift action_3
action_36 (19) = happyShift action_8
action_36 (5) = happyGoto action_38
action_36 _ = happyFail

action_37 _ = happyReduce_6

action_38 (10) = happyShift action_19
action_38 (11) = happyShift action_20
action_38 (12) = happyShift action_21
action_38 (13) = happyShift action_22
action_38 (14) = happyShift action_23
action_38 (15) = happyShift action_24
action_38 (16) = happyShift action_25
action_38 (17) = happyShift action_3
action_38 (19) = happyShift action_8
action_38 (5) = happyGoto action_17
action_38 (7) = happyGoto action_52
action_38 _ = happyFail

action_39 _ = happyReduce_16

action_40 _ = happyReduce_8

action_41 _ = happyReduce_9

action_42 _ = happyReduce_10

action_43 _ = happyReduce_11

action_44 (10) = happyShift action_19
action_44 (11) = happyShift action_20
action_44 (12) = happyShift action_21
action_44 (13) = happyShift action_22
action_44 (14) = happyShift action_23
action_44 (15) = happyShift action_24
action_44 (16) = happyShift action_25
action_44 (17) = happyShift action_3
action_44 (19) = happyShift action_8
action_44 (5) = happyGoto action_17
action_44 (7) = happyGoto action_51
action_44 _ = happyFail

action_45 (17) = happyShift action_3
action_45 (19) = happyShift action_8
action_45 (5) = happyGoto action_50
action_45 _ = happyFail

action_46 (10) = happyShift action_19
action_46 (11) = happyShift action_20
action_46 (12) = happyShift action_21
action_46 (13) = happyShift action_22
action_46 (14) = happyShift action_23
action_46 (15) = happyShift action_24
action_46 (16) = happyShift action_25
action_46 (17) = happyShift action_3
action_46 (19) = happyShift action_8
action_46 (5) = happyGoto action_17
action_46 (7) = happyGoto action_49
action_46 _ = happyFail

action_47 (17) = happyShift action_3
action_47 (19) = happyShift action_8
action_47 (5) = happyGoto action_48
action_47 _ = happyFail

action_48 (10) = happyShift action_19
action_48 (11) = happyShift action_20
action_48 (12) = happyShift action_21
action_48 (13) = happyShift action_22
action_48 (14) = happyShift action_23
action_48 (15) = happyShift action_24
action_48 (16) = happyShift action_25
action_48 (17) = happyShift action_3
action_48 (19) = happyShift action_8
action_48 (5) = happyGoto action_17
action_48 (7) = happyGoto action_54
action_48 _ = happyFail

action_49 _ = happyReduce_13

action_50 (10) = happyShift action_19
action_50 (11) = happyShift action_20
action_50 (12) = happyShift action_21
action_50 (13) = happyShift action_22
action_50 (14) = happyShift action_23
action_50 (15) = happyShift action_24
action_50 (16) = happyShift action_25
action_50 (17) = happyShift action_3
action_50 (19) = happyShift action_8
action_50 (5) = happyGoto action_17
action_50 (7) = happyGoto action_53
action_50 _ = happyFail

action_51 _ = happyReduce_12

action_52 _ = happyReduce_17

action_53 _ = happyReduce_14

action_54 _ = happyReduce_15

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyTerminal (TFloat happy_var_2))
	_
	 =  HappyAbsSyn5
		 (-happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (M_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (M_rel (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (M_abs (happy_var_2, happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 5 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (M_rel (happy_var_2, happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 7 happyReduction_12
happyReduction_12 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (L_rel (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (L_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 7 happyReduction_14
happyReduction_14 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (L_rel (happy_var_2, happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (L_abs (happy_var_2, happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 (Complete (happy_var_1, happy_var_2) : happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 7 happyReduction_17
happyReduction_17 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Complete (happy_var_1, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn6
		 ([Z]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 20 20 tk (HappyState action) sts stk;
	Tm -> cont 8;
	TM -> cont 9;
	Th -> cont 10;
	TH -> cont 11;
	Tv -> cont 12;
	TV -> cont 13;
	Tl -> cont 14;
	TL -> cont 15;
	TZ -> cont 16;
	TMinus -> cont 17;
	TComma -> cont 18;
	TFloat happy_dollar_dollar -> cont 19;
	_ -> happyError' tk
	})

happyError_ 20 tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenE)
happyReturn :: () => a -> P a
happyReturn = (returnE)
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => (Token) -> P a
happyError' tk = parseError tk

parseF = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parseP = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














# 1 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 1 3 4

# 18 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 3 4












# 31 "/usr/include/stdc-predef.h" 2 3 4








# 5 "<command-line>" 2
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 45 "templates/GenericTemplate.hs" #-}








{-# LINE 66 "templates/GenericTemplate.hs" #-}

{-# LINE 76 "templates/GenericTemplate.hs" #-}

{-# LINE 85 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 154 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 255 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 321 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
