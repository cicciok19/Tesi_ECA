:ArrayOb.273{6:Dictionary.4369{16 4:SLSPrivateMethod.286331408{:String.17{9 10 "119120936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{497 498 "\[\n
    //Init configuration (scenario type, language, smartAction messages, xml files name ecc)\n
    Configuration.Instance.Init();\n
\n
    //Set the scenario (SmartActions, Nodes)\n
    /*if (Configuration.Instance.ActualScenario.Equals(ScenarioType.Training))\n
        FindObjectOfType<DemoScenario>().Init();*/\n
\n
    //Init all ecas\n
    ECA[] allEca = FindObjectsOfType<ECA>();\n
    for (int i = 0; i < allEca.Length; i++)\n
        allEca[i].Init();\n
\n
    //Init logger\n
    // CSVManager.Instance.Init();\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "129756000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "129755232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{79 80 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "94271792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public Initializer : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{18 19 "public Initializer"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @31 @23 @15 @0 #8{16 0}
#8{16 0}
#8{16 1@3 }
#8{16 0}
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#10{1 }
#10{0 }
#10{1 }
}
