{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import AST

-- Módulos prestados
import Data.Char
import Graphics.Gloss
import Control.Applicative 
import Control.Monad (liftM, ap)

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t12 t17
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 (Float)
	| HappyAbsSyn11 (Point)
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 (Polygon)
	| HappyAbsSyn14 (Polygons)
	| HappyAbsSyn15 (Container)
	| HappyAbsSyn16 (Containers)
	| HappyAbsSyn17 t17

action_0 (29) = happyShift action_4
action_0 (30) = happyShift action_9
action_0 (6) = happyGoto action_10
action_0 _ = happyFail

action_1 (29) = happyShift action_4
action_1 (30) = happyShift action_9
action_1 (6) = happyGoto action_7
action_1 (17) = happyGoto action_8
action_1 _ = happyReduce_25

action_2 (34) = happyShift action_6
action_2 (15) = happyGoto action_5
action_2 _ = happyFail

action_3 (29) = happyShift action_4
action_3 _ = happyFail

action_4 (28) = happyShift action_15
action_4 _ = happyFail

action_5 (36) = happyAccept
action_5 _ = happyFail

action_6 (32) = happyShift action_14
action_6 (11) = happyGoto action_13
action_6 _ = happyFail

action_7 (29) = happyShift action_4
action_7 (30) = happyShift action_9
action_7 (6) = happyGoto action_7
action_7 (17) = happyGoto action_12
action_7 _ = happyReduce_25

action_8 (36) = happyAccept
action_8 _ = happyFail

action_9 (28) = happyShift action_11
action_9 _ = happyFail

action_10 (36) = happyAccept
action_10 _ = happyFail

action_11 (22) = happyShift action_25
action_11 _ = happyFail

action_12 _ = happyReduce_24

action_13 (35) = happyShift action_24
action_13 _ = happyFail

action_14 (19) = happyShift action_21
action_14 (26) = happyShift action_22
action_14 (31) = happyShift action_23
action_14 (7) = happyGoto action_17
action_14 (8) = happyGoto action_18
action_14 (9) = happyGoto action_19
action_14 (10) = happyGoto action_20
action_14 _ = happyFail

action_15 (22) = happyShift action_16
action_15 _ = happyFail

action_16 (32) = happyShift action_14
action_16 (11) = happyGoto action_35
action_16 (13) = happyGoto action_36
action_16 _ = happyFail

action_17 (18) = happyShift action_32
action_17 (19) = happyShift action_33
action_17 (33) = happyShift action_34
action_17 _ = happyFail

action_18 (20) = happyShift action_30
action_18 (21) = happyShift action_31
action_18 _ = happyReduce_7

action_19 _ = happyReduce_10

action_20 _ = happyReduce_12

action_21 (26) = happyShift action_22
action_21 (31) = happyShift action_23
action_21 (10) = happyGoto action_29
action_21 _ = happyFail

action_22 (19) = happyShift action_21
action_22 (26) = happyShift action_22
action_22 (31) = happyShift action_23
action_22 (7) = happyGoto action_28
action_22 (8) = happyGoto action_18
action_22 (9) = happyGoto action_19
action_22 (10) = happyGoto action_20
action_22 _ = happyFail

action_23 _ = happyReduce_13

action_24 (32) = happyShift action_14
action_24 (11) = happyGoto action_27
action_24 _ = happyFail

action_25 (34) = happyShift action_6
action_25 (15) = happyGoto action_26
action_25 _ = happyFail

action_26 _ = happyReduce_4

action_27 _ = happyReduce_21

action_28 (18) = happyShift action_32
action_28 (19) = happyShift action_33
action_28 (27) = happyShift action_43
action_28 _ = happyFail

action_29 _ = happyReduce_11

action_30 (19) = happyShift action_21
action_30 (26) = happyShift action_22
action_30 (31) = happyShift action_23
action_30 (9) = happyGoto action_42
action_30 (10) = happyGoto action_20
action_30 _ = happyFail

action_31 (19) = happyShift action_21
action_31 (26) = happyShift action_22
action_31 (31) = happyShift action_23
action_31 (9) = happyGoto action_41
action_31 (10) = happyGoto action_20
action_31 _ = happyFail

action_32 (19) = happyShift action_21
action_32 (26) = happyShift action_22
action_32 (31) = happyShift action_23
action_32 (8) = happyGoto action_40
action_32 (9) = happyGoto action_19
action_32 (10) = happyGoto action_20
action_32 _ = happyFail

action_33 (19) = happyShift action_21
action_33 (26) = happyShift action_22
action_33 (31) = happyShift action_23
action_33 (8) = happyGoto action_39
action_33 (9) = happyGoto action_19
action_33 (10) = happyGoto action_20
action_33 _ = happyFail

action_34 (19) = happyShift action_21
action_34 (26) = happyShift action_22
action_34 (31) = happyShift action_23
action_34 (7) = happyGoto action_38
action_34 (8) = happyGoto action_18
action_34 (9) = happyGoto action_19
action_34 (10) = happyGoto action_20
action_34 _ = happyFail

action_35 (23) = happyShift action_37
action_35 _ = happyFail

action_36 _ = happyReduce_3

action_37 (32) = happyShift action_14
action_37 (11) = happyGoto action_44
action_37 _ = happyFail

action_38 (18) = happyShift action_32
action_38 (19) = happyShift action_33
action_38 _ = happyReduce_15

action_39 (20) = happyShift action_30
action_39 (21) = happyShift action_31
action_39 _ = happyReduce_6

action_40 (20) = happyShift action_30
action_40 (21) = happyShift action_31
action_40 _ = happyReduce_5

action_41 _ = happyReduce_9

action_42 _ = happyReduce_8

action_43 _ = happyReduce_14

action_44 (23) = happyShift action_45
action_44 _ = happyFail

action_45 (32) = happyShift action_14
action_45 (11) = happyGoto action_46
action_45 _ = happyFail

action_46 (23) = happyShift action_47
action_46 _ = happyFail

action_47 (24) = happyShift action_50
action_47 (32) = happyShift action_14
action_47 (11) = happyGoto action_48
action_47 (12) = happyGoto action_49
action_47 _ = happyFail

action_48 (23) = happyShift action_52
action_48 _ = happyFail

action_49 _ = happyReduce_18

action_50 (25) = happyShift action_51
action_50 _ = happyFail

action_51 _ = happyReduce_16

action_52 (24) = happyShift action_50
action_52 (32) = happyShift action_14
action_52 (11) = happyGoto action_48
action_52 (12) = happyGoto action_53
action_52 _ = happyFail

action_53 _ = happyReduce_17

happyReduce_3 = happyReduce 4 6 happyReduction_3
happyReduction_3 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Dp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 ((HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Dc happy_var_2 happy_var_4
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

happyReduce_16 = happySpecReduce_2  12 happyReduction_16
happyReduction_16 _
	_
	 =  HappyAbsSyn12
		 ([]
	)

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 7 13 happyReduction_18
happyReduction_18 ((HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (P (happy_var_1 : (happy_var_3 : (happy_var_5 : happy_var_7)))
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  14 happyReduction_19
happyReduction_19 _
	_
	 =  HappyAbsSyn14
		 (Ps []
	)

happyReduce_20 = happySpecReduce_3  14 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (case happy_var_3 of
                                        Ps xs -> Ps (happy_var_1 : xs)
                                        _     -> Ps []
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 15 happyReduction_21
happyReduction_21 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (C happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  16 happyReduction_22
happyReduction_22 _
	_
	 =  HappyAbsSyn16
		 (Cs []
	)

happyReduce_23 = happySpecReduce_3  16 happyReduction_23
happyReduction_23 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 (case happy_var_3 of
                                            Cs xs -> Cs (happy_var_1 : xs)
                                            _     -> Cs []
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  17 happyReduction_24
happyReduction_24 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  17 happyReduction_25
happyReduction_25  =  HappyAbsSyn17
		 ([]
	)

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TPlus -> cont 18;
	TMinus -> cont 19;
	TTimes -> cont 20;
	TDiv -> cont 21;
	TEqual -> cont 22;
	TColon -> cont 23;
	TSBracketO -> cont 24;
	TSBracketC -> cont 25;
	TParenO -> cont 26;
	TParenC -> cont 27;
	TName happy_dollar_dollar -> cont 28;
	TPol -> cont 29;
	TCon -> cont 30;
	TFloat happy_dollar_dollar -> cont 31;
	TX -> cont 32;
	TY -> cont 33;
	TPoint1 -> cont 34;
	TPoint2 -> cont 35;
	_ -> happyError' (tk:tks)
	}

happyError_ 36 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => E a -> (a -> E b) -> E b
happyThen = (thenE)
happyReturn :: () => a -> E a
happyReturn = (returnE)
happyThen1 m k tks = (thenE) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> E a
happyReturn1 = \a tks -> (returnE) a
happyError' :: () => [(Token)] -> E a
happyError' = parseError

parseDef tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn6 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

parseExample tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
lexer []        = []
lexer ('\n':cs) = lexer cs
lexer ('X':cs)       = lexPoint1 ('X':cs)
lexer ('P':('1':cs)) = TPoint1 : lexPoint1 cs
lexer ('P':('2':cs)) = TPoint2 : lexPoint1 cs
lexer (c : cs) 
    | isSpace c = lexer cs
    | isDigit c = lexNum (c:cs) lexer
    | isAlpha c = lexString (c:cs)
lexer ('+':cs) = TPlus : lexer cs
lexer ('-':cs) = TMinus : lexer cs
lexer ('*':cs) = TTimes : lexer cs
lexer ('/':cs) = TDiv : lexer cs
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = TSBracketO : lexer cs
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

lexPoint1 :: String -> [Token]
lexPoint1 []      = []
lexPoint1 ('X':cs) = TX : lexPoint2 cs lexPoint1
lexPoint1 ('Y':cs) = TY : lexPoint2 cs lexer
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
