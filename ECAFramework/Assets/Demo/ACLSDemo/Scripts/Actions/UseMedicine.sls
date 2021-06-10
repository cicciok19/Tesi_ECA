:ArrayOb.273{6:Dictionary.4369{16 13:SLSPrivateMember.286331409{:String.17{9 10 "108142656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "medicine"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "medicine"}
#4{8 9 "Medicine"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
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
 0  0 #4{259 260 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
\n
\n
\n
public class UseMedicineEventArgs : EventArgs\n
\[\n
    public Medicine medicine;\n
    public UseMedicineEventArgs(Medicine m)\n
    \[\n
        medicine = m;\n
    \]\n
    \n
\]\n
"}
}
:SLSPublicMethod.286331408{#4{9 10 "108275872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnCompletedAction"}
 1.3 0.88 6.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{129 130 "\[\n
    base.OnCompletedAction();\n
    if (InjectionDone != null)\n
        InjectionDone(this, new UseMedicineEventArgs(medicine));\n
\]"}
#4{17 18 "OnCompletedAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "108272344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{764 765 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage goToMedicine = new GoToStage(medicine.GetDestination());\n
\n
    PickStage pickMedicine = new PickStage(medicine.GetSyringe(), 1, false, HandSide.RightHand);\n
    pickMedicine.StageFinished += OnMedicinePicked;\n
\n
    GoToStage goToPole = new GoToStage(pole.GetDestination());\n
    DropStage startInjection = new DropStage(pickMedicine, pole.GetInjectionPosition());\n
    startInjection.StageFinished += OnMedicineReleased;\n
\n
    GoToStage returnNearTable = new GoToStage(medicationProvider.GetDestinationNearTable());\n
    stages.Add(goToMedicine);\n
    stages.Add(pickMedicine);\n
    stages.Add(goToPole);\n
    stages.Add(startInjection);\n
    stages.Add(returnNearTable);\n
\n
    SetStages(stages);\n
\]"}
#4{11 12 "SetupAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "22849408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{9 10 "108271168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    SetupAction();\n
    base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSInternalMember.286331409{#4{9 10 "138758312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "hasMedicine"}
 1.8 1.88 4.4 10  31 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "hasMedicine"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{5 6 "false"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "110176008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnMedicinePicked"}
 1.3 0.880004 6.4 18  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 27 "\[\n
  hasMedicine = true;\n
\]\n
"}
#4{16 17 "OnMedicinePicked"}
#4{4 5 "void"}
#4{29 30 "object sender, EventArgs args"}
#4{0 1 ""}
 0}
#10{#4{9 10 "110176009"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "OnMedicineReleased"}
 1.3 0.88 7.2 18  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
  hasMedicine = false;\n
\]\n
"}
#4{18 19 "OnMedicineReleased"}
#4{4 5 "void"}
#4{29 30 "object sender, EventArgs args"}
#4{0 1 ""}
 0}
:SLSConstructor.286331408{#4{9 10 "108141776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, Medicin"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{148 149 ": base(eca)\n
\[\n
        medicine = m;\n
        medicationProvider = (MedicationProvider)eca;\n
        pole = medicationProvider.medicalRoom.GetPole();\n
\]"}
#4{11 12 "UseMedicine"}
#4{0 1 ""}
#4{19 20 "ECA eca, Medicine m"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "108479976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public UseMedicine : ECAAction"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  3.2445 4.14313 0
 0  0 #4{18 19 "public UseMedicine"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
#5{16 1#4{40 41 "public event EventHandler InjectionDone;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "108144416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{4 5 "pole"}
 3.2 1.88 1.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4 5 "pole"}
#4{6 7 "IVPole"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "108145296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "medicationProvider"}
 0.4 1.88 7.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "medicationProvider"}
#4{18 19 "MedicationProvider"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @121 @18 @50 @0 #5{16 3@136 @3 @151 }
#5{16 0}
#5{16 0}
#5{16 2@85 @97 }
#5{16 1@70 }
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@58 @38 @26 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@109 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
