{-# OPTIONS_GHC -w #-}
module ParseSVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t6 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 (MyPoint)
	| HappyAbsSyn8 ([MyPoint])
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 (Rect)
	| HappyAbsSyn13 (SVGPolygon)
	| HappyAbsSyn14 ([PathCommand])
	| HappyAbsSyn16 (Path)

action_0 (26) = happyShift action_4
action_0 (28) = happyShift action_13
action_0 (6) = happyGoto action_14
action_0 (12) = happyGoto action_15
action_0 _ = happyFail

action_1 (26) = happyShift action_4
action_1 (28) = happyShift action_13
action_1 (6) = happyGoto action_9
action_1 (7) = happyGoto action_10
action_1 (8) = happyGoto action_11
action_1 (13) = happyGoto action_12
action_1 _ = happyReduce_7

action_2 (17) = happyShift action_7
action_2 (18) = happyShift action_8
action_2 (14) = happyGoto action_5
action_2 (16) = happyGoto action_6
action_2 _ = happyFail

action_3 (26) = happyShift action_4
action_3 _ = happyFail

action_4 (28) = happyShift action_33
action_4 _ = happyFail

action_5 (29) = happyShift action_32
action_5 (30) = happyShift action_20
action_5 (31) = happyShift action_21
action_5 (32) = happyShift action_22
action_5 (33) = happyShift action_23
action_5 (34) = happyShift action_24
action_5 (35) = happyShift action_25
action_5 (9) = happyGoto action_17
action_5 (10) = happyGoto action_31
action_5 _ = happyReduce_36

action_6 (36) = happyAccept
action_6 _ = happyFail

action_7 (26) = happyShift action_4
action_7 (28) = happyShift action_13
action_7 (6) = happyGoto action_9
action_7 (7) = happyGoto action_30
action_7 _ = happyFail

action_8 (26) = happyShift action_4
action_8 (28) = happyShift action_13
action_8 (6) = happyGoto action_9
action_8 (7) = happyGoto action_29
action_8 _ = happyFail

action_9 (26) = happyShift action_4
action_9 (27) = happyShift action_28
action_9 (28) = happyShift action_13
action_9 (6) = happyGoto action_27
action_9 _ = happyFail

action_10 (26) = happyShift action_4
action_10 (28) = happyShift action_13
action_10 (6) = happyGoto action_9
action_10 (7) = happyGoto action_10
action_10 (8) = happyGoto action_26
action_10 _ = happyReduce_7

action_11 (29) = happyShift action_19
action_11 (30) = happyShift action_20
action_11 (31) = happyShift action_21
action_11 (32) = happyShift action_22
action_11 (33) = happyShift action_23
action_11 (34) = happyShift action_24
action_11 (35) = happyShift action_25
action_11 (9) = happyGoto action_17
action_11 (10) = happyGoto action_18
action_11 _ = happyReduce_23

action_12 (36) = happyAccept
action_12 _ = happyFail

action_13 _ = happyReduce_4

action_14 (26) = happyShift action_4
action_14 (28) = happyShift action_13
action_14 (6) = happyGoto action_16
action_14 _ = happyFail

action_15 (36) = happyAccept
action_15 _ = happyFail

action_16 (29) = happyShift action_56
action_16 (30) = happyShift action_57
action_16 (11) = happyGoto action_55
action_16 _ = happyReduce_20

action_17 (30) = happyShift action_20
action_17 (31) = happyShift action_21
action_17 (32) = happyShift action_22
action_17 (33) = happyShift action_23
action_17 (34) = happyShift action_24
action_17 (35) = happyShift action_25
action_17 (9) = happyGoto action_17
action_17 (10) = happyGoto action_54
action_17 _ = happyReduce_16

action_18 (29) = happyShift action_53
action_18 _ = happyFail

action_19 _ = happyReduce_24

action_20 (26) = happyShift action_4
action_20 (28) = happyShift action_13
action_20 (6) = happyGoto action_52
action_20 _ = happyFail

action_21 (26) = happyShift action_4
action_21 (28) = happyShift action_13
action_21 (6) = happyGoto action_51
action_21 _ = happyFail

action_22 (26) = happyShift action_4
action_22 (28) = happyShift action_13
action_22 (6) = happyGoto action_50
action_22 _ = happyFail

action_23 (26) = happyShift action_4
action_23 (28) = happyShift action_13
action_23 (6) = happyGoto action_49
action_23 _ = happyFail

action_24 (26) = happyShift action_4
action_24 (28) = happyShift action_13
action_24 (6) = happyGoto action_47
action_24 (7) = happyGoto action_48
action_24 _ = happyFail

action_25 (26) = happyShift action_4
action_25 (28) = happyShift action_13
action_25 (6) = happyGoto action_46
action_25 _ = happyFail

action_26 _ = happyReduce_8

action_27 _ = happyReduce_5

action_28 (26) = happyShift action_4
action_28 (28) = happyShift action_13
action_28 (6) = happyGoto action_45
action_28 _ = happyFail

action_29 (19) = happyShift action_37
action_29 (20) = happyShift action_38
action_29 (21) = happyShift action_39
action_29 (22) = happyShift action_40
action_29 (23) = happyShift action_41
action_29 (24) = happyShift action_42
action_29 (25) = happyShift action_43
action_29 (26) = happyShift action_4
action_29 (28) = happyShift action_13
action_29 (6) = happyGoto action_9
action_29 (7) = happyGoto action_35
action_29 (15) = happyGoto action_44
action_29 _ = happyFail

action_30 (19) = happyShift action_37
action_30 (20) = happyShift action_38
action_30 (21) = happyShift action_39
action_30 (22) = happyShift action_40
action_30 (23) = happyShift action_41
action_30 (24) = happyShift action_42
action_30 (25) = happyShift action_43
action_30 (26) = happyShift action_4
action_30 (28) = happyShift action_13
action_30 (6) = happyGoto action_9
action_30 (7) = happyGoto action_35
action_30 (15) = happyGoto action_36
action_30 _ = happyFail

action_31 (29) = happyShift action_34
action_31 _ = happyFail

action_32 _ = happyReduce_37

action_33 _ = happyReduce_3

action_34 _ = happyReduce_38

action_35 (19) = happyShift action_37
action_35 (20) = happyShift action_38
action_35 (21) = happyShift action_39
action_35 (22) = happyShift action_40
action_35 (23) = happyShift action_41
action_35 (24) = happyShift action_42
action_35 (25) = happyShift action_43
action_35 (26) = happyShift action_4
action_35 (28) = happyShift action_13
action_35 (6) = happyGoto action_9
action_35 (7) = happyGoto action_35
action_35 (15) = happyGoto action_67
action_35 _ = happyFail

action_36 _ = happyReduce_27

action_37 (26) = happyShift action_4
action_37 (28) = happyShift action_13
action_37 (6) = happyGoto action_66
action_37 _ = happyFail

action_38 (26) = happyShift action_4
action_38 (28) = happyShift action_13
action_38 (6) = happyGoto action_65
action_38 _ = happyFail

action_39 (26) = happyShift action_4
action_39 (28) = happyShift action_13
action_39 (6) = happyGoto action_64
action_39 _ = happyFail

action_40 (26) = happyShift action_4
action_40 (28) = happyShift action_13
action_40 (6) = happyGoto action_63
action_40 _ = happyFail

action_41 (26) = happyShift action_4
action_41 (28) = happyShift action_13
action_41 (6) = happyGoto action_9
action_41 (7) = happyGoto action_62
action_41 _ = happyFail

action_42 (26) = happyShift action_4
action_42 (28) = happyShift action_13
action_42 (6) = happyGoto action_9
action_42 (7) = happyGoto action_61
action_42 _ = happyFail

action_43 _ = happyReduce_35

action_44 _ = happyReduce_26

action_45 _ = happyReduce_6

action_46 _ = happyReduce_11

action_47 (26) = happyShift action_4
action_47 (27) = happyShift action_28
action_47 (28) = happyShift action_13
action_47 (6) = happyGoto action_27
action_47 _ = happyReduce_9

action_48 _ = happyReduce_10

action_49 (27) = happyShift action_60
action_49 _ = happyFail

action_50 _ = happyReduce_14

action_51 _ = happyReduce_13

action_52 _ = happyReduce_12

action_53 _ = happyReduce_25

action_54 _ = happyReduce_17

action_55 (29) = happyShift action_59
action_55 _ = happyFail

action_56 _ = happyReduce_21

action_57 (26) = happyShift action_4
action_57 (28) = happyShift action_13
action_57 (6) = happyGoto action_58
action_57 _ = happyFail

action_58 (30) = happyShift action_57
action_58 (11) = happyGoto action_75
action_58 _ = happyReduce_18

action_59 _ = happyReduce_22

action_60 (26) = happyShift action_4
action_60 (28) = happyShift action_13
action_60 (6) = happyGoto action_74
action_60 _ = happyFail

action_61 (19) = happyShift action_37
action_61 (20) = happyShift action_38
action_61 (21) = happyShift action_39
action_61 (22) = happyShift action_40
action_61 (23) = happyShift action_41
action_61 (24) = happyShift action_42
action_61 (25) = happyShift action_43
action_61 (26) = happyShift action_4
action_61 (28) = happyShift action_13
action_61 (6) = happyGoto action_9
action_61 (7) = happyGoto action_35
action_61 (15) = happyGoto action_73
action_61 _ = happyFail

action_62 (19) = happyShift action_37
action_62 (20) = happyShift action_38
action_62 (21) = happyShift action_39
action_62 (22) = happyShift action_40
action_62 (23) = happyShift action_41
action_62 (24) = happyShift action_42
action_62 (25) = happyShift action_43
action_62 (26) = happyShift action_4
action_62 (28) = happyShift action_13
action_62 (6) = happyGoto action_9
action_62 (7) = happyGoto action_35
action_62 (15) = happyGoto action_72
action_62 _ = happyFail

action_63 (19) = happyShift action_37
action_63 (20) = happyShift action_38
action_63 (21) = happyShift action_39
action_63 (22) = happyShift action_40
action_63 (23) = happyShift action_41
action_63 (24) = happyShift action_42
action_63 (25) = happyShift action_43
action_63 (26) = happyShift action_4
action_63 (28) = happyShift action_13
action_63 (6) = happyGoto action_9
action_63 (7) = happyGoto action_35
action_63 (15) = happyGoto action_71
action_63 _ = happyFail

action_64 (19) = happyShift action_37
action_64 (20) = happyShift action_38
action_64 (21) = happyShift action_39
action_64 (22) = happyShift action_40
action_64 (23) = happyShift action_41
action_64 (24) = happyShift action_42
action_64 (25) = happyShift action_43
action_64 (26) = happyShift action_4
action_64 (28) = happyShift action_13
action_64 (6) = happyGoto action_9
action_64 (7) = happyGoto action_35
action_64 (15) = happyGoto action_70
action_64 _ = happyFail

action_65 (19) = happyShift action_37
action_65 (20) = happyShift action_38
action_65 (21) = happyShift action_39
action_65 (22) = happyShift action_40
action_65 (23) = happyShift action_41
action_65 (24) = happyShift action_42
action_65 (25) = happyShift action_43
action_65 (26) = happyShift action_4
action_65 (28) = happyShift action_13
action_65 (6) = happyGoto action_9
action_65 (7) = happyGoto action_35
action_65 (15) = happyGoto action_69
action_65 _ = happyFail

action_66 (19) = happyShift action_37
action_66 (20) = happyShift action_38
action_66 (21) = happyShift action_39
action_66 (22) = happyShift action_40
action_66 (23) = happyShift action_41
action_66 (24) = happyShift action_42
action_66 (25) = happyShift action_43
action_66 (26) = happyShift action_4
action_66 (28) = happyShift action_13
action_66 (6) = happyGoto action_9
action_66 (7) = happyGoto action_35
action_66 (15) = happyGoto action_68
action_66 _ = happyFail

action_67 _ = happyReduce_34

action_68 _ = happyReduce_28

action_69 _ = happyReduce_29

action_70 _ = happyReduce_30

action_71 _ = happyReduce_31

action_72 _ = happyReduce_32

action_73 _ = happyReduce_33

action_74 (27) = happyShift action_76
action_74 _ = happyFail

action_75 _ = happyReduce_19

action_76 (26) = happyShift action_4
action_76 (28) = happyShift action_13
action_76 (6) = happyGoto action_77
action_76 _ = happyFail

action_77 (27) = happyShift action_78
action_77 _ = happyFail

action_78 (26) = happyShift action_4
action_78 (28) = happyShift action_13
action_78 (6) = happyGoto action_79
action_78 _ = happyFail

action_79 (27) = happyShift action_80
action_79 _ = happyFail

action_80 (26) = happyShift action_4
action_80 (28) = happyShift action_13
action_80 (6) = happyGoto action_81
action_80 _ = happyFail

action_81 (27) = happyShift action_82
action_81 _ = happyFail

action_82 (26) = happyShift action_4
action_82 (28) = happyShift action_13
action_82 (6) = happyGoto action_83
action_82 _ = happyFail

action_83 _ = happyReduce_15

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
happyReduction_9 _
	_
	 =  HappyAbsSyn9
		 (Thrash
	)

happyReduce_10 = happySpecReduce_2  9 happyReduction_10
happyReduction_10 _
	_
	 =  HappyAbsSyn9
		 (Thrash
	)

happyReduce_11 = happySpecReduce_2  9 happyReduction_11
happyReduction_11 _
	_
	 =  HappyAbsSyn9
		 (Thrash
	)

happyReduce_12 = happySpecReduce_2  9 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Scale happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  9 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SkewX happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (SkewY happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 12 9 happyReduction_15
happyReduction_15 ((HappyAbsSyn6  happy_var_12) `HappyStk`
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

happyReduce_16 = happySpecReduce_0  10 happyReduction_16
happyReduction_16  =  HappyAbsSyn10
		 ([]
	)

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  11 happyReduction_18
happyReduction_18  =  HappyAbsSyn11
		 ([]
	)

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Scale happy_var_2 : happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  12 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Rect {h = happy_var_1, w = happy_var_2, tr = [], nr = ""}
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Rect {h = happy_var_1, w = happy_var_2, tr = [], nr = happy_var_3}
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 12 happyReduction_22
happyReduction_22 ((HappyTerminal (TName happy_var_4)) `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Rect {h = happy_var_1, w = happy_var_2, tr = happy_var_3, nr = happy_var_4}
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (Pol {po = happy_var_1, tpo = [], npo = ""}
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  13 happyReduction_24
happyReduction_24 (HappyTerminal (TName happy_var_2))
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (Pol {po = happy_var_1, tpo = [], npo = happy_var_2}
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (Pol {po = happy_var_1, tpo = happy_var_2, npo = happy_var_3}
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  15 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  15 happyReduction_32
happyReduction_32 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  15 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  15 happyReduction_34
happyReduction_34 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn14
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn14
		 ([Z]
	)

happyReduce_36 = happySpecReduce_1  16 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (Path {pa = happy_var_1, tpa = [], npa = ""}
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  16 happyReduction_37
happyReduction_37 (HappyTerminal (TName happy_var_2))
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (Path {pa = happy_var_1, tpa = [], npa = happy_var_2}
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  16 happyReduction_38
happyReduction_38 (HappyTerminal (TName happy_var_3))
	(HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (Path {pa = happy_var_1, tpa = happy_var_2, npa = happy_var_3}
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 36 36 tk (HappyState action) sts stk;
	Tm -> cont 17;
	TM -> cont 18;
	Th -> cont 19;
	TH -> cont 20;
	Tv -> cont 21;
	TV -> cont 22;
	Tl -> cont 23;
	TL -> cont 24;
	TZ -> cont 25;
	TMinus -> cont 26;
	TComma -> cont 27;
	TFloat happy_dollar_dollar -> cont 28;
	TName happy_dollar_dollar -> cont 29;
	TScale -> cont 30;
	TSkewX -> cont 31;
	TSkewY -> cont 32;
	TMatrix -> cont 33;
	TTranslate -> cont 34;
	TRotate -> cont 35;
	_ -> happyError' tk
	})

happyError_ 36 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

parsePo = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

parsePa = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TTranslate
    | TRotate
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
                        ("m", res)        -> cont Tm res
                        ("M", res)        -> cont TM res
                        ("h", res)        -> cont Th res
                        ("H", res)        -> cont TH res
                        ("v", res)        -> cont Tv res
                        ("V", res)        -> cont TV res
                        ("l", res)        -> cont Tl res
                        ("L", res)        -> cont TL res
                        ("z", res)        -> cont TZ res
                        ("Z", res)        -> cont TZ res
                        ("scale", res)    -> cont TScale res
                        ("skewX", res)    -> cont TSkewX res 
                        ("skewY", res)    -> cont TSkewY res 
                        ("matrix", res)   -> cont TMatrix res
                        ("translate",res) -> cont TTranslate res
                        ("rotate", res)   -> cont TRotate res
                        (ran, res)        -> let (name, res') = span isAlphaNum (ran ++ res)
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
