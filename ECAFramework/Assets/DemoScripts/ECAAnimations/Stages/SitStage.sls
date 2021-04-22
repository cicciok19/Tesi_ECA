:ArrayOb.273{6:Dictionary.4369{16 11:SLSPrivateMember.286331409{:String.17{9 10 "131455152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "leftFootEffector"}
 0.799999 1.88 6.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "leftFootEffector"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "131451192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "rightFootEffector"}
 0.6 1.88 6.8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "rightFootEffector"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "162898024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "sittableObject"}
 1.2 1.88 5.6 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "sittableObject"}
#4{14 15 "SittableObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "163992200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{25 26 "SitStage : ECAActionStage"}
 18.4286 2.2 16 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{8 16 "SitStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "164811664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{272 536 "\[\n
    Utility.Log(\"SitStage::StartStage\");\n
    animator.TriggerAnimation(\"SitDown\", sitPoint);\n
\n
    SetWeightsForSitting();\n
    sittableObject.Occupied = true;\n
\n
    animator.TriggeredAnimationComplete += OnEventComplete;\n
    animator.WaitForTriggeredAnimationComplete();\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "131455592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "SittableObject o"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{228 229 "\[\n
    Assert.IsNotNull(obj);\n
\n
    sittableObject = obj;\n
    sitPoint = sittableObject.GetSitPoint();\n
    rightFootEffector = sittableObject.GetRightFootTransform();\n
    leftFootEffector = sittableObject.GetLeftFootTransform();\n
\]"}
#4{8 12 "SitStage"}
#4{0 1 ""}
#4{18 20 "SittableObject obj"}
#4{0 1 ""}
}
#3{#4{9 10 "131456032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "sitPoint"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "sitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "162512744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "155857176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "SetWeightsForSitting"}
 1.3 0.88 8 10  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{648 649 "\[\n
    ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);\n
\n
    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.bodyEffector, 0.6f, 0.02f);\n
    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightFootEffector, 0.7f, 0.01f);\n
    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 0.7f, 0.01f);\n
    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0.2f, 0.05f);\n
    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0.2f, 0.05f);\n
\]"}
#4{20 21 "SetWeightsForSitting"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "164809704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 68 "\[\n
    animator.SetAnimationGroup(\"Sitting\");\n
    base.EndStage();\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "162514280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{123 124 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using System;\n
"}
}
}
:CLSCSSem.1118481{ 56  51 @48 @133 @101 @0 #5{16 3@86 @3 @18 }
#5{16 1@33 }
#5{16 0}
#5{16 1@109 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@62 @121 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@74 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
