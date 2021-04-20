:ArrayOb.273{6:Dictionary.4369{16 11:SLSPublicMethod.286331408{:String.17{9 10 "155269088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{232 233 "\[\n
    return \"Percentage: \" + Percentage + \"\\n\" +\n
        \"Accuracy: \" + Math.Round(Accuracy, 1) + \"\\n\" +\n
        \"Start Time: \" + StartTaskTime + \"\\n\" +\n
        \"Staging: \" + Staging + \"\\n\" +\n
        \"End Time: \" + EndTaskTime; ;\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95450032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "155131792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "StartTaskTime"}
 1.3 0.88 5.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{13 14 "StartTaskTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "155132216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "EndTaskTime"}
 1.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{11 12 "EndTaskTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95449008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{321 322 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
/// <summary>\n
/// The class collects the necessary information that defines the state of a generic Task.\n
/// these elements are:\n
/// - Percentage\n
/// - Accuracy\n
/// - Staging\n
/// - StartTaskTime\n
/// - EndTaskTime\n
/// </summary>\n
"}
}
#6{#4{9 10 "155130520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Accuracy"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{8 9 "Accuracy"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "97754976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{12 13 "public State"}
 20.8057 2.2 7.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{12 13 "public State"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "155130944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Staging"}
 1.3 0.88 2.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{7 8 "Staging"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "155130096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "Percentage"}
 1.3 0.88 4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{10 11 "Percentage"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "97480776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "float percentage"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{115 116 "\[\n
    Percentage = percentage;\n
    Accuracy = accuracy;\n
    StartTaskTime = startTaskTime;\n
    Staging = staging;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{71 72 "float percentage, float accuracy, DateTime startTaskTime, float staging"}
#4{0 1 ""}
}
#10{#4{8 9 "97484736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "creator"}
 0.299999 0.88 2.8 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{106 107 "\[\n
    Percentage = 0.0f;\n
    Accuracy = 1.0f;\n
    StartTaskTime = DateTime.MinValue;\n
    Staging = 0.0f;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @70 @49 @15 @0 #9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@57 @84 @23 @36 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @97 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@122 @110 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
