:ArrayOb.273{6:Dictionary.4369{16 7:JLSGlobalDeclare.286331408{:String.17{9 10 "130155088"}
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
:SLSThisIcon.286331409{#4{9 10 "129264528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public ECA_pickUpAction : ECAAction"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{23 24 "public ECA_pickUpAction"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "94484120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "Destination"}
 1.8 1.88 4.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "Destination"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "94481920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{499 500 ": base(ecaAnimator)\n
\[\n
        Destination = destination;\n
        ObjToPick = obj;\n
\n
        HandEmpty = GameObject.FindGameObjectWithTag(\"HandEmpty\").transform;\n
\n
        AllStages = new ECAActionStage[]\n
        \[\n
            new GoToStage(this, (ECAAnimatorDemo)EcaAnimator, Destination),\n
            new PickUpStage(this, (ECAAnimatorDemo)EcaAnimator, ObjToPick, HandEmpty),\n
            new PickDownStage(this, (ECAAnimatorDemo)EcaAnimator, ObjToPick, HandEmpty)\n
        \];\n
\n
        SetupAction();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{61 62 "ECAAnimator ecaAnimator, Transform destination, Transform obj"}
#4{0 1 ""}
}
#7{#4{8 9 "94482800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "HandEmpty"}
 2.2 1.88 3.6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "HandEmpty"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130156624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{8 9 "94480160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "ObjToPick"}
 2.2 1.88 3.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "ObjToPick"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @11 @3 @67 @0 #6{16 0}
#6{16 3@25 @75 @52 }
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@40 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
