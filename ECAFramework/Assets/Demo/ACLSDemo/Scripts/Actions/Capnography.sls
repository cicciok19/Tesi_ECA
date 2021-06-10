:ArrayOb.273{6:Dictionary.4369{16 8:SLSPublicMethod.286331408{:String.17{9 10 "108268816"}
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
:SLSPrivateMember.286331409{#4{9 10 "108178112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "capnographyTube"}
 1 1.88 6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "capnographyTube"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "108178552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, Transfo"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{127 128 ": base(eca)\n
\[\n
        capnographyPosition = patient.GetCapnographyPosition();\n
        this.capnographyTube = capnographyTube;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{51 52 "ECA eca, Transform capnographyTube, Patient patient"}
#4{0 1 ""}
}
#3{#4{9 10 "108276264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{651 652 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    TurnStage turnToTube = new TurnStage(capnographyTube);\n
    PickStage pickTube = new PickStage(capnographyTube, 1, false, HandSide.RightHand);\n
    TurnStage turnToPatient = new TurnStage(capnographyPosition);\n
    LookStableStage lookPatient = new LookStableStage(capnographyPosition);\n
    WaitStage wait = new WaitStage(1f);\n
    DropStage dropTube = new DropStage(pickTube, capnographyPosition);\n
\n
    stages.Add(turnToTube);\n
    stages.Add(pickTube);\n
    stages.Add(turnToPatient);\n
    stages.Add(lookPatient);\n
    stages.Add(wait);\n
    stages.Add(dropTube);\n
\n
    SetStages(stages);\n
\]"}
#4{11 12 "SetupAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140113072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public Capnography : ECAAction"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{18 19 "public Capnography"}
#4{9 10 "ECAAction"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{9 10 "108179872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{19 20 "capnographyPosition"}
 0.3 1.88 7.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "capnographyPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "22847616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22851712"}
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
}
:CLSCSSem.1118481{ 56  51 @54 @91 @83 @0 #6{16 2@68 @15 }
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@42 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@30 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
