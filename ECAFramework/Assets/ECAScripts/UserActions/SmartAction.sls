:ArrayOb.273{6:Dictionary.4369{64 33:SLSPublicMethod.286331408{:String.17{8 9 "97551808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "StartUpdateStaging"}
 0.3 0.88 7.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{237 238 "\[\n
    //srtart updating staging\n
    IsStagingActive = true;\n
    //GameObject.FindObjectOfType<WaitingUtility>().startWaitingStaging(this, StagingInitialDelay);\n
    WaitingUtility.Instance.startWaitingStaging(this, StagingInitialDelay);\n
\]"}
#4{18 19 "StartUpdateStaging"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "97698408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "AccuracyLabel"}
 1.3 0.88 5.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{206 207 "\[\n
    get\n
    \[\n
        return LabelOfCriteria[(int)Criteria.Accuracy];\n
    \]\n
    set\n
    \[\n
        LabelOfCriteria[(int)Criteria.Accuracy] = value;\n
        LastSwitchedCriteria = Criteria.Accuracy;\n
    \]\n
\]"}
#4{13 14 "AccuracyLabel"}
#4{6 7 "Labels"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97697560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "IsFinished"}
 1.3 0.88 4 1  27 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{10 11 "IsFinished"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "97553376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "IncrementPercentage"}
 1.3 0.88 7.6 28  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{174 175 "\[\n
    Utility.Log(\"IncrementAmount = \" + incrementAmount);\n
    Percentage += incrementAmount;\n
    if (Percentage > 1)\n
        Percentage = 1;\n
\n
    SimpleAttributeUpdated();\n
\]"}
#4{19 20 "IncrementPercentage"}
#4{12 13 "virtual void"}
#4{21 22 "float incrementAmount"}
#4{0 1 ""}
 0}
#3{#4{8 9 "97552984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "UpdateStaging"}
 1.3 0.88 5.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{610 611 "\[\n
    //if (Staging == 1 || IsPaused || !IsStarted || IsFinished)\n
    if (IsPaused || !IsStarted || IsFinished)\n
        return;\n
\n
    float newValue = Staging + StagingUpdateFactor;\n
    if (newValue > 1)\n
        newValue = 1;\n
\n
    LastUpdatedCriteria = Criteria.Staging;\n
\n
    Labels newState = CheckStateSwitching(this.ID, (int)Criteria.Staging, Staging, newValue);\n
\n
    Staging = newValue;\n
\n
    //update staging level and throw relative event\n
    if (newState != Labels.None)\n
    \[\n
        StagingLabel = newState;\n
        LabeledAttributeUpdated(true);\n
    \]\n
    else\n
        LabeledAttributeUpdated(false);\n
\]"}
#4{13 14 "UpdateStaging"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "97554552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "LabeledAttributeUpdated"}
 1.3 0.88 9.2 19  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{110 111 "\[\n
    if (StateUpdated != null)\n
        StateUpdated(this, new SmartActionEventArgs(true, isLabelSwitched));\n
\]"}
#4{23 24 "LabeledAttributeUpdated"}
#4{12 13 "virtual void"}
#4{20 21 "bool isLabelSwitched"}
#4{0 1 ""}
 0}
#3{#4{8 9 "97554944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "StopUpdateStaging"}
 1.3 0.88 6.8 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{32 33 "\[\n
    IsStagingActive = false;\n
\]"}
#4{17 18 "StopUpdateStaging"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95446192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{2004 2005 "using IntentRecognitionResults;\n
using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
\tpublic enum Labels\n
\[\n
    Good,\n
    Normal,\n
    Bad,\n
    None\n
\]\n
\tpublic enum Criteria\n
\[\n
    Accuracy,\n
    Staging\n
\]\n
\tpublic enum Presence\n
\[\n
    Low,\n
    Medium,\n
    High\n
\]\n
/// <summary>\n
/// Every time a state element changes in value, the StateUpdated event is launched. \n
/// Some attributes are simple (like percentage, startTime ecc), but others are more complex (i.e. Staging and Accuracy that have a <see cref=\"Labels\"/>). \n
/// This class is used to transmit additional information by <see cref=\"SmartAction.StateUpdated\"/> event. In particular:\n
///1) if the newly updated attribute is simple or Labeled\n
///2) if it were Labeled if the new value caused a Label switch (for example from good to normal)\n
/// </summary>\n
\n
\n
public class SmartActionEventArgs: EventArgs\n
\[\n
    public SmartActionEventArgs(bool isLabeledAttributeUpdated, bool isLabelSwitched = false)\n
    \[\n
        IsLabeledAttribute = isLabeledAttributeUpdated;\n
        IsLabelSwitched = isLabelSwitched;\n
    \]\n
\n
    public bool IsLabeledAttribute \[ get; private set; \]\n
    public bool IsLabelSwitched \[ get; private set; \]\n
\]\n
\n
\n
/// <summary>\n
/// A SmartAction is created to update and store the state of a task over time.\n
/// It defines significant events that allow other scripts to react when there is some change: \n
/// - start, finished, restarted, paused\n
/// - StateUpdated: launched whenever a state parameter changes (<see cref=\"SmartActionEventArgs\"/>)\n
/// \n
/// In order to update the state, some basic parameters for updating accuracy and staging are defined and setted with some default parameters.\n
/// - Each <see cref=\"StagingUpdateTime\"/> seconds the staging is increased by <see cref=\"StagingUpdateFactor\"/>;\n
/// - Each time the <see cref=\"UpdateAccuracy(float)\"/> is called, its value is decreased by float parameter, of by <see cref=\"AccuracyPenalty\"/> if no parameter is not provided;\n
/// </summary>\n
"}
}
#3{#4{8 9 "97549848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Restart"}
 1.3 0.88 2.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{289 290 "\[\n
    if (IsFinished)\n
    \[\n
        Utility.LogError(\"can not restart if finished!\");\n
        return;\n
    \]\n
\n
    Accuracy = 1; //restart from 1\n
    Percentage = 0;\n
    Staging = 0;\n
\n
    LabeledAttributeUpdated(false);\n
\n
    if (Restarted != null)\n
        Restarted(this, EventArgs.Empty);\n
\]"}
#4{7 8 "Restart"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97550240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{30 31 "GetLabelOfLastSwitchedCriteria"}
 0.3 0.88 12 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{58 59 "\[\n
    return LabelOfCriteria[(int)LastSwitchedCriteria];\n
\]"}
#4{30 31 "GetLabelOfLastSwitchedCriteria"}
#4{6 7 "Labels"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97696288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "LastSwitchedCriteria"}
 1.3 0.88 8 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{20 21 "LastSwitchedCriteria"}
#4{8 9 "Criteria"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97549064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "UpdateAccuracy"}
 1.3 0.88 5.6 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{687 688 "\[\n
    if (IsPaused || !IsStarted || IsFinished)\n
        return;\n
\n
    float subtractValue;\n
    if (float.IsNaN(penalty))\n
        subtractValue = AccuracyPenalty;\n
    else\n
        subtractValue = penalty;\n
\n
    float newValue = Accuracy - subtractValue;\n
    if (newValue < 0f)\n
        newValue = 0f;\n
\n
    Labels newState = CheckStateSwitching(this.ID, (int)Criteria.Accuracy, Accuracy, newValue);\n
    Accuracy = newValue;\n
\n
    LastUpdatedCriteria = Criteria.Accuracy;\n
\n
    //update accuracy level and throw relative event\n
    if (newState != Labels.None)\n
    \[\n
        AccuracyLabel = newState;\n
        LabeledAttributeUpdated(true);\n
    \]\n
    else\n
        LabeledAttributeUpdated(false);\n
\]"}
#4{14 15 "UpdateAccuracy"}
#4{12 13 "virtual void"}
#4{25 26 "float penalty = float.NaN"}
#4{0 1 ""}
}
#5{#4{8 9 "97701376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{2 3 "ID"}
 1.3 0.88 0.8 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{2 3 "ID"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97699256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "StagingUpdateTime"}
 1.3 0.88 6.8 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{17 18 "StagingUpdateTime"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{2 3 "5f"}
}
:SLSProtectConstr.286331392{#4{8 9 "97485616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "int smartActionI"}
 0.299999 0.88 6.4 47  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{241 242 ": base()\n
\[\n
        ID = smartActionID;\n
        LabelOfCriteria = new Labels[Enum.GetNames(typeof(Labels)).Length];\n
        LabelOfCriteria[(int)Criteria.Accuracy] = Labels.Good;\n
        LabelOfCriteria[(int)Criteria.Staging] = Labels.Good;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{17 18 "int smartActionID"}
#4{0 1 ""}
}
:SLSProtectProperty.286331392{#4{8 9 "97697984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "LabelOfCriteria"}
 1.3 0.88 6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{15 16 "LabelOfCriteria"}
#4{8 9 "Labels[]"}
#4{0 1 ""}
#4{0 1 ""}
 0#4{0 1 ""}
}
#3{#4{8 9 "97548672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{517 518 "\[\n
    if (!IsPaused)\n
    \[\n
        //Utility.Log(this.GetType() + \" started\");\n
        StartTaskTime = DateTime.Now;\n
    \]\n
    else\n
        Utility.Log(\"Smart Action: \" + this.GetType() + \" REstarted\");\n
\n
    IsPaused = false;\n
    IsFinished = false;\n
    EndTaskTime = DateTime.MinValue;\n
    Percentage = 0;\n
\n
    IsStarted = true;\n
\n
    //throw StateValueUpdated event\n
    SimpleAttributeUpdated();\n
\n
    //throw started event\n
    if (Started != null)\n
        Started(this, EventArgs.Empty);\n
\n
    StartUpdateStaging();\n
\]"}
#4{5 6 "Start"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97694592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "IsStagingActive"}
 1.3 0.88 6 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{15 16 "IsStagingActive"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97555336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GetLabelOfCriteria"}
 0.3 0.88 7.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    return LabelOfCriteria[(int)criteria];\n
\]"}
#4{18 19 "GetLabelOfCriteria"}
#4{6 7 "Labels"}
#4{17 18 "Criteria criteria"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95452848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#5{#4{8 9 "97693744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "IsStarted"}
 1.3 0.88 3.6 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{9 10 "IsStarted"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97553768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Finish"}
 1.3 0.88 2.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{202 203 "\[\n
    IsFinished = true;\n
    StopUpdateStaging();\n
    EndTaskTime = DateTime.Now;\n
    Percentage = 1;\n
\n
    SimpleAttributeUpdated();\n
\n
    if (Finished != null)\n
        Finished(this, EventArgs.Empty);\n
\]"}
#4{6 7 "Finish"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97696712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "AccuracyPenalty"}
 1.3 0.88 6 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{15 16 "AccuracyPenalty"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{4 5 "0.1f"}
}
#3{#4{8 9 "97551024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{31 32 "\[\n
    return base.ToString();\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97550632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Pause"}
 1.3 0.88 2 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{182 183 "\[\n
    //Utility.Log(\"Smart Action: \" + this.GetType() + \" si Paused\");\n
    IsPaused = true;\n
    StopUpdateStaging();\n
\n
    if (Paused != null)\n
        Paused(this, EventArgs.Empty);\n
\]"}
#4{5 6 "Pause"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97695016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "StagingInitialDelay"}
 1.3 0.88 7.6 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{19 20 "StagingInitialDelay"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{2 3 "0f"}
}
:SLSThisIcon.286331409{#4{8 9 "97754424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public abstract SmartAction : State"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  6.57697 4.43907 0
 0  0 #4{27 28 "public abstract SmartAction"}
#4{5 7 "State"}
#4{0 13 ""}
:OrderedCltn.4369{16 5#4{34 35 "public event EventHandler Started;"}
#4{35 36 "public event EventHandler Finished;"}
#4{36 37 "public event EventHandler Restarted;"}
#4{33 34 "public event EventHandler Paused;"}
#4{61 62 "public event EventHandler<SmartActionEventArgs> StateUpdated;"}
}
#12{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{8 9 "97699680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "StagingUpdateFactor"}
 1.3 0.88 7.6 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{19 20 "StagingUpdateFactor"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{4 5 "0.1f"}
}
#5{#4{8 9 "97694168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "IsPaused"}
 1.3 0.88 3.2 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{8 9 "IsPaused"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97700104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "LastUpdatedCriteria"}
 1.3 0.88 7.6 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{19 20 "LastUpdatedCriteria"}
#4{8 9 "Criteria"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97554160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "CheckStateSwitching"}
 1.3 0.88 7.6 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2349 2350 "\[\n
    Labels newState = Labels.None;\n
    if (ECAParameters.SmartActionMessages == null)\n
        return newState;\n
\n
    TtsInfoContainer thisActionContainer = null;\n
\n
    if (ECAParameters.SmartActionMessages.ContainsKey(id))\n
        thisActionContainer = ECAParameters.SmartActionMessages[id];\n
    else\n
        return Labels.None;\n
\n
\n
    switch (criteria)\n
    \[\n
        case (int)Criteria.Accuracy:\n
            SmartActionCriteria accuracy = thisActionContainer.GetCriteriaTTSInfo(Criteria.Accuracy);\n
            if (newValue > accuracy.BadLimit && newValue <= accuracy.NormalLimit\n
                && (previous <= accuracy.BadLimit || previous > accuracy.NormalLimit))\n
            \[\n
                Utility.Log(\"set current accuracy actionState of \" + id + \" to Normal\");\n
                newState = Labels.Normal;\n
            \]\n
            else if (newValue >= 0f && newValue <= accuracy.BadLimit && previous > accuracy.BadLimit)\n
            \[\n
                Utility.Log(\"set current accuracy actionState of \" + id + \" to Bad\");\n
                newState = Labels.Bad;\n
            \]\n
            else if (newValue > accuracy.NormalLimit && previous <= accuracy.NormalLimit)\n
            \[\n
                Utility.Log(\"current accuracy actionState of \" + id + \" return to Good\");\n
                newState = Labels.Good;\n
            \]\n
            break;\n
\n
        case (int)Criteria.Staging:\n
            SmartActionCriteria staging = thisActionContainer.GetCriteriaTTSInfo(Criteria.Staging);\n
            if (newValue >= staging.NormalLimit && newValue < staging.BadLimit && (previous < staging.NormalLimit || previous >= staging.BadLimit))\n
            \[\n
                Utility.Log(\"set current staging actionState of \" + id + \" to Normal\");\n
                newState = Labels.Normal;\n
            \]\n
            else if (newValue >= staging.BadLimit && previous < staging.BadLimit)\n
            \[\n
                Utility.Log(\"set current staging actionState of \" + id + \" to Bad\");\n
                newState = Labels.Bad;\n
            \]\n
            else if (newValue >= staging.GoodLimit && newValue < staging.NormalLimit && previous >= staging.NormalLimit)\n
            \[\n
                Utility.Log(\"current staging actionState of \" + id + \" return to Good\");\n
                newState = Labels.Good;\n
            \]\n
            break;\n
    \]\n
    return newState;\n
\]"}
#4{19 20 "CheckStateSwitching"}
#4{13 14 "static Labels"}
#4{52 53 "int id, int criteria, float previous, float newValue"}
#4{0 1 ""}
}
#5{#4{8 9 "97697136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "StagingLabel"}
 1.3 0.88 4.8 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{203 204 "\[\n
    get\n
    \[\n
        return LabelOfCriteria[(int)Criteria.Staging];\n
    \]\n
    set\n
    \[\n
        LabelOfCriteria[(int)Criteria.Staging] = value;\n
        LastSwitchedCriteria = Criteria.Staging;\n
    \]\n
\]"}
#4{12 13 "StagingLabel"}
#4{6 7 "Labels"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "97547888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "SimpleAttributeUpdated"}
 1.3 0.88 8.8 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{94 95 "\[\n
    if (StateUpdated != null)\n
        StateUpdated(this, new SmartActionEventArgs(false));\n
\]"}
#4{22 23 "SimpleAttributeUpdated"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @317 @89 @234 @0 #12{16 0}
#12{16 0}
#12{16 0}
#12{16 4@400 @65 @41 @184 }
#12{16 0}
#12{16 0}
#12{16 0}
#1{16@172 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#12{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@197 @255 @97 @292 @3 @53 @77 @134 @387 @362 @121 @222 @109 @375 @336 @159 @267 @304 @146 @242 @15 @28 @349 @209 @280 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#12{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
