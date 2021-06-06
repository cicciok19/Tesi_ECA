:ArrayOb.273{6:Dictionary.4369{16 5:SLSThisIcon.286331409{:String.17{8 9 "93840080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public ECAGameManager : GameManager"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{21 22 "public ECAGameManager"}
#4{11 12 "GameManager"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155697880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{214 215 "public static Dictionary<SmartActions, SmartAction> AllSmartActions = new Dictionary<SmartActions, SmartAction>();\n
public static Dictionary<int, GameGraphNode> AllSimpleNodes = new Dictionary<int, GameGraphNode>();"}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155692504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{263 264 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
/// <summary>\n
/// Extends <see cref=\"GameManager\"/> in order to manage smartActions. \n
/// Keeps track all smartActions and all nodes\n
/// </summary>\n
"}
}
:SLSProtectMethod.286331408{#4{9 10 "157169112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{125 126 "\[\n
    //CSVManager.Instance.Init();\n
    ECAManager.Instance.AvailableEcas[Ecas.Sophie].SendMessage(\"StartGame\", StartGame);\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "157169504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartGame"}
 1.3 0.88 3.6 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{65 66 "\[\n
    base.StartGame();\n
    ECAManager.Instance.SetStartTime();\n
\]"}
#4{9 10 "StartGame"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @3 @25 @17 @0 #5{16 0}
#5{16 0}
#5{16 0}
#5{16 2@33 @45 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#10{1 }
#10{0 }
#10{1 }
}
