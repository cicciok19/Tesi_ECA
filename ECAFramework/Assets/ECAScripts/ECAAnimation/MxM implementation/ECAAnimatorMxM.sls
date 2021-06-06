:ArrayOb.273{6:Dictionary.4369{32 27:SLSProtectMethod.286331408{:String.17{9 10 "155403296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "SetEventDefinitions"}
 1.3 0.88 7.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{310 311 "\[\n
    foreach (EventDefinitions eventDef in (EventDefinitions[])Enum.GetValues(typeof(EventDefinitions)))\n
    \[\n
        string s = eventDef.ToString();\n
        MxMEventDefinition ed = Resources.Load<MxMEventDefinition>(\"EventsDefinitions/EventDef_\" + eventDef);\n
        MxM_EventDefinitions.Add(s, ed);\n
    \]\n
\]"}
#4{19 20 "SetEventDefinitions"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "129305296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public ECAAnimatorMxM : ECAAnimator"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.4903 3.8472 1
 0  0 #4{21 23 "public ECAAnimatorMxM"}
#4{11 12 "ECAAnimator"}
#4{22 23 ".\\..\\..\\ECAScripts\\ECA"}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "163292928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "MxM_StartStrafing"}
 0.3 0.879999 6.8 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{269 270 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.SetRequiredTag(\"Strafe\");\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;\n
    m_animator.AngularErrorWarpRate = 360f;\n
\]"}
#4{17 18 "MxM_StartStrafing"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "118888160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{150 151 "\[\n
    Assert.IsNotNull(navMeshAgent);\n
    navMeshAgent.SetDestination(target);\n
    StartCoroutine(WaitArrival(target, arrivalDeltaDistance + 0.5f));\n
\]"}
#4{4 5 "GoTo"}
#4{13 14 "override void"}
#4{42 43 "Vector3 target, float arrivalDeltaDistance"}
#4{0 1 ""}
}
#3{#4{9 10 "155397808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "WaitEventComplete"}
 1.3 0.879999 6.8 10  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{134 135 "\[\n
    while (!m_animator.IsEventComplete)\n
        yield return null;\n
\n
    RaiseEvent(\"TriggeredAnimationComplete\", EventArgs.Empty);\n
\]"}
#4{17 18 "WaitEventComplete"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "155397809"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "WaitEventContact"}
 1.3 0.879999 6.4 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{156 157 "\[\n
    while (m_animator.CurrentEventState != EEventState.Action)\n
        yield return null;\n
\n
    RaiseEvent(\"TriggeredAnimationContact\", EventArgs.Empty);\n
\]"}
#4{16 17 "WaitEventContact"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{9 10 "155399768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "SetAnimationGroup"}
 1.3 0.88 6.8 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{75 76 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.AddRequiredTag(tag);\n
\]"}
#4{17 18 "SetAnimationGroup"}
#4{13 14 "override void"}
#4{10 11 "string tag"}
#4{0 1 ""}
}
#7{#4{9 10 "163294104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_ClearRequiredTags"}
 0.3 0.879999 8.4 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 40 "\[\n
    m_animator.ClearRequiredTags();\n
\]"}
#4{21 22 "MxM_ClearRequiredTags"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "118884240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 1.3 0.88 1.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{99 100 "\[\n
    base.Init();\n
\n
    //MxM setup\n
    SetMxMAnimatorAndTrajectory();\n
    SetEventDefinitions();\n
\]"}
#4{4 5 "Init"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "155399377"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "TriggerAnimation"}
 1.3 0.88 6.4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{313 314 "\[\n
    var eventDef = MxM_EventDefinitions[id];\n
\n
    if(contact != null)\n
    \[\n
        eventDef.ClearContacts();\n
        eventDef.AddEventContact(contact);\n
    \]\n
\n
    if (tag != null)\n
    \[\n
        m_animator.ClearRequiredTags();\n
        m_animator.AddRequiredTag(tag);\n
    \]\n
    m_animator.BeginEvent(eventDef);\n
\]"}
#4{16 24 "TriggerAnimation"}
#4{13 14 "override void"}
#4{54 55 "string id, Transform contact = null, string tag = null"}
#4{0 1 ""}
}
#7{#4{8 9 "75581448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "MxM_BlendController"}
 0.3 0.88 7.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{124 125 "\[\n
    if (value == 1f)\n
        m_animator.BlendInController(value);\n
    else\n
        m_animator.BlendOutController(value);\n
\]"}
#4{19 20 "MxM_BlendController"}
#4{4 5 "void"}
#4{11 12 "float value"}
#4{0 1 ""}
}
#7{#4{8 9 "75585368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{29 30 "SetWeightLayerMecanicAnimator"}
 0.3 0.88 11.6 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{60 61 "\[\n
    StartCoroutine(LayerAnimator(idLayer, weightLayer));\n
\]"}
#4{29 30 "SetWeightLayerMecanicAnimator"}
#4{4 5 "void"}
#4{30 31 "int idLayer, float weightLayer"}
#4{0 1 ""}
}
#7{#4{9 10 "130426472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "LookAt"}
 1.3 0.879999 2.4 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{410 411 "\[\n
    //If the target is not specified, the ECA will look to the player\n
    if (target == null)\n
        target = Player.transform;\n
    if (turnToSit)\n
    \[\n
        Vector3 dir = target.forward;\n
\n
        m_trajectory.FaceDirectiononIdle = true;\n
        m_trajectory.StrafeDirection = dir;\n
\n
        StartCoroutine(WaitLookAt(dir));\n
    \]\n
\n
    Debug.DrawRay(target.position, target.forward * 50, Color.red, 10);\n
\]"}
#4{6 7 "LookAt"}
#4{13 14 "override void"}
#4{47 48 "Transform target = null, bool turnToSit = false"}
#4{0 1 ""}
}
#3{#4{9 10 "155402512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{27 28 "SetMxMAnimatorAndTrajectory"}
 1.3 0.88 10.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{333 334 "\[\n
    m_animator = GetComponent<MxMAnimator>();\n
    if (m_animator == null)\n
        Utility.LogWarning(\"No MxM animator found for ECA: \" + Eca.Name);\n
\n
    m_trajectory = GetComponent<MxMTrajectoryGenerator_BasicAI>();\n
    if (m_animator == null)\n
        Utility.LogWarning(\"No MxM trajectory generator found for ECA: \" + Eca.Name);\n
\]"}
#4{27 28 "SetMxMAnimatorAndTrajectory"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSGlobalDeclare.286331408{#4{9 10 "130154064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{289 290 "/* File ECAAnimator C# implementation of class ECAAnimator */\n
\n
\n
\n
\n
\n
using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using UnityEngine.UI;\n
using CrazyMinnow.SALSA;\n
using UnityEngine.AI;\n
using DG.Tweening;\n
using MxM;\n
"}
}
#7{#4{9 10 "163295280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_RemoveRequiredTag"}
 0.3 0.879999 8.4 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{42 43 "\[\n
    m_animator.RemoveRequiredTag(tag);\n
\]"}
#4{21 22 "MxM_RemoveRequiredTag"}
#4{4 5 "void"}
#4{10 11 "String tag"}
#4{0 1 ""}
}
#7{#4{9 10 "130419024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "WaitLookAt"}
 1.3 0.879999 4 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{164 165 "\[\n
    //DOVREI FARLO CON GLI ANGOLI E NON CON IL TEMPO\n
    yield return new WaitForSeconds(.7f);\n
    m_trajectory.FaceDirectiononIdle = false;\n
    EndLookingAt();\n
\]"}
#4{10 11 "WaitLookAt"}
#4{20 21 "override IEnumerator"}
#4{11 12 "Vector3 dir"}
#4{0 1 ""}
}
#7{#4{9 10 "155398200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{33 34 "WaitForTriggeredAnimationComplete"}
 1.3 0.880001 13.2 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 169 "\[\n
    StartCoroutine(WaitEventComplete());\n
