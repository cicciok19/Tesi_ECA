:ArrayOb.273{6:Dictionary.4369{16 8:SLSConstructor.286331408{:String.17{9 10 "156125384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAction ecaAct"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{63 64 ": base(ecaAction, ecaAnimator)\n
\[\n
        SitPoint = sitPoint;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{68 69 "ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155698392"}
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
:SLSPublicMember.286331409{#4{9 10 "156127584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "StageFinished"}
 1.3 1.88 5.2 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{13 14 "StageFinished"}
#4{12 13 "EventHandler"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "129304744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{32 33 "public SitStage : ECAActionStage"}
 17.1486 2.2 20.48 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{15 16 "public SitStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155691224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "155853256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{133 134 "\[\n
    base.StartStage();\n
    EcaAnimator.MxM_BeginEvent(\"SitDown\", SitPoint);\n
    //EcaAnimator.IK_setWeight(true);\n
    EndStage();\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "96611264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "SitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#10{#4{9 10 "155858352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{63 64 "\[\n
    EcaAnimator.MxM_SetTag(\"Sitting\");\n
    base.EndStage();\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @38 @15 @52 @0 #7{16 1@72 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @23 @0 @0 @0 }
#1{16@60 @87 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
