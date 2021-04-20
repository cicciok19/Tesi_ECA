:ArrayOb.273{6:Dictionary.4369{32 22:SLSPublicMethod.286331408{:String.17{9 10 "118887376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "EndLookAt"}
 1.3 0.88 3.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{242 243 "\[\n
    //DOVREI FARLO CON GLI ANGOLI E NON CON IL TEMPO\n
    yield return new WaitForSeconds(1f);\n
    //MxM_stopStrafing();\n
    m_trajectory.FaceDirectiononIdle = false;\n
    if (IsLookingAt != null)\n
        IsLookingAt(this, EventArgs.Empty);\n
\]"}
#4{9 10 "EndLookAt"}
#4{19 20 "virtual IEnumerator"}
#4{11 12 "Vector3 dir"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "155403296"}
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
@0  52 45 0.4 0 0 #4{35 37 "public ECAAnimatorMxM : ECAAnimator"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.92497 4.34043 0
 0  0 #4{21 23 "public ECAAnimatorMxM"}
#4{11 12 "ECAAnimator"}
#4{0 13 ""}
:OrderedCltn.4369{16 3#4{38 39 "public event EventHandler IsLookingAt;"}
#4{40 41 "public event EventHandler EventComplete;"}
#4{39 40 "public event EventHandler EventContact;"}
}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "155398984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_removeRequiredTag"}
 1.3 0.88 8.4 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{42 43 "\[\n
    m_animator.RemoveRequiredTag(tag);\n
\]"}
#4{21 22 "MxM_removeRequiredTag"}
#4{12 13 "virtual void"}
#4{10 11 "String tag"}
#4{0 1 ""}
}
#3{#4{9 10 "118888160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 115 "\[\n
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
 0.3 0.879999 6.8 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{147 148 "\[\n
    while (!m_animator.IsEventComplete)\n
        yield return null;\n
    if (EventComplete != null)\n
        EventComplete(this, EventArgs.Empty);\n
\]"}
#4{17 18 "WaitEventComplete"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155399768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "MxM_SetTag"}
 1.3 0.88 4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{75 76 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.AddRequiredTag(tag);\n
\]"}
#4{10 11 "MxM_SetTag"}
#4{12 13 "virtual void"}
#4{10 11 "string tag"}
#4{0 1 ""}
}
#3{#4{9 10 "155398592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "MxM_startStrafing"}
 1.3 0.88 6.8 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{269 270 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.SetRequiredTag(\"Strafe\");\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;\n
    m_animator.AngularErrorWarpRate = 360f;\n
\]"}
#4{17 18 "MxM_startStrafing"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "118884240"}
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
#3{#4{9 10 "155399376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "MxM_BeginEvent"}
 1.3 0.88 5.6 1  10 #4{0 1 ""}
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
#4{14 15 "MxM_BeginEvent"}
#4{12 13 "virtual void"}
#4{54 55 "string id, Transform contact = null, string tag = null"}
#4{0 1 ""}
}
#3{#4{9 10 "155401728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "MxM_waitForEventContact"}
 1.3 0.879999 9.2 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 44 "\[\n
    StartCoroutine(WaitEventContact());\n
\]"}
#4{23 24 "MxM_waitForEventContact"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "155402512"}
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
 0  0 #4{259 260 "/* File ECAAnimator C# implementation of class ECAAnimator */\n
\n
\n
\n
\n
\n
using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
using CrazyMinnow.SALSA;\n
using UnityEngine.AI;\n
using DG.Tweening;\n
using MxM;\n
"}
}
#3{#4{9 10 "155400160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_clearRequiredTags"}
 1.3 0.88 8.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 40 "\[\n
    m_animator.ClearRequiredTags();\n
\]"}
#4{21 22 "MxM_clearRequiredTags"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155398200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "WaitEventContact"}
 0.3 0.879999 6.4 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{168 169 "\[\n
    while (m_animator.CurrentEventState != EEventState.Action)\n
        yield return null;\n
    if (EventContact != null)\n
        EventContact(this, EventArgs.Empty);\n
\]"}
#4{16 17 "WaitEventContact"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "118884632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "LookAt"}
 1.3 0.88 2.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{444 445 "\[\n
    //If the target is not specified, the ECA will look to the player\n
    if (target == null)\n
        target = Player.transform;\n
\n
    Vector3 dir = (target.position - this.transform.position).normalized;\n
\n
    //MxM_startStrafing();\n
    m_trajectory.FaceDirectiononIdle = true;\n
\n
    if (!oppositeDirection)\n
        m_trajectory.StrafeDirection = dir;\n
    else\n
        m_trajectory.StrafeDirection = -dir;\n
\n
    StartCoroutine(EndLookAt(dir));\n
\]"}
#4{6 7 "LookAt"}
#4{12 13 "virtual void"}
#4{55 56 "Transform target = null, bool oppositeDirection = false"}
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
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{45 46 " new Dictionary<String, MxMEventDefinition>()"}
#4{0 1 ""}
}
#3{#4{9 10 "155400944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "MxM_stopStrafing"}
 1.3 0.88 6.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{224 225 "\[\n
    m_animator.ClearRequiredTags();\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;\n
    m_animator.AngularErrorWarpRate = 45f;\n
\]"}
#4{16 17 "MxM_stopStrafing"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "155403688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "MxM_waitForEventComplete"}
 1.3 0.879999 9.6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 45 "\[\n
    StartCoroutine(WaitEventComplete());\n
\]"}
#4{24 25 "MxM_waitForEventComplete"}
#4{12 13 "virtual void"}
#4{0 1 ""}
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
#7{16 0}
#7{16 0}
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
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @27 @152 @235 @0 #7{16 0}
#7{16 0}
#7{16 0}
#7{16 2@15 @140 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @196 @0 @243 @0 @258 @0 @0 @0 }
#1{16@104 @184 @3 @56 @116 @80 @92 @211 @160 @44 @223 @68 @128 @172 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
