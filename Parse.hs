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

data HappyAbsSyn t5 t6 t12 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 (Float)
	| HappyAbsSyn11 (MyPoint)
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 (Polygon)
	| HappyAbsSyn14 (Container)
	| HappyAbsSyn15 t15

action_0 (29) = happyShift action_9
action_0 (31) = happyShift action_10
action_0 (6) = happyGoto action_8
action_0 _ = happyFail

action_1 (29) = happyShift action_6
action_1 (31) = happyShift action_7
action_1 (6) = happyGoto action_4
action_1 (15) = happyGoto action_5
action_1 _ = happyReduce_21

action_2 (27) = happyShift action_3
action_2 _ = happyFail

action_3 (17) = happyShift action_20
action_3 (22) = happyShift action_21
action_3 (32) = happyShift action_22
action_3 (7) = happyGoto action_16
action_3 (8) = happyGoto action_17
action_3 (9) = happyGoto action_18
action_3 (10) = happyGoto action_19
action_3 _ = happyFail

action_4 (25) = happyShift action_15
action_4 _ = happyFail

action_5 (39) = happyAccept
action_5 _ = happyFail

action_6 (28) = happyShift action_14
action_6 _ = happyFail

action_7 (28) = happyShift action_13
action_7 _ = happyFail

action_8 (39) = happyAccept
action_8 _ = happyFail

action_9 (28) = happyShift action_12
action_9 _ = happyFail

action_10 (28) = happyShift action_11
action_10 _ = happyFail

action_11 (20) = happyShift action_34
action_11 _ = happyFail

action_12 (20) = happyShift action_33
action_12 _ = happyFail

action_13 (20) = happyShift action_32
action_13 _ = happyFail

action_14 (20) = happyShift action_31
action_14 _ = happyFail

action_15 (29) = happyShift action_6
action_15 (31) = happyShift action_7
action_15 (6) = happyGoto action_4
action_15 (15) = happyGoto action_30
action_15 _ = happyReduce_21

action_16 (16) = happyShift action_28
action_16 (17) = happyShift action_29
action_16 (29) = happyShift action_6
action_16 (31) = happyShift action_7
action_16 (6) = happyGoto action_4
action_16 (15) = happyGoto action_27
action_16 _ = happyFail

action_17 (18) = happyShift action_25
action_17 (19) = happyShift action_26
action_17 _ = happyReduce_7

action_18 _ = happyReduce_10

action_19 _ = happyReduce_12

action_20 (22) = happyShift action_21
action_20 (32) = happyShift action_22
action_20 (10) = happyGoto action_24
action_20 _ = happyFail

action_21 (17) = happyShift action_20
action_21 (22) = happyShift action_21
action_21 (32) = happyShift action_22
action_21 (7) = happyGoto action_23
action_21 (8) = happyGoto action_17
action_21 (9) = happyGoto action_18
action_21 (10) = happyGoto action_19
action_21 _ = happyFail

action_22 _ = happyReduce_13

action_23 (16) = happyShift action_28
action_23 (17) = happyShift action_29
action_23 (23) = happyShift action_46
action_23 _ = happyFail

action_24 _ = happyReduce_11

action_25 (17) = happyShift action_20
action_25 (22) = happyShift action_21
action_25 (32) = happyShift action_22
action_25 (9) = happyGoto action_45
action_25 (10) = happyGoto action_19
action_25 _ = happyFail

action_26 (17) = happyShift action_20
action_26 (22) = happyShift action_21
action_26 (32) = happyShift action_22
action_26 (9) = happyGoto action_44
action_26 (10) = happyGoto action_19
action_26 _ = happyFail

action_27 _ = happyFail

action_28 (17) = happyShift action_20
action_28 (22) = happyShift action_21
action_28 (32) = happyShift action_22
action_28 (8) = happyGoto action_43
action_28 (9) = happyGoto action_18
action_28 (10) = happyGoto action_19
action_28 _ = happyFail

action_29 (17) = happyShift action_20
action_29 (22) = happyShift action_21
action_29 (32) = happyShift action_22
action_29 (8) = happyGoto action_42
action_29 (9) = happyGoto action_18
action_29 (10) = happyGoto action_19
action_29 _ = happyFail

