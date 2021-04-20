:ArrayOb.273{6:Dictionary.4369{32 26:SLSProtectMethod.286331408{:String.17{8 9 "96181760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "HandlePaintsIntents"}
 1.3 0.88 7.6 10  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2361 2362 "\[\n
    if (FirstPaintInteraction)\n
    \[\n
        if (intentName == FirstPaintIntentNames[IdxPaintIntent])\n
        \[\n
            switch (intentName)\n
            \[\n
                case \"First Paint Artist\":\n
                    SendMessage(\"FirstPaintArtistCorrect\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    break;\n
                case \"First Paint Year\":\n
                    SendMessage(\"FirstPaintYearCorrect\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    FirstPaintInteraction = false;\n
                    break;\n
            \]\n
            IdxPaintIntent++;\n
        \]\n
    \]\n
\n
    if (SecondPaintInteraction)\n
    \[\n
        if (intentName == SecondPaintIntentNames[IdxPaintIntent])\n
        \[\n
            switch (intentName)\n
            \[\n
                case \"Second Paint Artist\":\n
                    SendMessage(\"paintCorrectArtist_2\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    break;\n
                case \"Second Paint Year\":\n
                    SendMessage(\"paintCorrectYear_2\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    SecondPaintInteraction = false;\n
                    break;\n
            \]\n
            if (CorrectAnswer != null)\n
                CorrectAnswer(this, EventArgs.Empty);\n
            IdxPaintIntent++;\n
        \]\n
        else\n
        \[\n
            if (IdxPaintIntent == 0)\n
                SendMessage(\"paintNOTCorrectArtist_2\");\n
            else\n
                SendMessage(\"paintNOTCorrectYear_2\");\n
        \]\n
    \]\n
\n
    if (ThirdPaintInteraction)\n
    \[\n
        if (intentName == ThirdPaintIntentNames[IdxPaintIntent])\n
        \[\n
            switch (intentName)\n
            \[\n
                case \"Third Paint Artist\":\n
                    SendMessage(\"ThirdPaintArtistCorrect\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    break;\n
                case \"Third Paint Year\":\n
                    SendMessage(\"ThirdPaintYearCorrect\");\n
                    IntentManager.Instance.RemoveIntentHandler(intentName, this);\n
                    ThirdPaintInteraction = false;\n
                    break;\n
            \]\n
            IdxPaintIntent++;\n
        \]\n
    \]\n
\]"}
#4{19 20 "HandlePaintsIntents"}
#4{4 5 "void"}
#4{17 18 "string intentName"}
#4{0 1 ""}
 0}
:SLSPrivateMethod.286331408{#4{8 9 "96183328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ExecuteAfterMessage"}
 1.3 0.88 7.6 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{259 260 "\[\n
    if (!e.SmartAction.IsStarted)\n
        SendMessage(e.SmartAction, e.MessageType, e.FunctionToExecute, e.AnyTime);\n
    //ANIMAZIONE ECA\n
    else\n
        //if was pause -> do not play start message (description of the task)\n
        e.SmartAction.Start();\n
\]"}
#4{19 20 "ExecuteAfterMessage"}
#4{4 5 "void"}
#4{38 39 "object sender, SmartActionCustomArgs e"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "96180192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1001 1002 "\[\n
    //controllo quali sono gli ECA a cui mi sto rivolgendo\n
    List<ECA> focusedEcas = ECAManager.Instance.FocusedECA();\n
    Utility.Log(\"Received intent \" + intent.IntentName + \"::\" + intent.Score);\n
\n
    //vedo quali di questi intent \195\\168\ quello giusto\n
    // - mando il messaggio relativo\n
    // - (facoltativo) aggiorno le emozioni\n
    // - (facoltativo) rimuovo l'intent nel caso in cui non mi serva pi\195\\185\, es. Presentation\n
    switch (intent.IntentName)\n
    \[\n
        case \"None\":\n
            if (focusedEcas.Count == 0 || focusedEcas.Contains(this))\n
                SendMessage(\"Misunderstood\");\n
            EmotionManager.updateEmotion(AppraisalVariables.UnexpectedNegative, 0.5f);\n
            break;\n
        case \"Presentation\":\n
            if (focusedEcas.Count == 0 || focusedEcas.Contains(this))\n
                SendMessage(\"Presentation\");\n
            IntentManager.Instance.RemoveIntentHandler(\"Presentation\", this);\n
            break;\n
\n
    \]\n
\n
    HandlePaintsIntents(intent.IntentName);\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
#5{#4{8 9 "96179800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnActionFinished"}
 1.3 0.88 6.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{615 616 "\[\n
    SmartAction smartAction = (SmartAction)sender;\n
    //send audio\n
    SendMessage(smartAction, \"EndTask\", null, true);\n
\n
    //update emotions\n
    if (Labels.Good.Equals(smartAction.AccuracyLabel) && Labels.Good.Equals(smartAction.StagingLabel))\n
        EmotionManager.updateEmotion(AppraisalVariables.Good);\n
    else if (Labels.Good.Equals(smartAction.AccuracyLabel) || Labels.Good.Equals(smartAction.StagingLabel))\n
        EmotionManager.updateEmotion(AppraisalVariables.Good, 0.8f);\n
    else\n
        EmotionManager.updateEmotion(AppraisalVariables.Good, 0.4f);\n
\n
    smartAction.Finished -= OnActionFinished;\n
\]"}
#4{16 17 "OnActionFinished"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130159184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
#3{#4{8 9 "96182544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{340 341 "\[\n
    base.Start();\n
    SubscribeToActionsEvents();\n
    SubscribeToNodesEvents();\n
    SubscribeHandlerToIntentManager();\n
\n
    FirstPaintInteraction = false;\n
    SecondPaintInteraction = false;\n
    ThirdPaintInteraction = false;\n
\n
    //usato per capire a che punto sono dell'interazione con l'ECA per ciascun quadro\n
    IdxPaintIntent = 0;\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{8 9 "96184112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "GiveSupport"}
 1.3 0.88 4.4 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1838 1839 "\[\n
    //bool isMessageAccepted;\n
\n
\n
    switch (smartAction.GetLabelOfLastSwitchedCriteria())\n
    \[\n
        case Labels.Bad:\n
            EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.4f);\n
            if (smartAction.LastSwitchedCriteria.Equals(Criteria.Staging))\n
            \[\n
                StagingLabelUpdated(smartAction);\n
\n
                //if staging has already reached the bad level, the update time is increased\n
                smartAction.StagingUpdateTime = 80f;\n
            \]\n
            else\n
                AccuracyLabelUpdated(smartAction);\n
\n
            //CHIAMO ANIMAZIONE ECA\n
\n
            break;\n
        case Labels.Normal:\n
            EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.4f);\n
            if (smartAction.LastSwitchedCriteria.Equals(Criteria.Staging))\n
                StagingLabelUpdated(smartAction);\n
            else\n
                AccuracyLabelUpdated(smartAction);\n
\n
            /*\n
            if (smartAction == ECAGameManager.AllSmartActions[SmartActions.PoseTriangle])\n
            \[\n
                SendMessage(smartAction, \"Support\", null, true);\n
                if (GivingSupport != null)\n
                    GivingSupport(true);\n
                return;\n
            \]\n
            isMessageAccepted = SendMessage(smartAction, \"Support\", null, false);\n
            if (GivingSupport != null)\n
                GivingSupport(isMessageAccepted);\n
            */\n
\n
            //CHIAMO ANIMAZIONE ECA\n
\n
            break;\n
        case Labels.Good:\n
            EmotionManager.updateEmotion(AppraisalVariables.Good);\n
\n
            //CHIAMO ANIMAZIONE ECA\n
\n
            break;\n
\n
        //CHIAMO ANIMAZIONE ECA,\n
        //una sola volta e passo come argomento la label che ho attualmente\n
        //internamente, lo script che gestisce l'animazione dovr\195\\160\ valutare la label e agire di conseguenza\n
    \]\n
\]"}
#4{11 12 "GiveSupport"}
#4{4 5 "void"}
#4{23 24 "SmartAction smartAction"}
#4{0 1 ""}
}
#3{#4{8 9 "96178624"}
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
#5{#4{8 9 "96183720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnStateUpdated"}
 1.3 0.88 5.6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{872 873 "\[\n
\n
    SmartAction smartAction = (SmartAction)sender;\n
    bool isMessageAccepted;\n
\n
    //if the state continues to worsen once the bad label is reached -> update emotions differently (lessened),\n
    //and continue to give support\n
    if (e.IsLabeledAttribute && !e.IsLabelSwitched)\n
    \[\n
        //some criteria has reached the limit value\n
        if (smartAction.GetLabelOfCriteria(smartAction.LastUpdatedCriteria).Equals(Labels.Bad))\n
        \[\n
            EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.1f);\n
            isMessageAccepted = SendMessage(smartAction, \"Support\", null, false);\n
            /*if (GivingSupport != null)\n
                GivingSupport(isMessageAccepted);\n
                */\n
        \]\n
        return;\n
    \]\n
\n
    //not give support if label is not switched\n
    if (!e.IsLabelSwitched)\n
        return;\n
\n
    \n
    GiveSupport(smartAction);\n
\]"}
#4{14 15 "OnStateUpdated"}
#4{4 5 "void"}
#4{37 38 "object sender, SmartActionEventArgs e"}
#4{0 1 ""}
}
#6{#4{8 9 "96179016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "SubscribeToNodesEvents"}
 0.3 0.88 8.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{293 294 "\[\n
    foreach (KeyValuePair<int, GameGraphNode> nodes in ECAGameManager.AllSimpleNodes)\n
        if (nodes.Value is SmartActionNode)\n
        \[\n
            SmartActionNode smNode = (SmartActionNode)nodes.Value;\n
            smNode.OnAskingExecutionAfterMessage += ExecuteAfterMessage;\n
        \]\n
\]"}
#4{22 23 "SubscribeToNodesEvents"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "96180584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "AccuracyLabelUpdated"}
 1.3 0.88 8 37  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{246 247 "\[\n
    bool isMessageAccepted;\n
\n
    isMessageAccepted = SendMessage(smartAction, \"Support\", null, false);\n
    //notifico che \195\\168\ stato emesso un mex di supporto\n
    /*if (GivingSupport != null)\n
        GivingSupport(isMessageAccepted);\n
        */\n
\]"}
#4{20 21 "AccuracyLabelUpdated"}
#4{4 5 "void"}
#4{23 24 "SmartAction smartAction"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "129171344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{21 22 "ThirdPaintInteraction"}
 1.3 1.88 8.4 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{21 22 "ThirdPaintInteraction"}
#4{4 5 "bool"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "129172224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{21 22 "FirstPaintIntentNames"}
 1.3 1.88 8.4 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{21 22 "FirstPaintIntentNames"}
#4{12 13 "List<string>"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{111 112 " new List<string>\n
    \[\n
        \"First Paint Artist\",\n
        \"First Paint Year\",\n
        \"Interruption\",\n
    \]"}
#4{0 1 ""}
}
#6{#4{8 9 "96184504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "SubscribeToActionsEvents"}
 0.3 0.88 9.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{217 218 "\[\n
    foreach (KeyValuePair<SmartActions, SmartAction> Actions in ECAGameManager.AllSmartActions)\n
    \[\n
        Actions.Value.StateUpdated += OnStateUpdated;\n
        Actions.Value.Finished += OnActionFinished;\n
    \]\n
\]"}
#4{24 25 "SubscribeToActionsEvents"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "96184896"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.88 12.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{312 313 "\[\n
    //definisco gli intent che mi servono per questo ECA\n
    IntentName = new List<string> \[ \"Presentation\", \"None\" \];\n
    //aggiungo gli handler per ogni intent definito prima\n
    IntentManager.Instance.AddIntentHandler(IntentName[0], this);\n
    IntentManager.Instance.AddIntentHandler(IntentName[1], this);\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "96180976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscriveToRelativePaintIntents"}
 0.3 0.88 12.4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{776 777 "\[\n
    switch (paintNumber)\n
    \[\n
        case 1:\n
            foreach(string intentName in FirstPaintIntentNames)\n
            \[\n
                IntentManager.Instance.AddIntentHandler(intentName, this);\n
            \]\n
            FirstPaintInteraction = true;\n
            break;\n
        case 2:\n
            foreach (string intentName in SecondPaintIntentNames)\n
            \[\n
                IntentManager.Instance.AddIntentHandler(intentName, this);\n
            \]\n
            SecondPaintInteraction = true;\n
            break;\n
        case 3:\n
            foreach (string intentName in ThirdPaintIntentNames)\n
            \[\n
                IntentManager.Instance.AddIntentHandler(intentName, this);\n
            \]\n
            ThirdPaintInteraction = true;\n
            break;\n
    \]\n
\]"}
#4{31 32 "SubscriveToRelativePaintIntents"}
#4{4 5 "void"}
#4{15 16 "int paintNumber"}
#4{0 1 ""}
}
#6{#4{8 9 "96185288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "SetEcaId"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
    ID = Ecas.Sophie_B;\n
\]"}
#4{8 9 "SetEcaId"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "18460040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{20 21 "public ECABlue : ECA"}
 19.3429 2.2 12.8 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.85252 4.24178 0
 0  0 #4{14 15 "public ECABlue"}
#4{3 7 "ECA"}
#4{0 13 ""}
#9{16 2#4{40 41 "public event EventHandler CorrectAnswer;"}
#4{38 39 "public event EventHandler WrongAnswer;"}
}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#8{#4{8 9 "97059304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{22 23 "SecondPaintIntentNames"}
 1.3 1.88 8.8 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{22 23 "SecondPaintIntentNames"}
#4{12 13 "List<string>"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{112 113 " new List<string>\n
    \[\n
        \"Second Paint Artist\",\n
        \"Second Paint Year\",\n
        \"Interruption\"\n
    \]"}
#4{0 1 ""}
}
#8{#4{9 10 "129171784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "IdxPaintIntent"}
 1.3 1.88 5.6 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "IdxPaintIntent"}
#4{3 4 "int"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "96182152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{25 26 "HandleIntentNotRecognized"}
 1.3 0.88 10 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{234 235 "\[\n
    if (IdxPaintIntent == 0)\n
        SendMessage(\"paintNOTCorrectArtist_1\");\n
    else if (IdxPaintIntent == 1)\n
        SendMessage(\"paintNOTCorrectYear_1\");\n
\n
    if (WrongAnswer != null)\n
        WrongAnswer(this, EventArgs.Empty);\n
\]"}
#4{25 26 "HandleIntentNotRecognized"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "129172664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{22 23 "SecondPaintInteraction"}
 1.3 1.88 8.8 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{22 23 "SecondPaintInteraction"}
#4{4 5 "bool"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "97061064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{21 22 "ThirdPaintIntentNames"}
 1.3 1.88 8.4 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{21 22 "ThirdPaintIntentNames"}
#4{12 13 "List<string>"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{110 111 " new List<string>\n
    \[\n
        \"Third Paint Artist\",\n
        \"Third Paint Year\",\n
        \"Interruption\"\n
    \]"}
#4{0 1 ""}
}
#5{#4{8 9 "96179408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "StagingLabelUpdated"}
 1.3 0.88 7.6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{459 460 "\[\n
    //serve per notificare al file di log che p stato emesso un mex di supporto\n
    /*Func<bool> isPlayed = () =>\n
    \[\n
        if (!smartAction.IsFinished && !smartAction.IsPaused)\n
        \[\n
            NotifyGivingSupport(true);\n
            return true;\n
        \]\n
        NotifyGivingSupport(false);\n
        return false;\n
    \];\n
    */\n
    //SendMessage(smartAction, \"Support\", null, true, isPlayed);\n
    SendMessage(smartAction, \"Support\", null, true);\n
\]"}
#4{19 20 "StagingLabelUpdated"}
#4{4 5 "void"}
#4{23 24 "SmartAction smartAction"}
#4{0 1 ""}
}
#8{#4{9 10 "129170464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{21 22 "FirstPaintInteraction"}
 1.3 1.88 8.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{21 22 "FirstPaintInteraction"}
#4{4 5 "bool"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130159440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @209 @51 @324 @0 #9{16 0}
#9{16 0}
#9{16 6@15 @39 @95 @71 @297 @119 }
#9{16 3@59 @83 @3 }
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @282 @0 @225 @0 @146 @0 @240 @0 @131 @0 @267 @0 @309 @0 @0 @0 }
#1{16@197 @173 @27 @161 @107 @185 @255 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
