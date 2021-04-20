:ArrayOb.273{6:Dictionary.4369{16 3:JLSGlobalDeclare.286331408{:String.17{9 10 "155697368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1212 1213 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
\n
\n
\n
 class PaintSequentialNode : SequentialNode\n
\[\n
    public PaintSequentialNode(string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : \n
        base(readableName, instructions, childrenNodes, isTrainingMode)\n
    \[\n
\n
    \]\n
\n
    //mi iscrivo agli eventi che fanno iniziare i vari nodi figli, questo sarebbe solo il SETUP del nodo\n
    //es. l'utente entra nel trigger del primo quadro e allora faccio partire i vari nodi figli\n
    //mi iscrivo anche a tutti gli intent che devono essere gestiti e ai relativi messaggi che devo dare all'utente\n
    public override void StartNode(bool speak = true)\n
    \[\n
        base.StartNode(speak);\n
        UpdateNode();\n
        //CurrentNode.OnCompleted += onChildrenCompleted;\n
    \]\n
\n
    //quando viene triggerato l'inizio di questo nodo faccio partire i nodi figli\n
    protected override void TriggerNode()\n
    \[\n
        base.TriggerNode();\n
    \]\n
\n
    public void OnChildrenCompleted(object sender, EventArgs e)\n
    \[\n
        StartNextNode();\n
        if(CurrentNode != null)\n
            CurrentNode.OnCompleted += OnChildrenCompleted;\n
    \]\n
\n
\]\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "93840632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{14 15 "FirstPaintNode"}
 20.44 2.2 8.96 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{14 15 "FirstPaintNode"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155697624"}
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
