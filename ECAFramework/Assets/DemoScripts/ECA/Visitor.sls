:ArrayOb.273{6:Dictionary.4369{16 14:SLSPublicMethod.286331408{:String.17{9 10 "130399704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "GoToPainting"}
 0.3 0.88 4.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{385 387 "\[\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage reachPainting = new GoToStage(painting.GetChairDestination());\n
    stages.Add(reachPainting);\n
    ECAAction newAction = new ECAAction(this, stages);\n
\n
\n
    newAction.CompletedAction += ArrivedAtPainting;\n
    Utility.Log(\"Visitor \" + this.Name + \" moving to \" + painting.name);\n
\n
    newAction.StartAction();\n
\]"}
#4{12 13 "GoToPainting"}
#4{4 5 "void"}
#4{17 18 "Painting painting"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "158395976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{148 149 "using System;\n
using System.Linq;\n
using System.Collections.Generic;\n
using IntentRecognitionResults;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
"}
}
:SLSProtectMethod.286331408{#4{9 10 "104028512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 20  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{158 182 "\[\n
  // component should be added to GO\n
  ECAAnimatorMxM ecaAnimator = GetComponent<ECAAnimatorMxM>();\n
  Assert.IsNotNull(ecaAnimator);\n
  return ecaAnimator;\n
\]"}
#4{14 15 "AddECAAnimator"}
#4{20 21 "override ECAAnimator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSExternObject.286331409{#4{8 9 "94606816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 7  46 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{14 16 "ECAAnimatorMxM"}
#4{15 16 ".\\ECAAnimations"}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
#6{#4{8 9 "85662088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 877 "\[\n
    base.Awake();\n
\]"}
#4{5 6 "Awake"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "85535760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "SetEcaId"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 70 "\[\n
    ID = Ecas.Default;\n
\]"}
#4{8 9 "SetEcaId"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "157790352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{13 14 "Visitor : ECA"}
 20.6229 2.2 8.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{7 8 "Visitor"}
#4{3 7 "ECA"}
#4{4 20 "./.."}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{8 9 "85708344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 903 "\[\n
  base.Start();\n
\n
  SelectDestinations();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSProtectMember.286331409{#4{9 10 "158920984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "paintings"}
 2.2 1.88 3.6 10  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "paintings"}
#4{14 15 "List<Painting>"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{25 26 "     new List<Painting>()"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "126829680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ArrivedAtPainting"}
 1.3 0.88 6.8 20  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{99 100 "\[\n
    Utility.Log(\"Visitor \" + this.Name + \" arrived at destination...\");\n
    Application.Quit();\n
\]"}
#4{17 18 "ArrivedAtPainting"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "129815976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "SelectDestinations"}
 1.3 0.879999 7.2 24  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{470 471 "\[\n
    Painting[] scenePaintings = FindObjectsOfType<Painting>();\n
\n
    if(scenePaintings == null)\n
    \[\n
        Utility.LogWarning(\"Visitor \" + this.Name + \" could not find any painting to see...\");\n
        return;\n
    \]\n
\n
    paintings = scenePaintings.ToList<Painting>();\n
    \n
    // shuffle list, tricks from stackoverflow\n
    paintings = paintings.OrderBy(a => Guid.NewGuid()).ToList();\n
\n
    // just as debug, go to the first painting\n
    GoToPainting(paintings[0]);\n
\]"}
#4{18 21 "SelectDestinations"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{9 10 "155568728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 25  46 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{8 9 "Painting"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
#7{#4{8 9 "95586680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 16  46 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{5 6 "Chair"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
:JLSFriendDeclare.286331408{#4{9 10 "158394696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{33 34 "protected static int counter = 0;"}
}
}
:CLSCSSem.1118481{ 56  51 @72 @15 @163 @0 #8{16 0}
#8{16 1@98 }
#8{16 1@113 }
#8{16 4@48 @86 @23 @125 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 3@35 @150 @137 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@60 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
