:ArrayOb.273{6:Dictionary.4369{32 27:SLSProtectMember.286331409{:String.17{9 10 "130573680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "animator"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 12 "animator"}
#4{11 16 "ECAAnimator"}
#4{8 9 ".\\..\\ECA"}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "73485128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ActivateLayer"}
 1.3 0.88 5.2 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "ActivateLayer"}
#4{12 13 "virtual void"}
#4{33 34 "int layerIndex, float weightLayer"}
#4{0 1 ""}
 0}
#3{#4{8 9 "75532352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "waitStatus"}
 2 1.88 4 12  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "waitStatus"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{5 6 "false"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "94203442"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "PauseStage"}
 1.3 0.88 4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{108 116 "\[\n
    State = ActionState.Paused;\n
    if (StagePaused != null)\n
        StagePaused(this, EventArgs.Empty);\n
\]"}
#4{10 11 "PauseStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "94203440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{149 150 "\[\n
    State = ActionState.Completed;\n
    animator.currentStage = null;\n
    if (StageFinished != null)\n
        StageFinished(this, EventArgs.Empty);\n
\]"}
#4{8 9 "EndStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "94203441"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "AbortStage"}
 1.3 0.88 4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{177 178 "\[\n
    Utility.Log(\"Stage \" + GetType() + \" AbortStage() called\");\n
\n
    State = ActionState.Aborted;\n
\n
    if (StageAborted != null)\n
        StageAborted(this, EventArgs.Empty);\n
\]"}
#4{10 11 "AbortStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "98376312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{204 207 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using System;\n
\n
\tpublic enum ActionState \[\n
\tInactive,\n
\tRunning,\n
\tPaused,\n
\tAborted,\n
\tCompleted\n
\]\n
"}
}
#7{#4{8 9 "94195992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "ReactToActionFinished"}
 1.3 0.879999 8.4 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{21 22 "ReactToActionFinished"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "164792024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "ikManager"}
 1.3 0.88 3.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{76 77 "\[\n
  get \[\n
\tAssert.IsNotNull(animator);\n
\treturn animator.Eca.ikManager;\n
  \]\n
\]"}
#4{9 10 "ikManager"}
#4{8 9 "IKSetter"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "94201088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{64 65 "\[\n
\tState = ActionState.Running;\n
\tanimator.currentStage = this;\n
\]"}
#4{10 11 "StartStage"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "164241472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnEventComplete"}
 1.3 0.88 6 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "\[\n
    EndStage();\n
\]"}
#4{15 16 "OnEventComplete"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#9{#4{9 10 "129248128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Animator"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{55 56 "\[\n
  set \[animator = value;\] \n
  get \[return animator;\]\n
\]"}
#4{8 9 "Animator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "164789904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "State"}
 1.3 0.879999 2 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 197 "\[\n
  set; get;\n
\]"}
#4{5 6 "State"}
#4{11 15 "ActionState"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 24 ""}
}
#7{#4{9 10 "164810488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{195 196 "\[\n
  if(waitTime)\n
  \[\n
\tdouble elapsedMillisecs = ((TimeSpan)(DateTime.Now - startTime)).TotalMilliseconds;\n
\n
\tif(elapsedMillisecs > waitTime)\n
\t\[\n
\t\twaitStatus = false;\n
\t\tOnWaitCompleted();\n
 \t\]\n
  \]\n
\]"}
#4{6 7 "Update"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "94202656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "ReactToLabelUpdate"}
 1.3 0.879999 7.2 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{18 19 "ReactToLabelUpdate"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{8 9 "73485520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "WaitFor"}
 1.3 0.880004 2.8 12  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{82 100 "\[\n
  waitStatus = true;\n
  waitTime = seconds * 1000;\n
  startTime = DateTime.Now;\n
\]\n
"}
#4{7 8 "WaitFor"}
#4{4 5 "void"}
#4{13 14 "float seconds"}
#4{0 1 ""}
 0}
:SLSConstructor.286331408{#4{9 10 "158919224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAnimator ecaA"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{63 64 "\[\n
   animator = ecaAnimator;\n
   State = ActionState.Inactive;\n
\]"}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#4{30 49 "ECAAnimator ecaAnimator = null"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "98375800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{8 9 "73481600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "DeactivateLayer"}
 1.3 0.88 6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{15 16 "DeactivateLayer"}
#4{12 13 "virtual void"}
#4{33 34 "int layerIndex, float weightLayer"}
#4{0 1 ""}
 0}
#7{#4{8 9 "94200304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "ReactToStateUpdate"}
 1.3 0.879999 7.2 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{18 19 "ReactToStateUpdate"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "157705424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ActivateBodyParts"}
 1.3 0.88 6.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{17 18 "ActivateBodyParts"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "75527072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "waitTime"}
 2.4 1.88 3.2 21  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "waitTime"}
#4{6 7 "double"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "94197560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "ReactToActionStart"}
 1.3 0.879999 7.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{18 19 "ReactToActionStart"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#3{#4{8 9 "75527073"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "startTime"}
 2.2 1.88 3.6 30  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "startTime"}
#4{8 10 "DateTime"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "73482776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnWaitCompleted"}
 1.3 0.880004 6 22  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4 5 "\[\n
\]\n
"}
#4{15 16 "OnWaitCompleted"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "120555464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public abstract ECAActionStage"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.78008 4.04449 0
 0  0 #4{30 31 "public abstract ECAActionStage"}
#4{0 7 ""}
#4{0 13 ""}
#5{16 3#4{40 41 "public event EventHandler StageFinished;"}
#4{39 40 "public event EventHandler StageAborted;"}
#4{38 39 "public event EventHandler StagePaused;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "157706208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "DisactivateBodyParts"}
 1.3 0.88 8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{20 21 "DisactivateBodyParts"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @310 @81 @212 @0 #5{16 0}
#5{16 4@3 @30 @256 @283 }
#5{16 0}
#5{16 7@244 @327 @126 @18 @220 @188 @298 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{28@138 @101 @164 @0 @45 @69 @114 @57 @0 @0 @0 @271 @232 @176 @89 @0 @0 @0 @151 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@200 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{366 367 "/*      CG&VG group @ Politecnico di Torino               */\n
/*              All Rights Reserved\t                      */\n
/*                                                        */\n
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */\n
/*  The copyright notice above does not evidence any      */\n
/*  actual or intended publication of such source code.   */\n
"}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
