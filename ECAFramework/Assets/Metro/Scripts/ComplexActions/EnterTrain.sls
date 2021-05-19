:ArrayOb.273{6:Dictionary.4369{16 16:SLSPrivateMethod.286331408{:String.17{9 10 "142106472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 11 "Enter"}
 1.3 0.879999 2 10  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1332 1502 "\[\n
    foreach(var p in station.train.GetPassengerPlaces())\n
    \[\n
        if (!p.Occupied)\n
        \[\n
            placeSelected = p;\n
            p.Occupied = true;\n
            break;\n
        \]\n
    \]\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
\n
\n
    switch (placeSelected.GetType().ToString())\n
    \[\n
        case \"SittableObject\":\n
            var chair = (SittableObject)placeSelected;\n
            GoToStage reachChair = new GoToStage(chair.GetDestination());\n
            TurnStage turn = new TurnStage(chair.GetSitPoint(), true);\n
            SitStage sit = new SitStage(chair);\n
            stages.Add(reachChair);\n
            stages.Add(turn);\n
            stages.Add(sit);\n
            break;\n
\n
        case \"GrabbableObject\":\n
            var handle = (GrabbableObject)placeSelected;\n
            GoToStage reachHandle = new GoToStage(new Vector3(handle.transform.position.x, transform.position.y, handle.transform.position.z));\n
            TurnStage turnToHandle = new TurnStage(handle.transform);\n
            PickStage grab = new PickStage(handle.transform, .3f, true);\n
            stages.Add(reachHandle);\n
            stages.Add(turnToHandle);\n
            stages.Add(grab);\n
            break;\n
    \]\n
\n
    if(stages.Count != 0)\n
    \[\n
        enterTrain = new ECAAction(this, stages);\n
\tactions.Add(enterTrain);\n
    \]\n
\]"}
#4{5 11 "Enter"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "131017320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "goToDoor"}
 2.4 1.88 3.2 10  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "goToDoor"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "131017321"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "enterTrain"}
 2 1.88 4 19  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "enterTrain"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "142104120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "OnDoorsOpen"}
 1.3 0.879999 4.4 19  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{148 193 "\[\n
    Utility.Log(\"Train is arrived, you can go in\");\n
\n
    doorOpened = true;\n
    if(ActualAction == goToDoor)\n
    \[\n
\tCompleteAndAdvance();\n
    \]\n
\n
\]"}
#4{11 12 "OnDoorsOpen"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "75634992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "doorSelected"}
 1.6 1.88 4.8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "doorSelected"}
#4{9 10 "TrainDoor"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{9 10 "     null"}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "131125192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "Passenger eca"}
 0.299999 0.88 5.2 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{66 105 ":base(eca)\n
\[\n
        this.eca = eca;\n
\ttrain = eca.station.train;\n
\]"}
#4{10 14 "EnterTrain"}
#4{0 1 ""}
#4{13 14 "Passenger eca"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75287696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{76 418 "\[\n
  train.DoorsOpen += OnDoorsOpen;\n
  SetupAction();\n
  base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "131126952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "doorOpened"}
 2 1.88 4 10  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "doorOpened"}
#4{4 5 "bool"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{5 6 "false"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75282064"}
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
:SLSProtectMethod.286331408{#4{9 10 "105408480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.880004 4.4 10  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{36 37 "\[\n
  GoNearTrainDoor();\n
  Enter();\n
\]\n
"}
#4{11 12 "SetupAction"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#12{#4{9 10 "129307712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "OnActualActionCompleted"}
 1.3 0.88 9.2 10  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{45 95 "\[\n
    if(doorOpened)\n
\tCompleteAndAdvance();\n
\]"}
#4{23 24 "OnActualActionCompleted"}
#4{13 14 "override void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#5{#4{9 10 "131124312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "train"}
 3 1.88 2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 8 "train"}
#4{5 8 "Train"}
#4{16 17 "./../ObjectTypes"}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131055288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public EnterTrain : ECACompositeAction"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{17 18 "public EnterTrain"}
#4{18 19 "ECACompositeAction"}
#4{34 35 ".\\..\\..\\..\\ECAScripts\\ECAAnimation"}
#6{16 0}
#6{16 0}
#4{1 3 "S"}
@0 #4{0 1 ""}
}
#5{#4{9 10 "131124752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "eca"}
#4{9 10 "Passenger"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "142109608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GoNearTrainDoor"}
 1.3 0.879999 6 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{454 467 "\[\n
    doorSelected = station.train.NearestDoor(transform.position);\n
    Utility.Log(name + \" going to \" + doorSelected);\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage goNear = new GoToStage(Randomize.GetRandomPosition(doorSelected.FrontDoor));\n
    TurnStage turn = new TurnStage(doorSelected.transform);\n
    stages.Add(goNear);\n
    stages.Add(turn);\n
\n
    goToDoor = new ECAAction(this, stages);\n
    actions.Add(goToDoor);\n
\]"}
#4{15 16 "GoNearTrainDoor"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @166 @119 @84 @0 #6{16 1@57 }
#6{16 5@180 @151 @104 @15 @30 }
#6{16 3@195 @3 @45 }
#6{16 2@139 @127 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@92 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@72 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
