:ArrayOb.273{6:Dictionary.4369{64 38:SLSPrivateMethod.286331408{:String.17{9 10 "108170288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{731 732 "\[\n
    injectionPosition = GetComponentInChildren<InjectionPosition>();\n
    cprPosition = GetComponentInChildren<CPRPosition>();\n
    capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();\n
    giveOxygenPosition = GetComponentInChildren<GiveOxygenPosition>();\n
    defLeftPosition = GetComponentInChildren<DefLeftPosition>();\n
    defRightPosition = GetComponentInChildren<DefRightPosition>();\n
    hitReaction = GetComponent<HitReaction>();\n
    spineCollider = GetComponentInChildren<SpineCollider>().GetComponent<Collider>();\n
    stomach = GetComponentInChildren<Stomach>();\n
    pumpPosition = GetComponentInChildren<PumpPosition>();\n
\n
    systemManager = FindObjectOfType<SystemManager>();\n
\n
    counterCPR = 0;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "139027448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "injectionPosition"}
 0.6 1.88 6.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "injectionPosition"}
#4{17 18 "InjectionPosition"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "108167544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetPumpPosition"}
 0.3 0.879999 6 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{38 39 "\[\n
    return pumpPosition.transform;\n
\]"}
#4{15 16 "GetPumpPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139030528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "defRightPosition"}
 0.799999 1.88 6.4 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "defRightPosition"}
#4{16 17 "DefRightPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139030088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "defLeftPosition"}
 1 1.88 6 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "defLeftPosition"}
#4{15 16 "DefLeftPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108171072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "GetGiveOxygenPosition"}
 0.3 0.879999 8.4 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 45 "\[\n
    return giveOxygenPosition.transform;\n
\]"}
#4{21 22 "GetGiveOxygenPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139025248"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "giveOxygenPosition"}
 0.400002 1.88 7.2 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "giveOxygenPosition"}
#4{18 19 "GiveOxygenPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139023928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "counterCPR"}
 2 1.88 4 37  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "counterCPR"}
#4{3 4 "int"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139024368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "rythimShockable"}
 1 1.88 6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "rythimShockable"}
#4{4 5 "bool"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108173032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "GetInjectionPosition"}
 0.3 0.88 8 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 44 "\[\n
    return injectionPosition.transform;\n
\]"}
#4{20 21 "GetInjectionPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "108166368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "CheckPatientState"}
 1.3 0.88 6.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{238 239 "\[\n
    float rythmShock = Random.Range(0, 1);\n
\n
    if (rythmShock < RHYTM_SHOCKABLE)\n
        state = PatientState.Asystole;\n
    else\n
        state = PatientState.VF;\n
\n
    if (CheckRythm != null)\n
        CheckRythm(this, EventArgs.Empty);\n
\]"}
#4{17 18 "CheckPatientState"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139025688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "pumpPosition"}
 1.6 1.88 4.8 10  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "pumpPosition"}
#4{12 13 "PumpPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108167152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnShockReceived"}
 0.3 0.88 6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{235 236 "\[\n
    Debug.Log(\"Sono shockato\");\n
    hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);\n
    //hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);\n
    state = PatientState.Shocked;\n
\]"}
#4{15 16 "OnShockReceived"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "108116600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "ivAccessInserted"}
 0.8 1.88 6.4 10  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "ivAccessInserted"}
#4{4 5 "bool"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{5 6 "false"}
#4{0 1 ""}
}
#7{#4{9 10 "108169112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "GetCPRPosition"}
 0.3 0.88 5.6 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
    return cprPosition;\n
\]"}
#4{14 15 "GetCPRPosition"}
#4{11 12 "CPRPosition"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139029648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "RHYTM_SHOCKABLE"}
 1 1.88 6 28  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "RHYTM_SHOCKABLE"}
#4{11 12 "const float"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{4 5 " .4f"}
#4{0 1 ""}
}
#7{#4{9 10 "108173424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GetDefLeftPosition"}
 0.3 0.879999 7.2 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 42 "\[\n
    return defLeftPosition.transform;\n
\]"}
#4{18 19 "GetDefLeftPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108170680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnOxygenGiven"}
 0.3 0.88 5.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "OnOxygenGiven"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "22850944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "139026128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "CheckRythm"}
 1.3 1.88 4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "CheckRythm"}
#4{12 13 "EventHandler"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108172640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnEpinephrineDone"}
 0.3 0.88 6.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{17 18 "OnEpinephrineDone"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139031408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "systemManager"}
 1.4 1.88 5.2 19  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "systemManager"}
#4{13 14 "SystemManager"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "86436656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "HasIVAccess"}
 1.3 0.88 4.4 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 42 "\[\n
  get \[\n
\treturn ivAccessInserted;\n
  \]\n
\]"}
#4{11 12 "HasIVAccess"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#10{#4{9 10 "139026568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "state"}
 1.3 1.88 2 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "state"}
#4{12 13 "PatientState"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140116384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{20 21 "public Patient : ECA"}
 19.3429 2.2 12.8 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{14 15 "public Patient"}
#4{3 7 "ECA"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#7{#4{9 10 "108169504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "GetDefRightPosition"}
 0.3 0.879999 7.6 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{42 43 "\[\n
    return defRightPosition.transform;\n
\]"}
#4{19 20 "GetDefRightPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108166760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnIvAccessDone"}
 0.3 0.88 5.6 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{30 31 "\[\n
  ivAccessInserted = true;\n
\]"}
#4{14 15 "OnIvAccessDone"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108168720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "OnCPREnded"}
 0.3 0.88 4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{34 35 "\[      \n
    CheckPatientState();\n
\]"}
#4{10 11 "OnCPREnded"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22847104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{219 220 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
using RootMotion.FinalIK;\n
using Random = UnityEngine.Random;\n
\n
\tpublic enum PatientState\n
\[\n
    VF,\n
    Asystole,\n
    Shocked\n
\]\n
"}
}
#5{#4{9 10 "139028328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "hitReaction"}
 1.8 1.88 4.4 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "hitReaction"}
#4{11 12 "HitReaction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108171856"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "GetCapnographyPosition"}
 0.3 0.88 8.8 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{45 46 "\[\n
    return capnographyPosition.transform;\n
\]"}
#4{22 23 "GetCapnographyPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108171464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnCapnographyDone"}
 0.3 0.88 6.8 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{17 18 "OnCapnographyDone"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139027888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{19 20 "capnographyPosition"}
 0.299999 1.88 7.6 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "capnographyPosition"}
#4{27 28 "AdvancedCapnographyPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139028768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "spineCollider"}
 1.4 1.88 5.2 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "spineCollider"}
#4{8 9 "Collider"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139030968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "cprPosition"}
 1.8 1.88 4.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "cprPosition"}
#4{11 12 "CPRPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108173816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnAmiodaroneDone"}
 0.3 0.88 6.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{16 17 "OnAmiodaroneDone"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139027008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "start"}
 3 1.88 2 46  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "start"}
#4{15 16 "readonly object"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{13 14 " new object()"}
#4{0 1 ""}
}
#5{#4{9 10 "139024808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "stomach"}
 2.6 1.88 2.8 46  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "stomach"}
#4{7 8 "Stomach"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @324 @374 @246 @0 #6{16 15@114 @15 @451 @421 @84 @57 @42 @382 @436 @493 @153 @281 @207 @99 @478 }
#6{16 1@180 }
#6{16 2@3 @141 }
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @254 @0 @309 @0 @0 @0 }
#1{16@168 @362 @466 @269 @350 @234 @409 @195 @397 @129 @72 @338 @222 @30 @296 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
