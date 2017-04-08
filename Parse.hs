{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t7 t8 t17
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 (Float)
	| HappyAbsSyn13 (MyPoint)
	| HappyAbsSyn14 ([MyPoint])
	| HappyAbsSyn16 (Container)
	| HappyAbsSyn17 t17

action_0 (19) = happyShift action_18
action_0 (23) = happyShift action_19
action_0 (30) = happyShift action_20
action_0 (9) = happyGoto action_14
action_0 (10) = happyGoto action_15
action_0 (11) = happyGoto action_16
action_0 (12) = happyGoto action_17
action_0 _ = happyFail

action_1 (34) = happyShift action_12
action_1 (37) = happyShift action_13
action_1 (8) = happyGoto action_11
action_1 _ = happyFail

action_2 (34) = happyShift action_9
action_2 (37) = happyShift action_10
action_2 (8) = happyGoto action_7
action_2 (17) = happyGoto action_8
action_2 _ = happyReduce_24

action_3 (33) = happyShift action_5
action_3 (7) = happyGoto action_6
action_3 _ = happyFail

action_4 (33) = happyShift action_5
action_4 _ = happyFail

action_5 (19) = happyShift action_18
action_5 (23) = happyShift action_19
action_5 (30) = happyShift action_20
action_5 (9) = happyGoto action_32
action_5 (10) = happyGoto action_15
action_5 (11) = happyGoto action_16
action_5 (12) = happyGoto action_17
action_5 _ = happyFail

action_6 (40) = happyAccept
action_6 _ = happyFail

action_7 (34) = happyShift action_9
action_7 (37) = happyShift action_10
action_7 (8) = happyGoto action_7
action_7 (17) = happyGoto action_31
action_7 _ = happyReduce_24

action_8 (40) = happyAccept
action_8 _ = happyFail

action_9 (28) = happyShift action_30
action_9 _ = happyFail

action_10 (28) = happyShift action_29
action_10 _ = happyFail

action_11 (40) = happyAccept
action_11 _ = happyFail

action_12 (28) = happyShift action_28
action_12 _ = happyFail

action_13 (28) = happyShift action_27
action_13 _ = happyFail

action_14 (18) = happyShift action_25
action_14 (19) = happyShift action_26
action_14 (40) = happyAccept
action_14 _ = happyFail

action_15 (20) = happyShift action_23
action_15 (21) = happyShift action_24
action_15 _ = happyReduce_9

action_16 _ = happyReduce_12

action_17 _ = happyReduce_14

action_18 (23) = happyShift action_19
action_18 (30) = happyShift action_20
action_18 (12) = happyGoto action_22
action_18 _ = happyFail

action_19 (19) = happyShift action_18
action_19 (23) = happyShift action_19
action_19 (30) = happyShift action_20
action_19 (9) = happyGoto action_21
action_19 (10) = happyGoto action_15
action_19 (11) = happyGoto action_16
action_19 (12) = happyGoto action_17
action_19 _ = happyFail

action_20 _ = happyReduce_15

action_21 (18) = happyShift action_25
action_21 (19) = happyShift action_26
action_21 (24) = happyShift action_42
action_21 _ = happyFail

action_22 _ = happyReduce_13

action_23 (19) = happyShift action_18
action_23 (23) = happyShift action_19
action_23 (30) = happyShift action_20
action_23 (11) = happyGoto action_41
action_23 (12) = happyGoto action_17
action_23 _ = happyFail

action_24 (19) = happyShift action_18
action_24 (23) = happyShift action_19
action_24 (30) = happyShift action_20
action_24 (11) = happyGoto action_40
action_24 (12) = happyGoto action_17
action_24 _ = happyFail

action_25 (19) = happyShift action_18
action_25 (23) = happyShift action_19
action_25 (30) = happyShift action_20
action_25 (10) = happyGoto action_39
action_25 (11) = happyGoto action_16
action_25 (12) = happyGoto action_17
action_25 _ = happyFail

action_26 (19) = happyShift action_18
action_26 (23) = happyShift action_19
action_26 (30) = happyShift action_20
action_26 (10) = happyGoto action_38
action_26 (11) = happyGoto action_16
action_26 (12) = happyGoto action_17
action_26 _ = happyFail

action_27 (22) = happyShift action_37
action_27 _ = happyFail

action_28 (22) = happyShift action_36
action_28 _ = happyFail

action_29 (22) = happyShift action_35
action_29 _ = happyFail

action_30 (22) = happyShift action_34
action_30 _ = happyFail

action_31 _ = happyReduce_23

action_32 (18) = happyShift action_25
action_32 (19) = happyShift action_26
action_32 (34) = happyShift action_9
action_32 (37) = happyShift action_10
action_32 (8) = happyGoto action_7
action_32 (17) = happyGoto action_33
action_32 _ = happyReduce_24

action_33 _ = happyReduce_4

action_34 (35) = happyShift action_46
action_34 (16) = happyGoto action_48
action_34 _ = happyFail

action_35 (25) = happyShift action_44
action_35 (14) = happyGoto action_47
action_35 _ = happyFail

action_36 (35) = happyShift action_46
action_36 (16) = happyGoto action_45
action_36 _ = happyFail

action_37 (25) = happyShift action_44
action_37 (14) = happyGoto action_43
action_37 _ = happyFail

action_38 (20) = happyShift action_23
action_38 (21) = happyShift action_24
action_38 _ = happyReduce_8

action_39 (20) = happyShift action_23
action_39 (21) = happyShift action_24
action_39 _ = happyReduce_7

action_40 _ = happyReduce_11

action_41 _ = happyReduce_10

action_42 _ = happyReduce_16

action_43 _ = happyReduce_5

action_44 (26) = happyShift action_55
action_44 (31) = happyShift action_52
action_44 (13) = happyGoto action_53
action_44 (15) = happyGoto action_54
action_44 _ = happyFail

action_45 _ = happyReduce_6

action_46 (31) = happyShift action_52
action_46 (13) = happyGoto action_51
action_46 _ = happyFail

action_47 (38) = happyShift action_50
action_47 _ = happyReduce_5

action_48 (38) = happyShift action_49
action_48 _ = happyReduce_6

action_49 (29) = happyShift action_61
action_49 _ = happyFail

action_50 (29) = happyShift action_60
action_50 _ = happyFail

action_51 (36) = happyShift action_59
action_51 _ = happyFail

action_52 (19) = happyShift action_18
action_52 (23) = happyShift action_19
action_52 (30) = happyShift action_20
action_52 (9) = happyGoto action_58
action_52 (10) = happyGoto action_15
action_52 (11) = happyGoto action_16
action_52 (12) = happyGoto action_17
action_52 _ = happyFail

action_53 (27) = happyShift action_57
action_53 _ = happyReduce_21

action_54 (26) = happyShift action_56
action_54 _ = happyFail

action_55 _ = happyReduce_18

action_56 _ = happyReduce_19

action_57 (31) = happyShift action_52
action_57 (13) = happyGoto action_53
action_57 (15) = happyGoto action_66
action_57 _ = happyFail

action_58 (18) = happyShift action_25
action_58 (19) = happyShift action_26
action_58 (32) = happyShift action_65
action_58 _ = happyFail

action_59 (31) = happyShift action_52
action_59 (13) = happyGoto action_64
action_59 _ = happyFail

action_60 (39) = happyShift action_63
action_60 _ = happyFail

action_61 (39) = happyShift action_62
action_61 _ = happyFail

action_62 (30) = happyShift action_69
action_62 _ = happyFail

action_63 (30) = happyShift action_68
action_63 _ = happyFail

action_64 _ = happyReduce_22

action_65 (19) = happyShift action_18
action_65 (23) = happyShift action_19
action_65 (30) = happyShift action_20
action_65 (9) = happyGoto action_67
action_65 (10) = happyGoto action_15
action_65 (11) = happyGoto action_16
action_65 (12) = happyGoto action_17
action_65 _ = happyFail

action_66 _ = happyReduce_20

action_67 (18) = happyShift action_25
action_67 (19) = happyShift action_26
action_67 _ = happyReduce_17

action_68 (34) = happyShift action_9
action_68 (37) = happyShift action_10
action_68 (8) = happyGoto action_7
action_68 (17) = happyGoto action_71
action_68 _ = happyReduce_24

action_69 (34) = happyShift action_9
action_69 (37) = happyShift action_10
action_69 (8) = happyGoto action_7
action_69 (17) = happyGoto action_70
action_69 _ = happyReduce_24

action_70 _ = happyReduce_26

action_71 _ = happyReduce_25

happyReduce_4 = happySpecReduce_3  7 happyReduction_4
happyReduction_4 (HappyAbsSyn17  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Kerf happy_var_2 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 8 happyReduction_5
happyReduction_5 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Dp (P {p = happy_var_4, pn = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 8 happyReduction_6
happyReduction_6 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Dc (happy_var_4 {nc = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  9 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 + happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  9 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 - happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  9 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  10 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 * happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 / happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (- happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  12 happyReduction_15
happyReduction_15 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  12 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 13 happyReduction_17
happyReduction_17 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_2  14 happyReduction_18
happyReduction_18 _
	_
	 =  HappyAbsSyn14
		 ([]
	)

happyReduce_19 = happySpecReduce_3  14 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  15 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  15 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 16 happyReduction_22
happyReduction_22 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (C { p1x = fst happy_var_2, p1y = snd happy_var_2, p2x = fst happy_var_4, p2y = snd happy_var_4, rid = 0 }
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  17 happyReduction_23
happyReduction_23 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  17 happyReduction_24
happyReduction_24  =  HappyAbsSyn17
		 ([]
	)

happyReduce_25 = happyReduce 9 17 happyReduction_25
happyReduction_25 ((HappyAbsSyn17  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (copytimes (Dp (P {p = happy_var_4, pn = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 9 17 happyReduction_26
happyReduction_26 ((HappyAbsSyn17  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (copytimes (Dc (happy_var_4 {nc = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 40 40 tk (HappyState action) sts stk;
	TPlus -> cont 18;
	TMinus -> cont 19;
	TTimes -> cont 20;
	TDiv -> cont 21;
	TEqual -> cont 22;
	TParenO -> cont 23;
	TParenC -> cont 24;
	TRBracketO -> cont 25;
	TRBracketC -> cont 26;
	TComma -> cont 27;
	TName happy_dollar_dollar -> cont 28;
	TNat happy_dollar_dollar -> cont 29;
	TFloat happy_dollar_dollar -> cont 30;
	TX -> cont 31;
	TY -> cont 32;
	TKerf -> cont 33;
	TCon -> cont 34;
	TPoint1 -> cont 35;
	TPoint2 -> cont 36;
	TPol -> cont 37;
	TCopy -> cont 38;
	TScale -> cont 39;
	_ -> happyError' tk
	})

happyError_ 40 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

parseDef = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

parseM = happySomeParser where
  happySomeParser = happyThen (happyParse action_3) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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

data Token  
    = TPlus      
    | TMinus     
    | TTimes     
    | TDiv       
    | TEqual
    | TParenO    
    | TParenC     
    | TRBracketO
    | TRBracketC 
    | TComma
    | TName String
    | TNat Int
    | TFloat Float
    | TX
    | TY
    | TKerf
    | TCon
    | TPoint1    
    | TPoint2    
    | TPol
    | TCopy
    | TScale
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
lexer cont ('[':cs)       = cont TRBracketO cs
lexer cont (']':cs)       = cont TRBracketC cs
lexer cont (',':cs)       = cont TComma cs

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
