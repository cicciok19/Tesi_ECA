:ArrayOb.273{6:Dictionary.4369{16 15:SLSPublicMethod.286331408{:String.17{9 10 "108268816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{145 146 "\[\n
    base.Handle(intent);\n
    switch (intent.IntentName)\n
    \[\n
        case \"StartCPR\":\n
            HandleStartCPR();\n
            break;\n
    \]\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "138798736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "intentNames"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "intentNames"}
#4{8 9 "string[]"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{15 16 " \[ \"StartCPR\" \]"}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "138797856"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "timeRecorder"}
 1.6 1.88 4.8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "timeRecorder"}
#4{12 13 "TimeRecorder"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "138799616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "patient"}
 2.6 1.88 2.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "patient"}
#4{7 8 "Patient"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22847872"}
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
:SLSPrivateMethod.286331408{#4{9 10 "108269992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "HandleStartCPR"}
 1.3 0.88 5.6 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{188 189 "\[\n
    //send message\n
    //StartCoroutine(CompressFor(10f));\n
    //do action\n
    cpr = new CPRAction(this, cprPosition);\n
    cpr.CompletedAction += OnCPRCompleted;\n
    cpr.StartAction();\n
\]"}
#4{14 15 "HandleStartCPR"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140119144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{23 24 "public Compressor : ECA"}
 18.7943 2.2 14.72 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{17 18 "public Compressor"}
#4{3 7 "ECA"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "108275872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{246 247 "\[\n
    base.Start();\n
    patient = FindObjectOfType<Patient>();\n
    timeRecorder = FindObjectOfType<TimeRecorder>();\n
    cprPosition = patient.GetCPRPosition();\n
\n
    //ikManager.ChangeFadeInTime(5f);\n
\n
    //just for debug\n
    //HandleStartCPR();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#11{#4{9 10 "108276264"}
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
#3{#4{9 10 "108269600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.88 12.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{119 120 "\[\n
    IntentName = new List<string> \[ \"StartCPR\" \];\n
    IntentManager.Instance.AddIntentHandler(IntentName[0], this);\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "108271168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnCPRCompleted"}
 1.3 0.88 5.6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{29 30 "\[\n
    patient.OnCPREnded();\n
\]"}
#4{14 15 "OnCPRCompleted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#9{#4{9 10 "108270384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "CompressFor"}
 1.3 0.88 4.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    yield return new WaitForSeconds(time);\n
\]"}
#4{11 12 "CompressFor"}
#4{11 12 "IEnumerator"}
#4{10 11 "float time"}
#4{0 1 ""}
}
#7{#4{9 10 "138800056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "cprPosition"}
 1.8 1.88 4.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "cprPosition"}
#4{11 12 "CPRPosition"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "138799176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "cpr"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "cpr"}
#4{9 10 "CPRAction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
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
:CLSCSSem.1118481{ 56  51 @80 @60 @184 @0 #6{16 4@169 @45 @30 @154 }
#6{16 0}
#6{16 3@68 @142 @130 }
#6{16 2@94 @106 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @15 @0 @0 @0 }
#1{16@3 @118 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
