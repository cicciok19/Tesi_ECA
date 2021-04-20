:ArrayOb.273{6:Dictionary.4369{64 45:SLSProperty.286331392{:String.17{8 9 "94303032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "HasTriggered"}
 1.3 0.88 4.8 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 40 "\[\n
      get;\n
      protected set;\n
    \]"}
#4{12 13 "HasTriggered"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94306848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "IsCompleted"}
 1.3 0.88 4.4 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{113 114 "\[\n
      get\n
      \[\n
    \treturn CurrentStatus.CompletionStatus == GameNodeCompletionType.Completed;\n
      \]\n
    \]"}
#4{11 12 "IsCompleted"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96613264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ScheduledTime"}
 1.3 0.88 5.2 1  27 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{13 14 "ScheduledTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94308120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "IsAborted"}
 1.3 0.88 3.6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{111 112 "\[\n
      get\n
      \[\n
    \treturn currentStatus.CompletionStatus == GameNodeCompletionType.Aborted;\n
      \]\n
    \]"}
#4{9 10 "IsAborted"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "96012360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "pause"}
 3 1.88 2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "pause"}
#4{4 5 "bool"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{7 8 "  false"}
#4{0 1 ""}
}
#3{#4{8 9 "96609872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "IsScheduled"}
 1.3 0.88 4.4 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{11 12 "IsScheduled"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{5 6 "false"}
}
:SLSProtectMethod.286331408{#4{8 9 "96082344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "ResetNode"}
 1.3 0.88 3.6 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{266 267 "\[\n
  // that's for loopable nodes, to bring them to a clean state before a new start\n
  //init current status\n
  CurrentStatus = new NodeStatus() \[ \n
\tCompletionStatus = GameNodeCompletionType.Inactive, \n
\tErrorType = GameErrorType.Fine, \n
\tErrorString = string.Empty \];\n
\]"}
#4{9 10 "ResetNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{8 9 "96087440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "AbortNode"}
 1.3 0.88 3.6 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{246 247 "\[\n
  if(IsAborted)\n
\treturn;\n
\n
  stopTime = DateTime.Now;\n
  currentStatus.CompletionStatus = GameNodeCompletionType.Aborted;\n
\n
/*\n
    if(OnAborted != null)\n
\tOnAborted(this, EventArgs.Empty);\n
*/\n
\n
    if(ManageToolTips())\n
  \t    EnableToolTip(false);\n
\]"}
#4{9 10 "AbortNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96086264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "NodeDescriptionCompleted"}
 1.3 0.88 9.6 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{155 156 "\[\n
  //Utility.Log(\"\");\n
  //BLSLogger.CRSpeaker.SpeakTimeout -= NodeDescriptionCompleted;\n
  //BLSLogger.CRSpeaker.ClipTimeout -= NodeDescriptionCompleted;\n
\]"}
#4{24 25 "NodeDescriptionCompleted"}
#4{12 13 "virtual void"}
#4{29 30 "object sender, EventArgs args"}
#4{0 1 ""}
 0}
#8{#4{8 9 "96087832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartNode"}
 1.3 0.88 3.6 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{92 93 "\[\n
  BaseStartActions();    \n
  //if(IsTrainingMode && showDialogWindow)\n
  \t//RaiseWidget();\n
\]"}
#4{9 10 "StartNode"}
#4{12 13 "virtual void"}
#4{17 18 "bool speak = true"}
#4{0 1 ""}
}
#3{#4{8 9 "94307696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ReadableDescription"}
 1.3 0.88 7.6 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 68 "\[\n
      get\n
      \[\n
    \treturn \"\";\n
      \]\n
    \n
      set \[\]\n
    \]"}
#4{19 20 "ReadableDescription"}
#4{14 15 "virtual string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96011480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{388 389 "\[\n
    IndexNode++;\n
    ID = IndexNode;\n
    ReadableName = readableName;\n
    IsTrainingMode = isTrainingMode;  \n
\n
    //init current status\n
    CurrentStatus = new NodeStatus() \[ CompletionStatus = GameNodeCompletionType.Inactive, ErrorType = GameErrorType.Fine, ErrorString = string.Empty \];\n
