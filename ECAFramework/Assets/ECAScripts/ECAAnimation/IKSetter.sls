:ArrayOb.273{6:Dictionary.4369{16 13:SLSPublicMethod.286331408{:String.17{8 9 "94197168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "SetTargetFullBodyIK"}
 1.3 0.88 7.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{527 528 "\[\n
    fullBody.solver.bodyEffector.position = bodyEffector.position;\n
    if(leftHandEffector != null)\n
        fullBody.solver.leftHandEffector.position = leftHandEffector.position;\n
    if (rightHandEffector != null)\n
        fullBody.solver.rightHandEffector.position = rightHandEffector.position;\n
    if (leftFootEffector != null)\n
        fullBody.solver.leftFootEffector.position = leftFootEffector.position;\n
    if (rightFootEffector != null)\n
        fullBody.solver.rightFootEffector.position = rightFootEffector.position;\n
\]"}
#4{19 20 "SetTargetFullBodyIK"}
#4{12 13 "virtual void"}
#4{190 191 "FullBodyBipedIK fullBody, Transform bodyEffector, Transform leftHandEffector = null, Transform rightHandEffector = null, Transform leftFootEffector = null, Transform rightFootEffector = null"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "94202264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "SetFullBodyIK"}
 1.3 0.88 5.2 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{139 140 "\[\n
    FullBodyBipedIK BodyIK = this.gameObject.AddComponent<FullBodyBipedIK>();\n
    BodyIK.solver.rootNode = rootNode;\n
    return BodyIK;\n
\]"}
#4{13 14 "SetFullBodyIK"}
#4{15 16 "FullBodyBipedIK"}
#4{18 19 "Transform rootNode"}
#4{0 1 ""}
 0}
#3{#4{8 9 "94197952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "SetWeightsFullBodyIK"}
 1.3 0.88 8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{170 171 "\[\n
    if (effector != null)\n
        StartCoroutine(SetWeightFullIK(effector, weight, speed));\n
    else\n
        Debug.Log(\"The effector is null, first set the target.\");\n
\]"}
#4{20 21 "SetWeightsFullBodyIK"}
#4{12 13 "virtual void"}
#4{53 54 "IKEffector effector, float weight, float speed = .01f"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "129754464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{150 151 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using RootMotion.FinalIK;\n
\n
\n
//principal class for setting the Final IK\n
"}
}
#5{#4{8 9 "94203048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "SetIKRightHand"}
 1.3 0.88 5.6 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{365 366 "\[\n
    AimIK RightIK = this.gameObject.AddComponent<AimIK>();\n
    RightIK.solver.transform = rightHandBone;\n
    RightIK.solver.axis = RightIK.solver.transform.position.normalized;\n
    RightIK.solver.AddBone(rightShoulder);\n
    RightIK.solver.AddBone(rightArm);\n
    RightIK.solver.AddBone(rightForeArm);\n
    RightIK.solver.IKPositionWeight = 0;\n
\n
    return RightIK;\n
\]"}
#4{14 15 "SetIKRightHand"}
#4{5 6 "AimIK"}
#4{92 93 "Transform rightHandBone, Transform rightForeArm, Transform rightArm, Transform rightShoulder"}
#4{0 1 ""}
 0}
#3{#4{8 9 "94196776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "SetTargetAimIK"}
 1.3 0.88 5.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{250 251 "\[\n
    aimIK.solver.IKPosition = target.position;\n
    if (aimIK.solver.IKPosition != null)\n
    \[\n
        StartCoroutine(SetWeightAimIK(aimIK, weight, speed));\n
    \]\n
    else\n
    \[\n
        Debug.Log(\"The target is null, first set the target.\");\n
    \]\n
\]"}
#4{14 15 "SetTargetAimIK"}
#4{12 13 "virtual void"}
#4{68 69 "AimIK aimIK, Transform target, float weight = 1f, float speed = .01f"}
#4{0 1 ""}
}
#5{#4{8 9 "94196384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "SetIKHead"}
 1.3 0.88 3.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{267 268 "\[\n
    AimIK HeadIK = this.gameObject.AddComponent<AimIK>();\n
    HeadIK.solver.transform = headBone;\n
    HeadIK.solver.axis = HeadIK.solver.transform.position.normalized;\n
    HeadIK.solver.AddBone(neckBone);\n
    HeadIK.solver.IKPositionWeight = 0;\n
    return HeadIK;\n
\]"}
#4{9 10 "SetIKHead"}
#4{5 6 "AimIK"}
#4{38 39 "Transform headBone, Transform neckBone"}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{9 10 "129754720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#5{#4{8 9 "94201872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "SetIKLeftHand"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{352 353 "\[\n
    AimIK LeftIK = this.gameObject.AddComponent<AimIK>();\n
    LeftIK.solver.transform = leftHandBone;\n
    LeftIK.solver.axis = LeftIK.solver.transform.position.normalized;\n
    LeftIK.solver.AddBone(leftShoulder);\n
    LeftIK.solver.AddBone(leftArm);\n
    LeftIK.solver.AddBone(leftForeArm);\n
    LeftIK.solver.IKPositionWeight = 0;\n
\n
    return LeftIK;\n
\]"}
#4{13 14 "SetIKLeftHand"}
#4{5 6 "AimIK"}
#4{88 89 "Transform leftHandBone, Transform leftForeArm, Transform leftArm, Transform leftShoulder"}
#4{0 1 ""}
 0}
