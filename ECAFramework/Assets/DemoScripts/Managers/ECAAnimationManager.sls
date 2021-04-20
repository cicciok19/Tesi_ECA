:ArrayOb.273{6:Dictionary.4369{16 9:SLSThisIcon.286331409{:String.17{8 9 "99217464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{42 43 "public ECAAnimationManager : MonoBehaviour"}
 15.32 2.2 26.88 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{26 27 "public ECAAnimationManager"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "98375800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{196 197 "static public Dictionary<ECAActions, ECAAction> allECAActions = new Dictionary<ECAActions, ECAAction>();\n
static public Dictionary<int, ECAAction> AnimationGraph = new Dictionary<int, ECAAction>();"}
}
:SLSProtectMethod.286331408{#4{9 10 "131365336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "createAnimationGraph"}
 1.3 0.88 8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{20 21 "createAnimationGraph"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "131366120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "StartECAAction"}
 1.3 0.88 5.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    allECAActions[actionID].StartAction();\n
\]"}
#4{14 15 "StartECAAction"}
#4{11 12 "static void"}
#4{19 20 "ECAActions actionID"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "98376056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{582 584 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using MxM;\n
using UnityEngine.AI;\n
\n
\n
\n
\tpublic enum ECAActions\n
\[\n
    SitAction,\n
    PickUpAction,\n
    FollowAction,\n
    GoToAction\n
\]\n
/// <summary>\n
/// Ogni ECAAction sar\195\\160\ definito da una o pi\195\\185\ azioni/animazioni dell'ECA. \n
/// es. il nodo ECA_sitAction sar\195\\160\ composto da 3 animazioni:\n
/// 1. Raggiungi destinazione\n
/// 2. Voltati\n
/// 3. Siediti\n
/// Ogni animazione avr\195\\160\ al suo interno dei metodi che servono a rispondere a cambiamenti di stato/emozioni dovute a comportamenti dell'utente)\n
/// </summary>\n
"}
}
:SLSPublicMember.286331409{#4{9 10 "130574560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "idx"}
 1.3 1.88 1.2 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "idx"}
#4{10 11 "static int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "131364944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{132 133 "\[\n
    ecaAnimator = GameObject.FindGameObjectWithTag(\"ECA\").GetComponent<ECAAnimator>();\n
\n
    idx = 0;\n
    createAnimationGraph();\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "131365728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "NextECAAction"}
 1.3 0.88 5.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{53 54 "\[\n
    idx++;\n
    AnimationGraph[idx].StartAction();\n
\]"}
#4{13 14 "NextECAAction"}
#4{11 12 "static void"}
#4{0 1 ""}
#4{0 1 ""}
}
#10{#4{9 10 "130574120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "ecaAnimator"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "ecaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @49 @17 @0 #5{16 0}
#5{16 0}
#5{16 0}
#5{16 2@72 @25 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @57 @0 @96 @0 @0 @0 }
#1{16@84 @37 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