\n
    Utility.Log(string.Format(\"State \[0\]:\[1\] created\", IndexNode, ReadableName));\n
    Awake();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{40 41 "string readableName, bool isTrainingMode"}
#4{0 1 ""}
}
#3{#4{8 9 "94306424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{2 3 "ID"}
 1.3 0.88 0.8 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{2 3 "ID"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "96010160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "currentStatus"}
 1.4 1.88 5.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "currentStatus"}
#4{10 11 "NodeStatus"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96534176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "ManageToolTips"}
 1.3 0.88 5.6 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{101 102 "\[\n
  //Assert.IsTrue(false);\n
  return false;\n
  //return GameManager.Session == SessionType.Learning;\n
\]"}
#4{14 15 "ManageToolTips"}
#4{11 12 "static bool"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96082736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "FixedUpdateNode"}
 1.3 0.88 6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{15 16 "FixedUpdateNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95446448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{32 33 "public static int IndexNode = 0;"}
}
#3{#4{8 9 "96611144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Label"}
 1.3 0.88 2 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{5 6 "Label"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96614112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartTime"}
 1.3 0.88 3.6 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{50 51 "\[\n
      get \[\n
    \treturn startTime;\n
      \]\n
    \]"}
#4{9 10 "StartTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96085872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "RestartNode"}
 1.3 0.88 4.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{62 63 "\[\n
  //BLSLogger.Log(this,\"node restarted\");\n
  pause = false;\n
\]"}
#4{11 12 "RestartNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94303456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "IsPaused"}
 1.3 0.88 3.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
      get \[\n
    \treturn pause;\n
      \]\n
    \]"}
#4{8 9 "IsPaused"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96086656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "EnableToolTip"}
 1.3 0.88 5.2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "EnableToolTip"}
#4{12 13 "virtual void"}
#4{11 12 "bool enable"}
#4{0 1 ""}
 0}
#8{#4{8 9 "96085088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "DisposeNode"}
 1.3 0.88 4.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{11 12 "DisposeNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96530648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "TimeSpent"}
 0.3 0.88 3.6 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{200 201 "\[\n
    if (!IsCompleted)\n
        return -1;\n
\n
    TimeSpan ts;\n
    if (IsScheduled)\n
        ts = stopTime - ScheduledTime;\n
    else\n
        ts = stopTime - startTime;\n
\n
    return (int)ts.TotalSeconds;\n
\]"}
#4{9 10 "TimeSpent"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94300912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "ReadableName"}
 1.3 0.88 4.8 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{33 34 "\[\n
      protected set; get;\n
    \]"}
#4{12 13 "ReadableName"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96613688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "CurrentStatus"}
 1.3 0.88 5.2 1  33 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 115 "\[\n
      set\n
      \[\n
    \tcurrentStatus = value;\n
      \]\n
      get\n
      \[\n
    \treturn currentStatus;\n
      \]\n
    \]"}
#4{13 14 "CurrentStatus"}
#4{10 11 "NodeStatus"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96088224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "PauseNode"}
 1.3 0.88 3.6 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 59 "\[\n
  //BLSLogger.Log(this,\"node paused\");\n
  pause = true;\n
\]"}
#4{9 10 "PauseNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96083912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "TriggerNode"}
 1.3 0.88 4.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{193 194 "\[\n
  //BLSLogger.Log(this,\"activity triggered\", BLSLogType.NodeTriggered);\n
  triggeredTime = DateTime.Now;\n
  HasTriggered = true;\n
  if(OnTriggered != null)\n
\tOnTriggered(this, EventArgs.Empty);\n
\]"}
#4{11 12 "TriggerNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "96617504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "TriggeredTime"}
 1.3 0.88 5.2 1  31 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{54 55 "\[\n
      get \[\n
    \treturn triggeredTime;\n
      \]\n
    \]"}
