:ArrayOb.273{6:Dictionary.4369{32 21:SLSProtectMember.286331409{:String.17{8 9 "86282408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "startTime"}
 2.2 1.88 3.6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "startTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "86281048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "CompletionManagement"}
 1.3 0.88 8 19  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{140 141 "\[\n
    IsPaused = true;\n
    ECAManager.Instance.SetEndTime();\n
    ECAManager.Instance.AvailableEcas[Ecas.Francesca].SendMessage(\"EndGame\");\n
\]"}
#4{20 21 "CompletionManagement"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "86285488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "currentNodeIdx"}
 1.2 1.88 5.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "currentNodeIdx"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{3 4 " -1"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "103673208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public GameManager : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.34541 3.6499 0
 0  0 #4{18 19 "public GameManager"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#5{16 2#4{53 54 "public event EventHandler<EventArgs> OnGameCompleted;"}
#4{40 41 "public event EventHandler OnGameStarted;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "103761312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "DefineGraphNodes"}
 1.3 0.88 6.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{92 93 "\[\n
    nodes = new GameGraphNode[]\n
    \[\n
    \];\n
    \n
    this.NumberOfNodes = nodes.Length;\n
\]"}
#4{16 17 "DefineGraphNodes"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{8 9 "86280656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "StartNextNode"}
 1.3 0.88 5.2 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{165 166 "\[\n
    currentNodeIdx++;\n
\n
    if (currentNodeIdx >= nodes.Length)\n
    \[\n
        StartCoroutine(GameCompleted());\n
        return;\n
    \]\n
\n
    CurrentNode.StartNode();\n
\]"}
#4{13 14 "StartNextNode"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSProperty.286331392{#4{8 9 "86281440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "NumberOfNodes"}
 1.3 0.88 5.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{13 14 "NumberOfNodes"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "86279480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "GameCompleted"}
 1.3 0.88 5.2 10  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{104 105 "\[\n
    Utility.Log(\"GAME COMPLETED SIMPLE_MANAGER\");\n
    CompletionManagement();\n
    yield return null;\n
\]"}
#4{13 14 "GameCompleted"}
#4{19 20 "virtual IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{8 9 "86279872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "CurrentNode"}
 1.3 0.88 4.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{181 182 "\[\n
        get\n
        \[\n
            if (currentNodeIdx >= 0 && currentNodeIdx < nodes.Length)\n
                return nodes[currentNodeIdx];\n
\n
            return null;\n
        \]\n
    \]"}
#4{11 12 "CurrentNode"}
#4{13 14 "GameGraphNode"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "103757392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{88 89 "\[\n
    IsPaused = true;\n
    DefineGraphNodes();\n
    Utility.Log(\"Game Manager awaken\");\n
\]"}
#4{5 6 "Awake"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "103761704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1147 1148 "\[\n
    if (!IsPaused && CurrentNode != null)\n
    \[\n
        //execute current step\n
        CurrentNode.UpdateNode();\n
\n
        //if it has finished (with errors or not)\n
        if (CurrentNode.IsCompleted || CurrentNode.IsAborted)\n
        \[\n
            //if went ok,switch to next one.\n
            //if there's no next one, leave the pointer to current\n
            //node and set current status as completed\n
            if (CurrentNode.CurrentStatus.ErrorType == GameErrorType.Fine)\n
            \[\n
                Utility.Log(\"Completed state \" + CurrentNode.ReadableName);\n
                StartNextNode();\n
            \]\n
            //else, set the error... we'll let the upper manager to decide how to handle the error.\n
            else\n
            \[\n
                Utility.LogWarning(CurrentNode.ReadableName + \" error:: \" + CurrentNode.CurrentStatus.ErrorString);\n
            \]\n
        \]\n
        else\n
        \[\n
            if (CurrentNode.CurrentStatus.ErrorType != GameErrorType.Fine)\n
            \[\n
                Utility.LogWarning(CurrentNode.ReadableName + \" error:: \" + CurrentNode.CurrentStatus.ErrorString);\n
            \]\n
        \]\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "86282848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "endTime"}
 2.6 1.88 2.8 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "endTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "86285048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "nodes"}
 3 1.88 2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "nodes"}
#4{15 16 "GameGraphNode[]"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "86283288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "IsPaused"}
 1.3 1.88 3.2 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{8 9 "IsPaused"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{6 7 " false"}
#4{0 1 ""}
}
#9{#4{8 9 "86017664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "IsTrainingMode"}
 1.3 1.88 5.6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "IsTrainingMode"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " true"}
#4{0 1 ""}
}
#6{#4{9 10 "103762096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{20 21 "\[\n
    StartGame();\n
\]"}
#4{5 6 "Start"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSGlobalDeclare.286331408{#4{8 9 "86368008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{125 126 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
using UnityEngine.Assertions;\n
\n
\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "86363912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{9 10 "103763272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartGame"}
 1.3 0.88 3.6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{256 257 "\[\n
    Assert.IsTrue(nodes.Length > 0);\n
    currentNodeIdx = 0;\n
    CurrentNode.StartNode();\n
    IsPaused = false;\n
    startTime = DateTime.Now;\n
    Utility.Log(\"GAME STARTED!\");\n
    if (OnGameStarted != null)\n
        OnGameStarted(this, EventArgs.Empty);\n
\]"}
#4{9 10 "StartGame"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{8 9 "86280264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "OnDestroy"}
 1.3 0.88 3.6 37  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{63 64 "\[\n
    foreach (var node in nodes)\n
        node.DisposeNode();\n
\]"}
#4{9 10 "OnDestroy"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "103762488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "FixedUpdate"}
 1.3 0.88 4.4 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{127 128 "\[\n
    if (!IsPaused && CurrentNode != null)\n
    \[\n
        //execute current step\n
        CurrentNode.FixedUpdateNode();\n
    \]\n
\]"}
#4{11 12 "FixedUpdate"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @45 @217 @225 @0 #5{16 0}
#5{16 4@160 @30 @3 @145 }
#5{16 0}
#5{16 10@121 @205 @61 @233 @133 @257 @73 @245 @97 @18 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @190 @0 @175 @0 @0 @0 }
#1{30@85 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @109 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
