{-# OPTIONS_GHC -w #-}
module ParseSVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t7 t10 t11 t12 t13 t14 t15 t18
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (MyPoint)
	| HappyAbsSyn9 ([MyPoint])
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 (Rect)
	| HappyAbsSyn17 (SVGPolygon)
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 ([PathCommand])
	| HappyAbsSyn21 (Path)

action_0 (31) = happyShift action_5
action_0 (33) = happyShift action_16
action_0 (7) = happyGoto action_17
action_0 (16) = happyGoto action_18
action_0 _ = happyFail

action_1 (31) = happyShift action_5
action_1 (33) = happyShift action_16
action_1 (7) = happyGoto action_12
action_1 (8) = happyGoto action_13
action_1 (9) = happyGoto action_14
action_1 (17) = happyGoto action_15
action_1 _ = happyReduce_8

action_2 (41) = happyShift action_11
action_2 (18) = happyGoto action_10
action_2 _ = happyFail

action_3 (22) = happyShift action_8
action_3 (23) = happyShift action_9
action_3 (19) = happyGoto action_6
action_3 (21) = happyGoto action_7
action_3 _ = happyFail

action_4 (31) = happyShift action_5
action_4 _ = happyFail

action_5 (33) = happyShift action_36
action_5 _ = happyFail

action_6 (35) = happyShift action_23
action_6 (36) = happyShift action_24
action_6 (37) = happyShift action_25
action_6 (38) = happyShift action_26
action_6 (39) = happyShift action_27
action_6 (40) = happyShift action_28
action_6 (10) = happyGoto action_35
action_6 (13) = happyGoto action_21
action_6 (14) = happyGoto action_22
action_6 _ = happyReduce_21

action_7 (42) = happyAccept
action_7 _ = happyFail

action_8 (31) = happyShift action_5
action_8 (33) = happyShift action_16
action_8 (7) = happyGoto action_12
action_8 (8) = happyGoto action_34
action_8 _ = happyFail

action_9 (31) = happyShift action_5
action_9 (33) = happyShift action_16
action_9 (7) = happyGoto action_12
action_9 (8) = happyGoto action_33
action_9 _ = happyFail

action_10 (42) = happyAccept
action_10 _ = happyFail

action_11 (31) = happyShift action_5
action_11 (33) = happyShift action_16
action_11 (7) = happyGoto action_12
action_11 (8) = happyGoto action_13
action_11 (9) = happyGoto action_32
action_11 _ = happyReduce_8

action_12 (31) = happyShift action_5
action_12 (32) = happyShift action_31
action_12 (33) = happyShift action_16
action_12 (7) = happyGoto action_30
action_12 _ = happyFail

action_13 (31) = happyShift action_5
action_13 (33) = happyShift action_16
action_13 (7) = happyGoto action_12
action_13 (8) = happyGoto action_13
action_13 (9) = happyGoto action_29
action_13 _ = happyReduce_8

action_14 (35) = happyShift action_23
action_14 (36) = happyShift action_24
action_14 (37) = happyShift action_25
action_14 (38) = happyShift action_26
action_14 (39) = happyShift action_27
action_14 (40) = happyShift action_28
action_14 (10) = happyGoto action_20
action_14 (13) = happyGoto action_21
action_14 (14) = happyGoto action_22
action_14 _ = happyReduce_21

action_15 (42) = happyAccept
action_15 _ = happyFail

action_16 _ = happyReduce_5

action_17 (31) = happyShift action_5
action_17 (33) = happyShift action_16
action_17 (7) = happyGoto action_19
action_17 _ = happyFail

action_18 (42) = happyAccept
action_18 _ = happyFail

action_19 (35) = happyShift action_61
action_19 (39) = happyShift action_62
action_19 (40) = happyShift action_63
action_19 (12) = happyGoto action_59
action_19 (15) = happyGoto action_60
action_19 _ = happyReduce_23

action_20 _ = happyReduce_29

action_21 (35) = happyShift action_23
action_21 (36) = happyShift action_24
action_21 (37) = happyShift action_25
action_21 (38) = happyShift action_26
action_21 (39) = happyShift action_27
action_21 (40) = happyShift action_28
action_21 (13) = happyGoto action_21
action_21 (14) = happyGoto action_58
action_21 _ = happyReduce_21

action_22 (34) = happyShift action_57
action_22 (11) = happyGoto action_56
action_22 _ = happyReduce_11

action_23 (31) = happyShift action_5
action_23 (33) = happyShift action_16
action_23 (7) = happyGoto action_55
action_23 _ = happyFail

action_24 (31) = happyShift action_5
action_24 (33) = happyShift action_16
action_24 (7) = happyGoto action_54
action_24 _ = happyFail

action_25 (31) = happyShift action_5
action_25 (33) = happyShift action_16
action_25 (7) = happyGoto action_53
action_25 _ = happyFail

action_26 (31) = happyShift action_5
action_26 (33) = happyShift action_16
action_26 (7) = happyGoto action_52
action_26 _ = happyFail

action_27 (31) = happyShift action_5
action_27 (33) = happyShift action_16
action_27 (7) = happyGoto action_50
action_27 (8) = happyGoto action_51
action_27 _ = happyFail

action_28 (31) = happyShift action_5
action_28 (33) = happyShift action_16
action_28 (7) = happyGoto action_49
action_28 _ = happyFail

action_29 _ = happyReduce_9

action_30 _ = happyReduce_6

action_31 (31) = happyShift action_5
action_31 (33) = happyShift action_16
action_31 (7) = happyGoto action_48
action_31 _ = happyFail

action_32 (35) = happyShift action_23
action_32 (36) = happyShift action_24
action_32 (37) = happyShift action_25
action_32 (38) = happyShift action_26
action_32 (39) = happyShift action_27
action_32 (40) = happyShift action_28
action_32 (10) = happyGoto action_47
action_32 (13) = happyGoto action_21
action_32 (14) = happyGoto action_22
action_32 _ = happyReduce_21

action_33 (24) = happyShift action_39
action_33 (25) = happyShift action_40
action_33 (26) = happyShift action_41
action_33 (27) = happyShift action_42
action_33 (28) = happyShift action_43
action_33 (29) = happyShift action_44
action_33 (30) = happyShift action_45
action_33 (31) = happyShift action_5
action_33 (33) = happyShift action_16
action_33 (7) = happyGoto action_12
action_33 (8) = happyGoto action_37
action_33 (20) = happyGoto action_46
action_33 _ = happyFail

action_34 (24) = happyShift action_39
action_34 (25) = happyShift action_40
action_34 (26) = happyShift action_41
action_34 (27) = happyShift action_42
action_34 (28) = happyShift action_43
action_34 (29) = happyShift action_44
action_34 (30) = happyShift action_45
action_34 (31) = happyShift action_5
action_34 (33) = happyShift action_16
action_34 (7) = happyGoto action_12
action_34 (8) = happyGoto action_37
action_34 (20) = happyGoto action_38
action_34 _ = happyFail

action_35 _ = happyReduce_41

action_36 _ = happyReduce_4

action_37 (24) = happyShift action_39
action_37 (25) = happyShift action_40
action_37 (26) = happyShift action_41
action_37 (27) = happyShift action_42
action_37 (28) = happyShift action_43
action_37 (29) = happyShift action_44
action_37 (30) = happyShift action_45
action_37 (31) = happyShift action_5
action_37 (33) = happyShift action_16
action_37 (7) = happyGoto action_12
action_37 (8) = happyGoto action_37
action_37 (20) = happyGoto action_76
action_37 _ = happyFail

action_38 _ = happyReduce_32

action_39 (31) = happyShift action_5
action_39 (33) = happyShift action_16
action_39 (7) = happyGoto action_75
action_39 _ = happyFail

action_40 (31) = happyShift action_5
action_40 (33) = happyShift action_16
action_40 (7) = happyGoto action_74
action_40 _ = happyFail

action_41 (31) = happyShift action_5
action_41 (33) = happyShift action_16
action_41 (7) = happyGoto action_73
action_41 _ = happyFail

action_42 (31) = happyShift action_5
action_42 (33) = happyShift action_16
action_42 (7) = happyGoto action_72
action_42 _ = happyFail

action_43 (31) = happyShift action_5
action_43 (33) = happyShift action_16
action_43 (7) = happyGoto action_12
action_43 (8) = happyGoto action_71
action_43 _ = happyFail

action_44 (31) = happyShift action_5
action_44 (33) = happyShift action_16
action_44 (7) = happyGoto action_12
action_44 (8) = happyGoto action_70
action_44 _ = happyFail

action_45 _ = happyReduce_40

action_46 _ = happyReduce_31

action_47 _ = happyReduce_30

action_48 _ = happyReduce_7

action_49 _ = happyReduce_16

action_50 (31) = happyShift action_5
action_50 (32) = happyShift action_31
action_50 (33) = happyShift action_16
action_50 (7) = happyGoto action_30
action_50 _ = happyReduce_14

action_51 _ = happyReduce_15

action_52 (32) = happyShift action_69
action_52 _ = happyFail

action_53 _ = happyReduce_19

action_54 _ = happyReduce_18

action_55 _ = happyReduce_17

action_56 _ = happyReduce_10

action_57 _ = happyReduce_12

action_58 _ = happyReduce_22

action_59 _ = happyReduce_28

action_60 (34) = happyShift action_57
action_60 (11) = happyGoto action_68
action_60 _ = happyReduce_11

action_61 (31) = happyShift action_5
action_61 (33) = happyShift action_16
action_61 (7) = happyGoto action_67
action_61 _ = happyFail

action_62 (31) = happyShift action_5
action_62 (33) = happyShift action_16
action_62 (7) = happyGoto action_65
action_62 (8) = happyGoto action_66
action_62 _ = happyFail

action_63 (31) = happyShift action_5
action_63 (33) = happyShift action_16
action_63 (7) = happyGoto action_64
action_63 _ = happyFail

action_64 (35) = happyShift action_61
action_64 (39) = happyShift action_62
action_64 (40) = happyShift action_63
action_64 (15) = happyGoto action_87
action_64 _ = happyReduce_23

action_65 (31) = happyShift action_5
action_65 (32) = happyShift action_31
action_65 (33) = happyShift action_16
action_65 (35) = happyShift action_61
action_65 (39) = happyShift action_62
action_65 (40) = happyShift action_63
action_65 (7) = happyGoto action_30
action_65 (15) = happyGoto action_86
action_65 _ = happyReduce_23

action_66 (35) = happyShift action_61
action_66 (39) = happyShift action_62
action_66 (40) = happyShift action_63
action_66 (15) = happyGoto action_85
action_66 _ = happyReduce_23

action_67 (35) = happyShift action_61
action_67 (39) = happyShift action_62
action_67 (40) = happyShift action_63
action_67 (15) = happyGoto action_84
action_67 _ = happyReduce_23

action_68 _ = happyReduce_13

action_69 (31) = happyShift action_5
action_69 (33) = happyShift action_16
action_69 (7) = happyGoto action_83
action_69 _ = happyFail

action_70 (24) = happyShift action_39
action_70 (25) = happyShift action_40
action_70 (26) = happyShift action_41
action_70 (27) = happyShift action_42
action_70 (28) = happyShift action_43
action_70 (29) = happyShift action_44
action_70 (30) = happyShift action_45
action_70 (31) = happyShift action_5
action_70 (33) = happyShift action_16
action_70 (7) = happyGoto action_12
action_70 (8) = happyGoto action_37
action_70 (20) = happyGoto action_82
action_70 _ = happyFail

action_71 (24) = happyShift action_39
action_71 (25) = happyShift action_40
action_71 (26) = happyShift action_41
action_71 (27) = happyShift action_42
action_71 (28) = happyShift action_43
action_71 (29) = happyShift action_44
action_71 (30) = happyShift action_45
action_71 (31) = happyShift action_5
action_71 (33) = happyShift action_16
action_71 (7) = happyGoto action_12
action_71 (8) = happyGoto action_37
action_71 (20) = happyGoto action_81
action_71 _ = happyFail

action_72 (24) = happyShift action_39
action_72 (25) = happyShift action_40
action_72 (26) = happyShift action_41
action_72 (27) = happyShift action_42
action_72 (28) = happyShift action_43
action_72 (29) = happyShift action_44
action_72 (30) = happyShift action_45
action_72 (31) = happyShift action_5
action_72 (33) = happyShift action_16
action_72 (7) = happyGoto action_12
action_72 (8) = happyGoto action_37
action_72 (20) = happyGoto action_80
action_72 _ = happyFail

action_73 (24) = happyShift action_39
action_73 (25) = happyShift action_40
action_73 (26) = happyShift action_41
action_73 (27) = happyShift action_42
action_73 (28) = happyShift action_43
action_73 (29) = happyShift action_44
action_73 (30) = happyShift action_45
action_73 (31) = happyShift action_5
action_73 (33) = happyShift action_16
action_73 (7) = happyGoto action_12
action_73 (8) = happyGoto action_37
action_73 (20) = happyGoto action_79
action_73 _ = happyFail

action_74 (24) = happyShift action_39
action_74 (25) = happyShift action_40
action_74 (26) = happyShift action_41
action_74 (27) = happyShift action_42
action_74 (28) = happyShift action_43
action_74 (29) = happyShift action_44
action_74 (30) = happyShift action_45
action_74 (31) = happyShift action_5
action_74 (33) = happyShift action_16
action_74 (7) = happyGoto action_12
action_74 (8) = happyGoto action_37
action_74 (20) = happyGoto action_78
action_74 _ = happyFail

action_75 (24) = happyShift action_39
action_75 (25) = happyShift action_40
action_75 (26) = happyShift action_41
action_75 (27) = happyShift action_42
action_75 (28) = happyShift action_43
action_75 (29) = happyShift action_44
action_75 (30) = happyShift action_45
action_75 (31) = happyShift action_5
action_75 (33) = happyShift action_16
action_75 (7) = happyGoto action_12
action_75 (8) = happyGoto action_37
action_75 (20) = happyGoto action_77
action_75 _ = happyFail

action_76 _ = happyReduce_39

action_77 _ = happyReduce_33

action_78 _ = happyReduce_34

action_79 _ = happyReduce_35

action_80 _ = happyReduce_36

action_81 _ = happyReduce_37

action_82 _ = happyReduce_38

action_83 (32) = happyShift action_88
action_83 _ = happyFail

action_84 _ = happyReduce_27

action_85 _ = happyReduce_25

action_86 _ = happyReduce_24

action_87 _ = happyReduce_26

action_88 (31) = happyShift action_5
action_88 (33) = happyShift action_16
action_88 (7) = happyGoto action_89
action_88 _ = happyFail

action_89 (32) = happyShift action_90
action_89 _ = happyFail

action_90 (31) = happyShift action_5
action_90 (33) = happyShift action_16
action_90 (7) = happyGoto action_91
action_90 _ = happyFail

action_91 (32) = happyShift action_92
action_91 _ = happyFail

action_92 (31) = happyShift action_5
action_92 (33) = happyShift action_16
action_92 (7) = happyGoto action_93
action_92 _ = happyFail

action_93 (32) = happyShift action_94
action_93 _ = happyFail

action_94 (31) = happyShift action_5
action_94 (33) = happyShift action_16
action_94 (7) = happyGoto action_95
action_94 _ = happyFail

action_95 _ = happyReduce_20

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

happyReduce_6 = happySpecReduce_2  8 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 ((happy_var_1, happy_var_2)
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 ((happy_var_1, happy_var_3)
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  9 happyReduction_8
happyReduction_8  =  HappyAbsSyn9
		 ([]
	)

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 : happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  10 happyReduction_10
happyReduction_10 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn10
		 ((happy_var_1, happy_var_2)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  11 happyReduction_11
happyReduction_11  =  HappyAbsSyn11
		 (""
	)

happyReduce_12 = happySpecReduce_1  11 happyReduction_12
happyReduction_12 (HappyTerminal (TName happy_var_1))
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  12 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn12
		 ((happy_var_1, happy_var_2)
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  13 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn13
		 (Thrash
	)

happyReduce_15 = happySpecReduce_2  13 happyReduction_15
happyReduction_15 _
	_
	 =  HappyAbsSyn13
		 (Thrash
	)

happyReduce_16 = happySpecReduce_2  13 happyReduction_16
happyReduction_16 _
	_
	 =  HappyAbsSyn13
		 (Thrash
	)

happyReduce_17 = happySpecReduce_2  13 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Scale happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  13 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SkewX happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  13 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (SkewY happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 12 13 happyReduction_20
happyReduction_20 ((HappyAbsSyn7  happy_var_12) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_10) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (Matrix happy_var_2 happy_var_4 happy_var_6 happy_var_8 happy_var_10 happy_var_12
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_0  14 happyReduction_21
happyReduction_21  =  HappyAbsSyn14
		 ([]
	)

happyReduce_22 = happySpecReduce_2  14 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1 : happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_0  15 happyReduction_23
happyReduction_23  =  HappyAbsSyn15
		 ([]
	)

happyReduce_24 = happySpecReduce_3  15 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_3)
	_
	_
	 =  HappyAbsSyn15
		 (happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  15 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_3)
	_
	_
	 =  HappyAbsSyn15
		 (happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  15 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_3)
	_
	_
	 =  HappyAbsSyn15
		 (happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  15 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Scale happy_var_2 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  16 happyReduction_28
happyReduction_28 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn16
		 (Rect {h = happy_var_1, w = happy_var_2, tr = fst happy_var_3, nr = snd happy_var_3}
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  17 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn17
		 (Pol {po = happy_var_1, tpo = fst happy_var_2, npo = snd happy_var_2}
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happyMonadReduce 3 18 happyReduction_30
happyReduction_30 ((HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( if head happy_var_2 == last happy_var_2 
                                  then returnE Pol {po = happy_var_2, tpo = fst happy_var_3, npo = snd happy_var_3} 
                                  else failE "El polyline no es cerrado")
	) (\r -> happyReturn (HappyAbsSyn18 r))

happyReduce_31 = happySpecReduce_3  19 happyReduction_31
happyReduction_31 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  19 happyReduction_32
happyReduction_32 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  20 happyReduction_33
happyReduction_33 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  20 happyReduction_34
happyReduction_34 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  20 happyReduction_35
happyReduction_35 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  20 happyReduction_36
happyReduction_36 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  20 happyReduction_37
happyReduction_37 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  20 happyReduction_38
happyReduction_38 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  20 happyReduction_39
happyReduction_39 (HappyAbsSyn19  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn19
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn19
		 ([Z]
	)

happyReduce_41 = happySpecReduce_2  21 happyReduction_41
happyReduction_41 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn21
		 (Path {pa = happy_var_1, tpa = fst happy_var_2, npa = snd happy_var_2}
	)
happyReduction_41 _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 42 42 tk (HappyState action) sts stk;
	Tm -> cont 22;
	TM -> cont 23;
	Th -> cont 24;
	TH -> cont 25;
	Tv -> cont 26;
	TV -> cont 27;
	Tl -> cont 28;
	TL -> cont 29;
	TZ -> cont 30;
	TMinus -> cont 31;
	TComma -> cont 32;
	TFloat happy_dollar_dollar -> cont 33;
	TName happy_dollar_dollar -> cont 34;
	TScale -> cont 35;
	TSkewX -> cont 36;
	TSkewY -> cont 37;
	TMatrix -> cont 38;
	TTranslate -> cont 39;
	TRotate -> cont 40;
	TPL -> cont 41;
	_ -> happyError' tk
	})

happyError_ 42 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

parsePo = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

parsePl = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn18 z -> happyReturn z; _other -> notHappyAtAll })

parsePa = happySomeParser where
  happySomeParser = happyThen (happyParse action_3) (\x -> case x of {HappyAbsSyn21 z -> happyReturn z; _other -> notHappyAtAll })

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
    | TPL
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
                        ("pl", res)       -> cont TPL res
                        (ran, res)        -> let (name, res') = span isAlphaNum (ran ++ res)
                                             in cont (TName name) res'
                

parseRect s    = parseR s 1

parsePolygon s = parsePo s 1  

parsePolyLine s = parsePl s 1

parsePath s    = parsePa s 1
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
