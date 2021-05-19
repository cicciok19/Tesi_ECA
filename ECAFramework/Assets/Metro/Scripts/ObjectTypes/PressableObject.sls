:ArrayOb.273{6:Dictionary.4369{32 18:SLSThisIcon.286331409{:String.17{9 10 "131625336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public PressableObject : MonoBehaviour"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{22 23 "public PressableObject"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "74948040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "SetReachCurve"}
 1.3 0.88 5.2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{289 290 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] ks = new Keyframe[4];\n
\n
    ks[0] = new Keyframe(0, v1, 0, 0);\n
    ks[1] = new Keyframe(0.6f, v2, 0, 0);\n
    ks[2] = new Keyframe(1.2f, v2, 0, 0);\n
    ks[3] = new Keyframe(1.6f, v3, 0, 0);\n
\n
    curve = new AnimationCurve(ks);\n
\n
    return curve;\n
\]"}
#4{13 14 "SetReachCurve"}
#4{14 15 "AnimationCurve"}
#4{28 29 "float v1, float v2, float v3"}
#4{0 1 ""}
}
#6{#4{8 9 "74950000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{117 118 "\[\n
    pressPosition = GameObject.Instantiate((GameObject)Resources.Load(\"Prefab/PressPosition_R\"), this.transform);\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "75463800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "positionWeight"}
 1.2 1.88 5.6 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "positionWeight"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75465120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "rotateBoneWeight"}
 0.8 1.88 6.4 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "rotateBoneWeight"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "74955488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "SetPositionWeightCurve"}
 1.3 0.88 8.8 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{307 308 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] ks = new Keyframe[4];\n
\n
    ks[0] = new Keyframe(0, minValue, 0, 0);\n
    ks[1] = new Keyframe(0.5f, maxValue, 0, 0);\n
    ks[2] = new Keyframe(1, maxValue, 0, 0);\n
    ks[3] = new Keyframe(2, minValue, 0, 0);\n
\n
    curve = new AnimationCurve(ks);\n
\n
    return curve;\n
\]"}
#4{22 23 "SetPositionWeightCurve"}
#4{14 15 "AnimationCurve"}
#4{30 31 "float minValue, float maxValue"}
#4{0 1 ""}
}
#7{#4{8 9 "75468640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "pivot"}
 3 1.88 2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "pivot"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "103571368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "GetPressPosition"}
 0.3 0.88 6.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{206 207 "\[\n
    GameObject gop = Instantiate(pressPosition);\n
    //gop.GetComponent<Renderer>().enabled = false;\n
    gop.transform.parent = transform;\n
    gop.transform.localPosition = Vector3.zero;\n
    return gop;\n
\]"}
#4{16 17 "GetPressPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "131015560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{8 9 "74950392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "SetGaussianCurve"}
 1.3 0.88 6.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{261 262 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] kS = new Keyframe[3];\n
\n
    kS[0] = new Keyframe(0, minValue, 0, 0);\n
    kS[1] = new Keyframe(.5f, maxValue, 0, 0);\n
    kS[2] = new Keyframe(1, minValue, 0, 0);\n
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
#6{#4{9 10 "131572016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "SetPositionOffsetYCurve"}
 1.3 0.88 9.2 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{373 374 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] ks = new Keyframe[6];\n
\n
    ks[0] = new Keyframe(0, v1, 0, 0);\n
    ks[1] = new Keyframe(0.5f, v2, 0, 0);\n
    ks[2] = new Keyframe(0.55f, v1, 0, 0);\n
    ks[3] = new Keyframe(0.95f, v1, 0, 0);\n
    ks[4] = new Keyframe(1, v3, 0, 0);\n
    ks[5] = new Keyframe(1.5f, v1, 0, 0);\n
\n
\n
    curve = new AnimationCurve(ks);\n
\n
    return curve;\n
\]"}
#4{23 24 "SetPositionOffsetYCurve"}
#4{14 15 "AnimationCurve"}
#4{28 29 "float v1, float v2, float v3"}
#4{0 1 ""}
}
#6{#4{8 9 "74952352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "SetupInteractionObject"}
 1.3 0.88 8.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2513 2514 "\[\n
    pressPosition = new GameObject(name + \"_PressPosition\");\n
    pivot = new GameObject(\"Pivot\");\n
    pressPosition.transform.parent = transform;\n
\n
    pressPosition.transform.position = Vector3.zero;\n
    pressPosition.transform.rotation = Quaternion.identity;\n
    pressPosition.transform.localScale = Vector3.one;\n
\n
    interactionObj = pressPosition.gameObject.AddComponent<InteractionObject>();\n
\n
    positionWeight = SetPositionWeightCurve(0, 1f);\n
    reach = SetReachCurve(0.8f, 0, 0.65f);\n
    rotateBoneWeight = SetRotateBoneWeightCurve(0, 1f);\n
    positionOffsetY = SetPositionOffsetYCurve(0, 0.05f, 0.03f);\n
\n
    //creating the weight curves\n
    interactionObj.weightCurves = new InteractionObject.WeightCurve[4];\n
\n
    interactionObj.weightCurves[0] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[0].type = InteractionObject.WeightCurve.Type.PositionWeight;\n
    interactionObj.weightCurves[0].curve = positionWeight;\n
\n
    interactionObj.weightCurves[1] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[1].type = InteractionObject.WeightCurve.Type.Reach;\n
    interactionObj.weightCurves[1].curve = reach;\n
\n
    interactionObj.weightCurves[2] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[2].type = InteractionObject.WeightCurve.Type.RotateBoneWeight;\n
    interactionObj.weightCurves[2].curve = rotateBoneWeight;\n
\n
    interactionObj.weightCurves[3] = new InteractionObject.WeightCurve();\n
    interactionObj.weightCurves[3].type = InteractionObject.WeightCurve.Type.PositionOffsetY;\n
    interactionObj.weightCurves[3].curve = positionOffsetY;\n
\n
    //creating multipliers\n
    interactionObj.multipliers = new InteractionObject.Multiplier[2];\n
\n
    interactionObj.multipliers[0] = new InteractionObject.Multiplier();\n
    interactionObj.multipliers[0].curve = InteractionObject.WeightCurve.Type.RotateBoneWeight;\n
    interactionObj.multipliers[0].multiplier = 1f;\n
    interactionObj.multipliers[0].result = InteractionObject.WeightCurve.Type.PoserWeight;\n
\n
    //creating event\n
\n
    interactionObj.events = new InteractionObject.InteractionEvent[1];\n
\n
    interactionObj.events[0] = new InteractionObject.InteractionEvent();\n
    interactionObj.events[0].unityEvent = new UnityEngine.Events.UnityEvent();\n
    interactionObj.events[0].animations = new InteractionObject.AnimatorEvent[0];\n
    interactionObj.events[0].messages = new InteractionObject.Message[0];\n
    interactionObj.events[0].time = .5f;\n
    interactionObj.events[0].pause = false;\n
\]"}
#4{22 23 "SetupInteractionObject"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75467760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "interactionObj"}
 1.2 1.88 5.6 28  26 #4{0 1 ""}
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
#7{#4{8 9 "75470400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "pressPosition"}
 1.4 1.88 5.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "pressPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
#6{#4{8 9 "74953136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "SetRotateBoneWeightCurve"}
 1.3 0.88 9.6 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{286 287 "\[\n
    AnimationCurve curve;\n
\n
    Keyframe[] ks = new Keyframe[4];\n
\n
    ks[0] = new Keyframe(0, v1, 0, 0);\n
    ks[1] = new Keyframe(0.5f, v2, 0, 0);\n
    ks[2] = new Keyframe(1, v2, 0, 0);\n
    ks[3] = new Keyframe(1.5f, v1, 0, 0);\n
\n
    curve = new AnimationCurve(ks);\n
\n
    return curve;\n
\]"}
#4{24 25 "SetRotateBoneWeightCurve"}
#4{14 15 "AnimationCurve"}
#4{18 19 "float v1, float v2"}
#4{0 1 ""}
}
#7{#4{8 9 "75464240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "reach"}
 3 1.88 2 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "reach"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75469960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "positionOffsetY"}
 1 1.88 6 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "positionOffsetY"}
#4{14 15 "AnimationCurve"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "131021704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{105 106 "using RootMotion.FinalIK;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
}
:CLSCSSem.1118481{ 56  51 @3 @226 @110 @0 #5{16 7@169 @83 @154 @41 @196 @56 @211 }
#5{16 0}
#5{16 7@29 @142 @118 @71 @17 @184 @130 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@98 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
