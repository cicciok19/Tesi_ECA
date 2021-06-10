:ArrayOb.273{6:Dictionary.4369{32 24:JLSFriendDeclare.286331408{:String.17{8 9 "22846592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{143 240 "protected enum MedicationProviderState \[\n
    None,\n
\tIdle,\n
\tInstallingIVAccess,\n
\tTakingMedicine,\n
\tInjectingMedicine,\n
        MedicineTaken\n
    \]"}
}
:SLSProtectMethod.286331408{#4{9 10 "109952600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "CreateGetMedicineAction"}
 1.3 0.880004 9.2 19  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{188 240 "\[\n
    Medicine m = medicationTable.GetMedicine(medicineName);\n
    Assert.IsNotNull(m);\n
    //send message\n
    UseMedicine useMedicine = new UseMedicine(this, m);\n
\n
    return useMedicine;\n
\]"}
#4{23 24 "CreateGetMedicineAction"}
#4{11 12 "UseMedicine"}
#4{25 26 "MedicineName medicineName"}
#4{0 1 ""}
 0}
:JLSExternObject.286331409{#4{8 9 "86464752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 12 ""}
 4 1.88 48.4 6  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 12 ""}
#4{11 12 "UseMedicine"}
#4{12 13 ".\\..\\Actions"}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 }
:SLSPrivateMethod.286331408{#4{9 10 "108169896"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "OnIvAccessCompleted"}
 1.3 0.88 7.6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{64 65 "\[\n
    // changing patient state\n
\n
    patient.OnIvAccessDone();\n
\]"}
#4{19 20 "OnIvAccessCompleted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "139617232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.879999 12.4 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{186 280 "\[\n
    List<string> intentName = new List<string> \[ AMIODARONE , EPINEPHRINE , IVACCESS \];\n
\n
    foreach(var intent in intentName)\n
\tIntentManager.Instance.AddIntentHandler(intent, this);\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "138798296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "patient"}
 2.6 1.88 2.8 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "patient"}
#4{7 8 "Patient"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "111462648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "EPINEPHRINE"}
 1.8 1.88 4.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "EPINEPHRINE"}
#4{12 13 "const string"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{14 15 " \"Epinephrine\""}
#4{0 1 ""}
}
#5{#4{9 10 "139619584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{246 247 "\[\n
    base.Start();\n
    medicationTable = medicalRoom.GetMedicationTable();\n
    pole = medicalRoom.GetPole();\n
\n
    //just for debug\n
    //HandleUseMedicine(MedicineName.Epinephrine);\n
    //HandleIVAccess(medicationTable.GetVeinTube(), patient);\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{9 10 "138752616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 10  9 #4{0 1 ""}
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
:SLSProtectProperty.286331392{#4{9 10 "108595840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "State"}
 1.3 0.880004 2 19  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{543 544 "\[\n
  get \[\n
\tif(currentAction == null)\n
\t\treturn MedicationProviderState.Idle;\n
\n
        if (currentAction is IVAccess)\n
            return MedicationProviderState.InstallingIVAccess;\n
\n
        if(currentAction is UseMedicine)\n
        \[\n
            UseMedicine useMedicine = (UseMedicine)currentAction;\n
            if (!useMedicine.hasMedicine)\n
                return MedicationProviderState.TakingMedicine;\n
            else\n
                return MedicationProviderState.MedicineTaken;\n
\n
        \]\n
\n
        return MedicationProviderState.None;\n
  \]\n
\]"}
#4{5 6 "State"}
#4{23 25 "MedicationProviderState"}
#4{0 1 ""}
#4{0 1 ""}
 0#4{0 1 ""}
}
#9{#4{9 10 "139619976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{347 389 "\[\n
    base.Handle(intent);\n
    switch (intent.IntentName)\n
    \[\n
        case AMIODARONE:\n
            HandleUseMedicine(MedicineName.Amiodarone);\n
            break;\n
        case EPINEPHRINE :\n
            HandleUseMedicine(MedicineName.Epinephrine);\n
            break;\n
        case IVACCESS :\n
            HandleIVAccess();\n
            break;\n
    \]\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
#11{#4{9 10 "111464408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "AMIODARONE"}
 2 1.88 4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "AMIODARONE"}
#4{12 13 "const string"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{13 14 " \"Amiodarone\""}
#4{0 1 ""}
}
#8{#4{9 10 "139618016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "HandleUseMedicine"}
 1.3 0.88 6.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1262 1263 "\[\n
    // check if iv access ahas been inserted\n
