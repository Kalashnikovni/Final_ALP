{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import AST

-- Módulos prestados
import Data.Char
import Data.List
import Graphics.Gloss
import Control.Applicative 
import Control.Monad (liftM, ap)

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t5 t11 t16
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 (Float)
	| HappyAbsSyn10 (Point)
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 (Polygon)
	| HappyAbsSyn13 (Polygons)
	| HappyAbsSyn14 (Container)
	| HappyAbsSyn15 (Containers)
	| HappyAbsSyn16 t16

action_0 (27) = happyShift action_3
action_0 (28) = happyShift action_6
action_0 (5) = happyGoto action_7
action_0 _ = happyFail

action_1 (27) = happyShift action_3
action_1 (28) = happyShift action_6
action_1 (5) = happyGoto action_4
action_1 (16) = happyGoto action_5
action_1 _ = happyReduce_24

action_2 (27) = happyShift action_3
action_2 _ = happyFail

action_3 (26) = happyShift action_10
action_3 _ = happyFail

action_4 (27) = happyShift action_3
action_4 (28) = happyShift action_6
action_4 (5) = happyGoto action_4
action_4 (16) = happyGoto action_9
action_4 _ = happyReduce_24

action_5 (35) = happyAccept
action_5 _ = happyFail

action_6 (26) = happyShift action_8
action_6 _ = happyFail

action_7 (35) = happyAccept
action_7 _ = happyFail

action_8 (21) = happyShift action_12
action_8 _ = happyFail

action_9 _ = happyReduce_23

action_10 (21) = happyShift action_11
action_10 _ = happyFail

action_11 (30) = happyShift action_17
action_11 (10) = happyGoto action_15
action_11 (12) = happyGoto action_16
action_11 _ = happyFail

action_12 (32) = happyShift action_14
action_12 (14) = happyGoto action_13
action_12 _ = happyFail

action_13 _ = happyReduce_3

action_14 (30) = happyShift action_17
action_14 (10) = happyGoto action_26
action_14 _ = happyFail

action_15 (22) = happyShift action_25
action_15 _ = happyFail

action_16 _ = happyReduce_2

action_17 (18) = happyShift action_22
action_17 (23) = happyShift action_23
action_17 (29) = happyShift action_24
action_17 (6) = happyGoto action_18
action_17 (7) = happyGoto action_19
action_17 (8) = happyGoto action_20
action_17 (9) = happyGoto action_21
action_17 _ = happyFail

action_18 (17) = happyShift action_33
action_18 (18) = happyShift action_34
action_18 (31) = happyShift action_35
action_18 _ = happyFail

action_19 (19) = happyShift action_31
action_19 (20) = happyShift action_32
action_19 _ = happyReduce_6

action_20 _ = happyReduce_9

action_21 _ = happyReduce_11

action_22 (23) = happyShift action_23
action_22 (29) = happyShift action_24
action_22 (9) = happyGoto action_30
action_22 _ = happyFail

action_23 (18) = happyShift action_22
action_23 (23) = happyShift action_23
action_23 (29) = happyShift action_24
action_23 (6) = happyGoto action_29
action_23 (7) = happyGoto action_19
action_23 (8) = happyGoto action_20
action_23 (9) = happyGoto action_21
action_23 _ = happyFail

action_24 _ = happyReduce_12

action_25 (30) = happyShift action_17
action_25 (10) = happyGoto action_28
action_25 _ = happyFail

action_26 (33) = happyShift action_27
action_26 _ = happyFail

action_27 (30) = happyShift action_17
action_27 (10) = happyGoto action_43
action_27 _ = happyFail

action_28 (22) = happyShift action_42
action_28 _ = happyFail

action_29 (17) = happyShift action_33
action_29 (18) = happyShift action_34
action_29 (24) = happyShift action_41
action_29 _ = happyFail

action_30 _ = happyReduce_10

action_31 (18) = happyShift action_22
action_31 (23) = happyShift action_23
action_31 (29) = happyShift action_24
action_31 (8) = happyGoto action_40
action_31 (9) = happyGoto action_21
action_31 _ = happyFail

action_32 (18) = happyShift action_22
action_32 (23) = happyShift action_23
action_32 (29) = happyShift action_24
action_32 (8) = happyGoto action_39
action_32 (9) = happyGoto action_21
action_32 _ = happyFail

action_33 (18) = happyShift action_22
action_33 (23) = happyShift action_23
action_33 (29) = happyShift action_24
action_33 (7) = happyGoto action_38
action_33 (8) = happyGoto action_20
action_33 (9) = happyGoto action_21
action_33 _ = happyFail

action_34 (18) = happyShift action_22
action_34 (23) = happyShift action_23
action_34 (29) = happyShift action_24
action_34 (7) = happyGoto action_37
action_34 (8) = happyGoto action_20
action_34 (9) = happyGoto action_21
action_34 _ = happyFail

action_35 (18) = happyShift action_22
action_35 (23) = happyShift action_23
action_35 (29) = happyShift action_24
action_35 (6) = happyGoto action_36
action_35 (7) = happyGoto action_19
action_35 (8) = happyGoto action_20
action_35 (9) = happyGoto action_21
action_35 _ = happyFail

action_36 (17) = happyShift action_33
action_36 (18) = happyShift action_34
action_36 _ = happyReduce_14

action_37 (19) = happyShift action_31
action_37 (20) = happyShift action_32
action_37 _ = happyReduce_5

action_38 (19) = happyShift action_31
action_38 (20) = happyShift action_32
action_38 _ = happyReduce_4

action_39 _ = happyReduce_8

action_40 _ = happyReduce_7

action_41 _ = happyReduce_13

action_42 (30) = happyShift action_17
action_42 (10) = happyGoto action_44
action_42 _ = happyFail

action_43 _ = happyReduce_20

action_44 (22) = happyShift action_45
action_44 _ = happyFail

action_45 (30) = happyShift action_17
action_45 (34) = happyShift action_48
action_45 (10) = happyGoto action_46
action_45 (11) = happyGoto action_47
action_45 _ = happyFail

action_46 (22) = happyShift action_49
action_46 _ = happyFail

action_47 _ = happyReduce_17

action_48 _ = happyReduce_15

action_49 (30) = happyShift action_17
action_49 (34) = happyShift action_48
action_49 (10) = happyGoto action_46
action_49 (11) = happyGoto action_50
action_49 _ = happyFail

action_50 _ = happyReduce_16

happyReduce_2 = happyReduce 4 5 happyReduction_2
happyReduction_2 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Dp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Dc happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  6 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 + happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 - happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  7 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 * happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 / happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  8 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (- happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 10 happyReduction_14
happyReduction_14 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  11 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn11
		 ([]
	)

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 7 12 happyReduction_17
happyReduction_17 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (P (happy_var_1 : (happy_var_3 : (happy_var_5 : happy_var_7)))
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn13
		 (Ps []
	)

happyReduce_19 = happySpecReduce_3  13 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 (case happy_var_3 of
                                        Ps xs -> Ps (happy_var_1 : xs)
                                        _     -> Ps []
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 14 happyReduction_20
happyReduction_20 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (C happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  15 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn15
		 (Cs []
	)

happyReduce_22 = happySpecReduce_3  15 happyReduction_22
happyReduction_22 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (case happy_var_3 of
                                            Cs xs -> Cs (happy_var_1 : xs)
                                            _     -> Cs []
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  16 happyReduction_23
happyReduction_23 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_0  16 happyReduction_24
happyReduction_24  =  HappyAbsSyn16
		 ([]
	)

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TPlus -> cont 17;
	TMinus -> cont 18;
	TTimes -> cont 19;
	TDiv -> cont 20;
	TEqual -> cont 21;
	TColon -> cont 22;
	TParenO -> cont 23;
	TParenC -> cont 24;
	TConcat -> cont 25;
	TName happy_dollar_dollar -> cont 26;
	TPol -> cont 27;
	TCon -> cont 28;
	TFloat happy_dollar_dollar -> cont 29;
	TX -> cont 30;
	TY -> cont 31;
	TPoint1 -> cont 32;
	TPoint2 -> cont 33;
	TEmpty -> cont 34;
	_ -> happyError' (tk:tks)
	}

happyError_ 35 tk tks = happyError' tks
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
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TConcat
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
    | TEmpty
    deriving (Eq, Show)

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
lexer ('=':cs) = TEqual : lexer cs
lexer ('(':cs) = TParenO : lexer cs
lexer (')':cs) = TParenC : lexer cs
lexer ('[':cs) = lexList cs
lexer (']':cs) = getRBracket1 cs ++ lexer cs
lexer (',':cs) = getRBracket2 cs ++ lexer cs

getRBracket1 :: String -> [Token]
getRBracket1 [] = [TColon, TEmpty]
getRBracket1 (c:cs)
    | isSpace c = getRBracket1 cs
    | c == ']'  = [TColon, TEmpty, TConcat, TEmpty]
    | otherwise = [TColon, TEmpty]

getRBracket2 :: String -> [Token]
getRBracket2 [] = []
getRBracket2 (c:cs)
    | isSpace c = getRBracket2 cs
    | c == '['  = [TConcat]
    | otherwise = [TColon]

lexNum :: String -> (String -> [Token]) -> [Token]
lexNum [] _ = []
lexNum cs f = if null res 
              then fromInt 
              else if fres == '.' 
                   then let (float, res') = span isDigit (drop 1 res) 
                   in TFloat ((read int :: Float) + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float))) : (f res')  
                   else fromInt 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = TFloat (read int :: Float) : (f res)

lexString :: String -> [Token]
lexString []     = []
lexString (c:cs) = case span isAlpha (c:cs) of
                    ("pdef", res) -> TPol : lexer res
                    ("cdef", res) -> TCon : lexer res
                    ("X", res)    -> TX : lexer res
                    ("Y", res)    -> TY : lexer res   
                    (po, res)     -> if po == "P"
                                     then let (num, res') = span isDigit res
                                          in if num == "1" 
                                             then TPoint1 : lexer res'
                                             else if num == "2"
                                                  then TPoint2 : lexer res'
                                                  else [] 
                                     else let (name, res') = span isAlphaNum (po ++ res)
                                          in TName name : lexer res'  

lexList :: String -> [Token]
lexList []     = []
lexList (c:cs) = case span (\x -> isAlpha x || isDigit x || isPunctuation x) (c:cs) of
                    ("X", res)  -> TX : lexer res
                    ("[", res)  -> TConcat : lexer res 
                    ("P1", res) -> TPoint1 : lexer res
                    _           -> lexer (c:cs)
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
