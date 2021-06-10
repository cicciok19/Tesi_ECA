:ArrayOb.273{6:Dictionary.4369{16 10:SLSPrivateMember.286331409{:String.17{9 10 "108974112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "ivTube"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "ivTube"}
#4{6 7 "IVTube"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "108974552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "injectionPosition"}
 0.6 1.88 6.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "injectionPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140117488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{27 28 "public IVAccess : ECAAction"}
 18.0629 2.2 17.28 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{15 16 "public IVAccess"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "108270384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  7 #4{0 1 ""}
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
#3{#4{9 10 "108975872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "medicationProvider"}
 0.400002 1.88 7.2 37  26 #4{0 1 ""}
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
#3{#4{9 10 "108974992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "destination"}
 1.8 1.88 4.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "destination"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22848640"}
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
#7{#4{9 10 "108275480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{589 590 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage goToTable = new GoToStage(ivTube.GetDestination());\n
    PickStage pickTube = new PickStage(ivTube.GetVeinTube(), 1f, false, HandSide.RightHand);\n
    GoToStage goToMainPosition = new GoToStage(destination);\n
    LookStableStage lookVein = new LookStableStage(injectionPosition);\n
    DropStage findVein = new DropStage(pickTube, injectionPosition);\n
\n
    stages.Add(goToTable);\n
    stages.Add(pickTube);\n
    stages.Add(goToMainPosition);\n
    stages.Add(lookVein);\n
    stages.Add(findVein);\n
\n
    SetStages(stages);\n
\]"}
#4{11 12 "SetupAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "108976312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, IVTube "}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{227 228 ": base(eca)\n
\[\n
        medicationProvider = (MedicationProvider)eca;\n
        this.ivTube = ivTube;\n
        injectionPosition = patient.GetInjectionPosition();\n
        destination = medicationProvider.GetDestinationNearTable();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{39 40 "ECA eca, IVTube ivTube, Patient patient"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "22850688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @33 @89 @121 @0 #5{16 4@3 @18 @74 @59 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@97 @47 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@109 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