#5{#4{8 9 "94198736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "SetWeightAimIK"}
 1.3 0.88 5.6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{460 461 "\[\n
    float var = aimIK.solver.IKPositionWeight;\n
\n
    if (var < weight)\n
    \[\n
        while (var < weight)\n
        \[\n
            aimIK.solver.SetIKPositionWeight(var);\n
            yield return new WaitForSeconds(speed);\n
            var += .01f;\n
        \]\n
    \]\n
    else\n
    \[\n
        while (var > weight)\n
        \[\n
            aimIK.solver.SetIKPositionWeight(var);\n
            yield return new WaitForSeconds(speed);\n
            var -= .01f;\n
        \]\n
    \]\n
\]"}
#4{14 15 "SetWeightAimIK"}
#4{11 12 "IEnumerator"}
#4{38 39 "AimIK aimIK, float speed, float weight"}
#4{0 1 ""}
 0}
#3{#4{8 9 "94198344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "SetWeightTargetAimIK"}
 1.3 0.88 8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{179 180 "\[\n
    if (aimIK.solver.IKPosition != null)\n
        StartCoroutine(SetWeightAimIK(aimIK, weight, speed));\n
    else\n
        Debug.Log(\"The target is null, first set the target.\");\n
\]"}
#4{20 21 "SetWeightTargetAimIK"}
#4{12 13 "virtual void"}
#4{45 46 "AimIK aimIK, float weight, float speed = .01f"}
#4{0 1 ""}
}
#5{#4{8 9 "94199128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SetWeightFullIK"}
 1.3 0.88 6 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{438 439 "\[\n
    float var = effector.positionWeight;\n
\n
    if (var < weight)\n
    \[\n
        while (var < weight)\n
        \[\n
            var += .01f;\n
            effector.positionWeight = var;\n
            yield return new WaitForSeconds(speed);\n
        \]\n
    \]\n
    else\n
    \[\n
        while (var > weight)\n
        \[\n
            var -= .01f;\n
            effector.positionWeight = var;\n
            yield return new WaitForSeconds(speed);\n
        \]\n
    \]\n
\]"}
#4{15 16 "SetWeightFullIK"}
#4{11 12 "IEnumerator"}
#4{46 47 "IKEffector effector, float weight, float speed"}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{8 9 "94276208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{31 32 "public IKSetter : MonoBehaviour"}
 17.3314 2.2 19.84 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{15 16 "public IKSetter"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @139 @39 @83 @0 #9{16 0}
#9{16 0}
#9{16 0}
#9{16 6@71 @47 @91 @15 @103 @127 }
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@59 @3 @27 @115 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
