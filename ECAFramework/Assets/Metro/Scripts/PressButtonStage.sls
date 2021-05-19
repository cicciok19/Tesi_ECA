:ArrayOb.273{6:Dictionary.4369{32 18:SLSInternalMember.286331409{:String.17{9 10 "103984232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "effector"}
 2.4 1.88 3.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "effector"}
#4{21 22 "FullBodyBipedEffector"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104347688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{497 498 "\[\n
    base.Update();\n
    if (startEvaluate)\n
    \[\n
        if (hand == HandSide.RightHand)\n
        \[\n
            if (Vector3.Distance(startPosition.position, animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand).position) < 0.5f)\n
                EndStage();\n
        \]\n
        else\n
        \[\n
            if (Vector3.Distance(startPosition.position, animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand).position) < 0.5f)\n
                EndStage();\n
        \]\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "104348864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "SetupInteractionSystem"}
 1.3 0.88 8.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{89 90 "\[\n
    ikManager.interactionSystem.Start();\n
    ikManager.interactionSystem.speed = .5f;\n
\]"}
#4{22 23 "SetupInteractionSystem"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "104562280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "startPosition"}
 1.4 1.88 5.2 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "startPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104558760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "interactionObj"}
 1.2 1.88 5.6 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "interactionObj"}
#4{17 18 "InteractionObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103983352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "target"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "target"}
#4{15 16 "PressableObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "104559200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "startEvaluate"}
 1.4 1.88 5.2 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "startEvaluate"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{6 7 " false"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "104352000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnWaitCompleted"}
 1.3 0.88 6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{57 58 "\[\n
    base.OnWaitCompleted();\n
    startEvaluate = true;\n
\]"}
#4{15 16 "OnWaitCompleted"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "104561400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "pivot"}
 3 1.88 2 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "pivot"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103984672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{4 5 "hand"}
 3.2 1.88 1.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4 5 "hand"}
#4{8 9 "HandSide"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{17 18 " HandSide.Nothing"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131541640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{40 41 "public PressButtonStage : ECAActionStage"}
 15.6857 2.2 25.6 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{23 24 "public PressButtonStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "104331136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{9 10 "104350824"}
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
#6{#4{9 10 "104346904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1423 1424 "\[\n
    base.StartStage();\n
\n
    animatorMxM = (ECAAnimatorMxM)animator;\n
\n
    interactionObj = target.GetComponentInChildren<InteractionObject>();\n
    Assert.IsNotNull(interactionObj);\n
\n
    if (hand == HandSide.Nothing)\n
    \[\n
        Transform rightHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);\n
        Transform leftHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);\n
\n
        if (Vector3.Distance(rightHand.position, interactionObj.transform.position) < Vector3.Distance(leftHand.position, interactionObj.transform.position))\n
        \[\n
            hand = HandSide.RightHand;\n
        \]\n
        else\n
        \[\n
            hand = HandSide.LeftHand;\n
            startPosition = leftHand;\n
        \]\n
\n
    \]\n
\n
    SetupInteractionSystem();\n
\n
    if (hand == HandSide.LeftHand)\n
    \[\n
        effector = FullBodyBipedEffector.LeftHand;\n
        startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);\n
        ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, interactionObj, false);\n
    \]\n
    else if (hand == HandSide.RightHand)\n
    \[\n
        effector = FullBodyBipedEffector.RightHand;\n
        startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);\n
        ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, interactionObj, false);\n
    \]\n
\n
    WaitFor(2f);\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "104563600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "PressableObject "}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{95 96 ": base()\n
\[\n
        this.target = target;\n
        Assert.IsNotNull(target);\n
        hand = hs;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{54 55 "PressableObject target, HandSide hs = HandSide.Nothing"}
#4{0 1 ""}
}
#3{#4{9 10 "103977192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "animatorMxM"}
 1.8 1.88 4.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "animatorMxM"}
#4{14 15 "ECAAnimatorMxM"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "104333440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{146 147 "using RootMotion.FinalIK;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using MxM;\n
"}
}
#3{#4{9 10 "104560080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "mecanimAnimator"}
 1 1.88 6 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "mecanimAnimator"}
#4{8 9 "Animator"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @144 @217 @158 @0 #5{16 3@114 @42 @87 }
#5{16 0}
#5{16 1@30 }
#5{16 1@102 }
#5{16 6@72 @129 @3 @202 @225 @57 }
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@178 @166 @18 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@190 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
