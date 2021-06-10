:ArrayOb.273{6:Dictionary.4369{32 18:SLSPrivateMethod.286331408{:String.17{9 10 "108269992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "UseShock"}
 1.3 0.88 3.2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{527 528 "\[\n
    placePaddles = new List<PlaceObjectStage>()\n
    \[\n
        new PlaceObjectStage(pickStages[0], defLeftPosition),\n
        new PlaceObjectStage(pickStages[1], defRightPosition)\n
    \];\n
    ECAParallelActionStage place = new ECAParallelActionStage(placePaddles.ToArray());\n
    WaitStage waitForShock = new WaitStage(2f);\n
    //shock\n
\n
    List<ECAActionStage> list = new List<ECAActionStage>();\n
    list.Add(place);\n
    list.Add(waitForShock);\n
\n
    ECAAction action = new ECAAction(defManager, list);\n
    actions.Add(action);\n
\]"}
#4{8 9 "UseShock"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "108977192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "defibrillator"}
 1.4 1.88 5.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "defibrillator"}
#4{13 14 "Defibrillator"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "139225208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "DefibrillatorMan"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{433 434 ": base(eca)\n
\[\n
        defManager = eca;\n
        this.defibrillator = defibrillatorTable.GetDefibrillator();\n
        defLeftPosition = patient.GetDefLeftPosition();\n
        defRightPosition = patient.GetDefRightPosition();\n
        turnAtPosition = patient.GetDefLeftPosition();\n
        leftFootPosition = defibrillatorTable.GetLeftFootPosition();\n
        bodyTarget = defibrillatorTable.GetBodyTarget();\n
\n
        CreateActionList();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{80 81 "DefibrillatorManager eca, DefibrillatorTable defibrillatorTable, Patient patient"}
#4{0 1 ""}
}
#5{#4{9 10 "139223888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "leftFootPosition"}
 0.8 1.88 6.4 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "leftFootPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "108274304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "PickPaddles"}
 1.3 0.88 4.4 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{617 618 "\[\n
    pickStages = new List<PickStage>()\n
    \[\n
        new PickStage(defibrillator.GetLeftPaddle().transform, 1, false, HandSide.LeftHand),\n
        new PickStage(defibrillator.GetRightPaddle().transform, 1, false, HandSide.RightHand)\n
    \];\n
\n
    ECAParallelActionStage pick = new ECAParallelActionStage(pickStages.ToArray());\n
    TurnStage turnToPatient = new TurnStage(turnAtPosition, false, leftFootPosition, bodyTarget);\n
\n
    List<ECAActionStage> list = new List<ECAActionStage>();\n
    list.Add(pick);\n
    list.Add(turnToPatient);\n
\n
    takePaddles = new ECAAction(defManager, list);\n
    actions.Add(takePaddles);\n
\]"}
#4{11 12 "PickPaddles"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139222128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "pickStages"}
 2 1.88 4 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "pickStages"}
#4{15 16 "List<PickStage>"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
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
#5{#4{9 10 "139224328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "placePaddles"}
 1.6 1.88 4.8 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "placePaddles"}
#4{22 23 "List<PlaceObjectStage>"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22848896"}
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
#5{#4{9 10 "139223008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "bodyTarget"}
 2 1.88 4 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "bodyTarget"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139222568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "turnAtPosition"}
 1.2 1.88 5.6 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "turnAtPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "139097416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{33 34 "public Shock : ECACompositeAction"}
 16.9657 2.2 21.12 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{12 13 "public Shock"}
#4{18 19 "ECACompositeAction"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{9 10 "139221688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "defRightPosition"}
 0.799999 1.88 6.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "defRightPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139224768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "usePaddles"}
 2 1.88 4 10  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "usePaddles"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "108270776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CreateActionList"}
 1.3 0.88 6.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 68 "\[\n
    PickPaddles();\n
    UseShock();\n
    base.CreateActionList();\n
\]"}
#4{16 17 "CreateActionList"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{9 10 "108973672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "defLeftPosition"}
 1 1.88 6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "defLeftPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "108976752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "defManager"}
 2 1.88 4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "defManager"}
#4{20 21 "DefibrillatorManager"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "139223448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "takePaddles"}
 1.8 1.88 4.4 46  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "takePaddles"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @145 @107 @84 @0 #6{16 11@15 @216 @201 @159 @130 @42 @115 @69 @92 @231 @174 }
#6{16 0}
#6{16 2@57 @3 }
#6{16 1@189 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@30 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
