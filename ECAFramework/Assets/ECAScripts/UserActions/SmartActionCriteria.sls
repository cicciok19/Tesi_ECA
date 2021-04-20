:ArrayOb.273{6:Dictionary.4369{32 18:SLSProperty.286331392{:String.17{9 10 "155128824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Limits"}
 1.3 0.88 2.4 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{6 7 "Limits"}
#4{7 8 "float[]"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95447728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{135 136 "static int numberOfLabels = Enum.GetNames(typeof(Labels)).Length;\n
static int numberOfCriteria = Enum.GetNames(typeof(Criteria)).Length;"}
}
:SLSPublicMethod.286331408{#4{8 9 "97552200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "getText"}
 0.3 0.88 2.8 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{32 33 "\[\n
    return Txts[(int)state];\n
\]"}
#4{7 8 "getText"}
#4{6 7 "String"}
#4{12 13 "Labels state"}
#4{0 1 ""}
}
#3{#4{9 10 "155131368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "CriteriaType"}
 1.3 0.88 4.8 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{12 13 "CriteriaType"}
#4{8 9 "Criteria"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "97486056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string good, str"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{364 365 "\[\n
    //init text valus\n
    Txts = new string[numberOfLabels];\n
    Txts[(int)Labels.Good] = good;\n
    Txts[(int)Labels.Normal] = normal;\n
    Txts[(int)Labels.Bad] = bad;\n
\n
    //init limit values\n
    Limits = new float[numberOfLabels];\n
    Limits[(int)Labels.Good] = goodLimit;\n
    Limits[(int)Labels.Normal] = normalLimit;\n
    Limits[(int)Labels.Bad] = badLimit;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{90 91 "string good, string normal, string bad, float goodLimit, float normalLimit, float badLimit"}
#4{0 1 ""}
}
#3{#4{9 10 "155129672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{3 4 "Bad"}
 1.3 0.88 1.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{71 72 "\[ get => Txts[(int)Labels.Bad]; set => Txts[(int)Labels.Bad] = value; \]"}
#4{3 4 "Bad"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155127552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Txts"}
 1.3 0.88 1.6 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{4 5 "Txts"}
#4{8 9 "string[]"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "97752768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{26 27 "public SmartActionCriteria"}
 18.2457 2.2 16.64 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{26 27 "public SmartActionCriteria"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "155126704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "BadLimit"}
 1.3 0.88 3.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{75 76 "\[ get => Limits[(int)Labels.Bad]; set => Limits[(int)Labels.Bad] = value; \]"}
#4{8 9 "BadLimit"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97695440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Good"}
 1.3 0.88 1.6 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{73 74 "\[ get => Txts[(int)Labels.Good]; set => Txts[(int)Labels.Good] = value; \]"}
#4{4 5 "Good"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155128400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "NumberOfLabels"}
 1.3 0.88 5.6 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 27 "\[ get => numberOfLabels; \]"}
#4{14 15 "NumberOfLabels"}
#4{10 11 "static int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "97552592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{283 284 "\[\n
    return CriteriaType.ToString() + \":\" +\n
           \"\\n goodText: \" + Good +\n
           \"\\n normalText: \" + Normal +\n
           \"\\n badText: \" + Bad +\n
           \"\\n goodLimit: \" + GoodLimit +\n
           \"\\n normalLimit: \" + NormalLimit +\n
           \"\\n badLimit: \" + BadLimit;\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95453104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{873 874 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
\n
/// <summary>\n
/// For each <see cref=\"Criteria\"/>, it defines the threshold values that determine the passage from one <see cref=\"Labels\"/> to another \n
/// and the texts associated with these changes.\n
/// For now, in this project we use only 2 <see cref=\"SmartActionCriteria\"/> of type <see cref=\"Criteria.Accuracy\"/> and <see cref=\"Criteria.Staging\"/> \n
/// that can be in 3 different states (<see cref=\"Labels\"/>): <see cref=\"Labels.Good\"/>, <see cref=\"Labels.Normal\"/>, <see cref=\"Labels.Bad\"/>.\n
/// In general, other parameters could be added later.\n
/// In general, this class defines:\n
/// 1) an array of texts: used for Text-To-Speech\n
/// 2) Threshold values that will be used by other scripts to verify the transition of the state from one Labels to another.\n
/// </summary>\n
"}
}
#3{#4{9 10 "155132640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "NumberOfCriteria"}
 1.3 0.88 6.4 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{28 29 "\[ get => numberOfCriteria; \]"}
#4{16 17 "NumberOfCriteria"}
#4{10 11 "static int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155127976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "NormalLimit"}
 1.3 0.88 4.4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 82 "\[ get => Limits[(int)Labels.Normal]; set => Limits[(int)Labels.Normal] = value; \]"}
#4{11 12 "NormalLimit"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "97488256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Criteria criteri"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{70 71 "\[\n
    CriteriaType = criteria;\n
    Txts = txts;\n
    Limits = limits;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{48 49 "Criteria criteria, String[] txts, float[] limits"}
#4{0 1 ""}
}
#3{#4{9 10 "155129248"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "GoodLimit"}
 1.3 0.88 3.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{77 78 "\[ get => Limits[(int)Labels.Good]; set => Limits[(int)Labels.Good] = value; \]"}
#4{9 10 "GoodLimit"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155127128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Normal"}
 1.3 0.88 2.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{77 78 "\[ get => Txts[(int)Labels.Normal]; set => Txts[(int)Labels.Normal] = value; \]"}
#4{6 7 "Normal"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @87 @152 @16 @0 #9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@24 @211 @61 @198 @173 @101 @160 @127 @74 @3 @36 @140 @0 @0 @0 @0 @0 @0 @0 @0 @114 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@186 @49 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