action_30 _ = happyReduce_20

action_31 (34) = happyShift action_39
action_31 (11) = happyGoto action_37
action_31 (13) = happyGoto action_41
action_31 _ = happyFail

action_32 (36) = happyShift action_36
action_32 (14) = happyGoto action_40
action_32 _ = happyFail

action_33 (34) = happyShift action_39
action_33 (11) = happyGoto action_37
action_33 (13) = happyGoto action_38
action_33 _ = happyFail

action_34 (36) = happyShift action_36
action_34 (14) = happyGoto action_35
action_34 _ = happyFail

action_35 _ = happyReduce_4

action_36 (34) = happyShift action_39
action_36 (11) = happyGoto action_51
action_36 _ = happyFail

action_37 (34) = happyShift action_39
action_37 (11) = happyGoto action_50
action_37 _ = happyFail

action_38 _ = happyReduce_3

action_39 (17) = happyShift action_20
action_39 (22) = happyShift action_21
action_39 (32) = happyShift action_22
action_39 (7) = happyGoto action_49
action_39 (8) = happyGoto action_17
action_39 (9) = happyGoto action_18
action_39 (10) = happyGoto action_19
action_39 _ = happyFail

action_40 (24) = happyShift action_48
action_40 _ = happyReduce_4

action_41 (24) = happyShift action_47
action_41 _ = happyReduce_3

action_42 (18) = happyShift action_25
action_42 (19) = happyShift action_26
action_42 _ = happyReduce_6

action_43 (18) = happyShift action_25
action_43 (19) = happyShift action_26
action_43 _ = happyReduce_5

action_44 _ = happyReduce_9

action_45 _ = happyReduce_8

action_46 _ = happyReduce_14

action_47 (32) = happyShift action_56
action_47 _ = happyFail

action_48 (32) = happyShift action_55
action_48 _ = happyFail

action_49 (16) = happyShift action_28
action_49 (17) = happyShift action_29
action_49 (35) = happyShift action_54
action_49 _ = happyFail

action_50 (34) = happyShift action_39
action_50 (11) = happyGoto action_53
action_50 _ = happyFail

action_51 (37) = happyShift action_52
action_51 _ = happyFail

action_52 (34) = happyShift action_39
action_52 (11) = happyGoto action_63
action_52 _ = happyFail

action_53 (34) = happyShift action_39
action_53 (38) = happyShift action_62
action_53 (11) = happyGoto action_60
action_53 (12) = happyGoto action_61
action_53 _ = happyFail

action_54 (17) = happyShift action_20
action_54 (22) = happyShift action_21
action_54 (32) = happyShift action_22
action_54 (7) = happyGoto action_59
action_54 (8) = happyGoto action_17
action_54 (9) = happyGoto action_18
action_54 (10) = happyGoto action_19
action_54 _ = happyFail

action_55 (30) = happyShift action_58
action_55 _ = happyFail

action_56 (30) = happyShift action_57
action_56 _ = happyFail

action_57 (32) = happyShift action_66
action_57 _ = happyFail

action_58 (32) = happyShift action_65
action_58 _ = happyFail

action_59 (16) = happyShift action_28
action_59 (17) = happyShift action_29
action_59 _ = happyReduce_15

action_60 (34) = happyShift action_39
action_60 (38) = happyShift action_62
action_60 (11) = happyGoto action_60
action_60 (12) = happyGoto action_64
action_60 _ = happyFail

action_61 _ = happyReduce_18

action_62 _ = happyReduce_16

action_63 _ = happyReduce_19

action_64 _ = happyReduce_17

action_65 (26) = happyShift action_68
action_65 _ = happyFail

action_66 (26) = happyShift action_67
action_66 _ = happyFail

action_67 (29) = happyShift action_6
action_67 (31) = happyShift action_7
action_67 (6) = happyGoto action_4
action_67 (15) = happyGoto action_70
action_67 _ = happyReduce_21

