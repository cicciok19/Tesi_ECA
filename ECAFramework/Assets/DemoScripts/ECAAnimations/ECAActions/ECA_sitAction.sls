:ArrayOb.273{6:Dictionary.4369{16 9:SLSPrivateMember.286331409{:String.17{8 9 "94483240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
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
:SLSPublicMethod.286331408{#4{9 10 "118885416"}
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
#6{#4{9 10 "118886200"}
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
:SLSThisIcon.286331409{#4{9 10 "129270600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{32 33 "public ECA_sitAction : ECAAction"}
 17.1486 2.2 20.48 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public ECA_sitAction"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{8 9 "94485440"}
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
#3{#4{8 9 "94485880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{20 21 "SmartActionToStandUp"}
 0.299999 1.88 8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{20 21 "SmartActionToStandUp"}
#4{11 12 "SmartAction"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130157392"}
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
:SLSConstructor.286331408{#4{8 9 "94480600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{476 477 ": base(ecaAnimator)\n
\[\n
        Destination = destination;\n
        SitPoint = sitPoint;\n
\n
        AllStages = new ECAActionStage[]\n
        \[\n
            new GoToStage(this, (ECAAnimatorDemo)EcaAnimator, Destination),\n
            new TurnStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint, true),\n
            new SitStage(this, (ECAAnimatorDemo)EcaAnimator, SitPoint),\n
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
:JLSFriendDeclare.286331408{#4{9 10 "130159696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @42 @86 @106 @0 #5{16 3@56 @3 @71 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@30 @18 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@94 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
