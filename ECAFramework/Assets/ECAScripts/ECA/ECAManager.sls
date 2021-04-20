:ArrayOb.273{6:Dictionary.4369{32 17:SLSPublicMethod.286331408{:String.17{8 9 "85951080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "UpdatePercentage"}
 0.3 0.88 6.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{121 122 "\[\n
    GlobalState.Percentage += PercentageUnit;\n
    if (GlobalState.Percentage > 1)\n
        GlobalState.Percentage = 1;\n
\]"}
#4{16 17 "UpdatePercentage"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "86295488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "PercentageUnit"}
 1.3 0.879999 5.6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{14 15 "PercentageUnit"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "85947552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "UpdateStaging"}
 0.3 0.88 5.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{168 169 "\[\n
    Utility.Log(\"Staging formula: \" + GlobalState.Staging + \" + (\" + localStaging + \")/ \" + NumberOfNodes);\n
    GlobalState.Staging += localStaging / NumberOfNodes;\n
\]"}
#4{13 14 "UpdateStaging"}
#4{4 5 "void"}
#4{18 19 "float localStaging"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86313544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{17 18 "public ECAManager"}
 19.8914 2.2 10.88 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{17 18 "public ECAManager"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateConstructor.286331648{#4{8 9 "86216104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "creator"}
 0.299999 0.88 2.8 47  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{270 271 "\[\n
    GlobalState = new State();\n
    /*\n
    NumberOfNodes = GameObject.FindObjectOfType<GameManager>().NumberOfNodes;\n
    CompletedNodes = 0;\n
    PercentageUnit = 1f / NumberOfNodes;\n
    GlobalState.Accuracy = 1;\n
    */\n
    AvailableEcas = new Dictionary<Ecas, ECA>();\n
\]"}
#4{10 12 "ECAManager"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86297840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "AvailableEcas"}
 1.3 0.879999 5.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{13 14 "AvailableEcas"}
#4{21 22 "Dictionary<Ecas, ECA>"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85950296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.879999 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{250 251 "\[\n
        get\n
        \[\n
            lock (padlock)\n
            \[\n
                if (instance == null)\n
                \[\n
                    instance = new ECAManager();\n
                \]\n
                return instance;\n
            \]\n
        \]\n
    \]"}
#4{8 9 "Instance"}
#4{17 18 "static ECAManager"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "85949120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "SetStartTime"}
 0.3 0.88 4.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{49 50 "\[\n
    GlobalState.StartTaskTime = DateTime.Now;\n
\]"}
#4{12 13 "SetStartTime"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "85949512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "FocusedECA"}
 0.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{233 234 "\[\n
    List<ECA> focusedECAs = new List<ECA>();\n
    foreach (KeyValuePair<Ecas, ECA> eca in AvailableEcas)\n
        if (eca.Value.ECAAnimator.IsWatchingMe(Camera.main))\n
            focusedECAs.Add(eca.Value);\n
\n
    return focusedECAs;\n
\]"}
#4{10 11 "FocusedECA"}
#4{9 10 "List<ECA>"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86295880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "CompletedNodes"}
 1.3 0.88 5.6 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{14 15 "CompletedNodes"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86130328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{734 762 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System.Linq;\n
using UnityEngine;\n
\t\tpublic enum Ecas\n
\[\n
    Sophie_G,\n
    Sophie_R,\n
    Sophie_B,\n
    Turi,\n
    Sophie\n
\]\n
\n
/// <summary>\n
/// Singleton class that contains a list of available ECAs accessible via an ID (defined by the Enum: Ecas).\n
/// It contains a state that represents the general progress of the FULL procedure,\n
/// represented by the typical attributes defined in the State class <see cref=\"State\"/>.\n
/// the percentage of completion is increased each time a node of SmartActionNode types is terminated by a quantity equal to 1 / NodeNumber.\n
/// Accuracy and Staging are a weighted average of individual smart action values\n
/// </summary>\n
"}
}
#3{#4{8 9 "86296664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "EndedNode"}
 0.3 0.88 3.6 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{121 122 "\[\n
    CompletedNodes++;\n
    UpdatePercentage();\n
    UpdateAccuracy(action.Accuracy);\n
    UpdateStaging(action.Staging);\n
\]"}
#4{9 10 "EndedNode"}
#4{4 5 "void"}
#4{18 19 "SmartAction action"}
#4{0 1 ""}
}
#5{#4{8 9 "86299016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "GlobalState"}
 1.3 0.88 4.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{11 12 "GlobalState"}
#4{5 6 "State"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86131608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{97 98 "private static ECAManager instance = null;\n
private static readonly object padlock = new object();"}
}
#3{#4{8 9 "85950688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "UpdateAccuracy"}
 0.3 0.88 5.6 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{184 185 "\[\n
    Utility.Log(\"Accuracy formula: \" + GlobalState.Accuracy + \" - ( 1 - \" + localAccuracy + \")/ \" + NumberOfNodes);\n
    GlobalState.Accuracy -= (1 - localAccuracy) / NumberOfNodes;\n
\]"}
#4{14 15 "UpdateAccuracy"}
#4{4 5 "void"}
#4{19 20 "float localAccuracy"}
#4{0 1 ""}
}
#3{#4{8 9 "85949904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "SetEndTime"}
 0.3 0.88 4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{47 48 "\[\n
    GlobalState.EndTaskTime = DateTime.Now;\n
\]"}
#4{10 11 "SetEndTime"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86297056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "NumberOfNodes"}
 1.3 0.88 5.2 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{13 14 "NumberOfNodes"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @40 @129 @162 @0 #7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@54 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@104 @3 @92 @182 @170 @28 @137 @149 @194 @116 @15 @66 @0 @0 @0 @0 @0 @0 @0 @0 @79 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
