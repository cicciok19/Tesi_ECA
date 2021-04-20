:ArrayOb.273{6:Dictionary.4369{16 9:SLSPublicMethod.286331408{:String.17{8 9 "94199912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "showScoreTab"}
 0.3 0.88 4.8 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{836 837 "\[\n
    String finalTab = \"number of nodes: \" + nodes.Length.ToString() + \"\\n\";\n
    for(int i = 0; i< nodes.Length; i++)\n
    \[\n
        if (!nodes[i].IsCompleted)\n
        \[\n
            finalTab += nodes[i].ReadableName + \" has not been made \\n\";\n
            continue;\n
        \]\n
        else\n
        \[\n
            String info = nodes[i].ReadableName + \" is played in \" + nodes[i].TimeSpent() + \" seconds.\";\n
            if (!nodes[i].IsScheduled)\n
                info += \" WARNING: not at the right time\";\n
            /*\n
            if (nodes[i].IsScheduled)\n
                info += \"at the right order\";\n
            else\n
                info += \"but not at the right order\";\n
            */\n
            finalTab += info + \"\\n\";\n
        \]\n
    \]\n
    finalTab += \"\\n\\n\\n FINAL SCORE: \" + _score;\n
\n
    _scoreTxt.text = \"REPORT: \\n\" + finalTab;\n
\]"}
#4{12 13 "showScoreTab"}
#4{4 5 "void"}
#4{21 22 "GameGraphNode[] nodes"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "129751904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{8 9 "94200696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "updateScore"}
 0.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{74 75 "\[\n
    _score = score;\n
    _scoreTxt.text = \"SCORE: \" + score.ToString();\n
\]"}
#4{11 12 "updateScore"}
#4{4 5 "void"}
#4{12 13 "double score"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "119131528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "_score"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "_score"}
#4{6 7 "double"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "94275656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{28 29 "public Score : MonoBehaviour"}
 17.88 2.2 17.92 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{12 13 "public Score"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "119119760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSGlobalDeclare.286331408{#4{9 10 "129754976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{222 223 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
\n
/*\n
    public void setListOfNodes(GameGraphNode[] nodes)\n
    \[\n
        _simpleNodes = nodes;\n
    \]\n
    */\n
"}
}
#9{#4{8 9 "94199520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMember.286331409{#4{9 10 "119131088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "_scoreTxt"}
 1.3 1.88 3.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{9 10 "_scoreTxt"}
#4{4 5 "Text"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @50 @76 @15 @0 #7{16 0}
#7{16 1@35 }
#7{16 0}
#7{16 2@84 @64 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @96 @0 @0 @0 }
#1{16@3 @23 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
