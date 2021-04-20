:ArrayOb.273{6:Dictionary.4369{16 10:SLSPublicMethod.286331408{:String.17{9 10 "155396632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "ReactToActionFinished"}
 1.3 0.88 8.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{133 134 "\[\n
    base.ReactToActionFinished(sender, e);\n
    EcaAnimator.MxM_BeginEvent(\"PickDown\");\n
    EcaAnimator.MxM_waitForEventContact();\n
\]"}
#4{21 22 "ReactToActionFinished"}
#4{13 14 "override void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155694552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "96614344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "HandEmpty"}
 2.2 1.88 3.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "HandEmpty"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155396240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 27 "\[\n
    base.StartStage();\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96616104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAction ecaAct"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{203 204 ": base(ecaAction, ecaAnimator)\n
\[\n
        ObjToPick = obj;\n
        HandEmpty = handEmpty;\n
\n
        EcaAction.CompletedAction += ReactToActionFinished;\n
        EcaAnimator.EventContact += OnEventContact;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{84 85 "ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform obj, Transform handEmpty"}
#4{0 1 ""}
}
#3{#4{9 10 "155402904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{24 25 "\[\n
    base.EndStage();\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130156368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
:SLSThisIcon.286331409{#4{9 10 "129301984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public PickDownStage : ECAActionStage"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public PickDownStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "155397024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnEventContact"}
 0.3 0.88 5.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{140 141 "\[\n
    HandEmpty.DetachChildren();\n
    ObjToPick.position = new Vector3(ObjToPick.position.x, 0.05f, ObjToPick.position.z);\n
    EndStage();\n
\]"}
#4{14 15 "OnEventContact"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{8 9 "96614784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "ObjToPick"}
 2.2 1.88 3.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "ObjToPick"}
#4{9 10 "Transform"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @82 @74 @15 @0 #7{16 0}
#7{16 2@108 @23 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@38 @62 @3 @96 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@50 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
