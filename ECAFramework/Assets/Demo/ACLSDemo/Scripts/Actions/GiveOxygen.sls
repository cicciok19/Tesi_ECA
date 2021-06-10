:ArrayOb.273{6:Dictionary.4369{16 9:JLSGlobalDeclare.286331408{:String.17{8 9 "22847872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{79 80 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "22848128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "108180312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "pumpPosition"}
 1.6 1.88 4.8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "pumpPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "108178992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "giveOxygenPosition"}
 0.4 1.88 7.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "giveOxygenPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "108273520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "SetupPickMask"}
 1.3 0.88 5.2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1133 1134 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    TurnStage turnToMask = new TurnStage(oxygen.GetOxygenMask());\n
    List<PickStage> pickOxygen = new List<PickStage>()\n
    \[\n
        new PickStage(oxygen.GetOxygenMask(), 1, false, HandSide.LeftHand),\n
        new PickStage(oxygen.GetOxygenPump(), 1, false, HandSide.RightHand)\n
    \];\n
    ECAParallelActionStage pick = new ECAParallelActionStage(pickOxygen.ToArray());\n
    TurnStage turnToPatient = new TurnStage(giveOxygenPosition);\n
    LookStableStage lookPatient = new LookStableStage(giveOxygenPosition);\n
    WaitStage wait = new WaitStage(1f);\n
    List<PlaceObjectStage> putOxygen = new List<PlaceObjectStage>()\n
    \[\n
        new PlaceObjectStage(pickOxygen[0], giveOxygenPosition),\n
        new PlaceObjectStage(pickOxygen[1], pumpPosition)\n
    \];\n
    ECAParallelActionStage put = new ECAParallelActionStage(putOxygen.ToArray());\n
\n
\n
    stages.Add(turnToMask);\n
    stages.Add(pick);\n
    stages.Add(turnToPatient);\n
    stages.Add(wait);\n
    stages.Add(lookPatient);\n
    stages.Add(put);\n
\n
    ECAAction action = new ECAAction(eca, stages);\n
    actions.Add(action);\n
\]"}
#4{13 14 "SetupPickMask"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "108269600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{48 49 "\[\n
    SetupPickMask();\n
    base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "108975432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, Oxygen "}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{157 158 ": base(eca)\n
\[\n
        this.oxygen = oxygen;\n
        giveOxygenPosition = patient.GetGiveOxygenPosition();\n
        pumpPosition = patient.GetPumpPosition();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{39 40 "ECA eca, Oxygen oxygen, Patient patient"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140115280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public GiveOxygen : ECACompositeAction"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{17 18 "public GiveOxygen"}
#4{18 19 "ECACompositeAction"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "108181192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "oxygen"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "oxygen"}
#4{6 7 "Oxygen"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @85 @3 @11 @0 #7{16 0}
#7{16 3@99 @34 @19 }
#7{16 1@49 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@61 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@73 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
