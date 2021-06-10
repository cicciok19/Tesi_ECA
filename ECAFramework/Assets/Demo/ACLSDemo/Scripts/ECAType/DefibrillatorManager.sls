:ArrayOb.273{6:Dictionary.4369{32 18:SLSPublicMember.286331409{:String.17{9 10 "138802256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "intentNames"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "intentNames"}
#4{8 9 "string[]"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{29 30 " \[ \"AttachMonitor\", \"Shock\" \]"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "138751832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnShockCompleted"}
 1.3 0.88 6.4 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{34 35 "\[\n
    patient.OnShockReceived();\n
\]"}
#4{16 17 "OnShockCompleted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "108271560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{224 225 "\[\n
    base.Handle(intent);\n
\n
    switch (intent.IntentName)\n
    \[\n
        case \"AttachMonitor\":\n
            HandleAttachMonitor();\n
            break;\n
        case \"Shock\":\n
            HandleShock();\n
            break;\n
    \]\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "138796536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "defibrillatorTable"}
 0.400002 1.88 7.2 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "defibrillatorTable"}
#4{18 19 "DefibrillatorTable"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "138800496"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "shock"}
 3 1.88 2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "shock"}
#4{5 6 "Shock"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "138752224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "OnRythm"}
 1.3 0.88 2.8 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{218 219 "\[\n
    if (patient.state == PatientState.VF)\n
        Debug.Log(\"VF\");\n
    else if (patient.state == PatientState.Asystole)\n
        Debug.Log(\"Asystole\");\n
    else\n
        Debug.LogError(\"Patient State is not setted\");\n
\]"}
#4{7 8 "OnRythm"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "108272736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{57 58 "\[\n
    return gameObject.AddComponent<ECAAnimatorMxM>();\n
\]"}
#4{14 15 "AddECAAnimator"}
#4{20 21 "override ECAAnimator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{9 10 "108271952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.88 12.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{198 199 "\[\n
    IntentName = new List<string> \[ \"AttachMonitor\", \"Shock\"\];\n
    IntentManager.Instance.AddIntentHandler(IntentName[0], this);\n
    IntentManager.Instance.AddIntentHandler(IntentName[1], this);\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22849408"}
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
#6{#4{9 10 "138754576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "HandleShock"}
 1.3 0.88 4.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{247 248 "\[\n
    if (patient.state == PatientState.Asystole)\n
        Debug.Log(\"You have to inject Epinephrine, NOT Shock!\");\n
\n
    shock = new Shock(this, defibrillatorTable, patient);\n
    shock.CompletedAction += OnShockCompleted;\n
    shock.StartAction();\n
\]"}
#4{11 12 "HandleShock"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "138801376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{4 5 "room"}
 3.2 1.88 1.6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4 5 "room"}
#4{11 12 "MedicalRoom"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "138749088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "HandleAttachMonitor"}
 1.3 0.88 7.6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{19 20 "HandleAttachMonitor"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "138800936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "attachMonitor"}
 1.4 1.88 5.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "attachMonitor"}
#4{13 14 "AttachMonitor"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140113072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{33 34 "public DefibrillatorManager : ECA"}
 16.9657 2.2 21.12 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  3.82406 4.04449 0
 0  0 #4{27 28 "public DefibrillatorManager"}
#4{3 7 "ECA"}
#4{0 13 ""}
#5{16 1#4{41 42 "public event EventHandler ShockCompleted;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "138750656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnMonitorAttached"}
 1.3 0.88 6.8 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{22 23 "\[\n
    //send message\n
\]"}
#4{17 18 "OnMonitorAttached"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#9{#4{9 10 "108272344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{219 220 "\[\n
    base.Start();\n
    room = FindObjectOfType<MedicalRoom>();\n
    patient = FindObjectOfType<Patient>();\n
    defibrillatorTable = room.GetDefibrillatorTable();\n
    patient.CheckRythm += OnRythm;\n
    //HandleShock();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "22848640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#8{#4{9 10 "138795656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "patient"}
 2.6 1.88 2.8 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "patient"}
#4{7 8 "Patient"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @170 @108 @209 @0 #5{16 5@57 @155 @128 @42 @217 }
#5{16 0}
#5{16 5@116 @143 @18 @185 @72 }
#5{16 2@84 @197 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @3 @0 @0 @0 }
#1{16@30 @0 @0 @0 @0 @0 @0 @0 @96 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
