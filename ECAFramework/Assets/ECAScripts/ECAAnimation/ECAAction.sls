:ArrayOb.273{6:Dictionary.4369{64 32:SLSPublicMember.286331409{:String.17{9 10 "131393440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "ecaAnimator"}
 1.3 1.88 4.4 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "ecaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "13898552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnEmotionUpdated"}
 1.3 0.88 6.4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{51 52 "\[\n
    ActualStage.ReactToEmotionUpdated(emotion);\n
\]"}
#4{16 17 "OnEmotionUpdated"}
#4{12 13 "virtual void"}
#4{18 19 "ECAEmotion emotion"}
#4{0 1 ""}
}
#3{#4{9 10 "119128888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "AllStages"}
 1.3 1.88 3.6 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "AllStages"}
#4{16 17 "ECAActionStage[]"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "130424512"}
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
#7{#4{9 10 "129305360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "NextStage"}
 1.3 0.88 3.6 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{215 216 "\[\n
    if (ActualStage != null)\n
    \[\n
        //iscrivo l'azione all'evento che segnala la fine dello stage\n
        Attach(ActualStage);\n
        ActualStage.StartStage();\n
    \]\n
    else\n
        OnCompletedAction();\n
\]"}
#4{9 10 "NextStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{9 10 "127721464"}
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
#7{#4{9 10 "131033008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "SetStages"}
 1.3 0.879999 3.6 19  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{196 198 "\[\n
    foreach(var stage in stages)\n
    \[\n
\t    stage.Animator = eca.ecaAnimator;\n
        //stage.StageFinished += OnStageFinished;\n
    \]\n
\n
    AllStages = stages.ToArray();\n
    actualStageIdx = 0;\n
\]"}
#4{9 10 "SetStages"}
#4{4 5 "void"}
#4{27 28 "List<ECAActionStage> stages"}
#4{0 1 ""}
 0}
#7{#4{9 10 "130424513"}
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
:JLSFriendDeclare.286331408{#4{8 9 "98376056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "164789904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "State"}
 1.3 0.879999 2 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{359 366 "\[\n
    set \[\n
\tif(ActualStage == null)\n
\t\treturn;\n
\n
        if (value == ActionState.Paused)\n
\t\t    ActualStage.PauseStage();\n
\t    else\n
\t    if(value == ActionState.Aborted)\n
\t\t    ActualStage.AbortStage();\n
\t    else\n
            ActualStage.State = value;\n
    \]\n
  get \[\n
\tif(ActualStage != null)\n
\t\treturn ActualStage.State;\n
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
#7{#4{8 9 "13894632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnLabelUpdate"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "OnLabelUpdate"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#6{#4{8 9 "13896200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Pause"}
 0.3 0.88 2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{69 70 "\[\n
    Utility.Log(\"Action paused\");\n
    State = ActionState.Paused;\n
\]"}
#4{5 6 "Pause"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "129307713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnStageAborted"}
 1.3 0.879999 5.6 16  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{91 95 "\[\n
    Utility.Log(\"Stage \" + sender.GetType() + \" has aborted\");\n
    Detach(ActualStage);\n
\]"}
#4{14 16 "OnStageAborted"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#7{#4{8 9 "13896592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnStateUpdate"}
 1.3 0.88 5.2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "OnStateUpdate"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#6{#4{8 9 "13895416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Resume"}
 0.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{162 163 "\[\n
    if(State == ActionState.Paused)\n
    \[\n
        Utility.Log(\"Action resumed\");\n
        State = ActionState.Running;\n
        ActualStage.ResumeStage();\n
    \]\n
\]"}
#4{6 7 "Resume"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "118544504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "ikManager"}
 1.3 1.88 3.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "ikManager"}
#4{8 9 "IKSetter"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "129307714"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnStagePaused"}
 1.3 0.879999 5.2 16  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{65 95 "\[\n
    Utility.Log(\"Stage \" + sender.GetType() + \" has paused\");\n
\]"}
#4{13 16 "OnStagePaused"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#6{#4{9 10 "130422944"}
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
#9{#4{9 10 "131228112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "ActualStage"}
 1.3 0.879999 4.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{341 342 "\[\n
    get\n
    \[\n
        try\n
        \[\n
            if (AllStages != null && actualStageIdx >= 0 && actualStageIdx < AllStages.Length)\n
                return AllStages[actualStageIdx];\n
\n
        \]\n
        catch (Exception e)\n
        \[\n
            Utility.LogError(\"Generated exception :: \" + e.Message);\n
        \]\n
\n
\n
        return null;\n
    \]\n
\]"}
#4{11 12 "ActualStage"}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
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
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 }
:SLSConstructor.286331408{#4{9 10 "119130210"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, ECAActi"}
 0.299999 0.88 6.4 47  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{185 233 "\[\n
    this.eca = eca;\n
    ecaAnimator = eca.ecaAnimator;\n
    AllStages = new ECAActionStage[1];\n
    AllStages[0] = stage;\n
    stage.Animator = eca.ecaAnimator;\n
    actualStageIdx = 0;\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{29 53 "ECA eca, ECAActionStage stage"}
#4{0 1 ""}
}
#11{#4{9 10 "119130209"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca, List<EC"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 233 "\[\n
    this.eca = eca;\n
    ecaAnimator = eca.ecaAnimator;\n
    SetStages(stages);\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{36 53 "ECA eca, List<ECAActionStage> stages"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "103938848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "eca"}
#4{3 4 "ECA"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "129308888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnCompletedAction"}
 1.3 0.879999 6.8 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{120 121 "\[\n
    State = ActionState.Completed;\n
\n
    if (CompletedAction != null)\n
        CompletedAction(this, EventArgs.Empty);\n
\]"}
#4{17 18 "OnCompletedAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "98426344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{16 17 "public ECAAction"}
 20.0743 2.2 10.24 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  6.06986 4.34043 0
 0  0 #4{16 26 "public ECAAction"}
#4{0 7 ""}
#4{0 13 ""}
#5{16 1#4{42 43 "public event EventHandler CompletedAction;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{8 9 "13893456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnEmotionChanged"}
 1.3 0.88 6.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{51 52 "\[\n
    ActualStage.ReactToEmotionChanged(emotion);\n
\]"}
#4{16 17 "OnEmotionChanged"}
#4{12 13 "virtual void"}
#4{18 19 "ECAEmotion emotion"}
#4{0 1 ""}
}
#11{#4{9 10 "131389920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "ECA eca"}
 0.299999 0.88 2.8 47  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 59 "\[\n
    this.eca = eca;\n
    ecaAnimator = eca.ecaAnimator;\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{7 8 "ECA eca"}
#4{0 1 ""}
}
#7{#4{9 10 "129307712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnStageFinished"}
 1.3 0.879999 6 16  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 95 "\[\n
    Detach(ActualStage);\n
    actualStageIdx++;\n
    NextStage();\n
\]"}
#4{15 16 "OnStageFinished"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#11{#4{9 10 "119130208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{264 265 "\[\n
    this.ecaAnimator = ecaAnimator;\n
    this.eca = ecaAnimator.Eca;\n
    foreach (var stage in stages)\n
    \[\n
        stage.Animator = ecaAnimator;\n
        //stage.StageFinished += OnStageFinished;\n
    \]\n
\n
    AllStages = stages.ToArray();\n
    actualStageIdx = 0;\n
\]"}
#4{9 12 "ECAAction"}
#4{0 1 ""}
#4{52 53 "ECAAnimator ecaAnimator, List<ECAActionStage> stages"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "98375288"}
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
#6{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{409 418 "\[\n
    if (AllStages != null)\n
    \[\n
        if(ActualStage != null)\n
        \[\n
\t\tif(ecaAnimator.actualAction != null && \n
\t\t(ecaAnimator.actualAction.State == ActionState.Running || ecaAnimator.actualAction.State == ActionState.Paused))\n
\t\t\t  ecaAnimator.actualAction.Abort();\n
\n
\t\tState = ActionState.Running;\n
\t\tAttach(ActualStage);\t\n
\t\tActualStage.StartStage();\n
\t\tecaAnimator.actualAction = this;\n
        \]\n
    \]\n
\]"}
#4{11 12 "StartAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#12{#4{9 10 "131393000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "actualStageIdx"}
 1.2 1.88 5.6 18  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "actualStageIdx"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @302 @365 @105 @0 #5{16 0}
#5{16 2@385 @275 }
#5{16 0}
#5{16 10@69 @341 @150 @201 @45 @93 @162 @126 @57 @81 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 1@238 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @3 @0 @0 @0 @30 @0 @0 @0 @0 @0 @186 @0 @0 @0 }
#1{30@138 @213 @174 @317 @18 @0 @0 @0 @373 @0 @0 @290 @0 @0 @0 @0 @0 @0 @113 @0 @225 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@263 @353 @251 @329 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#16{1 }
#16{0 }
#16{1 }
}
