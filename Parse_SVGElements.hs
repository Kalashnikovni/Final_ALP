{-# OPTIONS_GHC -w #-}
module Parse_SVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 (MyPoint)
	| HappyAbsSyn8 (Container)
	| HappyAbsSyn9 (Polygon)
	| HappyAbsSyn10 ([PathCommand])

action_0 (21) = happyShift action_4
action_0 (23) = happyShift action_11
action_0 (6) = happyGoto action_12
action_0 (8) = happyGoto action_13
action_0 _ = happyFail

action_1 (21) = happyShift action_4
action_1 (23) = happyShift action_11
action_1 (6) = happyGoto action_8
action_1 (7) = happyGoto action_9
action_1 (9) = happyGoto action_10
action_1 _ = happyReduce_8

action_2 (12) = happyShift action_6
action_2 (13) = happyShift action_7
action_2 (10) = happyGoto action_5
action_2 _ = happyFail

action_3 (21) = happyShift action_4
action_3 _ = happyFail

action_4 (23) = happyShift action_20
action_4 _ = happyFail

action_5 (24) = happyAccept
action_5 _ = happyFail

action_6 (21) = happyShift action_4
action_6 (23) = happyShift action_11
action_6 (6) = happyGoto action_8
action_6 (7) = happyGoto action_19
action_6 _ = happyFail

action_7 (21) = happyShift action_4
action_7 (23) = happyShift action_11
action_7 (6) = happyGoto action_8
action_7 (7) = happyGoto action_18
action_7 _ = happyFail

action_8 (21) = happyShift action_4
action_8 (22) = happyShift action_17
action_8 (23) = happyShift action_11
action_8 (6) = happyGoto action_16
action_8 _ = happyFail

action_9 (21) = happyShift action_4
action_9 (23) = happyShift action_11
action_9 (6) = happyGoto action_8
action_9 (7) = happyGoto action_9
action_9 (9) = happyGoto action_15
action_9 _ = happyReduce_8

action_10 (24) = happyAccept
action_10 _ = happyFail

action_11 _ = happyReduce_4

action_12 (21) = happyShift action_4
action_12 (23) = happyShift action_11
action_12 (6) = happyGoto action_14
action_12 _ = happyFail

action_13 (24) = happyAccept
action_13 _ = happyFail

action_14 _ = happyReduce_7

action_15 _ = happyReduce_9

action_16 _ = happyReduce_5

action_17 (21) = happyShift action_4
action_17 (23) = happyShift action_11
action_17 (6) = happyGoto action_31
action_17 _ = happyFail

action_18 (14) = happyShift action_23
action_18 (15) = happyShift action_24
action_18 (16) = happyShift action_25
action_18 (17) = happyShift action_26
action_18 (18) = happyShift action_27
action_18 (19) = happyShift action_28
action_18 (20) = happyShift action_29
action_18 (21) = happyShift action_4
action_18 (23) = happyShift action_11
action_18 (6) = happyGoto action_8
action_18 (7) = happyGoto action_21
action_18 (11) = happyGoto action_30
action_18 _ = happyFail

action_19 (14) = happyShift action_23
action_19 (15) = happyShift action_24
action_19 (16) = happyShift action_25
action_19 (17) = happyShift action_26
action_19 (18) = happyShift action_27
action_19 (19) = happyShift action_28
action_19 (20) = happyShift action_29
action_19 (21) = happyShift action_4
action_19 (23) = happyShift action_11
action_19 (6) = happyGoto action_8
action_19 (7) = happyGoto action_21
action_19 (11) = happyGoto action_22
action_19 _ = happyFail

action_20 _ = happyReduce_3

action_21 (14) = happyShift action_23
action_21 (15) = happyShift action_24
action_21 (16) = happyShift action_25
action_21 (17) = happyShift action_26
action_21 (18) = happyShift action_27
action_21 (19) = happyShift action_28
action_21 (20) = happyShift action_29
action_21 (21) = happyShift action_4
action_21 (23) = happyShift action_11
action_21 (6) = happyGoto action_8
action_21 (7) = happyGoto action_21
action_21 (11) = happyGoto action_38
action_21 _ = happyFail

action_22 _ = happyReduce_11

action_23 (21) = happyShift action_4
action_23 (23) = happyShift action_11
action_23 (6) = happyGoto action_37
action_23 _ = happyFail

action_24 (21) = happyShift action_4
action_24 (23) = happyShift action_11
action_24 (6) = happyGoto action_36
action_24 _ = happyFail

action_25 (21) = happyShift action_4
action_25 (23) = happyShift action_11
action_25 (6) = happyGoto action_35
action_25 _ = happyFail

action_26 (21) = happyShift action_4
action_26 (23) = happyShift action_11
action_26 (6) = happyGoto action_34
action_26 _ = happyFail

action_27 (21) = happyShift action_4
action_27 (23) = happyShift action_11
action_27 (6) = happyGoto action_8
action_27 (7) = happyGoto action_33
action_27 _ = happyFail

action_28 (21) = happyShift action_4
action_28 (23) = happyShift action_11
action_28 (6) = happyGoto action_8
action_28 (7) = happyGoto action_32
action_28 _ = happyFail

action_29 _ = happyReduce_19

action_30 _ = happyReduce_10

action_31 _ = happyReduce_6

action_32 (14) = happyShift action_23
action_32 (15) = happyShift action_24
action_32 (16) = happyShift action_25
action_32 (17) = happyShift action_26
action_32 (18) = happyShift action_27
action_32 (19) = happyShift action_28
action_32 (20) = happyShift action_29
action_32 (21) = happyShift action_4
action_32 (23) = happyShift action_11
action_32 (6) = happyGoto action_8
action_32 (7) = happyGoto action_21
action_32 (11) = happyGoto action_44
action_32 _ = happyFail

action_33 (14) = happyShift action_23
action_33 (15) = happyShift action_24
action_33 (16) = happyShift action_25
action_33 (17) = happyShift action_26
action_33 (18) = happyShift action_27
action_33 (19) = happyShift action_28
action_33 (20) = happyShift action_29
action_33 (21) = happyShift action_4
action_33 (23) = happyShift action_11
action_33 (6) = happyGoto action_8
action_33 (7) = happyGoto action_21
action_33 (11) = happyGoto action_43
action_33 _ = happyFail

action_34 (14) = happyShift action_23
action_34 (15) = happyShift action_24
action_34 (16) = happyShift action_25
action_34 (17) = happyShift action_26
action_34 (18) = happyShift action_27
action_34 (19) = happyShift action_28
action_34 (20) = happyShift action_29
action_34 (21) = happyShift action_4
action_34 (23) = happyShift action_11
action_34 (6) = happyGoto action_8
action_34 (7) = happyGoto action_21
action_34 (11) = happyGoto action_42
action_34 _ = happyFail

action_35 (14) = happyShift action_23
action_35 (15) = happyShift action_24
action_35 (16) = happyShift action_25
action_35 (17) = happyShift action_26
action_35 (18) = happyShift action_27
action_35 (19) = happyShift action_28
action_35 (20) = happyShift action_29
action_35 (21) = happyShift action_4
action_35 (23) = happyShift action_11
action_35 (6) = happyGoto action_8
action_35 (7) = happyGoto action_21
action_35 (11) = happyGoto action_41
action_35 _ = happyFail

action_36 (14) = happyShift action_23
action_36 (15) = happyShift action_24
action_36 (16) = happyShift action_25
action_36 (17) = happyShift action_26
action_36 (18) = happyShift action_27
action_36 (19) = happyShift action_28
action_36 (20) = happyShift action_29
action_36 (21) = happyShift action_4
action_36 (23) = happyShift action_11
action_36 (6) = happyGoto action_8
action_36 (7) = happyGoto action_21
action_36 (11) = happyGoto action_40
action_36 _ = happyFail

action_37 (14) = happyShift action_23
action_37 (15) = happyShift action_24
action_37 (16) = happyShift action_25
action_37 (17) = happyShift action_26
action_37 (18) = happyShift action_27
action_37 (19) = happyShift action_28
action_37 (20) = happyShift action_29
action_37 (21) = happyShift action_4
action_37 (23) = happyShift action_11
action_37 (6) = happyGoto action_8
action_37 (7) = happyGoto action_21
action_37 (11) = happyGoto action_39
action_37 _ = happyFail

action_38 _ = happyReduce_18

action_39 _ = happyReduce_12

action_40 _ = happyReduce_13

action_41 _ = happyReduce_14

action_42 _ = happyReduce_15

action_43 _ = happyReduce_16

action_44 _ = happyReduce_17

happyReduce_3 = happySpecReduce_2  6 happyReduction_3
happyReduction_3 (HappyTerminal (TFloat happy_var_2))
	_
	 =  HappyAbsSyn6
		 (-happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  7 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ((happy_var_1, happy_var_2)
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  7 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ((happy_var_1, happy_var_3)
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  8 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (C {p1x = 0, p1y = 0, p2x = happy_var_1, p2y = happy_var_2, rid = 0}
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  9 happyReduction_8
happyReduction_8  =  HappyAbsSyn9
		 ([]
	)

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  10 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  11 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  11 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  11 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  11 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn10
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn10
		 ([Z]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 24 24 tk (HappyState action) sts stk;
	Tm -> cont 12;
	TM -> cont 13;
	Th -> cont 14;
	TH -> cont 15;
	Tv -> cont 16;
	TV -> cont 17;
	Tl -> cont 18;
	TL -> cont 19;
	TZ -> cont 20;
	TMinus -> cont 21;
	TComma -> cont 22;
	TFloat happy_dollar_dollar -> cont 23;
	_ -> happyError' tk
	})

happyError_ 24 tk = happyError' tk
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

parseR = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

parsePo = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

parsePa = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []        = cont TEof []
lexer cont ('\n':cs) = \l -> lexer cont cs (l + 1)
lexer cont ('m':cs)  = cont Tm cs
lexer cont ('M':cs)  = cont TM cs
lexer cont ('h':cs)  = cont Th cs
lexer cont ('H':cs)  = cont TH cs
lexer cont ('v':cs)  = cont Tv cs
lexer cont ('V':cs)  = cont TV cs
lexer cont ('l':cs)  = cont Tl cs
lexer cont ('L':cs)  = cont TL cs
lexer cont ('z':cs)  = cont TZ cs
lexer cont ('Z':cs)  = cont TZ cs
lexer cont ('-':cs)  = cont TMinus cs
lexer cont (',':cs)  = cont TComma cs
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | isSpace c = lexer cont cs
    | otherwise = cont TEof []

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

parseRect s    = parseR s 1

parsePath s    = parsePa s 1  

parsePolygon s = parsePo s 1
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
