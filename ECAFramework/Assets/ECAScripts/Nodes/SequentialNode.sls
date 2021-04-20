:ArrayOb.273{6:Dictionary.4369{16 11:SLSConstructor.286331408{:String.17{8 9 "96006200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{69 70 ": base(readableName, instructions, childrenNodes, isTrainingMode)\n
\[\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{92 93 "string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "96615384"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ReadableDescription"}
 1.3 0.88 7.6 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 59 "\[\n
  get\n
  \[\n
\treturn CurrentNode.ReadableDescription;\n
  \]\n
\]"}
#4{19 20 "ReadableDescription"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "96527512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "StartNextNode"}
 1.3 0.88 5.2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{156 157 "\[\n
    currentNodeIdx++;\n
\n
    if (currentNodeIdx >= childrenNodes.Length)\n
    \[\n
        SetCompleted();\n
        return;\n
    \]\n
\n
    CurrentNode.StartNode();\n
\]"}
#4{13 14 "StartNextNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{8 9 "96529864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartNode"}
 1.3 0.88 3.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{193 194 "\[\n
    base.StartNode(speak);\n
    currentNodeIdx = 0;\n
    CurrentNode.OnCompleted += onChildrenCompleted;\n
    CurrentNode.StartNode();\n
    Utility.Log(\"starting node\" + CurrentNode.GetType());\n
\]"}
#4{9 10 "StartNode"}
#4{13 14 "override void"}
#4{17 18 "bool speak = true"}
#4{0 1 ""}
}
#7{#4{8 9 "96533784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "onChildrenCompleted"}
 1.3 0.88 7.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{24 25 "\[\n
    StartNextNode();\n
\]"}
#4{19 20 "onChildrenCompleted"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "96013680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "currentNodeIdx"}
 1.2 1.88 5.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "currentNodeIdx"}
#4{3 4 "int"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{2 3 "-1"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95446704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{14 15 "using System;\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "96181544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "SequentialNode : AggregateNode"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{14 15 "SequentialNode"}
#4{13 14 "AggregateNode"}
#4{0 13 ""}
#9{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95451056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{8 9 "96532608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "UpdateNode"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{847 848 "\[\n
    if (IsRunning)\n
    \[\n
\n
        if (CurrentNode.IsRunning)\n
            CurrentNode.UpdateNode();\n
        else\n
        if (CurrentNode.CurrentStatus.CompletionStatus == GameNodeCompletionType.Completed &&\n
            CurrentNode.CurrentStatus.ErrorType == GameErrorType.Fine)\n
        \[\n
            StartNextNode();\n
        \]\n
        else\n
        \[\n
\n
            Utility.Log(string.Format(\"State \[0\]:\[1\] finished WITH ERRORS current node \[2\]:\[3\]\", ID, ReadableName, CurrentNode.ID, CurrentNode.ReadableName));\n
\n
            CurrentStatus.CompletionStatus = GameNodeCompletionType.Aborted; //if one task returns error, it is impossible to complete the AND\n
            CurrentStatus.ErrorType = CurrentNode.CurrentStatus.ErrorType;\n
            CurrentStatus.ErrorString = CurrentNode.CurrentStatus.ErrorString;\n
\n
            return;\n
        \]\n
    \]\n
\]"}
#4{10 11 "UpdateNode"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "96611992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "CurrentNode"}
 1.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{169 170 "\[\n
    get\n
    \[\n
        if (currentNodeIdx >= 0 && currentNodeIdx < childrenNodes.Length)\n
            return childrenNodes[currentNodeIdx];\n
\n
        return null;\n
    \]\n
\]"}
#4{11 12 "CurrentNode"}
#4{13 14 "GameGraphNode"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @87 @79 @101 @0 #9{16 1@64 }
#9{16 0}
#9{16 0}
#9{16 1@28 }
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@109 @121 @40 @52 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @15 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
