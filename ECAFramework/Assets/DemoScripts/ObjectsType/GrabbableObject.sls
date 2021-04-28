:ArrayOb.273{6:Dictionary.4369{16 9:SLSThisIcon.286331409{:String.17{9 10 "141977712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public GrabbableObject : MonoBehaviour"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{22 23 "public GrabbableObject"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "144398144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "curveOne"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "curveOne"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75518496"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "74425192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "SetGaussianCurve"}
 1.3 0.88 6.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{301 302 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] kS = new Keyframe[3];\n
    \n
    kS[0] = new Keyframe(0, minValue, 0, 0);\n
    kS[1] = new Keyframe(.5f, maxValue, 0, 0);\n
    kS[2] = new Keyframe(1, minValue, 0, 0);\n
    //curve.curve = AnimationCurve.\n
\n
    curve = new AnimationCurve(kS);\n
\n
    return curve;\n
\]"}
#4{16 17 "SetGaussianCurve"}
#4{14 15 "AnimationCurve"}
#4{30 31 "float minValue, float maxValue"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "74424408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1413 1414 "\[\n
    interactionObj = this.gameObject.AddComponent<InteractionObject>();\n
    curveOne = SetGaussianCurve(0, 1);\n
    curveTwo = SetGaussianCurve(0, .23f);\n
\n
    //creating the weight curves\n
    interactionObj.weightCurves = new InteractionObject.WeightCurve[2];\n
    interactionObj.weightCurves[0] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[0].type = InteractionObject.WeightCurve.Type.PositionWeight;\n
    interactionObj.weightCurves[0].curve = curveOne;\n
\n
    interactionObj.weightCurves[1] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[1].type = InteractionObject.WeightCurve.Type.Reach;\n
    interactionObj.weightCurves[1].curve = curveTwo;\n
\n
    //creating multipliers\n
    interactionObj.multipliers = new InteractionObject.Multiplier[2];\n
    interactionObj.multipliers[0] = new InteractionObject.Multiplier();\n
    interactionObj.multipliers[0].curve = InteractionObject.WeightCurve.Type.PositionWeight;\n
    interactionObj.multipliers[0].multiplier = 1;\n
    interactionObj.multipliers[0].result = InteractionObject.WeightCurve.Type.RotateBoneWeight;\n
\n
    interactionObj.multipliers[1] = new InteractionObject.Multiplier();\n
    interactionObj.multipliers[1].curve = InteractionObject.WeightCurve.Type.PositionWeight;\n
    interactionObj.multipliers[1].multiplier = 1;\n
    interactionObj.multipliers[1].result = InteractionObject.WeightCurve.Type.PositionWeight;\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "144396824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "curveTwo"}
 2.4 1.88 3.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "curveTwo"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{8 9 "74431464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "144397264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "interactionObj"}
 1.2 1.88 5.6 10  26 #4{0 1 ""}
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
:JLSGlobalDeclare.286331408{#4{8 9 "75518240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{129 130 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using RootMotion.Demos;\n
using RootMotion.FinalIK;\n
"}
}
}
:CLSCSSem.1118481{ 56  51 @3 @106 @32 @0 #5{16 0}
#5{16 3@91 @17 @64 }
#5{16 1@40 }
#5{16 2@52 @79 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
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