action_68 (29) = happyShift action_6
action_68 (31) = happyShift action_7
action_68 (6) = happyGoto action_4
action_68 (15) = happyGoto action_69
action_68 _ = happyReduce_21

action_69 _ = happyReduce_23

action_70 _ = happyReduce_22

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 6 happyReduction_3
happyReduction_3 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Dp happy_var_2 happy_var_4 1
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Dc happy_var_2 happy_var_4 1
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 + happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  7 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 - happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  8 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 * happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 / happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (- happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 11 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  12 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn12
		 ([]
	)

happyReduce_17 = happySpecReduce_2  12 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 13 happyReduction_18
happyReduction_18 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (P (happy_var_1 : (happy_var_2 : (happy_var_3 : happy_var_4)))
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 14 happyReduction_19
happyReduction_19 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (C { p1x = fst happy_var_2, p1y = snd happy_var_2, p2x = fst happy_var_4, p2y = snd happy_var_4, rid = 0 }
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  15 happyReduction_20
happyReduction_20 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_0  15 happyReduction_21
happyReduction_21  =  HappyAbsSyn15
		 ([]
	)

happyReduce_22 = happyMonadReduce 10 15 happyReduction_22
happyReduction_22 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((if happy_var_8 < 0 
                                                                    then failE "El escalamiento debe ser positivo"
                                                                    else returnE ([Dp happy_var_2 happy_var_4 happy_var_8]))
	) (\r -> happyReturn (HappyAbsSyn15 r))

happyReduce_23 = happyMonadReduce 10 15 happyReduction_23
happyReduction_23 ((HappyAbsSyn15  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFloat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen ((if happy_var_8 < 0
                                                                    then failE "El escalamiento debe ser positivo"
                                                                    else returnE (copytimes (Dc happy_var_2 happy_var_4 happy_var_8) (floor happy_var_6) ++ happy_var_10))
	) (\r -> happyReturn (HappyAbsSyn15 r))

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 39 39 tk (HappyState action) sts stk;
	TPlus -> cont 16;
	TMinus -> cont 17;
	TTimes -> cont 18;
	TDiv -> cont 19;
	TEqual -> cont 20;
	TColon -> cont 21;
	TParenO -> cont 22;
	TParenC -> cont 23;
	TCopy -> cont 24;
	TComma -> cont 25;
	TPComma -> cont 26;
	TKerf -> cont 27;
	TName happy_dollar_dollar -> cont 28;
	TPol -> cont 29;
	TScale -> cont 30;
	TCon -> cont 31;
	TFloat happy_dollar_dollar -> cont 32;
	TNat happy_dollar_dollar -> cont 33;
	TX -> cont 34;
	TY -> cont 35;
	TPoint1 -> cont 36;
	TPoint2 -> cont 37;
	TEmpty -> cont 38;
	_ -> happyError' tk
	})

happyError_ 39 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TColon     
    | TComma
    | TPComma
    | TSBracketO 
    | TSBracketC 
    | TParenO    
    | TParenC     
    | TConcat
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
lexer cont []        = cont TEof []
lexer cont ('\n':cs) = lexer cont cs
lexer cont (c:cs)
    | isSpace c = lexer cont cs
    | isAlpha c = lexString cont (c:cs)
    | isDigit c = lexNum cont (c:cs) 
lexer cont ('+':cs) = cont TPlus cs
lexer cont ('-':cs) = cont TMinus cs
lexer cont ('*':cs) = cont TTimes cs
lexer cont ('/':cs) = cont TDiv cs
lexer cont ('=':cs) = cont TEqual cs
lexer cont ('(':cs) = cont TParenO cs
lexer cont (')':cs) = cont TParenC cs
lexer cont ('[':cs) = lexer cont cs
lexer cont (']':cs) = cont TEmpty cs
lexer cont (',':cs) = cont TComma cs
lexer cont (';':cs) = cont TPComma cs

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
          fromInt    = cont (TFloat (read int :: Float)) res

--lexString :: String -> [Token]
lexString cont []     = cont TEof []
lexString cont (c:cs) = case span isAlpha (c:cs) of
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

parseMac s = parseDefs s 1
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
