:ArrayOb.273{6:Dictionary.4369{16 11:SLSThisIcon.286331409{:String.17{9 10 "139096864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{25 26 "public TimeRecorder : ECA"}
 18.4286 2.2 16 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  4.11384 3.94584 0
 0  0 #4{19 20 "public TimeRecorder"}
#4{3 7 "ECA"}
#4{0 13 ""}
:OrderedCltn.4369{16 1#4{38 39 "public event EventHandler TimeExpired;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "109438136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "startTime"}
 2.2 1.88 3.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "startTime"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "109526208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "HandleStartRecord"}
 1.3 0.88 6.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{222 223 "\[\n
    //send message\n
    Debug.Log(\"INIZIO ATTESA DI \" + time + \" SECONDI\");\n
    recordAction = new ECAAction(this, new WaitStage(time));\n
    recordAction.CompletedAction += OnTimeExpired;\n
    recordAction.StartAction();\n
\]"}
#4{17 18 "HandleStartRecord"}
#4{4 5 "void"}
#4{10 11 "float time"}
#4{0 1 ""}
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
:SLSProtectMethod.286331408{#4{9 10 "109520328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 19  7 #4{0 1 ""}
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
#7{#4{9 10 "109521504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnTimeExpired"}
 1.3 0.88 5.2 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{176 177 "\[\n
    recordAction.CompletedAction -= OnTimeExpired;\n
    //send message\n
    Debug.Log(\"FINE ATTESA\");\n
    if (TimeExpired != null)\n
        TimeExpired(this, EventArgs.Empty);\n
\]"}
#4{13 14 "OnTimeExpired"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "109437256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "intentNames"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "intentNames"}
#4{8 9 "string[]"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{32 33 " \[ \"StartRecord\", \"StopRecord\" \]"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22847360"}
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
#9{#4{9 10 "108167936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{48 49 "\[\n
    base.Start();\n
    HandleStartRecord(5f);\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "109519544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{28 29 "\[\n
    base.Handle(intent);\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
#6{#4{9 10 "109441216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "recordAction"}
 1.6 1.88 4.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "recordAction"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @92 @45 @0 #5{16 2@18 @124 }
#5{16 0}
#5{16 2@33 @65 }
#5{16 2@100 @53 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @77 @0 @0 @0 }
#1{16@112 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
