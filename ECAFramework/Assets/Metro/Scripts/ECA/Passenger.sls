:ArrayOb.273{6:Dictionary.4369{32 17:SLSPrivateMethod.286331408{:String.17{9 10 "142104120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "OnDoorsOpen"}
 1.3 0.879999 4.4 10  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{180 193 "\[\n
    Utility.Log(\"Train is arrived, you can go in\");\n
\n
    //ecaAnimator.navMeshAgent.areaMask = (1 << 3) | (1 << 10) | (1 << 4) | (1 << 0);\n
\n
    //DO SOMETHING\n
    EnterTrain();\n
\]"}
#4{11 12 "OnDoorsOpen"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "177017464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "station"}
 2.6 1.88 2.8 10  39 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "station"}
#4{7 8 "Station"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "75635432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "placeSelected"}
 1.4 1.88 5.2 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "placeSelected"}
#4{14 15 "PassengerPlace"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{6 7 "  null"}
#4{0 1 ""}
}
#3{#4{9 10 "142105688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "GoToPlatform"}
 1.3 0.88 4.8 10  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{292 396 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
\n
    Vector3 platformPosition = station.GetPositionOnPlatform();\n
\n
    ECAAction newAction = new ECAAction(this, new GoToStage(platformPosition));\n
    newAction.CompletedAction += OnPlatformReached;\n
    newAction.StartAction();\n
\]"}
#4{12 13 "GoToPlatform"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75634552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "train"}
 3 1.88 2 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "train"}
#4{5 6 "Train"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "142103336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Entered"}
 1.3 0.879999 2.8 38  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{119 120 "\[\n
    currentAction.CompletedAction -= Entered;\n
    doorSelected.Occupied = false;\n
    placeSelected.Occupied = true;\n
\]"}
#4{7 8 "Entered"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#7{#4{8 9 "75635872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "maxRange"}
 2.4 1.88 3.2 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "maxRange"}
#4{5 6 "float"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75634992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "doorSelected"}
 1.6 1.88 4.8 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "doorSelected"}
#4{9 10 "TrainDoor"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{6 7 "  null"}
#4{0 1 ""}
}
#3{#4{9 10 "142106472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "EnterTrain"}
 1.3 0.879999 4 10  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{915 994 "\[\n
    if (doorSelected.Occupied)\n
    \[\n
        doorSelected.DoorFree += OnDoorFree;\n
        Utility.Log(this.gameObject + \" tried to enter \" + doorSelected.gameObject + \" but someone is already entering\");\n
    \]\n
    else\n
    \[\n
        doorSelected.DoorFree -= OnDoorFree;\n
        doorSelected.Occupied = true;\n
\n
        foreach(var p in station.train.GetPassengerPlaces())\n
        \[\n
            if (!p.Occupied)\n
            \[\n
                placeSelected = p;\n
                break;\n
            \]\n
        \]\n
\n
        GoToStage enter = new GoToStage(placeSelected.transform);\n
        ECAAction newAction = new ECAAction(this, enter);\n
\n
        //TODO: the next ECA should enter even before that this ECA will arrive at destination\n
        newAction.CompletedAction += Entered;\n
        newAction.StartAction();\n
\n
        Utility.Log(this.gameObject + \" is entering the train at door \" + doorSelected.gameObject);\n
    \]\n
\]"}
#4{10 11 "EnterTrain"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "142109608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GoNearTrainDoor"}
 1.3 0.879999 6 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{239 267 "\[\n
    doorSelected = station.train.NearestDoor(transform.position);\n
    Utility.Log(\"Going to \" + doorSelected);\n
    ECAAction newAction = new ECAAction(this, new GoToStage(doorSelected.GetRandomPosition()));\n
    newAction.StartAction();\n
\]"}
#4{15 16 "GoNearTrainDoor"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75516960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{115 116 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.AI;\n
"}
}
:SLSProtectMethod.286331408{#4{9 10 "142109216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{424 538 "\[\n
    base.Start();\n
\n
\n
    station = GameObject.FindObjectOfType<Station>();\n
    station.TrainArriving += OnTrainArriving;\n
\n
    train = station.train;\n
\n
    //max distance from the destination (es. door when waiting, binary's empty)\n
    //maxRange = 5f;\n
    maxRange = 10f;\n
\n
\n
    int maskIndex = NavMesh.GetAreaFromName(\"Binary\");\n
    ecaAnimator.navMeshAgent.areaMask = (1 << maskIndex) | (1 << 0);\n
    \n
    GoToPlatform();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "75520032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{8 9 "74428720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnPlatformReached"}
 1.3 0.88 6.8 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{190 191 "\[\n
    Utility.Log(\"\" + name);\n
    currentAction.CompletedAction -= OnPlatformReached;\n
    //ecaAnimator.navMeshAgent.areaMask = 1 << NavMesh.GetAreaFromName(\"Binary\");\n
    //GoSomewhere();\n
\]"}
#4{17 21 "OnPlatformReached"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#3{#4{9 10 "142106864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnTrainArriving"}
 1.3 0.88 6 10  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{129 148 "\[\n
    Utility.Log(\"Train is arriving\");\n
\n
    station.train.DoorsOpen += OnDoorsOpen;\n
\n
    //DO SOMETHING\n
    GoNearTrainDoor();\n
\]"}
#4{15 16 "OnTrainArriving"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#3{#4{9 10 "142107648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "OnDoorFree"}
 1.3 0.879999 4 29  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[\n
    EnterTrain();\n
\]"}
#4{10 11 "OnDoorFree"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141875256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{22 23 "public Passenger : ECA"}
 18.9771 2.2 14.08 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{16 17 "public Passenger"}
#4{3 7 "ECA"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @202 @138 @158 @0 #6{16 4@57 @99 @30 @84 }
#6{16 1@15 }
#6{16 8@45 @126 @114 @190 @72 @178 @3 @166 }
#6{16 1@146 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}