\]"}
#4{33 34 "WaitForTriggeredAnimationComplete"}
#4{13 21 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "96612144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{20 21 "MxM_EventDefinitions"}
 1.3 1.88 8 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{20 21 "MxM_EventDefinitions"}
#4{38 39 "Dictionary<String, MxMEventDefinition>"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{49 50 "     new Dictionary<String, MxMEventDefinition>()"}
#4{0 1 ""}
}
#7{#4{9 10 "164809312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ClearAnimationGroup"}
 1.3 0.879999 7.6 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 41 "\[\n
    m_animator.ClearRequiredTags();\n
\]"}
#4{19 20 "ClearAnimationGroup"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75584976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "MxM_SetMaskBodyPart"}
 0.3 0.88 7.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{121 122 "\[\n
    m_animator.AnimatorControllerMask.SetHumanoidBodyPartActive(bodyPart, active);\n
    m_animator.UpdateAvatarMask();\n
\]"}
#4{19 20 "MxM_SetMaskBodyPart"}
#4{4 5 "void"}
#4{56 57 "AvatarMaskBodyPart bodyPart, bool active, bool firstTime"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130154320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{9 10 "163289792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "MxM_StopStrafing"}
 0.3 0.879999 6.4 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{224 225 "\[\n
    m_animator.ClearRequiredTags();\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;\n
    m_animator.AngularErrorWarpRate = 45f;\n
\]"}
#4{16 17 "MxM_StopStrafing"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "163295672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{32 33 "WaitForTriggeredAnimationContact"}
 1.3 0.879999 12.8 1  31 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 44 "\[\n
    StartCoroutine(WaitEventContact());\n
