:ArrayOb.273{6:Dictionary.4369{16 8:SLSThisIcon.286331409{:String.17{8 9 "96178784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{31 32 "ParallelAndNode : AggregateNode"}
 17.3314 2.2 19.84 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{15 16 "ParallelAndNode"}
#4{13 14 "AggregateNode"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95448496"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{19 20 "using System.Text;\n
"}
}
:SLSPublicMethod.286331408{#4{8 9 "96527120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "UpdateNode"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1526 1527 "\[\n
  if(IsRunning)\n
  \[\n
\t//execute current step on all children\n
    //checks all the children's status\n
\tfor(int i = 0; i < childrenNodes.Length; i++)\n
\t\[\n
\t\tGameGraphNode currentNode = childrenNodes[i];\n
\n
\t\t//ignore already terminated children\n
\t\tif(!currentNode.IsRunning)\n
\t\t\tcontinue;\n
\n
\t\tcurrentNode.UpdateNode();\n
\n
\t\t//if it has finished (with errors or not)\n
\t\tif(!currentNode.IsRunning)\n
\t \t\[\n
\t\t\t//increment completed counter\n
\t\t\tcompletedNodes++;\n
\n
\t\t\t//if went ok and there's no reamining task, set current status as completed\n
\t\t\tif(currentNode.CurrentStatus.ErrorType == GameErrorType.Fine)\n
\t\t\t\[\n
\t\t\t\tUtility.Log(string.Format(\"State \[0\]:\[1\] finished current node \[2\]:\[3\]\", ID, ReadableName, currentNode.ID, currentNode.ReadableName));\n
\t\n
\t\t\t\tif(completedNodes >= childrenNodes.Length)\n
\t\t\t\t\[\n
\t\t\t\t\tCurrentStatus.CompletionStatus = GameNodeCompletionType.Completed; \t\t\t\t\n
\n
\t\t\t\t\tUtility.Log(string.Format(\"State \[0\]:\[1\] terminated with success\", ID, ReadableName));\n
\t\t\t\t\]\n
\t\t\t\]\n
\t\t\t//else, set the error... we'll let the upper manager to decide how to handle the error.\n
\t\t\telse\n
\t\t\t\[\t\t\t\n
\t\t\t\tUtility.Log(string.Format(\"State \[0\]:\[1\] finished WITH ERRORS current node \[2\]:\[3\]\", ID, ReadableName, currentNode.ID, currentNode.ReadableName));\n
\n
\t\t\t\tCurrentStatus.CompletionStatus = GameNodeCompletionType.Completed; //if one task returns error, it is impossible to complete the AND\n
\t\t\t\tCurrentStatus.ErrorType = currentNode.CurrentStatus.ErrorType;\n
\t\t\t\tCurrentStatus.ErrorString = currentNode.CurrentStatus.ErrorString;\n
\t\t\t\]\n
\t\t\]\t\t\n
\t\t\n
\t  \]\n
  \]\n
\]"}
#4{10 11 "UpdateNode"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "96012800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "completedNodes"}
 1.2 1.88 5.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "completedNodes"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "96616656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ReadableDescription"}
 1.3 0.88 7.6 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{385 386 "\[\n
  get\n
  \[\n
\t//concatenate all readable descriptions and write a AND between them\n
\tif(childrenNodes.Length == 0)\n
\t\treturn string.Empty;\n
\n
\tStringBuilder sb = new StringBuilder();\n
\n
\tsb.Append(childrenNodes[0].ReadableDescription);\n
\n
\tfor(int i = 0; i < childrenNodes.Length; i++)\n
\t\[\n
\t\tsb.Append(\"\\n\\n - AND - \\n\\n\" + childrenNodes[i].ReadableDescription);\n
\t\]\n
\n
\treturn sb.ToString();\n
  \]\n
\]"}
#4{19 20 "ReadableDescription"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96532216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartNode"}
 1.3 0.88 3.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{98 99 "\[\n
    base.StartNode(speak);\n
    foreach (var child in childrenNodes)\n
        child.StartNode();\n
\]"}
#4{9 10 "StartNode"}
#4{13 14 "override void"}
#4{17 18 "bool speak = true"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95452592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96013240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{95 96 ": base(readableName, instructions, childrenNodes, isTrainingMode)\n
\[\n
      completedNodes = 0;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{92 93 "string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @17 @77 @0 #5{16 0}
#5{16 1@37 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@25 @65 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @52 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@85 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
