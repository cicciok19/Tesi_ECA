:ArrayOb.273{6:Dictionary.4369{16 16:SLSPublicMember.286331409{:String.17{9 10 "130569280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "allStages"}
 1.3 1.88 3.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{9 10 "allStages"}
#4{16 17 "ECAActionStage[]"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "131360632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "onStateUpdate"}
 1.3 0.88 5.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "onStateUpdate"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "131360240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "startAction"}
 1.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{134 135 "\[\n
    if (allStages != null)\n
    \[\n
        if(currentStage != null)\n
        \[\n
            currentStage.startStage();\n
        \]\n
    \]\n
\]"}
#4{11 12 "startAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "130569720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "currentStageIdx"}
 1.3 1.88 6 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{15 16 "currentStageIdx"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "98426344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{25 26 "public abstract ECAAction"}
 18.4286 2.2 16 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  9.61966 4.63636 0
 0  0 #4{25 26 "public abstract ECAAction"}
#4{0 7 ""}
#4{0 13 ""}
#5{16 1#4{42 43 "public event EventHandler CompletedAction;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSExternObject.286331409{#4{9 10 "131321384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 1 12  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 }
:JLSGlobalDeclare.286331408{#4{8 9 "98375288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{95 96 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
\n
\n
"}
}
#6{#4{9 10 "131366512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "onCompletedAction"}
 1.3 0.88 6.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{84 85 "\[\n
    if (CompletedAction != null)\n
        CompletedAction(this, EventArgs.Empty);\n
\]"}
#4{17 18 "onCompletedAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "131365336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "nextStage"}
 1.3 0.88 3.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{243 244 "\[\n
    if (currentStage != null)\n
    \[\n
        //iscrivo l'azione all'evento che segnala la fine dello stage\n
        currentStage.StageFinished += onStageFinished;\n
        currentStage.startStage();\n
    \]\n
    else\n
        onCompletedAction();\n
\]"}
#4{9 10 "nextStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "131366120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{79 80 "\[\n
    currentStageIdx = 0;\n
    currentStage.StageFinished += onStageFinished;\n
\]"}
#4{11 12 "SetupAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "98376056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{9 10 "131361024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "onLabelUpdate"}
 1.3 0.88 5.2 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "onLabelUpdate"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "131365728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "onStageFinished"}
 1.3 0.88 6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{94 95 "\[\n
    currentStage.StageFinished -= onStageFinished;\n
    currentStageIdx++;\n
    nextStage();\n
\]"}
#4{15 16 "onStageFinished"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "131364944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "currentStage"}
 1.3 0.88 4.8 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{164 165 "\[\n
    get\n
    \[\n
        if (currentStageIdx >= 0 && currentStageIdx < allStages.Length)\n
            return allStages[currentStageIdx];\n
\n
        return null;\n
    \]\n
\]"}
#4{12 13 "currentStage"}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "130570600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{34 35 "\[\n
    EcaAnimator = ecaAnimator;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{23 24 "ECAAnimator ecaAnimator"}
#4{0 1 ""}
}
#3{#4{9 10 "130572360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "EcaAnimator"}
 1.3 1.88 4.4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "EcaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @57 @85 @129 @0 #5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 1@72 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @42 @0 @185 @0 @3 @0 @0 @0 }
#1{30@117 @30 @105 @149 @93 @18 @137 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @161 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@173 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}