\]"}
#4{32 33 "WaitForTriggeredAnimationContact"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "75586152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "LayerAnimator"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{525 526 "\[\n
    \n
    float var = mecanimAnimator.GetLayerWeight(idLayer);\n
\n
    if(var < weightLayer)\n
    \[\n
        while (var < weightLayer)\n
        \[\n
            mecanimAnimator.SetLayerWeight(idLayer, var);\n
            var += .01f;\n
            yield return new WaitForSeconds(.005f);\n
        \]\n
    \]\n
    else if(var > weightLayer)\n
    \[\n
        while (var > weightLayer)\n
        \[\n
            mecanimAnimator.SetLayerWeight(idLayer, var);\n
            var -= .01f;\n
            yield return new WaitForSeconds(.005f);\n
        \]\n
    \]\n
\]"}
#4{13 14 "LayerAnimator"}
#4{11 12 "IEnumerator"}
#4{30 31 "int idLayer, float weightLayer"}
#4{0 1 ""}
 0}
#9{#4{8 9 "96611704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "m_trajectory"}
 1.3 1.88 4.8 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "m_trajectory"}
#4{30 31 "MxMTrajectoryGenerator_BasicAI"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{8 9 "96613464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "m_animator"}
 1.3 1.88 4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "m_animator"}
#4{11 12 "MxMAnimator"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @15 @173 @256 @0 #6{16 0}
#6{16 0}
#6{16 0}
#6{16 5@3 @161 @65 @53 @288 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @217 @0 @300 @0 @315 @0 @0 @0 }
#1{36@101 @125 @244 @41 @113 @77 @137 @0 @0 @0 @0 @0 @0 @0 @149 @193 @29 @264 @89 @181 @0 @0 @0 @0 @232 @276 @205 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{366 367 "/*      CG&VG group @ Politecnico di Torino               */\n
/*              All Rights Reserved\t                      */\n
/*                                                        */\n
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */\n
/*  The copyright notice above does not evidence any      */\n
/*  actual or intended publication of such source code.   */\n
"}
#6{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