#4{13 14 "TriggeredTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95451568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{182 183 "using UnityEngine;\n
using UnityEngine.Assertions;\n
using System;\n
using System.Collections.Generic;\n
\n
\n
\t\tpublic enum GameNodeCompletionType\n
\[\n
\tInactive,\n
\tRunning,\n
\tCompleted,\n
\tAborted\n
\]\n
"}
}
#3{#4{8 9 "94300488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "IsChildNode"}
 1.3 0.88 4.4 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{11 12 "IsChildNode"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96089792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{56 57 "\[\n
  //showDialogWindow = true;\n
  HasTriggered = false;\n
\]"}
#4{5 6 "Awake"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{8 9 "96089008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "SetCompleted"}
 1.3 0.88 4.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{391 392 "\[\n
    Utility.Log(\"activity completed correctly \" + this.GetType());\n
\n
    CurrentStatus = new NodeStatus() \[ \n
\tCompletionStatus = GameNodeCompletionType.Completed, \n
\tErrorType = GameErrorType.Fine, \n
\tErrorString = string.Empty \n
    \];\n
\n
    if(OnCompleted != null)\n
\t    OnCompleted(this, EventArgs.Empty);\n
\n
    if(ManageToolTips())\n
  \t    EnableToolTip(false);\n
\n
    stopTime = DateTime.Now;\n
\]"}
#4{12 13 "SetCompleted"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96614960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "IsTrainingMode"}
 1.3 0.88 5.6 1  35 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{14 15 "IsTrainingMode"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96087048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "UpdateNode"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{10 11 "UpdateNode"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "94307272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "IsRunning"}
 1.3 0.88 3.6 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{111 112 "\[\n
      get\n
      \[\n
    \treturn CurrentStatus.CompletionStatus == GameNodeCompletionType.Running;\n
      \]\n
    \]"}
#4{9 10 "IsRunning"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96614536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "showDialogWindow"}
 1.3 0.88 6.4 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[\n
      set; get;\n
    \]"}
#4{16 17 "showDialogWindow"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "96007080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "stopTime"}
 2.4 1.88 3.2 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "stopTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "96084304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "BaseStartActions"}
 1.3 0.88 6.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{292 293 "\[\n
    //Utility.Log(\"\");\n
    CurrentStatus.CompletionStatus = GameNodeCompletionType.Running;    \n
    \n
    if(OnStarted != null)\n
        OnStarted(this, EventArgs.Empty);\n
\n
    if(ManageToolTips())\n
        EnableToolTip(true);\n
\n
    startTime = DateTime.Now;\n
    ScheduledTime = DateTime.Now;\n
\]"}
#4{16 17 "BaseStartActions"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{8 9 "96184304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{29 30 "public abstract GameGraphNode"}
 17.6971 2.2 18.56 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.27296 3.74855 0
 0  0 #4{29 30 "public abstract GameGraphNode"}
#4{0 7 ""}
#4{0 13 ""}
#6{16 4#4{50 51 "public event EventHandler<EventArgs> SpeakTimeout;"}
#4{47 48 "public event EventHandler<EventArgs> OnStarted;"}
#4{49 50 "public event EventHandler<EventArgs> OnCompleted;"}
#4{49 50 "public event EventHandler<EventArgs> OnTriggered;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{8 9 "96617080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "StopTime"}
 1.3 0.88 3.2 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{49 50 "\[\n
      get \[\n
    \treturn stopTime;\n
      \]\n
    \]"}
#4{8 9 "StopTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "96085480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnCompleteRequest"}
 0.3 0.88 6.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{101 102 "\[\n
  Utility.Log(\"received request to complete node \" + this + \" from \" + sender);\n
  SetCompleted();\n
\]"}
#4{17 18 "OnCompleteRequest"}
#4{4 5 "void"}
#4{28 29 "object sender,EventArgs args"}
#4{0 1 ""}
}
#5{#4{8 9 "96008400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "startTime"}
 2.2 1.88 3.6 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "startTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "96011040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "triggeredTime"}
 1.4 1.88 5.2 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "triggeredTime"}
#4{8 9 "DateTime"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96612840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "FinishedInTime"}
 1.3 0.88 5.6 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{14 15 "FinishedInTime"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{5 6 "false"}
}
}
:CLSCSSem.1118481{ 56  51 @489 @366 @208 @0 #6{16 1@169 }
#6{16 4@55 @532 @462 @547 }
#6{16 0}
#6{16 6@387 @107 @341 @477 @267 @83 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{33@424 @196 @279 @399 @520 @119 @329 @242 @95 @184 @42 @254 @436 @16 @3 @374 @131 @303 @70 @562 @291 @29 @507 @156 @229 @353 @216 @316 @449 @411 @0 @0 @0 }
#1{16@144 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
