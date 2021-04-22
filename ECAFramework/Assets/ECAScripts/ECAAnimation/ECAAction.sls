:ArrayOb.273{6:Dictionary.4369{32 25:JLSGlobalDeclare.286331408{:String.17{8 9 "98375288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{112 190 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
using System.Linq;\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "98426344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{16 17 "public ECAAction"}
 20.0743 2.2 10.24 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  3.67917 4.24178 0
 0  0 #4{16 26 "public ECAAction"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 1#4{42 43 "public event EventHandler CompletedAction;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "119128008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "CurrentStageIdx"}
 1.3 1.88 6 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "CurrentStageIdx"}
#4{3 4 "int"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "131366120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetupAction"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{79 80 "\[\n
    CurrentStageIdx = 0;\n
    CurrentStage.StageFinished += OnStageFinished;\n
\]"}
#4{11 12 "SetupAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "129309280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnStateUpdate"}
 1.3 0.879999 5.2 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "OnStateUpdate"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "129305360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "NextStage"}
 1.3 0.88 3.6 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{218 348 "\[\n
    if (CurrentStage != null)\n
    \[\n
        //iscrivo l'azione all'evento che segnala la fine dello stage\n
        Attach(CurrentStage);\n
        CurrentStage.StartStage();\n
    \]\n
    else\n
        OnCompletedAction();\n
\]"}
#4{9 10 "NextStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "118544504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "ikManager"}
 1.3 1.88 3.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "ikManager"}
#4{8 9 "IKSetter"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "129307713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnStageAborted"}
 1.3 0.879999 5.6 16  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{91 95 "\[\n
    Utility.Log(\"Stage \" + sender.GetType() + \"has aborted\");\n
    Detach(CurrentStage);\n
\]"}
#4{14 16 "OnStageAborted"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:SLSProperty.286331392{#4{9 10 "164789904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "State"}
 1.3 0.879999 2 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{362 363 "\[\n
    set \[\n
\tif(CurrentStage == null)\n
\t\treturn;\n
\n
        if (value == ActionState.Paused)\n
\t\tCurrentStage.PauseStage();\n
\t    else\n
\t    if(value == ActionState.Aborted)\n
\t\t    CurrentStage.AbortStage();\n
\t    else\n
            \tCurrentStage.State = value;\n
    \]\n
  get \[\n
\tif(CurrentStage != null)\n
\t\treturn CurrentStage.State;\n
\telse\n
\t\treturn ActionState.Inactive;\n
  \]\n
\]"}
#4{5 6 "State"}
#4{11 15 "ActionState"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 24 ""}
}
#8{#4{9 10 "129308888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnCompletedAction"}
 1.3 0.879999 6.8 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{84 85 "\[\n
    if (CompletedAction != null)\n
        CompletedAction(this, EventArgs.Empty);\n
\]"}
#4{17 18 "OnCompletedAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{190 191 "\[\n
    if (AllStages != null)\n
    \[\n
        if(CurrentStage != null)\n
        \[\n
\t\tState = ActionState.Running;\n
\t\tAttach(CurrentStage);\n
            \tCurrentStage.StartStage();\n
        \]\n
    \]\n
\]"}
#4{11 12 "StartAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "130572360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "EcaAnimator"}
 1.3 1.88 4.4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "EcaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "119130208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{221 222 "\[\n
    EcaAnimator = ecaAnimator;\n
    foreach(var stage in stages)\n
    \[\n
        stage.Animator = ecaAnimator;\n
        //stage.StageFinished += OnStageFinished;\n
    \]\n
\n
    AllStages = stages.ToArray();\n
    SetupAction();\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{52 53 "ECAAnimator ecaAnimator, List<ECAActionStage> stages"}
#4{0 1 ""}
}
#11{#4{9 10 "119130209"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, List<EC"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{226 227 "\[\n
    EcaAnimator = eca.ecaAnimator;\n
    foreach(var stage in stages)\n
    \[\n
\t    stage.Animator = eca.ecaAnimator;\n
        //stage.StageFinished += OnStageFinished;\n
    \]\n
\n
    AllStages = stages.ToArray();\n
    SetupAction();\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{36 53 "ECA eca, List<ECAActionStage> stages"}
#4{0 1 ""}
}
#9{#4{9 10 "127721464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "GetIkManager"}
 1.3 0.88 4.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{49 50 "\[\n
    ikManager = eca.GetComponent<IKSetter>();\n
\]"}
#4{12 13 "GetIkManager"}
#4{12 13 "virtual void"}
#4{7 8 "ECA eca"}
#4{0 1 ""}
 0}
#7{#4{9 10 "119128888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "AllStages"}
 1.3 1.88 3.6 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "AllStages"}
#4{16 17 "ECAActionStage[]"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#10{#4{8 9 "93721256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "CurrentStage"}
 1.3 0.88 4.8 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{164 165 "\[\n
    get\n
    \[\n
        if (CurrentStageIdx >= 0 && CurrentStageIdx < AllStages.Length)\n
            return AllStages[CurrentStageIdx];\n
\n
        return null;\n
    \]\n
\]"}
#4{12 13 "CurrentStage"}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "130422944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Abort"}
 0.3 0.88 2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{71 72 "\[\n
    Utility.Log(\"Action aborted\");\n
    State = ActionState.Aborted;\n
\]"}
#4{5 6 "Abort"}
#4{4 5 "void"}
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
#9{#4{9 10 "129307712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnStageFinished"}
 1.3 0.879999 6 16  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{69 95 "\[\n
    Detach(CurrentStage);\n
    CurrentStageIdx++;\n
    NextStage();\n
\]"}
#4{15 16 "OnStageFinished"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:JLSExternObject.286331409{#4{9 10 "131321384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 12  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 }
#9{#4{9 10 "129307714"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnStagePaused"}
 1.3 0.879999 5.2 16  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{64 95 "\[\n
    Utility.Log(\"Stage \" + sender.GetType() + \"has paused\");\n
\]"}
#4{13 16 "OnStagePaused"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#9{#4{9 10 "130424513"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Detach"}
 1.3 0.879999 2.4 30  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{129 137 "\[\n
    stage.StageFinished -= OnStageFinished;\n
    stage.StageAborted -= OnStageAborted;\n
    stage.StagePaused -= OnStagePaused;\n
\]"}
#4{6 7 "Detach"}
#4{4 5 "void"}
#4{20 21 "ECAActionStage stage"}
#4{0 1 ""}
 0}
#9{#4{9 10 "130424512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Attach"}
 1.3 0.879999 2.4 30  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{129 137 "\[\n
    stage.StageFinished += OnStageFinished;\n
    stage.StageAborted += OnStageAborted;\n
    stage.StagePaused += OnStagePaused;\n
\]"}
#4{6 7 "Attach"}
#4{4 5 "void"}
#4{20 21 "ECAActionStage stage"}
#4{0 1 ""}
 0}
#8{#4{9 10 "128708328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnLabelUpdate"}
 1.3 0.879999 5.2 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "OnLabelUpdate"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @11 @3 @232 @0 #6{16 0}
#6{16 0}
#6{16 0}
#6{16 6@180 @240 @92 @265 @289 @277 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 1@252 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @26 @0 @192 @0 @0 @0 @141 @0 @77 @0 @0 @0 }
#1{30@41 @220 @0 @0 @0 @0 @0 @207 @129 @65 @0 @117 @53 @301 @0 @0 @0 @0 @104 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@168 @156 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
