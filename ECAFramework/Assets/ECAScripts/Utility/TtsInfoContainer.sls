:ArrayOb.273{6:Dictionary.4369{16 11:SLSPublicMethod.286331408{:String.17{8 9 "86347568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "SetCriteriaTTSInfo"}
 0.3 0.88 7.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 42 "\[\n
    stateAttributes[(int)type] = obj;\n
\]"}
#4{18 19 "SetCriteriaTTSInfo"}
#4{4 5 "void"}
#4{38 39 "Criteria type, SmartActionCriteria obj"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "86349136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SmartActionMsgs"}
 1.3 0.88 6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{15 16 "SmartActionMsgs"}
#4{26 27 "Dictionary<string, string>"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "104342960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "stateAttributes"}
 1 1.88 6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "stateAttributes"}
#4{21 22 "SmartActionCriteria[]"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86311920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{8 9 "86343648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{455 456 "\[\n
    String s = \"\";\n
    foreach(SmartActionCriteria attribute in stateAttributes)\n
        s += attribute.ToString() + \" \\n\";\n
\n
    foreach (KeyValuePair<string, string> txt in SmartActionMsgs)\n
        s += txt.Key + \": \" + txt.Value + \"\\n\";\n
\n
    //s += \"Description: \" + Description + \"\\n End Message: \" + EndMessage + \"\\n Help Message: \" + HelpMessage + \"\\n\";\n
    return \"TextContainer of \" + this.ActionName + \" With Weight of: \" + Weight + \"\\n \" + s;\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "104341640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "String actionNam"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{173 174 "\[\n
    stateAttributes = new SmartActionCriteria[SmartActionCriteria.NumberOfCriteria];\n
    ActionName = actionName;\n
    SmartActionMsgs = new Dictionary<string, string>();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{17 18 "String actionName"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86308592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{560 561 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
\n
/// <summary>\n
/// This class is a container for all information related to the various actions regarding SpeechToText.\n
/// In particular an array of StateAttribute for now made up of 2 elements: Accuracy obj and Staging obj.\n
/// Weight is used to determine the importance of the action in the game. In this way, the ECA can decide (based on its weight level) \n
/// whether to reproduce the message or not.\n
/// The other elements are self-explanatory.\n
/// </summary>\n
\n
"}
}
#5{#4{8 9 "86347960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Weight"}
 1.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{6 7 "Weight"}
#4{8 9 "Presence"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "86342864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GetCriteriaTTSInfo"}
 0.3 0.88 7.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{432 433 "\[\n
    if((int)attribute > stateAttributes.Length)\n
    \[\n
        Utility.LogError(\"ERROR: Not all state elements have been initialized. \" +\n
                            \"Check if they are in the xml file or if they are not considered in the parser script\" +\n
                            \" Number of state elements are: \" + SmartActionCriteria.NumberOfCriteria);\n
        return null;\n
    \]\n
\n
    return stateAttributes[(int)attribute];\n
\]"}
#4{18 19 "GetCriteriaTTSInfo"}
#4{19 20 "SmartActionCriteria"}
#4{18 19 "Criteria attribute"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "85938816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{23 24 "public TtsInfoContainer"}
 18.7943 2.2 14.72 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{23 24 "public TtsInfoContainer"}
#4{0 7 ""}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{8 9 "86346392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "ActionName"}
 1.3 0.88 4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{10 11 "ActionName"}
#4{6 7 "String"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @106 @74 @42 @0 #7{16 1@27 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@3 @94 @82 @15 @50 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @120 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@62 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
