:ArrayOb.273{6:Dictionary.4369{16 8:SLSConstructor.286331408{:String.17{9 10 "131125192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "Passenger eca"}
 0.299999 0.88 5.2 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{62 105 ":base(eca)\n
\[\n
        this.eca = eca;\n
\tstation = eca.station;\n
\]"}
#4{13 14 "ReachPlatform"}
#4{0 1 ""}
#4{13 14 "Passenger eca"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "142105688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 13 "SetupAction"}
 1.3 0.88 4.4 10  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{364 583 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
\n
    Vector3 platformPosition = Randomize.GetRandomPosition(station.GetPlatform());\n
    GoToStage reachPlatform = new GoToStage(platformPosition);\n
    TurnStage turnToTrain = new TurnStage(station.train.transform);\n
    stages.Add(reachPlatform);\n
    stages.Add(turnToTrain);\n
\n
    SetStages(stages);\n
\]"}
#4{11 13 "SetupAction"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{42 418 "\[\n
  SetupAction();\n
  base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75285392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75286160"}
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
:SLSProtectMember.286331409{#4{9 10 "131124312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "station"}
 2.6 1.88 2.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "station"}
#4{7 8 "Station"}
#4{16 17 "./../ObjectTypes"}
:OrderedCltn.4369{16 0}
#10{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131051424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{32 42 "public ReachPlatform : ECAAction"}
 17.1486 2.2 20.48 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public ReachPlatform"}
#4{9 19 "ECAAction"}
#4{0 13 ""}
#10{16 0}
#10{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#9{#4{9 10 "131124752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "eca"}
#4{9 10 "Passenger"}
#4{0 1 ""}
#10{16 0}
#10{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @70 @47 @39 @0 #10{16 0}
#10{16 2@84 @55 }
#10{16 1@15 }
#10{16 0}
#10{16 0}
#10{16 0}
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#10{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @27 @0 @0 @0 @0 @0 @0 @0 }
#1{16@3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#10{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
