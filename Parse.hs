{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Applicative 
import Control.Monad (liftM, ap)

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t7 t13 t16
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (Float)
	| HappyAbsSyn12 (MyPoint)
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 (Polygon)
	| HappyAbsSyn15 (Container)
	| HappyAbsSyn16 t16

action_0 (27) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (7) = happyGoto action_10
action_0 _ = happyFail

action_1 (27) = happyShift action_8
action_1 (29) = happyShift action_9
action_1 (7) = happyGoto action_6
action_1 (16) = happyGoto action_7
action_1 _ = happyReduce_22

action_2 (25) = happyShift action_4
action_2 (6) = happyGoto action_5
action_2 _ = happyFail

action_3 (25) = happyShift action_4
action_3 _ = happyFail

action_4 (18) = happyShift action_22
action_4 (22) = happyShift action_23
action_4 (30) = happyShift action_24
action_4 (8) = happyGoto action_18
action_4 (9) = happyGoto action_19
action_4 (10) = happyGoto action_20
action_4 (11) = happyGoto action_21
action_4 _ = happyFail

action_5 (37) = happyAccept
action_5 _ = happyFail

action_6 (27) = happyShift action_8
action_6 (29) = happyShift action_9
action_6 (7) = happyGoto action_6
action_6 (16) = happyGoto action_17
action_6 _ = happyReduce_22

action_7 (37) = happyAccept
action_7 _ = happyFail

action_8 (26) = happyShift action_16
action_8 _ = happyFail

action_9 (26) = happyShift action_15
action_9 _ = happyFail

action_10 (37) = happyAccept
action_10 _ = happyFail

action_11 (26) = happyShift action_14
action_11 _ = happyFail

action_12 (26) = happyShift action_13
action_12 _ = happyFail

action_13 (21) = happyShift action_35
action_13 _ = happyFail

action_14 (21) = happyShift action_34
action_14 _ = happyFail

action_15 (21) = happyShift action_33
action_15 _ = happyFail

action_16 (21) = happyShift action_32
action_16 _ = happyFail

action_17 _ = happyReduce_21

action_18 (17) = happyShift action_30
action_18 (18) = happyShift action_31
action_18 (27) = happyShift action_8
action_18 (29) = happyShift action_9
action_18 (7) = happyGoto action_6
action_18 (16) = happyGoto action_29
action_18 _ = happyReduce_22

action_19 (19) = happyShift action_27
action_19 (20) = happyShift action_28
action_19 _ = happyReduce_8

action_20 _ = happyReduce_11

action_21 _ = happyReduce_13

action_22 (22) = happyShift action_23
action_22 (30) = happyShift action_24
action_22 (11) = happyGoto action_26
action_22 _ = happyFail

action_23 (18) = happyShift action_22
action_23 (22) = happyShift action_23
action_23 (30) = happyShift action_24
action_23 (8) = happyGoto action_25
action_23 (9) = happyGoto action_19
action_23 (10) = happyGoto action_20
action_23 (11) = happyGoto action_21
action_23 _ = happyFail

action_24 _ = happyReduce_14

action_25 (17) = happyShift action_30
action_25 (18) = happyShift action_31
action_25 (23) = happyShift action_47
action_25 _ = happyFail

action_26 _ = happyReduce_12

action_27 (18) = happyShift action_22
action_27 (22) = happyShift action_23
action_27 (30) = happyShift action_24
action_27 (10) = happyGoto action_46
action_27 (11) = happyGoto action_21
action_27 _ = happyFail

action_28 (18) = happyShift action_22
action_28 (22) = happyShift action_23
action_28 (30) = happyShift action_24
action_28 (10) = happyGoto action_45
action_28 (11) = happyGoto action_21
action_28 _ = happyFail

action_29 _ = happyReduce_3

action_30 (18) = happyShift action_22
action_30 (22) = happyShift action_23
action_30 (30) = happyShift action_24
action_30 (9) = happyGoto action_44
action_30 (10) = happyGoto action_20
action_30 (11) = happyGoto action_21
action_30 _ = happyFail

action_31 (18) = happyShift action_22
action_31 (22) = happyShift action_23
action_31 (30) = happyShift action_24
action_31 (9) = happyGoto action_43
action_31 (10) = happyGoto action_20
action_31 (11) = happyGoto action_21
action_31 _ = happyFail

action_32 (32) = happyShift action_40
action_32 (12) = happyGoto action_38
action_32 (14) = happyGoto action_42
action_32 _ = happyFail

action_33 (34) = happyShift action_37
action_33 (15) = happyGoto action_41
action_33 _ = happyFail

action_34 (32) = happyShift action_40
action_34 (12) = happyGoto action_38
action_34 (14) = happyGoto action_39
action_34 _ = happyFail

action_35 (34) = happyShift action_37
action_35 (15) = happyGoto action_36
action_35 _ = happyFail

action_36 _ = happyReduce_5

action_37 (32) = happyShift action_40
action_37 (12) = happyGoto action_52
action_37 _ = happyFail

action_38 (32) = happyShift action_40
action_38 (12) = happyGoto action_51
action_38 _ = happyFail

action_39 _ = happyReduce_4

action_40 (18) = happyShift action_22
action_40 (22) = happyShift action_23
action_40 (30) = happyShift action_24
action_40 (8) = happyGoto action_50
action_40 (9) = happyGoto action_19
action_40 (10) = happyGoto action_20
action_40 (11) = happyGoto action_21
action_40 _ = happyFail

action_41 (24) = happyShift action_49
action_41 _ = happyReduce_5

action_42 (24) = happyShift action_48
action_42 _ = happyReduce_4

action_43 (19) = happyShift action_27
action_43 (20) = happyShift action_28
action_43 _ = happyReduce_7

action_44 (19) = happyShift action_27
action_44 (20) = happyShift action_28
action_44 _ = happyReduce_6

action_45 _ = happyReduce_10

action_46 _ = happyReduce_9

action_47 _ = happyReduce_15

action_48 (31) = happyShift action_57
action_48 _ = happyFail

action_49 (31) = happyShift action_56
action_49 _ = happyFail

action_50 (17) = happyShift action_30
action_50 (18) = happyShift action_31
action_50 (33) = happyShift action_55
action_50 _ = happyFail

action_51 (32) = happyShift action_40
action_51 (12) = happyGoto action_54
action_51 _ = happyFail

action_52 (35) = happyShift action_53
action_52 _ = happyFail

action_53 (32) = happyShift action_40
action_53 (12) = happyGoto action_64
action_53 _ = happyFail

action_54 (32) = happyShift action_40
action_54 (36) = happyShift action_63
action_54 (12) = happyGoto action_61
action_54 (13) = happyGoto action_62
action_54 _ = happyFail

action_55 (18) = happyShift action_22
action_55 (22) = happyShift action_23
action_55 (30) = happyShift action_24
action_55 (8) = happyGoto action_60
action_55 (9) = happyGoto action_19
action_55 (10) = happyGoto action_20
action_55 (11) = happyGoto action_21
action_55 _ = happyFail

action_56 (28) = happyShift action_59
action_56 _ = happyFail

action_57 (28) = happyShift action_58
action_57 _ = happyFail

action_58 (30) = happyShift action_67
action_58 _ = happyFail

action_59 (30) = happyShift action_66
action_59 _ = happyFail

action_60 (17) = happyShift action_30
action_60 (18) = happyShift action_31
action_60 _ = happyReduce_16

action_61 (32) = happyShift action_40
action_61 (36) = happyShift action_63
action_61 (12) = happyGoto action_61
action_61 (13) = happyGoto action_65
action_61 _ = happyFail

action_62 _ = happyReduce_19

action_63 _ = happyReduce_17

action_64 _ = happyReduce_20

action_65 _ = happyReduce_18

action_66 (27) = happyShift action_8
action_66 (29) = happyShift action_9
action_66 (7) = happyGoto action_6
action_66 (16) = happyGoto action_69
action_66 _ = happyReduce_22

action_67 (27) = happyShift action_8
action_67 (29) = happyShift action_9
action_67 (7) = happyGoto action_6
action_67 (16) = happyGoto action_68
action_67 _ = happyReduce_22

action_68 _ = happyReduce_23

action_69 _ = happyReduce_24

happyReduce_3 = happySpecReduce_3  6 happyReduction_3
happyReduction_3 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Kerf happy_var_2 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 7 happyReduction_4
happyReduction_4 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Dp happy_var_2 happy_var_4 1
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 7 happyReduction_5
happyReduction_5 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Dc happy_var_2 happy_var_4 1
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 + happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 - happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 * happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 / happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  10 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (- happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  11 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 12 happyReduction_16
happyReduction_16 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  13 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn13
		 ([]
	)

happyReduce_18 = happySpecReduce_2  13 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 14 happyReduction_19
happyReduction_19 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (P (happy_var_1 : (happy_var_2 : (happy_var_3 : happy_var_4)))
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 4 15 happyReduction_20
happyReduction_20 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (C { p1x = fst happy_var_2, p1y = snd happy_var_2, p2x = fst happy_var_4, p2y = snd happy_var_4, rid = 0 }
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_2  16 happyReduction_21
happyReduction_21 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_0  16 happyReduction_22
happyReduction_22  =  HappyAbsSyn16
		 ([]
	)

happyReduce_23 = happyReduce 9 16 happyReduction_23
happyReduction_23 ((HappyAbsSyn16  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (copytimes (Dp happy_var_2 happy_var_4 happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 9 16 happyReduction_24
happyReduction_24 ((HappyAbsSyn16  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (copytimes (Dc happy_var_2 happy_var_4 happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 37 37 tk (HappyState action) sts stk;
	TPlus -> cont 17;
	TMinus -> cont 18;
	TTimes -> cont 19;
	TDiv -> cont 20;
	TEqual -> cont 21;
	TParenO -> cont 22;
	TParenC -> cont 23;
	TCopy -> cont 24;
	TKerf -> cont 25;
	TName happy_dollar_dollar -> cont 26;
	TPol -> cont 27;
	TScale -> cont 28;
	TCon -> cont 29;
	TFloat happy_dollar_dollar -> cont 30;
	TNat happy_dollar_dollar -> cont 31;
	TX -> cont 32;
	TY -> cont 33;
	TPoint1 -> cont 34;
	TPoint2 -> cont 35;
	TEmpty -> cont 36;
	_ -> happyError' tk
	})

happyError_ 37 tk = happyError' tk
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

parseDef = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

parseM = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

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

--lexer :: String -> [Token]
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

--lexNum :: String -> (String -> [Token]) -> [Token]
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

--lexString :: String -> [Token]
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

--lexNat :: String -> [Token]
lexNat cont [] = cont TEof []
lexNat cont (c:cs)
    | isSpace c = lexNat cont cs
    | isDigit c = let (num, res) = span isDigit (c:cs)
                  in cont (TNat (read num :: Int)) res 

parseMac s = parseM s 1
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
