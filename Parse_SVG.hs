{-# OPTIONS_GHC -w #-}
module Parse_SVG where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List
import Control.Monad (liftM, ap)
import Control.Applicative (Applicative(..))

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t4
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 (SVG)

action_0 (7) = happyShift action_4
action_0 (8) = happyShift action_5
action_0 (5) = happyGoto action_3
action_0 _ = happyFail

action_1 (12) = happyShift action_2
action_1 _ = happyFail

action_2 (13) = happyShift action_9
action_2 _ = happyFail

action_3 (14) = happyAccept
action_3 _ = happyFail

action_4 (12) = happyShift action_2
action_4 (13) = happyShift action_7
action_4 (4) = happyGoto action_8
action_4 _ = happyFail

action_5 (12) = happyShift action_2
action_5 (13) = happyShift action_7
action_5 (4) = happyGoto action_6
action_5 _ = happyFail

action_6 (12) = happyShift action_2
action_6 (13) = happyShift action_7
action_6 (4) = happyGoto action_11
action_6 _ = happyFail

action_7 _ = happyReduce_2

action_8 (12) = happyShift action_2
action_8 (13) = happyShift action_7
action_8 (4) = happyGoto action_10
action_8 _ = happyFail

action_9 _ = happyReduce_1

action_10 (7) = happyShift action_14
action_10 (8) = happyShift action_15
action_10 (9) = happyShift action_16
action_10 (10) = happyShift action_17
action_10 (11) = happyShift action_18
action_10 (12) = happyShift action_2
action_10 (13) = happyShift action_7
action_10 (4) = happyGoto action_12
action_10 (6) = happyGoto action_19
action_10 _ = happyFail

action_11 (7) = happyShift action_14
action_11 (8) = happyShift action_15
action_11 (9) = happyShift action_16
action_11 (10) = happyShift action_17
action_11 (11) = happyShift action_18
action_11 (12) = happyShift action_2
action_11 (13) = happyShift action_7
action_11 (4) = happyGoto action_12
action_11 (6) = happyGoto action_13
action_11 _ = happyFail

action_12 (12) = happyShift action_2
action_12 (13) = happyShift action_7
action_12 (4) = happyGoto action_24
action_12 _ = happyFail

action_13 _ = happyReduce_3

action_14 (12) = happyShift action_2
action_14 (13) = happyShift action_7
action_14 (4) = happyGoto action_23
action_14 _ = happyFail

action_15 (12) = happyShift action_2
action_15 (13) = happyShift action_7
action_15 (4) = happyGoto action_22
action_15 _ = happyFail

action_16 (12) = happyShift action_2
action_16 (13) = happyShift action_7
action_16 (4) = happyGoto action_21
action_16 _ = happyFail

action_17 (12) = happyShift action_2
action_17 (13) = happyShift action_7
action_17 (4) = happyGoto action_20
action_17 _ = happyFail

action_18 _ = happyReduce_10

action_19 _ = happyReduce_4

action_20 (12) = happyShift action_2
action_20 (13) = happyShift action_7
action_20 (4) = happyGoto action_29
action_20 _ = happyFail

action_21 (12) = happyShift action_2
action_21 (13) = happyShift action_7
action_21 (4) = happyGoto action_28
action_21 _ = happyFail

action_22 (12) = happyShift action_2
action_22 (13) = happyShift action_7
action_22 (4) = happyGoto action_27
action_22 _ = happyFail

action_23 (12) = happyShift action_2
action_23 (13) = happyShift action_7
action_23 (4) = happyGoto action_26
action_23 _ = happyFail

action_24 (7) = happyShift action_14
action_24 (8) = happyShift action_15
action_24 (9) = happyShift action_16
action_24 (10) = happyShift action_17
action_24 (11) = happyShift action_18
action_24 (12) = happyShift action_2
action_24 (13) = happyShift action_7
action_24 (4) = happyGoto action_12
action_24 (6) = happyGoto action_25
action_24 _ = happyFail

action_25 _ = happyReduce_9

action_26 (7) = happyShift action_14
action_26 (8) = happyShift action_15
action_26 (9) = happyShift action_16
action_26 (10) = happyShift action_17
action_26 (11) = happyShift action_18
action_26 (12) = happyShift action_2
action_26 (13) = happyShift action_7
action_26 (4) = happyGoto action_12
action_26 (6) = happyGoto action_33
action_26 _ = happyFail

action_27 (7) = happyShift action_14
action_27 (8) = happyShift action_15
action_27 (9) = happyShift action_16
action_27 (10) = happyShift action_17
action_27 (11) = happyShift action_18
action_27 (12) = happyShift action_2
action_27 (13) = happyShift action_7
action_27 (4) = happyGoto action_12
action_27 (6) = happyGoto action_32
action_27 _ = happyFail

action_28 (7) = happyShift action_14
action_28 (8) = happyShift action_15
action_28 (9) = happyShift action_16
action_28 (10) = happyShift action_17
action_28 (11) = happyShift action_18
action_28 (12) = happyShift action_2
action_28 (13) = happyShift action_7
action_28 (4) = happyGoto action_12
action_28 (6) = happyGoto action_31
action_28 _ = happyFail

action_29 (7) = happyShift action_14
action_29 (8) = happyShift action_15
action_29 (9) = happyShift action_16
action_29 (10) = happyShift action_17
action_29 (11) = happyShift action_18
action_29 (12) = happyShift action_2
action_29 (13) = happyShift action_7
action_29 (4) = happyGoto action_12
action_29 (6) = happyGoto action_30
action_29 _ = happyFail

action_30 _ = happyReduce_8

action_31 _ = happyReduce_7

action_32 _ = happyReduce_6

action_33 _ = happyReduce_5

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyTerminal (TFloat happy_var_2))
	_
	 =  HappyAbsSyn4
		 (-happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (M_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (M_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (M_rel (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (M_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (L_rel (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (L_abs (happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (Complete (happy_var_1, happy_var_2) : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn5
		 ([Z]
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 14 14 tk (HappyState action) sts stk;
	Tm -> cont 7;
	TM -> cont 8;
	Tl -> cont 9;
	TL -> cont 10;
	TZ -> cont 11;
	TMinus -> cont 12;
	TFloat happy_dollar_dollar -> cont 13;
	_ -> happyError' tk
	})

happyError_ 14 tk = happyError' tk
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

parsePath = happySomeParser where
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

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
    | Tl
    | TL
    | TZ
    | TMinus
    | TFloat Float
    | TPath
    | TString String
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

get_paths :: String -> [String]
get_paths [] = []
get_paths (c:cs)
    | isPrefixOf " d=" (c:cs)  = takeWhile (/= '"') (drop 3 cs) : get_paths (dropWhile (/= '"') (drop 3 cs))
    | isPrefixOf "\nd=" (c:cs) = takeWhile (/= '"') (drop 3 cs) : get_paths (dropWhile (/= '"') (drop 3 cs))
    | otherwise                = get_paths cs

lexer cont []       = cont TEof []
lexer cont ('m':cs) = cont Tm cs
lexer cont ('M':cs) = cont TM cs
lexer cont ('l':cs) = cont Tl cs
lexer cont ('L':cs) = cont TL cs
lexer cont ('z':cs) = cont TZ cs
lexer cont ('Z':cs) = cont TZ cs
lexer cont ('-':cs) = cont TMinus cs
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | otherwise = lexer cont cs

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

parseSVG s = myConcat (map (\x -> parsePath x 1) (get_paths s))  

myConcat :: [PR SVG] -> PR [SVG]
myConcat []     = Ok []
myConcat (x:xs) = case x of 
                    Ok v     -> do res <- myConcat xs
                                   return (v : res)
                    Failed s -> Failed s
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
