{-# OPTIONS_GHC -w #-}
module Parse where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t8 t9 t10 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 (MyPoint)
	| HappyAbsSyn12 ([MyPoint])
	| HappyAbsSyn14 (Container)
	| HappyAbsSyn15 t15

action_0 (16) = happyShift action_6
action_0 (23) = happyShift action_19
action_0 (8) = happyGoto action_18
action_0 _ = happyFail

action_1 (23) = happyShift action_17
action_1 (14) = happyGoto action_16
action_1 _ = happyFail

action_2 (26) = happyShift action_14
action_2 (27) = happyShift action_15
action_2 (10) = happyGoto action_13
action_2 _ = happyFail

action_3 (26) = happyShift action_11
action_3 (27) = happyShift action_12
action_3 (10) = happyGoto action_9
action_3 (15) = happyGoto action_10
action_3 _ = happyReduce_17

action_4 (25) = happyShift action_8
action_4 (9) = happyGoto action_7
action_4 _ = happyFail

action_5 (16) = happyShift action_6
action_5 _ = happyFail

action_6 (23) = happyShift action_27
action_6 _ = happyFail

action_7 (30) = happyAccept
action_7 _ = happyFail

action_8 (16) = happyShift action_6
action_8 (23) = happyShift action_19
action_8 (8) = happyGoto action_26
action_8 _ = happyFail

action_9 (26) = happyShift action_11
action_9 (27) = happyShift action_12
action_9 (10) = happyGoto action_9
action_9 (15) = happyGoto action_25
action_9 _ = happyReduce_17

action_10 (30) = happyAccept
action_10 _ = happyFail

action_11 (21) = happyShift action_24
action_11 _ = happyFail

action_12 (21) = happyShift action_23
action_12 _ = happyFail

action_13 (30) = happyAccept
action_13 _ = happyFail

action_14 (21) = happyShift action_22
action_14 _ = happyFail

action_15 (21) = happyShift action_21
action_15 _ = happyFail

action_16 (30) = happyAccept
action_16 _ = happyFail

action_17 (24) = happyShift action_20
action_17 _ = happyFail

action_18 (30) = happyAccept
action_18 _ = happyFail

action_19 _ = happyReduce_6

action_20 (23) = happyShift action_33
action_20 _ = happyFail

action_21 (17) = happyShift action_32
action_21 _ = happyFail

action_22 (17) = happyShift action_31
action_22 _ = happyFail

action_23 (17) = happyShift action_30
action_23 _ = happyFail

action_24 (17) = happyShift action_29
action_24 _ = happyFail

action_25 _ = happyReduce_16

action_26 (26) = happyShift action_11
action_26 (27) = happyShift action_12
action_26 (10) = happyGoto action_9
action_26 (15) = happyGoto action_28
action_26 _ = happyReduce_17

action_27 _ = happyReduce_5

action_28 _ = happyReduce_7

action_29 (23) = happyShift action_17
action_29 (14) = happyGoto action_38
action_29 _ = happyFail

action_30 (18) = happyShift action_35
action_30 (12) = happyGoto action_37
action_30 _ = happyFail

action_31 (23) = happyShift action_17
action_31 (14) = happyGoto action_36
action_31 _ = happyFail

action_32 (18) = happyShift action_35
action_32 (12) = happyGoto action_34
action_32 _ = happyFail

action_33 _ = happyReduce_15

action_34 _ = happyReduce_8

action_35 (16) = happyShift action_6
action_35 (19) = happyShift action_44
action_35 (23) = happyShift action_19
action_35 (8) = happyGoto action_41
action_35 (11) = happyGoto action_42
action_35 (13) = happyGoto action_43
action_35 _ = happyFail

action_36 _ = happyReduce_9

action_37 (28) = happyShift action_40
action_37 _ = happyReduce_8

action_38 (28) = happyShift action_39
action_38 _ = happyReduce_9

action_39 (22) = happyShift action_49
action_39 _ = happyFail

action_40 (22) = happyShift action_48
action_40 _ = happyFail

action_41 (16) = happyShift action_6
action_41 (23) = happyShift action_19
action_41 (8) = happyGoto action_47
action_41 _ = happyFail

action_42 (20) = happyShift action_46
action_42 _ = happyReduce_14

action_43 (19) = happyShift action_45
action_43 _ = happyFail

action_44 _ = happyReduce_11

action_45 _ = happyReduce_12

action_46 (16) = happyShift action_6
action_46 (23) = happyShift action_19
action_46 (8) = happyGoto action_41
action_46 (11) = happyGoto action_42
action_46 (13) = happyGoto action_52
action_46 _ = happyFail

action_47 _ = happyReduce_10

action_48 (29) = happyShift action_51
action_48 _ = happyFail

action_49 (29) = happyShift action_50
action_49 _ = happyFail

action_50 (23) = happyShift action_54
action_50 _ = happyFail

action_51 (23) = happyShift action_53
action_51 _ = happyFail

action_52 _ = happyReduce_13

action_53 (26) = happyShift action_11
action_53 (27) = happyShift action_12
action_53 (10) = happyGoto action_9
action_53 (15) = happyGoto action_56
action_53 _ = happyReduce_17

action_54 (26) = happyShift action_11
action_54 (27) = happyShift action_12
action_54 (10) = happyGoto action_9
action_54 (15) = happyGoto action_55
action_54 _ = happyReduce_17

action_55 _ = happyReduce_19

action_56 _ = happyReduce_18

happyReduce_5 = happySpecReduce_2  8 happyReduction_5
happyReduction_5 (HappyTerminal (TFloat happy_var_2))
	_
	 =  HappyAbsSyn8
		 (-happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  8 happyReduction_6
happyReduction_6 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  9 happyReduction_7
happyReduction_7 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Kerf happy_var_2 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 10 happyReduction_8
happyReduction_8 ((HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Dp (P {p = happy_var_4, pn = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 10 happyReduction_9
happyReduction_9 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Dc (happy_var_4 {nc = happy_var_2}) 1
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_2  11 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_2)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  12 happyReduction_11
happyReduction_11 _
	_
	 =  HappyAbsSyn12
		 ([]
	)

happyReduce_12 = happySpecReduce_3  12 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  13 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  13 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  14 happyReduction_15
happyReduction_15 (HappyTerminal (TFloat happy_var_3))
	_
	(HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn14
		 (C { p1x = 0, p1y = 0, p2x = happy_var_1, p2y = happy_var_3, rid = 0, nc = ""}
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  15 happyReduction_16
happyReduction_16 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  15 happyReduction_17
happyReduction_17  =  HappyAbsSyn15
		 ([]
	)

happyReduce_18 = happyReduce 9 15 happyReduction_18
happyReduction_18 ((HappyAbsSyn15  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (copytimes (Dp (P {p = happy_var_4, pn = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 9 15 happyReduction_19
happyReduction_19 ((HappyAbsSyn15  happy_var_9) `HappyStk`
	(HappyTerminal (TFloat happy_var_8)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TNat happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (copytimes (Dc (happy_var_4 {nc = happy_var_2}) happy_var_8) happy_var_6 ++ happy_var_9
	) `HappyStk` happyRest

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 30 30 tk (HappyState action) sts stk;
	TMinus -> cont 16;
	TEqual -> cont 17;
	TRBracketO -> cont 18;
	TRBracketC -> cont 19;
	TComma -> cont 20;
	TName happy_dollar_dollar -> cont 21;
	TNat happy_dollar_dollar -> cont 22;
	TFloat happy_dollar_dollar -> cont 23;
	TX -> cont 24;
	TKerf -> cont 25;
	TCon -> cont 26;
	TPol -> cont 27;
	TCopy -> cont 28;
	TScale -> cont 29;
	_ -> happyError' tk
	})

happyError_ 30 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn8 z -> happyReturn z; _other -> notHappyAtAll })

parseC = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn14 z -> happyReturn z; _other -> notHappyAtAll })

parseDef = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

parseDefs = happySomeParser where
  happySomeParser = happyThen (happyParse action_3) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

parseM = happySomeParser where
  happySomeParser = happyThen (happyParse action_4) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

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
    = TMinus     
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

parseCon s = parseC s 1
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
