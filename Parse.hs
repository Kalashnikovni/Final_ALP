{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t7 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (MyPoint)
	| HappyAbsSyn9 ([MyPoint])
	| HappyAbsSyn11 (Container)
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

action_0 (17) = happyShift action_5
action_0 (24) = happyShift action_15
action_0 (7) = happyGoto action_14
action_0 _ = happyFail

action_1 (22) = happyShift action_13
action_1 (12) = happyGoto action_12
action_1 _ = happyFail

action_2 (27) = happyShift action_10
action_2 (28) = happyShift action_11
action_2 (13) = happyGoto action_8
action_2 (14) = happyGoto action_9
action_2 _ = happyReduce_15

action_3 (26) = happyShift action_7
action_3 (15) = happyGoto action_6
action_3 _ = happyFail

action_4 (17) = happyShift action_5
action_4 _ = happyFail

action_5 (24) = happyShift action_21
action_5 _ = happyFail

action_6 (31) = happyAccept
action_6 _ = happyFail

action_7 (17) = happyShift action_5
action_7 (24) = happyShift action_15
action_7 (7) = happyGoto action_20
action_7 _ = happyFail

action_8 (27) = happyShift action_10
action_8 (28) = happyShift action_11
action_8 (13) = happyGoto action_8
action_8 (14) = happyGoto action_19
action_8 _ = happyReduce_15

action_9 (31) = happyAccept
action_9 _ = happyFail

action_10 (22) = happyShift action_18
action_10 _ = happyFail

action_11 (22) = happyShift action_17
action_11 _ = happyFail

action_12 (31) = happyAccept
action_12 _ = happyFail

action_13 (18) = happyShift action_16
action_13 _ = happyFail

action_14 (31) = happyAccept
action_14 _ = happyFail

action_15 _ = happyReduce_5

action_16 (24) = happyShift action_25
action_16 _ = happyFail

action_17 (18) = happyShift action_24
action_17 _ = happyFail

action_18 (18) = happyShift action_23
action_18 _ = happyFail

action_19 _ = happyReduce_16

action_20 (27) = happyShift action_10
action_20 (28) = happyShift action_11
action_20 (13) = happyGoto action_8
action_20 (14) = happyGoto action_22
action_20 _ = happyReduce_15

action_21 _ = happyReduce_4

action_22 _ = happyReduce_19

action_23 (24) = happyShift action_30
action_23 (11) = happyGoto action_29
action_23 _ = happyFail

action_24 (19) = happyShift action_28
action_24 (10) = happyGoto action_27
action_24 _ = happyFail

action_25 (25) = happyShift action_26
action_25 _ = happyFail

action_26 (24) = happyShift action_38
action_26 _ = happyFail

action_27 (29) = happyShift action_37
action_27 _ = happyReduce_13

action_28 (17) = happyShift action_5
action_28 (20) = happyShift action_36
action_28 (24) = happyShift action_15
action_28 (7) = happyGoto action_33
action_28 (8) = happyGoto action_34
action_28 (9) = happyGoto action_35
action_28 _ = happyFail

action_29 (29) = happyShift action_32
action_29 _ = happyReduce_14

action_30 (25) = happyShift action_31
action_30 _ = happyFail

action_31 (24) = happyShift action_44
action_31 _ = happyFail

action_32 (23) = happyShift action_43
action_32 _ = happyFail

action_33 (16) = happyShift action_42
action_33 _ = happyFail

action_34 (21) = happyShift action_41
action_34 _ = happyReduce_7

action_35 (20) = happyShift action_40
action_35 _ = happyFail

action_36 _ = happyReduce_9

action_37 (23) = happyShift action_39
action_37 _ = happyFail

action_38 _ = happyReduce_12

action_39 (30) = happyShift action_48
action_39 _ = happyFail

action_40 _ = happyReduce_10

action_41 (17) = happyShift action_5
action_41 (24) = happyShift action_15
action_41 (7) = happyGoto action_33
action_41 (8) = happyGoto action_34
action_41 (9) = happyGoto action_47
action_41 _ = happyFail

action_42 (17) = happyShift action_5
action_42 (24) = happyShift action_15
action_42 (7) = happyGoto action_46
action_42 _ = happyFail

action_43 (30) = happyShift action_45
action_43 _ = happyFail

action_44 _ = happyReduce_11

action_45 (24) = happyShift action_50
action_45 _ = happyFail

action_46 _ = happyReduce_6

action_47 _ = happyReduce_8

action_48 (24) = happyShift action_49
action_48 _ = happyFail

action_49 (27) = happyShift action_10
action_49 (28) = happyShift action_11
action_49 (13) = happyGoto action_8
action_49 (14) = happyGoto action_52
action_49 _ = happyReduce_15

action_50 (27) = happyShift action_10
action_50 (28) = happyShift action_11
action_50 (13) = happyGoto action_8
action_50 (14) = happyGoto action_51
action_50 _ = happyReduce_15

action_51 _ = happyReduce_18

action_52 _ = happyReduce_17

happyReduce_4 = happySpecReduce_2  7 happyReduction_4
happyReduction_4 (HappyTerminal (TFloat happy_var_2))
	_
	 =  HappyAbsSyn7
		 (-happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 ((happy_var_1, happy_var_3)
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  9 happyReduction_7
happyReduction_7 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  9 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  10 happyReduction_9
happyReduction_9 _
	_
	 =  HappyAbsSyn9
		 ([]
	)

happyReduce_10 = happySpecReduce_3  10 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  11 happyReduction_11
happyReduction_11 (HappyTerminal (TFloat happy_var_3))
	_
	(HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn11
		 (C { p1x = 0, p1y = 0, p2x = happy_var_1, p2y = happy_var_3, rid = 0, nc = ""}
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 12 happyReduction_12
happyReduction_12 ((HappyTerminal (TFloat happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFloat happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (C {p1x = 0, p1y = 0, p2x = happy_var_3, p2y = happy_var_5, nc = happy_var_1}
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 13 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Dp (P {p = happy_var_4, pn = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 13 happyReduction_14
happyReduction_14 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Dc (happy_var_4 {nc = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_0  14 happyReduction_15
happyReduction_15  =  HappyAbsSyn14
		 ([]
	)

happyReduce_16 = happySpecReduce_2  14 happyReduction_16
happyReduction_16 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 9 14 happyReduction_17
happyReduction_17 ((HappyAbsSyn14  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (copytimes (Dp (P {p = happy_var_4, pn = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 9 14 happyReduction_18
happyReduction_18 ((HappyAbsSyn14  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (copytimes (Dc (happy_var_4 {nc = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  15 happyReduction_19
happyReduction_19 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Kerf happy_var_2 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 31 31 tk (HappyState action) sts stk;
	TPSep -> cont 16;
	TMinus -> cont 17;
	TEqual -> cont 18;
	TRBracketO -> cont 19;
	TRBracketC -> cont 20;
	TComma -> cont 21;
	TName happy_dollar_dollar -> cont 22;
	TNat happy_dollar_dollar -> cont 23;
	TFloat happy_dollar_dollar -> cont 24;
	TX -> cont 25;
	TKerf -> cont 26;
	TCon -> cont 27;
	TPol -> cont 28;
	TCopy -> cont 29;
	TScale -> cont 30;
	_ -> happyError' tk
	})

happyError_ 31 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

parseC = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn11 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn14 z -> happyReturn z; _other -> notHappyAtAll })

parseM = happySomeParser where
  happySomeParser = happyThen (happyParse action_3) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

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
    = TPSep
    | TMinus     
    | TEqual
    | TRBracketO
    | TRBracketC 
    | TComma
    | TName String
    | TNat Int
    | TFloat Float
    | TX
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
lexer cont ('~':cs)       = cont TPSep cs
lexer cont ('-':cs)       = cont TMinus cs
lexer cont ('=':cs)       = cont TEqual cs
lexer cont ('[':cs)       = cont TRBracketO cs
lexer cont (']':cs)       = cont TRBracketC cs
lexer cont (',':cs)       = cont TComma cs

lexNum cont [] = cont TEof []
lexNum cont cs = if null res 
                 then fromInt 
                 else if fres == '.' 
                      then let (float, res') = span isDigit (drop 1 res) 
                           in case float of
                                [] -> cont TEof []
                                _  -> cont (TFloat ((read int :: Float) + ((read float :: Float) 
                                            / (fromIntegral (10 ^ length float) :: Float)))) res'  
                      else fromInt 
    where (int, res) = span isDigit cs  
          fres       = head res
          fromInt    = cont (TNat (read int :: Int)) res

lexString cont []     = cont TEof []
lexString cont (c:cs) = case span isAlpha (c:cs) of
                         ("kerf", res)  -> cont TKerf res
                         ("pdef", res)  -> cont TPol res
                         ("cdef", res)  -> cont TCon res
                         ("x", res)     -> cont TX res
                         ("copy", res)  -> cont TCopy res
                         ("scale", res) -> cont TScale res
                         (po, res)      -> let (name, res') = span isAlphaNum (po ++ res)
                                           in cont (TName name) res'  

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
