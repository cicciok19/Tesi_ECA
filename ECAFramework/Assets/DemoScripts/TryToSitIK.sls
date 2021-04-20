:ArrayOb.273{6:Dictionary.4369{16 11:SLSPrivateMember.286331409{:String.17{8 9 "95560624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "SitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "157168720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{462 463 "\[\n
    if (Input.GetKeyDown(KeyCode.O))\n
    \[\n
        SitAction = new ECA_sitActionIK(EcaAnimator, Destination, SitPoint);\n
        SitAction.StartAction();\n
    \]\n
    if (Input.GetKeyDown(KeyCode.P))\[\n
        PointingAction = new ECA_pointingActionIK(EcaAnimator, Destination, Target);\n
        PointingAction.StartAction();\n
    \]\n
\n
    if (Input.GetMouseButtonDown(0))\n
    \[\n
        if (StopPointing != null)\n
            StopPointing(this, EventArgs.Empty);\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "157168328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{213 214 "\[\n
    SitPoint = GameObject.FindGameObjectWithTag(\"Sit\").transform;\n
    Destination = GameObject.FindGameObjectWithTag(\"Destination\").transform;\n
    Target = GameObject.FindGameObjectWithTag(\"Target\").transform;\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155690968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
"}
}
:SLSPublicMember.286331409{#4{8 9 "95562384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "PointingAction"}
 1.3 1.88 5.6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "PointingAction"}
#4{20 21 "ECA_pointingActionIK"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "95559744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "SitAction"}
 1.3 1.88 3.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{9 10 "SitAction"}
#4{15 16 "ECA_sitActionIK"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96378888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "Destination"}
 1.8 1.88 4.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "Destination"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "157793112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{33 34 "public TryToSitIK : MonoBehaviour"}
 16.9657 2.2 21.12 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  4.11384 3.74855 0
 0  0 #4{17 18 "public TryToSitIK"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#5{16 1#4{46 47 "public static event EventHandler StopPointing;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{8 9 "96373608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "Target"}
 2.8 1.88 2.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "Target"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155689432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#8{#4{8 9 "96377568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "EcaAnimator"}
 1.3 1.88 4.4 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "EcaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{16 17 "[SerializeField]"}
}
}
:CLSCSSem.1118481{ 56  51 @95 @42 @125 @0 #5{16 3@3 @80 @110 }
#5{16 0}
#5{16 2@30 @18 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @133 @0 @50 @0 @65 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
