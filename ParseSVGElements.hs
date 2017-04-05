{-# OPTIONS_GHC -w #-}
module ParseSVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 (MyPoint)
	| HappyAbsSyn8 ([MyPoint])
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 (Rect)
	| HappyAbsSyn12 (SVGPolygon)
	| HappyAbsSyn13 ([PathCommand])
	| HappyAbsSyn15 (Path)

action_0 (25) = happyShift action_4
action_0 (27) = happyShift action_13
action_0 (6) = happyGoto action_14
action_0 (11) = happyGoto action_15
action_0 _ = happyFail

action_1 (25) = happyShift action_4
action_1 (27) = happyShift action_13
action_1 (6) = happyGoto action_9
action_1 (7) = happyGoto action_10
action_1 (8) = happyGoto action_11
action_1 (12) = happyGoto action_12
action_1 _ = happyReduce_7

action_2 (16) = happyShift action_7
action_2 (17) = happyShift action_8
action_2 (13) = happyGoto action_5
action_2 (15) = happyGoto action_6
action_2 _ = happyFail

action_3 (25) = happyShift action_4
action_3 _ = happyFail

action_4 (27) = happyShift action_31
action_4 _ = happyFail

action_5 (28) = happyShift action_30
action_5 (29) = happyShift action_20
action_5 (30) = happyShift action_21
action_5 (31) = happyShift action_22
action_5 (32) = happyShift action_23
action_5 (9) = happyGoto action_17
action_5 (10) = happyGoto action_29
action_5 _ = happyReduce_31

action_6 (33) = happyAccept
action_6 _ = happyFail

action_7 (25) = happyShift action_4
action_7 (27) = happyShift action_13
action_7 (6) = happyGoto action_9
action_7 (7) = happyGoto action_28
action_7 _ = happyFail

action_8 (25) = happyShift action_4
action_8 (27) = happyShift action_13
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_27
action_8 _ = happyFail

action_9 (25) = happyShift action_4
action_9 (26) = happyShift action_26
action_9 (27) = happyShift action_13
action_9 (6) = happyGoto action_25
action_9 _ = happyFail

action_10 (25) = happyShift action_4
action_10 (27) = happyShift action_13
action_10 (6) = happyGoto action_9
action_10 (7) = happyGoto action_10
action_10 (8) = happyGoto action_24
action_10 _ = happyReduce_7

action_11 (28) = happyShift action_19
action_11 (29) = happyShift action_20
action_11 (30) = happyShift action_21
action_11 (31) = happyShift action_22
action_11 (32) = happyShift action_23
action_11 (9) = happyGoto action_17
action_11 (10) = happyGoto action_18
action_11 _ = happyReduce_18

action_12 (33) = happyAccept
action_12 _ = happyFail

action_13 _ = happyReduce_4

action_14 (25) = happyShift action_4
action_14 (27) = happyShift action_13
action_14 (6) = happyGoto action_16
action_14 _ = happyFail

action_15 (33) = happyAccept
action_15 _ = happyFail

action_16 (28) = happyShift action_51
action_16 (29) = happyShift action_20
action_16 (30) = happyShift action_21
action_16 (31) = happyShift action_22
action_16 (32) = happyShift action_23
action_16 (9) = happyGoto action_17
action_16 (10) = happyGoto action_50
action_16 _ = happyReduce_15

action_17 (29) = happyShift action_20
action_17 (30) = happyShift action_21
action_17 (31) = happyShift action_22
action_17 (32) = happyShift action_23
action_17 (9) = happyGoto action_17
action_17 (10) = happyGoto action_49
action_17 _ = happyReduce_13

action_18 (28) = happyShift action_48
action_18 _ = happyFail

action_19 _ = happyReduce_19

action_20 (25) = happyShift action_4
action_20 (27) = happyShift action_13
action_20 (6) = happyGoto action_47
action_20 _ = happyFail

action_21 (25) = happyShift action_4
action_21 (27) = happyShift action_13
action_21 (6) = happyGoto action_46
action_21 _ = happyFail

action_22 (25) = happyShift action_4
action_22 (27) = happyShift action_13
action_22 (6) = happyGoto action_45
action_22 _ = happyFail

action_23 (25) = happyShift action_4
action_23 (27) = happyShift action_13
action_23 (6) = happyGoto action_44
action_23 _ = happyFail

action_24 _ = happyReduce_8

action_25 _ = happyReduce_5

action_26 (25) = happyShift action_4
action_26 (27) = happyShift action_13
action_26 (6) = happyGoto action_43
action_26 _ = happyFail

action_27 (18) = happyShift action_35
action_27 (19) = happyShift action_36
action_27 (20) = happyShift action_37
action_27 (21) = happyShift action_38
action_27 (22) = happyShift action_39
action_27 (23) = happyShift action_40
action_27 (24) = happyShift action_41
action_27 (25) = happyShift action_4
action_27 (27) = happyShift action_13
action_27 (6) = happyGoto action_9
action_27 (7) = happyGoto action_33
action_27 (14) = happyGoto action_42
action_27 _ = happyFail

action_28 (18) = happyShift action_35
action_28 (19) = happyShift action_36
action_28 (20) = happyShift action_37
action_28 (21) = happyShift action_38
action_28 (22) = happyShift action_39
action_28 (23) = happyShift action_40
action_28 (24) = happyShift action_41
action_28 (25) = happyShift action_4
action_28 (27) = happyShift action_13
action_28 (6) = happyGoto action_9
action_28 (7) = happyGoto action_33
action_28 (14) = happyGoto action_34
action_28 _ = happyFail

action_29 (28) = happyShift action_32
action_29 _ = happyFail

action_30 _ = happyReduce_32

action_31 _ = happyReduce_3

action_32 _ = happyReduce_33

action_33 (18) = happyShift action_35
action_33 (19) = happyShift action_36
action_33 (20) = happyShift action_37
action_33 (21) = happyShift action_38
action_33 (22) = happyShift action_39
action_33 (23) = happyShift action_40
action_33 (24) = happyShift action_41
action_33 (25) = happyShift action_4
action_33 (27) = happyShift action_13
action_33 (6) = happyGoto action_9
action_33 (7) = happyGoto action_33
action_33 (14) = happyGoto action_60
action_33 _ = happyFail

action_34 _ = happyReduce_22

action_35 (25) = happyShift action_4
action_35 (27) = happyShift action_13
action_35 (6) = happyGoto action_59
action_35 _ = happyFail

action_36 (25) = happyShift action_4
action_36 (27) = happyShift action_13
action_36 (6) = happyGoto action_58
action_36 _ = happyFail

action_37 (25) = happyShift action_4
action_37 (27) = happyShift action_13
action_37 (6) = happyGoto action_57
action_37 _ = happyFail

action_38 (25) = happyShift action_4
action_38 (27) = happyShift action_13
action_38 (6) = happyGoto action_56
action_38 _ = happyFail

action_39 (25) = happyShift action_4
action_39 (27) = happyShift action_13
action_39 (6) = happyGoto action_9
action_39 (7) = happyGoto action_55
action_39 _ = happyFail

action_40 (25) = happyShift action_4
action_40 (27) = happyShift action_13
action_40 (6) = happyGoto action_9
action_40 (7) = happyGoto action_54
action_40 _ = happyFail

action_41 _ = happyReduce_30

action_42 _ = happyReduce_21

action_43 _ = happyReduce_6

action_44 (26) = happyShift action_53
action_44 _ = happyFail

action_45 _ = happyReduce_11

action_46 _ = happyReduce_10

action_47 _ = happyReduce_9

action_48 _ = happyReduce_20

action_49 _ = happyReduce_14

action_50 (28) = happyShift action_52
action_50 _ = happyFail

action_51 _ = happyReduce_16

action_52 _ = happyReduce_17

action_53 (25) = happyShift action_4
action_53 (27) = happyShift action_13
action_53 (6) = happyGoto action_67
action_53 _ = happyFail

action_54 (18) = happyShift action_35
action_54 (19) = happyShift action_36
action_54 (20) = happyShift action_37
action_54 (21) = happyShift action_38
action_54 (22) = happyShift action_39
action_54 (23) = happyShift action_40
action_54 (24) = happyShift action_41
action_54 (25) = happyShift action_4
action_54 (27) = happyShift action_13
action_54 (6) = happyGoto action_9
action_54 (7) = happyGoto action_33
action_54 (14) = happyGoto action_66
action_54 _ = happyFail

action_55 (18) = happyShift action_35
action_55 (19) = happyShift action_36
action_55 (20) = happyShift action_37
action_55 (21) = happyShift action_38
action_55 (22) = happyShift action_39
action_55 (23) = happyShift action_40
action_55 (24) = happyShift action_41
action_55 (25) = happyShift action_4
action_55 (27) = happyShift action_13
action_55 (6) = happyGoto action_9
action_55 (7) = happyGoto action_33
action_55 (14) = happyGoto action_65
action_55 _ = happyFail

action_56 (18) = happyShift action_35
action_56 (19) = happyShift action_36
action_56 (20) = happyShift action_37
action_56 (21) = happyShift action_38
action_56 (22) = happyShift action_39
action_56 (23) = happyShift action_40
action_56 (24) = happyShift action_41
action_56 (25) = happyShift action_4
action_56 (27) = happyShift action_13
action_56 (6) = happyGoto action_9
action_56 (7) = happyGoto action_33
action_56 (14) = happyGoto action_64
action_56 _ = happyFail

action_57 (18) = happyShift action_35
action_57 (19) = happyShift action_36
action_57 (20) = happyShift action_37
action_57 (21) = happyShift action_38
action_57 (22) = happyShift action_39
action_57 (23) = happyShift action_40
action_57 (24) = happyShift action_41
action_57 (25) = happyShift action_4
action_57 (27) = happyShift action_13
action_57 (6) = happyGoto action_9
action_57 (7) = happyGoto action_33
action_57 (14) = happyGoto action_63
action_57 _ = happyFail

action_58 (18) = happyShift action_35
action_58 (19) = happyShift action_36
action_58 (20) = happyShift action_37
action_58 (21) = happyShift action_38
action_58 (22) = happyShift action_39
action_58 (23) = happyShift action_40
action_58 (24) = happyShift action_41
action_58 (25) = happyShift action_4
action_58 (27) = happyShift action_13
action_58 (6) = happyGoto action_9
action_58 (7) = happyGoto action_33
action_58 (14) = happyGoto action_62
action_58 _ = happyFail

action_59 (18) = happyShift action_35
action_59 (19) = happyShift action_36
action_59 (20) = happyShift action_37
action_59 (21) = happyShift action_38
action_59 (22) = happyShift action_39
action_59 (23) = happyShift action_40
action_59 (24) = happyShift action_41
action_59 (25) = happyShift action_4
action_59 (27) = happyShift action_13
action_59 (6) = happyGoto action_9
action_59 (7) = happyGoto action_33
action_59 (14) = happyGoto action_61
action_59 _ = happyFail

action_60 _ = happyReduce_29

action_61 _ = happyReduce_23

action_62 _ = happyReduce_24

action_63 _ = happyReduce_25

action_64 _ = happyReduce_26

action_65 _ = happyReduce_27

action_66 _ = happyReduce_28

action_67 (26) = happyShift action_68
action_67 _ = happyFail

action_68 (25) = happyShift action_4
action_68 (27) = happyShift action_13
action_68 (6) = happyGoto action_69
action_68 _ = happyFail

action_69 (26) = happyShift action_70
action_69 _ = happyFail

action_70 (25) = happyShift action_4
action_70 (27) = happyShift action_13
action_70 (6) = happyGoto action_71
action_70 _ = happyFail

action_71 (26) = happyShift action_72
action_71 _ = happyFail

action_72 (25) = happyShift action_4
action_72 (27) = happyShift action_13
action_72 (6) = happyGoto action_73
action_72 _ = happyFail

action_73 (26) = happyShift action_74
action_73 _ = happyFail

action_74 (25) = happyShift action_4
action_74 (27) = happyShift action_13
action_74 (6) = happyGoto action_75
action_74 _ = happyFail

action_75 _ = happyReduce_12

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

happyReduce_7 = happySpecReduce_0  8 happyReduction_7
happyReduction_7  =  HappyAbsSyn8
		 ([]
	)

happyReduce_8 = happySpecReduce_2  8 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Scale happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  9 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SkewX happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SkewY happy_var_2
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 12 9 happyReduction_12
happyReduction_12 ((HappyAbsSyn6  happy_var_12) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Matrix happy_var_2 happy_var_4 happy_var_6 happy_var_8 happy_var_10 happy_var_12
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_0  10 happyReduction_13
happyReduction_13  =  HappyAbsSyn10
		 ([]
	)

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  11 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Rect {h = happy_var_1, w = happy_var_2, tr = [], nr = ""}
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Rect {h = happy_var_1, w = happy_var_2, tr = [], nr = happy_var_3}
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 11 happyReduction_17
happyReduction_17 ((HappyTerminal (TName happy_var_4)) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Rect {h = happy_var_1, w = happy_var_2, tr = happy_var_3, nr = happy_var_4}
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  12 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 (Pol {po = happy_var_1, tpo = [], npo = ""}
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  12 happyReduction_19
happyReduction_19 (HappyTerminal (TName happy_var_2))
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 (Pol {po = happy_var_1, tpo = [], npo = happy_var_2}
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 (Pol {po = happy_var_1, tpo = happy_var_2, npo = happy_var_3}
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  13 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  13 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  14 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  14 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn13
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn13
		 ([Z]
	)

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (Path {pa = happy_var_1, tpa = [], npa = ""}
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  15 happyReduction_32
happyReduction_32 (HappyTerminal (TName happy_var_2))
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (Path {pa = happy_var_1, tpa = [], npa = happy_var_2}
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn15
		 (Path {pa = happy_var_1, tpa = happy_var_2, npa = happy_var_3}
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 33 33 tk (HappyState action) sts stk;
	Tm -> cont 16;
	TM -> cont 17;
	Th -> cont 18;
	TH -> cont 19;
	Tv -> cont 20;
	TV -> cont 21;
	Tl -> cont 22;
	TL -> cont 23;
	TZ -> cont 24;
	TMinus -> cont 25;
	TComma -> cont 26;
	TFloat happy_dollar_dollar -> cont 27;
	TName happy_dollar_dollar -> cont 28;
	TScale -> cont 29;
	TSkewX -> cont 30;
	TSkewY -> cont 31;
	TMatrix -> cont 32;
	_ -> happyError' tk
	})

happyError_ 33 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn11 z -> happyReturn z; _other -> notHappyAtAll })

parsePo = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

parsePa = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TName String
    | TScale
    | TSkewX
    | TSkewY
    | TMatrix
    | TPath
    | TEof
    deriving (Eq, Show)

-- ================= --
-- ===== LEXER ===== --
-- ================= --

lexer cont []        = cont TEof []
lexer cont ('\n':cs) = \l -> lexer cont cs (l + 1)
lexer cont (c:cs)   
    | isDigit c = lexNum cont (c:cs)     
    | isSpace c = lexer cont cs
    | isAlpha c = lexString cont (c:cs)
lexer cont ('-':cs)  = cont TMinus cs
lexer cont (',':cs)  = cont TComma cs
lexer cont ('(':cs)  = lexer cont cs
lexer cont (')':cs)  = lexer cont cs

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

lexString cont [] = cont TEof []
lexString cont cs = case span isAlpha cs of
                        ("m", res)      -> cont Tm res
                        ("M", res)      -> cont TM res
                        ("h", res)      -> cont Th res
                        ("H", res)      -> cont TH res
                        ("v", res)      -> cont Tv res
                        ("V", res)      -> cont TV res
                        ("l", res)      -> cont Tl res
                        ("L", res)      -> cont TL res
                        ("z", res)      -> cont TZ res
                        ("Z", res)      -> cont TZ res
                        ("scale", res)  -> cont TScale res
                        ("skewX", res)  -> cont TSkewX res 
                        ("skewY", res)  -> cont TSkewY res 
                        ("matrix", res) -> cont TMatrix res
                        ("path", res)   -> cont TPath res
                        (ran, res)      -> let (name, res') = span isAlphaNum (ran ++ res)
                                           in cont (TName name) res'
                

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
