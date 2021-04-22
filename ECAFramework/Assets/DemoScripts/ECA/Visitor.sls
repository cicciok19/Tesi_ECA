:ArrayOb.273{6:Dictionary.4369{32 19:SLSPrivateMethod.286331408{:String.17{9 10 "131539496"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnEndPaintVisit"}
 1.3 0.88 6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{583 590 "\[\n
    Utility.Log(\"Visitor \" + this.Name + \" visited paint \" + paintings[idxPaint].id);\n
\n
    //free the paint\n
    paintings[idxPaint].chair.SittableBusy -= OnChairBusy;\n
    paintings[idxPaint].chair.SittableFree -= OnChairFree;\n
\n
/*\n
    idxPaint++;\n
\n
    if (paintings.Count > idxPaint)\n
    \[\n
\t\n
\n
        while (paintings[idxPaint].Occupied)\n
        \[ \n
            //while next paint is occupied do nothing\n
        \]\n
        \n
        //then visit paint\n
        GoToPainting(paintings[idxPaint]);\n
    \]\n
    else\n
*/\n
    \[\n
        Utility.Log(\"END OF APPLICATION\");\n
\taction = null;\n
    \]\n
\]"}
#4{15 16 "OnEndPaintVisit"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#3{#4{9 10 "131539497"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 16 "OnChairBusy"}
 1.3 0.88 4.4 10  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{676 677 "\[\n
    Utility.Log(\"Visitor \" + this.Name + \" going to \" + sender + \" that becomes busy\");\n
    Painting painting = paintings[idxPaint];\n
\n
    painting.chair.SittableBusy -= OnChairBusy;\n
    painting.chair.SittableFree -= OnChairFree;\n
\n
    GoToStage reachPainting = new GoToStage(painting.GetLookableObject());\n
    reachPainting.StopDistance = 2.5f;\n
    LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    stages.Add(reachPainting);\n
    stages.Add(lookAt);\n
\n
    action.Abort();\n
\n
    action = new ECAAction(this, stages);\n
    action.CompletedAction += OnEndPaintVisit;\n
\n
    action.StartAction();\n
\]"}
#4{11 16 "OnChairBusy"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "131543416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{66 67 "\[\n
    base.Start();\n
\n
    idxPaint = 0;\n
    SelectDestinations();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{9 10 "164238728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "OccupyChair"}
 1.3 0.88 4.4 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{50 51 "\[\n
    paintings[idxPaint].chair.Occupied = true;\n
\]"}
#4{11 12 "OccupyChair"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "131537144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 1.3 0.88 1.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{20 45 "\[\n
    base.Init();\n
\]"}
#4{4 5 "Init"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "131451192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "action"}
 2.8 1.88 2.4 10  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "action"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "77769920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "idxPaint"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "idxPaint"}
#4{3 4 "int"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "163172032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{33 34 "protected static int counter = 0;"}
}
:SLSThisIcon.286331409{#4{9 10 "163996064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{13 14 "Visitor : ECA"}
 20.6229 2.2 8.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{7 8 "Visitor"}
#4{3 7 "ECA"}
#4{22 23 ".\\..\\..\\ECAScripts\\ECA"}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{9 10 "131537536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "CreateAnimator"}
 1.3 0.88 5.6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{207 208 "\[\n
    ecaAnimator = GetComponent<ECAAnimatorMxM>();\n
    if (ecaAnimator == null)\n
        ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();\n
    Assert.IsNotNull(ecaAnimator);\n
\n
    ecaAnimator.Init();\n
\]"}
#4{14 15 "CreateAnimator"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSExternObject.286331409{#4{9 10 "164792872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 5  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{14 15 "SittableObject"}
#4{16 17 "./../ObjectsType"}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
#12{#4{9 10 "164792873"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 14  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{8 9 "Painting"}
#4{16 17 "./../ObjectsType"}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
:JLSGlobalDeclare.286331408{#4{9 10 "163171520"}
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
#7{#4{8 9 "77770360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "paintings"}
 2.2 1.88 3.6 28  26 #4{0 1 ""}
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
#6{#4{8 9 "77550664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "SetEcaId"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 27 "\[\n
    ID = Ecas.Default;\n
\]"}
#4{8 9 "SetEcaId"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "77552232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "SelectDestinations"}
 1.3 0.88 7.2 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{480 481 "\[\n
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
    // paintings = paintings.OrderBy(a => Guid.NewGuid()).ToList();\n
\n
    // just as debug, go to the first painting\n
    GoToPainting(paintings[idxPaint]);\n
\]"}
#4{18 19 "SelectDestinations"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "131539498"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "OnChairFree"}
 1.3 0.879999 4.4 10  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{91 590 "\[\n
    Utility.Log(\"Visitor \" + this.Name + \" going to \" + sender + \" that becomes free\");\n
\]"}
#4{11 16 "OnChairFree"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{8 9 "77552624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "GoToPainting"}
 0.3 0.88 4.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{989 1030 "\[\n
    //set the status of the paint to occupied, only one visitor at time\n
    painting.Occupied = true;\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage reachPainting = new GoToStage(painting.GetChairDestination());\n
    TurnStage turn = new TurnStage(painting.GetChairSitPoint(), true);\n
    SitStage sit = new SitStage(painting.chair);\n
    LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());\n
    StandUpStage standUp = new StandUpStage(painting.chair);\n
\n
\n
    painting.chair.SittableBusy += OnChairBusy;\n
    painting.chair.SittableFree += OnChairFree;\n
\n
    stages.Add(reachPainting);\n
    stages.Add(turn);\n
    stages.Add(sit);\n
    stages.Add(lookAt);\n
    stages.Add(standUp);\n
\n
    ECAAction newAction = new ECAAction(this, stages);\n
    action = newAction;\n
\n
\n
    newAction.CompletedAction += OnEndPaintVisit;\n
    Utility.Log(\"Visitor \" + this.Name + \" moving to \" + painting.name);\n
\n
    newAction.StartAction();\n
\n
    Invoke(\"OccupyChair\", 1.0f);\n
\]"}
#4{12 13 "GoToPainting"}
#4{4 5 "void"}
#4{17 18 "Painting painting"}
#4{0 1 ""}
}
#5{#4{9 10 "131543024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 45 "\[\n
    base.Awake();\n
\]"}
#4{5 6 "Awake"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @101 @153 @93 @0 #8{16 1@78 }
#8{16 2@161 @63 }
#8{16 3@3 @15 @200 }
#8{16 5@224 @27 @115 @188 @39 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 2@127 @140 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@51 @176 @212 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