\n
    if(!patient.HasIVAccess)\n
    \[\n
\tSendDirectMessage(\"Ti sei dimenticato di dirmi di inserire l'accesso venoso, faccio che farlo da solo va...\");\n
\tUtility.LogWarning(\"Asked to inject \" + medicineName + \" but iv access is missing\");\n
\n
\tList<ECAAction> actions = new List<ECAAction>();\n
\n
    \tIVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);\n
    \tivAccess.CompletedAction += OnIvAccessCompleted;\n
\n
\tUseMedicine useMedicine = CreateGetMedicineAction(medicineName);\n
    \tuseMedicine.InjectionDone += OnInjectionDone;\n
\n
\tactions.Add(ivAccess);\n
\tactions.Add(useMedicine);\n
\n
\tECACompositeAction composite = new ECACompositeAction(this, actions);\n
\tcomposite.StartAction();\n
\n
\treturn;\n
    \]\n
\n
    // else, inject\n
\n
    if(State == MedicationProviderState.TakingMedicine || State == MedicationProviderState.MedicineTaken)\n
    \[\n
        Utility.LogWarning(\"\");\n
        currentAction.Abort();\n
        if (State == MedicationProviderState.MedicineTaken)\n
        \[ \n
            // drop medicine, and enqueue taking medicine\n
        \]\n
    \]\n
\n
    UseMedicine useOnlyMedicine = CreateGetMedicineAction(medicineName);\n
    useOnlyMedicine.InjectionDone += OnInjectionDone;\n
    useOnlyMedicine.StartAction();\n
\]"}
#4{17 18 "HandleUseMedicine"}
#4{4 5 "void"}
#4{25 26 "MedicineName medicineName"}
#4{0 1 ""}
}
#5{#4{9 10 "139620760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{184 185 "\[\n
    base.Awake();\n
    medicalRoom = FindObjectOfType<MedicalRoom>();\n
    destination = FindObjectOfType<DestinationMedicationProvider>();\n
    patient = FindObjectOfType<Patient>();\n
\]"}
#4{5 6 "Awake"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#10{#4{9 10 "138797416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "medicationTable"}
 1 1.88 6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "medicationTable"}
#4{15 16 "MedicationTable"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#10{#4{9 10 "138795216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "destination"}
 1.8 1.88 4.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "destination"}
#4{29 30 "DestinationMedicationProvider"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "111463968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "IVACCESS"}
 2.4 1.88 3.2 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "IVACCESS"}
#4{12 13 "const string"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{11 12 " \"IVAccess\""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140114728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{31 32 "public MedicationProvider : ECA"}
 17.3314 2.2 19.84 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{25 26 "public MedicationProvider"}
#4{3 7 "ECA"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#8{#4{9 10 "139618408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "HandleIVAccess"}
 1.3 0.88 5.6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{461 462 "\[\n
    // check if iv access is already on\n
\n
    if(patient.HasIVAccess)\n
    \[\n
\tSendDirectMessage(\"Guarda che l'accesso alle vie venose \232\ gi\224\ stato inserito, che cavolo chiedi?\");\n
\tUtility.LogWarning(\"Requested IVAccess when it was already in place\");\n
\treturn;\n
    \]\n
\n
    // else, execute action\n
\n
    IVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);\n
    ivAccess.CompletedAction += OnIvAccessCompleted;\n
    ivAccess.StartAction();\n
\]"}
#4{14 15 "HandleIVAccess"}
#4{4 5 "void"}
#4{0 31 ""}
#4{0 1 ""}
}
#8{#4{9 10 "108172248"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnInjectionDone"}
 1.3 0.88 6 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{349 350 "\[\n
    UseMedicine useMedicine = (UseMedicine)sender; \n
    useMedicine.InjectionDone -= OnInjectionDone;\n
    UseMedicineEventArgs args = (UseMedicineEventArgs)e;\n
    Medicine m = args.medicine;\n
    //send message of completed action\n
\n
    if (m.name == \"Epinephrine\")\n
        patient.OnEpinephrineDone();\n
    else\n
        patient.OnAmiodaroneDone();\n
\]"}
#4{15 16 "OnInjectionDone"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#10{#4{9 10 "139029208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{4 5 "pole"}
 3.2 1.88 1.6 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4 5 "pole"}
#4{6 7 "IVPole"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22849664"}
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
:SLSPublicMember.286331409{#4{9 10 "138796096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "medicalRoom"}
 1.3 1.88 4.4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "medicalRoom"}
#4{11 12 "MedicalRoom"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "108168328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "GetDestinationNearTable"}
 0.3 0.88 9.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    return destination.transform.position;\n
\]"}
#4{23 24 "GetDestinationNearTable"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @223 @276 @3 @0 #7{16 4@178 @193 @60 @261 }
#7{16 3@139 @75 @208 }
#7{16 4@154 @237 @249 @36 }
#7{16 5@166 @90 @102 @11 @114 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 1@23 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @284 @0 @0 @0 @0 @0 }
#1{16@127 @0 @299 @0 @0 @0 @0 @0 @0 @0 @48 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#17{1 }
#17{0 }
#17{1 }
}
