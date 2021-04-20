:ArrayOb.273{6:Dictionary.4369{16 9:SLSPrivateMember.286331409{:String.17{8 9 "96613024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{20 21 "SmartActionToStandUp"}
 0.299999 1.88 8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{20 21 "SmartActionToStandUp"}
#4{11 12 "SmartAction"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "129307504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public ECA_sitActionIK : ECAAction"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{22 23 "public ECA_sitActionIK"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130156880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96615664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{482 483 ": base(ecaAnimator)\n
\[\n
        Destination = destination;\n
        SitPoint = sitPoint;\n
\n
        AllStages = new ECAActionStage[]\n
        \[\n
            new GoToStage(this, (ECAAnimatorDemo)EcaAnimator, Destination),\n
            new TurnStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint, true),\n
            new SitStageWithIK(this, (ECAAnimatorDemo)EcaAnimator, SitPoint),\n
            new StandUpStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint)\n
        \];\n
\n
        SetupAction();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{66 67 "ECAAnimator ecaAnimator, Transform destination, Transform sitPoint"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130153808"}
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
:SLSPublicMethod.286331408{#4{9 10 "118890904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "SetEndTriggerAction"}
 0.3 0.88 7.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 44 "\[\n
    SmartActionToStandUp = smartAction;\n
\]"}
#4{19 20 "SetEndTriggerAction"}
#4{4 5 "void"}
#4{23 24 "SmartAction smartAction"}
#4{0 1 ""}
}
#10{#4{9 10 "118885808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetSitPoint"}
 0.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{605 606 "\[\n
\n
    Transform r_footEffector = t.GetChild(0);\n
    Transform l_footEffector = t.GetChild(1);\n
    Transform hipsEffector = t.GetChild(2);\n
\n
    SitPoint = hipsEffector;\n
    //(ECAAnimatorDemo)EcaAnimator.IK_setEffectors(hipsEffector, l_footEffector, r_footEffector);\n
\n
    AllStages = new ECAActionStage[]\n
    \[\n
        new GoToStage(this, (ECAAnimatorDemo)EcaAnimator, Destination),\n
        new TurnStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint, true),\n
        new SitStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint),\n
        new StandUpStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint)\n
    \];\n
\]"}
#4{11 12 "SetSitPoint"}
#4{4 5 "void"}
#4{11 12 "Transform t"}
#4{0 1 ""}
}
#3{#4{8 9 "96615224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "SitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94481040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "Destination"}
 1.8 1.88 4.4 10  26 #4{0 1 ""}
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
}
:CLSCSSem.1118481{ 56  51 @18 @52 @32 @0 #5{16 3@99 @84 @3 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@60 @72 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@40 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
