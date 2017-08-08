{-# OPTIONS_GHC -w #-}
module ParseSVGElements where
    
-- Módulos propios
import Common

-- Módulos prestados
import Data.Char
import Data.List

-- parser produced by Happy Version 1.19.0

data HappyAbsSyn t7 t8 t11 t12 t14 t15 t16 t19
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 (MyPoint)
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 (Rect)
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 ([MyPoint])
	| HappyAbsSyn18 (SVGPolygon)
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 ([PathCommand])
	| HappyAbsSyn22 (Path)

action_0 (34) = happyShift action_19
action_0 (13) = happyGoto action_18
action_0 _ = happyFail

action_1 (32) = happyShift action_5
action_1 (34) = happyShift action_17
action_1 (7) = happyGoto action_12
action_1 (9) = happyGoto action_13
action_1 (10) = happyGoto action_14
action_1 (17) = happyGoto action_15
action_1 (18) = happyGoto action_16
action_1 _ = happyReduce_28

action_2 (42) = happyShift action_11
action_2 (19) = happyGoto action_10
action_2 _ = happyFail

action_3 (23) = happyShift action_8
action_3 (24) = happyShift action_9
action_3 (20) = happyGoto action_6
action_3 (22) = happyGoto action_7
action_3 _ = happyFail

action_4 (32) = happyShift action_5
action_4 _ = happyFail

action_5 (34) = happyShift action_37
action_5 _ = happyFail

action_6 (36) = happyShift action_24
action_6 (37) = happyShift action_25
action_6 (38) = happyShift action_26
action_6 (39) = happyShift action_27
action_6 (40) = happyShift action_28
action_6 (41) = happyShift action_29
action_6 (14) = happyGoto action_21
action_6 (15) = happyGoto action_22
action_6 (16) = happyGoto action_36
action_6 _ = happyReduce_25

action_7 (43) = happyAccept
action_7 _ = happyFail

action_8 (32) = happyShift action_5
action_8 (34) = happyShift action_17
action_8 (7) = happyGoto action_12
action_8 (9) = happyGoto action_13
action_8 (10) = happyGoto action_35
action_8 _ = happyFail

action_9 (32) = happyShift action_5
action_9 (34) = happyShift action_17
action_9 (7) = happyGoto action_12
action_9 (9) = happyGoto action_13
action_9 (10) = happyGoto action_34
action_9 _ = happyFail

action_10 (43) = happyAccept
action_10 _ = happyFail

action_11 (32) = happyShift action_5
action_11 (34) = happyShift action_17
action_11 (7) = happyGoto action_12
action_11 (9) = happyGoto action_13
action_11 (10) = happyGoto action_14
action_11 (17) = happyGoto action_33
action_11 _ = happyReduce_28

action_12 (32) = happyShift action_5
action_12 (33) = happyShift action_32
action_12 (34) = happyShift action_17
action_12 (7) = happyGoto action_31
action_12 _ = happyFail

action_13 _ = happyReduce_10

action_14 (32) = happyShift action_5
action_14 (34) = happyShift action_17
action_14 (7) = happyGoto action_12
action_14 (9) = happyGoto action_13
action_14 (10) = happyGoto action_14
action_14 (17) = happyGoto action_30
action_14 _ = happyReduce_28

action_15 (36) = happyShift action_24
action_15 (37) = happyShift action_25
action_15 (38) = happyShift action_26
action_15 (39) = happyShift action_27
action_15 (40) = happyShift action_28
action_15 (41) = happyShift action_29
action_15 (14) = happyGoto action_21
action_15 (15) = happyGoto action_22
action_15 (16) = happyGoto action_23
action_15 _ = happyReduce_25

action_16 (43) = happyAccept
action_16 _ = happyFail

action_17 _ = happyReduce_5

action_18 (43) = happyAccept
action_18 _ = happyFail

action_19 (34) = happyShift action_20
action_19 _ = happyFail

action_20 (36) = happyShift action_62
action_20 (40) = happyShift action_63
action_20 (41) = happyShift action_64
action_20 (11) = happyGoto action_60
action_20 (12) = happyGoto action_61
action_20 _ = happyReduce_11

action_21 (36) = happyShift action_24
action_21 (37) = happyShift action_25
action_21 (38) = happyShift action_26
action_21 (39) = happyShift action_27
action_21 (40) = happyShift action_28
action_21 (41) = happyShift action_29
action_21 (14) = happyGoto action_21
action_21 (15) = happyGoto action_59
action_21 _ = happyReduce_25

action_22 (35) = happyShift action_58
action_22 (8) = happyGoto action_57
action_22 _ = happyReduce_6

action_23 _ = happyReduce_30

action_24 (32) = happyShift action_5
action_24 (34) = happyShift action_17
action_24 (7) = happyGoto action_56
action_24 _ = happyFail

action_25 (32) = happyShift action_5
action_25 (34) = happyShift action_17
action_25 (7) = happyGoto action_55
action_25 _ = happyFail

action_26 (32) = happyShift action_5
action_26 (34) = happyShift action_17
action_26 (7) = happyGoto action_54
action_26 _ = happyFail

action_27 (32) = happyShift action_5
action_27 (34) = happyShift action_17
action_27 (7) = happyGoto action_53
action_27 _ = happyFail

action_28 (32) = happyShift action_5
action_28 (34) = happyShift action_17
action_28 (7) = happyGoto action_51
action_28 (9) = happyGoto action_52
action_28 _ = happyFail

action_29 (32) = happyShift action_5
action_29 (34) = happyShift action_17
action_29 (7) = happyGoto action_50
action_29 _ = happyFail

action_30 _ = happyReduce_29

action_31 _ = happyReduce_9

action_32 (32) = happyShift action_5
action_32 (34) = happyShift action_17
action_32 (7) = happyGoto action_49
action_32 _ = happyFail

action_33 (36) = happyShift action_24
action_33 (37) = happyShift action_25
action_33 (38) = happyShift action_26
action_33 (39) = happyShift action_27
action_33 (40) = happyShift action_28
action_33 (41) = happyShift action_29
action_33 (14) = happyGoto action_21
action_33 (15) = happyGoto action_22
action_33 (16) = happyGoto action_48
action_33 _ = happyReduce_25

action_34 (25) = happyShift action_40
action_34 (26) = happyShift action_41
action_34 (27) = happyShift action_42
action_34 (28) = happyShift action_43
action_34 (29) = happyShift action_44
action_34 (30) = happyShift action_45
action_34 (31) = happyShift action_46
action_34 (32) = happyShift action_5
action_34 (34) = happyShift action_17
action_34 (7) = happyGoto action_12
action_34 (9) = happyGoto action_13
action_34 (10) = happyGoto action_38
action_34 (21) = happyGoto action_47
action_34 _ = happyFail

action_35 (25) = happyShift action_40
action_35 (26) = happyShift action_41
action_35 (27) = happyShift action_42
action_35 (28) = happyShift action_43
action_35 (29) = happyShift action_44
action_35 (30) = happyShift action_45
action_35 (31) = happyShift action_46
action_35 (32) = happyShift action_5
action_35 (34) = happyShift action_17
action_35 (7) = happyGoto action_12
action_35 (9) = happyGoto action_13
action_35 (10) = happyGoto action_38
action_35 (21) = happyGoto action_39
action_35 _ = happyFail

action_36 _ = happyReduce_42

action_37 _ = happyReduce_4

action_38 (25) = happyShift action_40
action_38 (26) = happyShift action_41
action_38 (27) = happyShift action_42
action_38 (28) = happyShift action_43
action_38 (29) = happyShift action_44
action_38 (30) = happyShift action_45
action_38 (31) = happyShift action_46
action_38 (32) = happyShift action_5
action_38 (34) = happyShift action_17
action_38 (7) = happyGoto action_12
action_38 (9) = happyGoto action_13
action_38 (10) = happyGoto action_38
action_38 (21) = happyGoto action_77
action_38 _ = happyFail

action_39 _ = happyReduce_33

action_40 (32) = happyShift action_5
action_40 (34) = happyShift action_17
action_40 (7) = happyGoto action_76
action_40 _ = happyFail

action_41 (32) = happyShift action_5
action_41 (34) = happyShift action_17
action_41 (7) = happyGoto action_75
action_41 _ = happyFail

action_42 (32) = happyShift action_5
action_42 (34) = happyShift action_17
action_42 (7) = happyGoto action_74
action_42 _ = happyFail

action_43 (32) = happyShift action_5
action_43 (34) = happyShift action_17
action_43 (7) = happyGoto action_73
action_43 _ = happyFail

action_44 (32) = happyShift action_5
action_44 (34) = happyShift action_17
action_44 (7) = happyGoto action_12
action_44 (9) = happyGoto action_13
action_44 (10) = happyGoto action_72
action_44 _ = happyFail

action_45 (32) = happyShift action_5
action_45 (34) = happyShift action_17
action_45 (7) = happyGoto action_12
action_45 (9) = happyGoto action_13
action_45 (10) = happyGoto action_71
action_45 _ = happyFail

action_46 _ = happyReduce_41

action_47 _ = happyReduce_32

action_48 _ = happyReduce_31

action_49 _ = happyReduce_8

action_50 _ = happyReduce_20

action_51 (33) = happyShift action_32
action_51 _ = happyReduce_18

action_52 _ = happyReduce_19

action_53 (33) = happyShift action_70
action_53 _ = happyFail

action_54 _ = happyReduce_23

action_55 _ = happyReduce_22

action_56 _ = happyReduce_21

action_57 _ = happyReduce_27

action_58 _ = happyReduce_7

action_59 _ = happyReduce_26

action_60 (35) = happyShift action_58
action_60 (8) = happyGoto action_69
action_60 _ = happyReduce_6

action_61 _ = happyReduce_17

action_62 (32) = happyShift action_5
action_62 (34) = happyShift action_17
action_62 (7) = happyGoto action_68
action_62 _ = happyFail

action_63 (32) = happyShift action_5
action_63 (34) = happyShift action_17
action_63 (7) = happyGoto action_66
action_63 (9) = happyGoto action_67
action_63 _ = happyFail

action_64 (32) = happyShift action_5
action_64 (34) = happyShift action_17
action_64 (7) = happyGoto action_65
action_64 _ = happyFail

action_65 (36) = happyShift action_62
action_65 (40) = happyShift action_63
action_65 (41) = happyShift action_64
action_65 (11) = happyGoto action_88
action_65 _ = happyReduce_11

action_66 (33) = happyShift action_32
action_66 (36) = happyShift action_62
action_66 (40) = happyShift action_63
action_66 (41) = happyShift action_64
action_66 (11) = happyGoto action_87
action_66 _ = happyReduce_11

action_67 (36) = happyShift action_62
action_67 (40) = happyShift action_63
action_67 (41) = happyShift action_64
action_67 (11) = happyGoto action_86
action_67 _ = happyReduce_11

action_68 (36) = happyShift action_62
action_68 (40) = happyShift action_63
action_68 (41) = happyShift action_64
action_68 (11) = happyGoto action_85
action_68 _ = happyReduce_11

action_69 _ = happyReduce_16

action_70 (32) = happyShift action_5
action_70 (34) = happyShift action_17
action_70 (7) = happyGoto action_84
action_70 _ = happyFail

action_71 (25) = happyShift action_40
action_71 (26) = happyShift action_41
action_71 (27) = happyShift action_42
action_71 (28) = happyShift action_43
action_71 (29) = happyShift action_44
action_71 (30) = happyShift action_45
action_71 (31) = happyShift action_46
action_71 (32) = happyShift action_5
action_71 (34) = happyShift action_17
action_71 (7) = happyGoto action_12
action_71 (9) = happyGoto action_13
action_71 (10) = happyGoto action_38
action_71 (21) = happyGoto action_83
action_71 _ = happyFail

action_72 (25) = happyShift action_40
action_72 (26) = happyShift action_41
action_72 (27) = happyShift action_42
action_72 (28) = happyShift action_43
action_72 (29) = happyShift action_44
action_72 (30) = happyShift action_45
action_72 (31) = happyShift action_46
action_72 (32) = happyShift action_5
action_72 (34) = happyShift action_17
action_72 (7) = happyGoto action_12
action_72 (9) = happyGoto action_13
action_72 (10) = happyGoto action_38
action_72 (21) = happyGoto action_82
action_72 _ = happyFail

action_73 (25) = happyShift action_40
action_73 (26) = happyShift action_41
action_73 (27) = happyShift action_42
action_73 (28) = happyShift action_43
action_73 (29) = happyShift action_44
action_73 (30) = happyShift action_45
action_73 (31) = happyShift action_46
action_73 (32) = happyShift action_5
action_73 (34) = happyShift action_17
action_73 (7) = happyGoto action_12
action_73 (9) = happyGoto action_13
action_73 (10) = happyGoto action_38
action_73 (21) = happyGoto action_81
action_73 _ = happyFail

action_74 (25) = happyShift action_40
action_74 (26) = happyShift action_41
action_74 (27) = happyShift action_42
action_74 (28) = happyShift action_43
action_74 (29) = happyShift action_44
action_74 (30) = happyShift action_45
action_74 (31) = happyShift action_46
action_74 (32) = happyShift action_5
action_74 (34) = happyShift action_17
action_74 (7) = happyGoto action_12
action_74 (9) = happyGoto action_13
action_74 (10) = happyGoto action_38
action_74 (21) = happyGoto action_80
action_74 _ = happyFail

action_75 (25) = happyShift action_40
action_75 (26) = happyShift action_41
action_75 (27) = happyShift action_42
action_75 (28) = happyShift action_43
action_75 (29) = happyShift action_44
action_75 (30) = happyShift action_45
action_75 (31) = happyShift action_46
action_75 (32) = happyShift action_5
action_75 (34) = happyShift action_17
action_75 (7) = happyGoto action_12
action_75 (9) = happyGoto action_13
action_75 (10) = happyGoto action_38
action_75 (21) = happyGoto action_79
action_75 _ = happyFail

action_76 (25) = happyShift action_40
action_76 (26) = happyShift action_41
action_76 (27) = happyShift action_42
action_76 (28) = happyShift action_43
action_76 (29) = happyShift action_44
action_76 (30) = happyShift action_45
action_76 (31) = happyShift action_46
action_76 (32) = happyShift action_5
action_76 (34) = happyShift action_17
action_76 (7) = happyGoto action_12
action_76 (9) = happyGoto action_13
action_76 (10) = happyGoto action_38
action_76 (21) = happyGoto action_78
action_76 _ = happyFail

action_77 _ = happyReduce_40

action_78 _ = happyReduce_34

action_79 _ = happyReduce_35

action_80 _ = happyReduce_36

action_81 _ = happyReduce_37

action_82 _ = happyReduce_38

action_83 _ = happyReduce_39

action_84 (33) = happyShift action_89
action_84 _ = happyFail

action_85 _ = happyReduce_15

action_86 _ = happyReduce_13

action_87 _ = happyReduce_12

action_88 _ = happyReduce_14

action_89 (32) = happyShift action_5
action_89 (34) = happyShift action_17
action_89 (7) = happyGoto action_90
action_89 _ = happyFail

action_90 (33) = happyShift action_91
action_90 _ = happyFail

action_91 (32) = happyShift action_5
action_91 (34) = happyShift action_17
action_91 (7) = happyGoto action_92
action_91 _ = happyFail

action_92 (33) = happyShift action_93
action_92 _ = happyFail

action_93 (32) = happyShift action_5
action_93 (34) = happyShift action_17
action_93 (7) = happyGoto action_94
action_93 _ = happyFail

action_94 (33) = happyShift action_95
action_94 _ = happyFail

action_95 (32) = happyShift action_5
action_95 (34) = happyShift action_17
action_95 (7) = happyGoto action_96
action_95 _ = happyFail

action_96 _ = happyReduce_24

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

happyReduce_6 = happySpecReduce_0  8 happyReduction_6
happyReduction_6  =  HappyAbsSyn8
		 ("noname"
	)

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 (HappyTerminal (TName happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  9 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn9
		 ((happy_var_1, happy_var_3)
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  10 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn9
		 ((happy_var_1, happy_var_2)
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_0  11 happyReduction_11
happyReduction_11  =  HappyAbsSyn11
		 ([]
	)

happyReduce_12 = happySpecReduce_3  11 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  11 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_3)
	_
	_
	 =  HappyAbsSyn11
		 (happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  11 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Scale happy_var_2 : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  12 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn12
		 ((happy_var_1, happy_var_2)
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  13 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	(HappyTerminal (TFloat happy_var_2))
	(HappyTerminal (TFloat happy_var_1))
	 =  HappyAbsSyn13
		 (Rect {h = happy_var_1, w = happy_var_2, tr = fst happy_var_3, nr = snd happy_var_3}
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  14 happyReduction_18
happyReduction_18 _
	_
	 =  HappyAbsSyn14
		 (Thrash
	)

happyReduce_19 = happySpecReduce_2  14 happyReduction_19
happyReduction_19 _
	_
	 =  HappyAbsSyn14
		 (Thrash
	)

happyReduce_20 = happySpecReduce_2  14 happyReduction_20
happyReduction_20 _
	_
	 =  HappyAbsSyn14
		 (Thrash
	)

happyReduce_21 = happySpecReduce_2  14 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Scale happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  14 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (SkewX happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  14 happyReduction_23
happyReduction_23 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (SkewY happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 12 14 happyReduction_24
happyReduction_24 ((HappyAbsSyn7  happy_var_12) `HappyStk`
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
	 = HappyAbsSyn14
		 (Matrix happy_var_2 happy_var_4 happy_var_6 happy_var_8 happy_var_10 happy_var_12
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_0  15 happyReduction_25
happyReduction_25  =  HappyAbsSyn15
		 ([]
	)

happyReduce_26 = happySpecReduce_2  15 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 : happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  16 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ((happy_var_1, happy_var_2)
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_0  17 happyReduction_28
happyReduction_28  =  HappyAbsSyn17
		 ([]
	)

happyReduce_29 = happySpecReduce_2  17 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 : happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  18 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (Pol {po = happy_var_1, tpo = fst happy_var_2, npo = snd happy_var_2}
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happyMonadReduce 3 19 happyReduction_31
happyReduction_31 ((HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest) tk
	 = happyThen (( if head happy_var_2 == last happy_var_2 
                                  then returnE Pol {po = happy_var_2, tpo = fst happy_var_3, npo = snd happy_var_3} 
                                  else failE "Error de parseo: el polyline no es cerrado")
	) (\r -> happyReturn (HappyAbsSyn19 r))

happyReduce_32 = happySpecReduce_3  20 happyReduction_32
happyReduction_32 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (M_abs happy_var_2 : happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  20 happyReduction_33
happyReduction_33 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (M_rel happy_var_2 : happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  21 happyReduction_34
happyReduction_34 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  21 happyReduction_35
happyReduction_35 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (H_rel happy_var_2 : happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  21 happyReduction_36
happyReduction_36 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  21 happyReduction_37
happyReduction_37 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (V_abs happy_var_2 : happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  21 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (L_rel happy_var_2 : happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  21 happyReduction_39
happyReduction_39 (HappyAbsSyn20  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (L_abs happy_var_2 : happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  21 happyReduction_40
happyReduction_40 (HappyAbsSyn20  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn20
		 (Complete happy_var_1 : happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  21 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn20
		 ([Z]
	)

happyReduce_42 = happySpecReduce_2  22 happyReduction_42
happyReduction_42 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn22
		 (Path {pa = happy_var_1, tpa = fst happy_var_2, npa = snd happy_var_2}
	)
happyReduction_42 _ _  = notHappyAtAll 

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = action i i tk (HappyState action) sts stk in
	case tk of {
	TEof -> action 43 43 tk (HappyState action) sts stk;
	Tm -> cont 23;
	TM -> cont 24;
	Th -> cont 25;
	TH -> cont 26;
	Tv -> cont 27;
	TV -> cont 28;
	Tl -> cont 29;
	TL -> cont 30;
	TZ -> cont 31;
	TMinus -> cont 32;
	TComma -> cont 33;
	TFloat happy_dollar_dollar -> cont 34;
	TName happy_dollar_dollar -> cont 35;
	TScale -> cont 36;
	TSkewX -> cont 37;
	TSkewY -> cont 38;
	TMatrix -> cont 39;
	TTranslate -> cont 40;
	TRotate -> cont 41;
	TPL -> cont 42;
	_ -> happyError' tk
	})

happyError_ 43 tk = happyError' tk
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
  happySomeParser = happyThen (happyParse action_0) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

parsePo = happySomeParser where
  happySomeParser = happyThen (happyParse action_1) (\x -> case x of {HappyAbsSyn18 z -> happyReturn z; _other -> notHappyAtAll })

parsePl = happySomeParser where
  happySomeParser = happyThen (happyParse action_2) (\x -> case x of {HappyAbsSyn19 z -> happyReturn z; _other -> notHappyAtAll })

parsePa = happySomeParser where
  happySomeParser = happyThen (happyParse action_3) (\x -> case x of {HappyAbsSyn22 z -> happyReturn z; _other -> notHappyAtAll })

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
                

parseRect s     = parseR s 1

parsePolygon s  = parsePo s 1  

parsePolyLine s = parsePl s 1

parsePath s     = parsePa s 1
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
