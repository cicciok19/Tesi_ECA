:ArrayOb.273{6:Dictionary.4369{16 15:SLSProtectMethod.286331408{:String.17{9 10 "131028304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CreateActionList"}
 1.3 0.88 6.4 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 74 "\[\n
\]"}
#4{16 17 "CreateActionList"}
#4{12 14 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSConstructor.286331408{#4{9 10 "131389921"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECA eca,List<ECA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{40 41 ":base(eca)\n
\[\n
  this.actions = actions;\n
\]"}
#4{18 19 "ECACompositeAction"}
#4{0 1 ""}
#4{31 32 "ECA eca,List<ECAAction> actions"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75280528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{9 10 "103355872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "CompleteAndAdvance"}
 1.3 0.879999 7.2 16  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{71 72 "\[\n
    Detach(ActualAction);\n
    actualActionIdx++;\n
    NextAction();\n
\]\n
"}
#4{18 19 "CompleteAndAdvance"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{9 10 "131389920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "ECA eca"}
 0.299999 0.88 2.8 47  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 39 ":base(eca)\n
\[\n
\]"}
#4{18 19 "ECACompositeAction"}
#4{0 1 ""}
#4{7 8 "ECA eca"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{426 427 "\[\n
    if (actions.Count != 0)\n
    \[\n
        if(ActualAction != null)\n
        \[\n
\t\tif(ecaAnimator.actualAction != null && \n
\t\t(ecaAnimator.actualAction.State == ActionState.Running || ecaAnimator.actualAction.State == ActionState.Paused))\n
\t\t\t  ecaAnimator.actualAction.Abort();\n
\n
\t\tAttach(ActualAction);\t\n
\t\tecaAnimator.actualAction = ActualAction;\n
\n
\t\t\n
\t\tState = ActionState.Running;\n
\t\tActualAction.StartAction();\n
        \]\n
    \]\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "75054240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "actualActionIdx"}
 1 1.88 6 19  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "actualActionIdx"}
#4{3 4 "int"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{1 2 "0"}
#4{0 1 ""}
}
#8{#4{8 9 "75050280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "actions"}
 2.6 1.88 2.8 10  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "actions"}
#4{15 16 "List<ECAAction>"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{21 22 "new List<ECAAction>()"}
#4{0 1 ""}
}
#3{#4{9 10 "130424513"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Detach"}
 1.3 0.879999 2.4 30  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 137 "\[\n
    action.CompletedAction -= OnActualActionCompleted;\n
\]"}
#4{6 7 "Detach"}
#4{4 5 "void"}
#4{16 21 "ECAAction action"}
#4{0 1 ""}
 0}
:SLSProperty.286331392{#4{9 10 "131228112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "ActualAction"}
 1.3 0.879999 4.8 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{159 162 "\[\n
    get\n
    \[\n
        if (actualActionIdx >= 0 && actualActionIdx < actions.Count)\n
            return actions[actualActionIdx];\n
\n
        return null;\n
    \]\n
\]"}
#4{12 13 "ActualAction"}
#4{9 15 "ECAAction"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "130424512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Attach"}
 1.3 0.879999 2.4 30  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 137 "\[\n
    action.CompletedAction += OnActualActionCompleted;\n
\]"}
#4{6 7 "Attach"}
#4{4 5 "void"}
#4{16 21 "ECAAction action"}
#4{0 1 ""}
 0}
#3{#4{9 10 "129307712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "OnActualActionCompleted"}
 1.3 0.879999 9.2 16  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{29 95 "\[\n
    CompleteAndAdvance();\n
\]"}
#4{23 24 "OnActualActionCompleted"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "131055288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public ECACompositeAction : ECAAction"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{25 26 "public ECACompositeAction"}
#4{9 17 "ECAAction"}
#4{0 13 ""}
#9{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75280272"}
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
#3{#4{9 10 "129305360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "NextAction"}
 1.3 0.88 4 10  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{219 220 "\[\n
    if (ActualAction != null)\n
    \[\n
        //iscrivo l'azione all'evento che segnala la fine dello stage\n
        Attach(ActualAction);\n
        ActualAction.StartAction();\n
    \]\n
    else\n
        OnCompletedAction();\n
\]"}
#4{10 11 "NextAction"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @150 @164 @27 @0 #9{16 0}
#9{16 2@86 @71 }
#9{16 0}
#9{16 6@126 @101 @138 @172 @35 @3 }
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@0 @0 @59 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @113 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@15 @0 @0 @47 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
