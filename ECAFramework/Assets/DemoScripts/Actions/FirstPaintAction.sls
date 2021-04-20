:ArrayOb.273{6:Dictionary.4369{16 3:JLSGlobalDeclare.286331408{:String.17{9 10 "130159952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1307 1308 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
\n
\n
\n
public class PaintInteraction : SmartAction\n
\[\n
    public int PaintID;\n
    public int TotalAnswers = 2;\n
    public int ActualAnswers;\n
    public GameObject Eca;\n
\n
    //mi iscrivo agli intent che devo gestire\n
    public PaintInteraction(int smartActionID, int paintNumber) : base(smartActionID)\n
    \[\n
        PaintID = paintNumber;\n
        ActualAnswers = 0;\n
    \]\n
\n
    public void OnWrongAnswer(object sender, EventArgs e)\n
    \[\n
        UpdateAccuracy(0.2f);\n
    \]\n
\n
    public void OnCorrectAnswer(object sender, EventArgs e)\n
    \[\n
        ActualAnswers++;\n
        if (ActualAnswers == TotalAnswers)\n
            Finish();\n
    \]\n
\n
    public override void Start()\n
    \[\n
        base.Start();\n
        Eca = GameObject.FindGameObjectWithTag(\"ECA\");\n
        Eca.GetComponent<ECASophie>().SubscriveToRelativePaintIntents(PaintID);\n
        Eca.GetComponent<ECASophie>().CorrectAnswer += OnCorrectAnswer;\n
        Eca.GetComponent<ECASophie>().WrongAnswer += OnWrongAnswer;\n
    \]\n
\n
    public override void UpdateStaging()\n
    \[\n
        base.UpdateStaging();\n
    \]\n
\n
    public override void Finish()\n
    \[\n
        base.Finish();\n
        ECAAnimationManager.allECAActions[ECAActions.SitAction].OnCompletedAction();\n
    \]\n
\]\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "18462800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{16 17 "FirstPaintAction"}
 20.0743 2.2 10.24 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{16 17 "FirstPaintAction"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130158416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @11 @3 @25 @0 #6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#9{1 }
#9{0 }
#9{1 }
}
