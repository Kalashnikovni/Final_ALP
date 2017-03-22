{-# OPTIONS_GHC -w #-}
module Parse_Path where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 (MyPoint)
	| HappyAbsSyn7 (Container)
	| HappyAbsSyn8 (Polygon)
	| HappyAbsSyn9 ([PathCommand])

action_0 (20) = happyShift action_3
action_0 (22) = happyShift action_9
action_0 (5) = happyGoto action_7
action_0 (7) = happyGoto action_8
action_0 _ = happyFail

action_1 (11) = happyShift action_5
action_1 (12) = happyShift action_6
action_1 (9) = happyGoto action_4
action_1 _ = happyFail

action_2 (20) = happyShift action_3
action_2 _ = happyFail

action_3 (22) = happyShift action_14
action_3 _ = happyFail

action_4 (24) = happyAccept
action_4 _ = happyFail

action_5 (20) = happyShift action_3
action_5 (22) = happyShift action_9
action_5 (5) = happyGoto action_11
action_5 (6) = happyGoto action_13
action_5 _ = happyFail

action_6 (20) = happyShift action_3
action_6 (22) = happyShift action_9
action_6 (5) = happyGoto action_11
action_6 (6) = happyGoto action_12
action_6 _ = happyFail

action_7 (20) = happyShift action_3
action_7 (22) = happyShift action_9
action_7 (5) = happyGoto action_10
action_7 _ = happyFail

action_8 (24) = happyAccept
action_8 _ = happyFail

action_9 _ = happyReduce_3

action_10 _ = happyReduce_6

action_11 (20) = happyShift action_3
action_11 (21) = happyShift action_26
action_11 (22) = happyShift action_9
action_11 (5) = happyGoto action_25
action_11 _ = happyFail

action_12 (13) = happyShift action_17
action_12 (14) = happyShift action_18
action_12 (15) = happyShift action_19
action_12 (16) = happyShift action_20
action_12 (17) = happyShift action_21
action_12 (18) = happyShift action_22
action_12 (19) = happyShift action_23
action_12 (20) = happyShift action_3
action_12 (22) = happyShift action_9
action_12 (5) = happyGoto action_11
action_12 (6) = happyGoto action_15
action_12 (10) = happyGoto action_24
action_12 _ = happyFail

action_13 (13) = happyShift action_17
action_13 (14) = happyShift action_18
action_13 (15) = happyShift action_19
action_13 (16) = happyShift action_20
action_13 (17) = happyShift action_21
action_13 (18) = happyShift action_22
action_13 (19) = happyShift action_23
action_13 (20) = happyShift action_3
action_13 (22) = happyShift action_9
action_13 (5) = happyGoto action_11
action_13 (6) = happyGoto action_15
action_13 (10) = happyGoto action_16
action_13 _ = happyFail

action_14 _ = happyReduce_2

action_15 (13) = happyShift action_17
action_15 (14) = happyShift action_18
action_15 (15) = happyShift action_19
action_15 (16) = happyShift action_20
action_15 (17) = happyShift action_21
action_15 (18) = happyShift action_22
action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_3
action_15 (22) = happyShift action_9
action_15 (5) = happyGoto action_11
action_15 (6) = happyGoto action_15
action_15 (10) = happyGoto action_34
action_15 _ = happyFail

action_16 _ = happyReduce_10

action_17 (20) = happyShift action_3
action_17 (22) = happyShift action_9
action_17 (5) = happyGoto action_33
action_17 _ = happyFail

action_18 (20) = happyShift action_3
action_18 (22) = happyShift action_9
action_18 (5) = happyGoto action_32
action_18 _ = happyFail

action_19 (20) = happyShift action_3
action_19 (22) = happyShift action_9
action_19 (5) = happyGoto action_31
action_19 _ = happyFail

action_20 (20) = happyShift action_3
action_20 (22) = happyShift action_9
action_20 (5) = happyGoto action_30
action_20 _ = happyFail

action_21 (20) = happyShift action_3
action_21 (22) = happyShift action_9
action_21 (5) = happyGoto action_11
action_21 (6) = happyGoto action_29
action_21 _ = happyFail

action_22 (20) = happyShift action_3
action_22 (22) = happyShift action_9
action_22 (5) = happyGoto action_11
action_22 (6) = happyGoto action_28
action_22 _ = happyFail

action_23 _ = happyReduce_18

action_24 _ = happyReduce_9

action_25 _ = happyReduce_4

action_26 (20) = happyShift action_3
action_26 (22) = happyShift action_9
action_26 (5) = happyGoto action_27
action_26 _ = happyFail

action_27 _ = happyReduce_5

action_28 (13) = happyShift action_17
action_28 (14) = happyShift action_18
action_28 (15) = happyShift action_19
action_28 (16) = happyShift action_20
action_28 (17) = happyShift action_21
action_28 (18) = happyShift action_22
action_28 (19) = happyShift action_23
action_28 (20) = happyShift action_3
action_28 (22) = happyShift action_9
action_28 (5) = happyGoto action_11
action_28 (6) = happyGoto action_15
action_28 (10) = happyGoto action_40
action_28 _ = happyFail

action_29 (13) = happyShift action_17
action_29 (14) = happyShift action_18
action_29 (15) = happyShift action_19
action_29 (16) = happyShift action_20
action_29 (17) = happyShift action_21
action_29 (18) = happyShift action_22
action_29 (19) = happyShift action_23
action_29 (20) = happyShift action_3
action_29 (22) = happyShift action_9
action_29 (5) = happyGoto action_11
action_29 (6) = happyGoto action_15
action_29 (10) = happyGoto action_39
action_29 _ = happyFail

action_30 (13) = happyShift action_17
action_30 (14) = happyShift action_18
action_30 (15) = happyShift action_19
action_30 (16) = happyShift action_20
action_30 (17) = happyShift action_21
action_30 (18) = happyShift action_22
action_30 (19) = happyShift action_23
action_30 (20) = happyShift action_3
action_30 (22) = happyShift action_9
action_30 (5) = happyGoto action_11
action_30 (6) = happyGoto action_15
action_30 (10) = happyGoto action_38
action_30 _ = happyFail

action_31 (13) = happyShift action_17
action_31 (14) = happyShift action_18
action_31 (15) = happyShift action_19
action_31 (16) = happyShift action_20
action_31 (17) = happyShift action_21
action_31 (18) = happyShift action_22
action_31 (19) = happyShift action_23
action_31 (20) = happyShift action_3
action_31 (22) = happyShift action_9
action_31 (5) = happyGoto action_11
action_31 (6) = happyGoto action_15
action_31 (10) = happyGoto action_37
action_31 _ = happyFail

action_32 (13) = happyShift action_17
action_32 (14) = happyShift action_18
action_32 (15) = happyShift action_19
action_32 (16) = happyShift action_20
action_32 (17) = happyShift action_21
action_32 (18) = happyShift action_22
action_32 (19) = happyShift action_23
action_32 (20) = happyShift action_3
action_32 (22) = happyShift action_9
action_32 (5) = happyGoto action_11
action_32 (6) = happyGoto action_15
action_32 (10) = happyGoto action_36
action_32 _ = happyFail

action_33 (13) = happyShift action_17
action_33 (14) = happyShift action_18
action_33 (15) = happyShift action_19
action_33 (16) = happyShift action_20
action_33 (17) = happyShift action_21
action_33 (18) = happyShift action_22
action_33 (19) = happyShift action_23
action_33 (20) = happyShift action_3
action_33 (22) = happyShift action_9
action_33 (5) = happyGoto action_11
action_33 (6) = happyGoto action_15
action_33 (10) = happyGoto action_35
action_33 _ = happyFail

action_34 _ = happyReduce_17

action_35 _ = happyReduce_11

action_36 _ = happyReduce_12

action_37 _ = happyReduce_13

action_38 _ = happyReduce_14

action_39 _ = happyReduce_15

action_40 _ = happyReduce_16

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

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 ((happy_var_1, happy_var_2)
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn6
		 ((happy_var_1, happy_var_3)
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn7
		 (C {p1x = 0, p1y = 0, p2x = happy_var_1, p2y = happy_var_2, rid = 0}
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn8
		 ([]
	)

happyReduce_8 = happySpecReduce_2  8 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  9 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn9
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  10 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn9
		 ([Z]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 24 24 tk (HappyState action) sts stk;
	Tm -> cont 11;
	TM -> cont 12;
	Th -> cont 13;
	TH -> cont 14;
	Tv -> cont 15;
	TV -> cont 16;
	Tl -> cont 17;
	TL -> cont 18;
	TZ -> cont 19;
	TMinus -> cont 20;
	TComma -> cont 21;
	TFloat happy_dollar_dollar -> cont 22;
	TEmpty -> cont 23;
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

parseP = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TEmpty
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
                 then cont TEof [] 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in cont (TFloat ((read int :: Float) 
                                    + ((read float :: Float) / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else cont TEof [] 
    where (int, res) = span isDigit cs  
          fres       = head res

parsePath s = parseP s 1  

parseRect s = parseR s 1
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
