:ArrayOb.273{6:Dictionary.4369{64 39:SLSPublicMethod.286331408{:String.17{8 9 "85914928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SendMessage"}
 0.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{894 895 "\[\n
        bool IsMsgEnabled = false;\n
    \n
        TtsInfoContainer container = ECAParameters.SmartActionMessages[smartAction.ID];\n
    \n
        if (SufficientLevel((int)container.Weight) && CheckIfMsgIsActive(msgType.ToString()))\n
            IsMsgEnabled = true;\n
    \n
        String txt = \"\";\n
        if (msgType.Equals(\"Support\"))\n
        \[\n
            SmartActionCriteria lastUpdatedCriteria = container.GetCriteriaTTSInfo(smartAction.LastUpdatedCriteria);\n
            txt = lastUpdatedCriteria.getText(smartAction.GetLabelOfLastSwitchedCriteria());\n
        \]\n
        else\n
            txt = container.SmartActionMsgs[msgType];\n
    \n
        SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, txt, functionToBeExecuted, anytime, IsMsgEnabled, conditionJustBeforePlay);\n
        bool acceptedMessage = TtsManager.Instance.Speech(speechInfo);\n
        return acceptedMessage;\n
\]"}
#4{11 12 "SendMessage"}
#4{4 5 "bool"}
#4{139 140 "SmartAction smartAction, string msgType, Action functionToBeExecuted = null, bool anytime = true, Func<bool> conditionJustBeforePlay = null"}
#4{0 1 ""}
}
#3{#4{8 9 "74753208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "DetachEvent"}
 1.3 0.879999 4.4 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{11 12 "DetachEvent"}
#4{12 13 "virtual void"}
#4{34 35 "string handlerName, EventArgs args"}
#4{0 1 ""}
}
#3{#4{9 10 "129305752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{25 26 "HandleIntentNotRecognized"}
 1.3 0.879999 10 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{25 26 "HandleIntentNotRecognized"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "145502320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "currentAction"}
 1.3 0.879999 5.2 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{50 51 "\[\n
  get \[\n
\treturn ecaAnimator.CurrentAction;\n
  \]\n
\]"}
#4{13 14 "currentAction"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSExternObject.286331409{#4{8 9 "85832936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 1  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{10 11 "ECAManager"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 }
:JLSGlobalDeclare.286331408{#4{8 9 "48937992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{2247 2248 "using System;\n
using System.Collections.Generic;\n
using IntentRecognitionResults;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
\n
\n
\n
\n
\n
\n
\n
\n
\n
\n
\n
\n
\n
public class ECAParameters\n
\[\n
    //Static Attributes\n
    /// <summary>\n
    /// Messages related to Key SmartActions.\n
    /// Key = SmartAction ID, Value = TtsInfoContainer related to the action\n
    /// </summary>\n
    public static Dictionary<int, TtsInfoContainer> SmartActionMessages \[ get; set; \]\n
    /// <summary>\n
    /// Given a Scenario (ex. Training) it defines which messages are enabled\n
    /// </summary>\n
    public static Dictionary<ScenarioType, Dictionary<string, bool>> ActiveMessagesPerScenario \[ get; set; \]\n
\n
    /// <summary>\n
    /// Set of attributes that characterize an eca\n
    /// </summary>\n
    /// <param name=\"name\">name of the ECA</param>\n
    /// <param name=\"language\">language used for tts</param>\n
    /// <param name=\"voiceName\">voice used to produce voice</param>\n
    /// <param name=\"emotionModel\">emotional model that simulate character of this ECA</param>\n
    /// <param name=\"ecaPresence\">parameter that specifies how much ECA must be present -> intervene on one's own initiative</param>\n
    public ECAParameters(string name, string language, string voiceName, string emotionModel, Presence ecaPresence = Presence.High)\n
    \[\n
        Name = name;\n
        EcaPresence = ecaPresence;\n
        EmotionModel = emotionModel;\n
        Language = language;\n
        VoiceName = voiceName;\n
    \]\n
\n
    public string Name \[ get; set; \]\n
    public string Language \[ get; set; \]\n
    public string VoiceName \[ get; set; \]\n
    public string EmotionModel \[ get; set; \]\n
    public Presence EcaPresence \[ get; set; \]\n
\n
    public override string ToString()\n
    \[\n
        return \"Name = \" + Name + \"\\n\" +\n
                \"Language = \" + Language + \"\\n\" +\n
                \"Voice name = \" + VoiceName + \"\\n\" +\n
                \"XML file for Emotion model = \" + EmotionModel + \"\\n\" +\n
                \"Level of presence = \" + EcaPresence.ToString() + \"\\n\";\n
    \]\n
\]\n
\n
\n
\n
\n
\n
\n
/// <summary>\n
/// Allows access to all the features and properties of a specific eca. \n
/// Identified by an ID can be retrieved via <see cref=\"ECAManager\"/> which keeps track of all the eca instanced in the scene.\n
/// </summary>\n
"}
}
#5{#4{9 10 "164790328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "ikManager"}
 1.3 0.879999 3.6 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{25 26 "\[\n
  protected set; get;\n
\]"}
#4{9 10 "ikManager"}
#4{8 9 "IKSetter"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "158918344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "ecaAnimator"}
 1.3 1.88 4.4 1  39 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "ecaAnimator"}
#4{11 12 "ECAAnimator"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "85535760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "SetEcaId"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 70 "\[\n
    ID = Ecas.Default;\n
\]"}
#4{8 9 "SetEcaId"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85941736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Language"}
 1.3 0.88 3.2 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{33 34 "\[ get => myParameters.Language; \]"}
#4{8 9 "Language"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "128707936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 1.3 0.88 1.6 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{604 605 "\[\n
    SetEcaId();\n
\n
    IntentName = new List<string>();\n
\n
    myParameters = XmlParser.GetEcaParameters(ID, Configuration.Instance.XmlDocumentNames.EcaList); //GET parameters of this eca from XML!! BUT, set the ID first (required to select ECA in XML file)\n
    GeneralMessagesCltn = XmlParser.GetGeneralMessagesCltn(Configuration.Instance.XmlDocumentNames.ListOfMessages, this.ID);\n
\n
    EmotionManager = new ECAEmotionManager(myParameters.EmotionModel);\n
    //ECAManager.Instance.AvailableEcas.Add(ID, this);\n
\n
    CreateAnimator();\n
\n
    SubscribeHandlerToIntentManager();\n
\n
    Utility.Log(\"ECA setted\");\n
\]"}
#4{4 5 "Init"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85948728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ActualEmotion"}
 1.3 0.88 5.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{56 57 "\[ \n
  get \[\n
\treturn EmotionManager.ActualEmotion;\n
  \] \n
\n
\]"}
#4{13 14 "ActualEmotion"}
#4{10 11 "ECAEmotion"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "93717440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "EmotionalMessages"}
 1.3 0.88 6.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{17 18 "EmotionalMessages"}
#4{42 43 "Dictionary<string, List<EmotionalMessage>>"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "85653424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.880001 12.4 1  35 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85620112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "IntentName"}
 1.3 0.879999 4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{10 11 "IntentName"}
#4{12 13 "List<string>"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104346152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 10  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{16 17 "EmotionalMessage"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 }
#5{#4{8 9 "85977272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Name"}
 1.3 0.88 1.6 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{29 30 "\[ get => myParameters.Name; \]"}
#4{4 5 "Name"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "85581024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{42 43 "public ECA : MonoBehaviour, IIntentHandler"}
 15.32 2.2 26.88 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{10 11 "public ECA"}
#4{29 30 "MonoBehaviour, IIntentHandler"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "164789056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 19  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{8 9 "IKSetter"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 }
:SLSProtectMethod.286331408{#4{8 9 "85662088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 877 "\[\n
    Utility.Log(\"ECA \" + name + \" awaken\");\n
    AddIKManager();\n
\]"}
#4{5 6 "Awake"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "85914385"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "SendDirectMessage"}
 0.3 0.88 6.8 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{171 370 "\[\n
    SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, message, functionToBeExecuted, anytime, true);\n
    TtsManager.Instance.Speech(speechInfo);\n
\]"}
#4{17 18 "SendDirectMessage"}
#4{4 5 "void"}
#4{71 72 "string message, Action functionToBeExecuted = null, bool anytime = true"}
#4{0 1 ""}
}
#3{#4{9 10 "129817152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SendMessage"}
 0.3 0.88 4.4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{388 390 "\[\n
        if (!GeneralMessagesCltn.ContainsKey(msgType))\n
        \[\n
            Debug.LogError(\"This message does not exist\");\n
            return;\n
        \]\n
        SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, GeneralMessagesCltn[msgType][0].message, functionToBeExecuted, anytime, CheckIfMsgIsActive(msgType));\n
        TtsManager.Instance.Speech(speechInfo);\n
\]"}
#4{11 12 "SendMessage"}
#4{4 5 "void"}
#4{71 72 "string msgType, Action functionToBeExecuted = null, bool anytime = true"}
#4{0 1 ""}
}
#11{#4{9 10 "129304576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "CreateAnimator"}
 1.3 0.88 5.6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{429 430 "\[\n
    if (ecaAnimator == null)\n
    \[\n
        ecaAnimator = GetComponent<ECAAnimator>();\n
        if (ecaAnimator == null)\n
        \[\n
            ecaAnimator = AddECAAnimator();\n
            Utility.LogWarning(\"No ECAAnimator directly assigned by editor to the ECA Script \" +\n
                                \" and no ECAAnimator Component assigned! therefore it was created automatically\");\n
        \]\n
    \]\n
\n
    ecaAnimator.Init();\n
\]"}
#4{14 15 "CreateAnimator"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#11{#4{9 10 "104028512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 20  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{52 54 "\[\n
  return gameObject.AddComponent<ECAAnimator>();\n
\]"}
#4{14 15 "AddECAAnimator"}
#4{19 20 "virtual ECAAnimator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#5{#4{8 9 "85942520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "EcaPresence"}
 1.3 0.879999 4.4 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{36 37 "\[ get => myParameters.EcaPresence; \]"}
#4{11 12 "EcaPresence"}
#4{8 9 "Presence"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85912552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "myParameters"}
 1.3 0.879999 4.8 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{12 13 "myParameters"}
#4{13 14 "ECAParameters"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "85913872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{2 3 "ID"}
 1.3 0.88 0.8 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{2 3 "ID"}
#4{4 5 "Ecas"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "93718712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "GeneralMessagesCltn"}
 1.3 0.879999 7.6 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{19 20 "GeneralMessagesCltn"}
#4{42 43 "Dictionary<string, List<EmotionalMessage>>"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{8 9 "86347568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "GetGeneralMessagesFor"}
 1.3 0.879999 8.4 26  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{92 126 "\[\n
  if(EmotionalMessages.ContainsKey(key))\n
\treturn EmotionalMessages[key];\n
\n
  return null;\n
\]"}
#4{21 22 "GetGeneralMessagesFor"}
#4{22 23 "List<EmotionalMessage>"}
#4{10 11 "string key"}
#4{0 1 ""}
 0}
:SLSPrivateMethod.286331408{#4{8 9 "85917840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SufficientLevel"}
 1.3 0.88 6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{244 245 "\[\n
    if ((int)EcaPresence < weight)\n
    \[\n
        Utility.Log(\"Not speaking because this action has weight = \" + weight + \" that is less than Eca Level equal to \" + (int)EcaPresence);\n
        return false;\n
    \]\n
    else\n
        return true;\n
\]"}
#4{15 16 "SufficientLevel"}
#4{4 5 "bool"}
#4{10 11 "int weight"}
#4{0 1 ""}
}
#12{#4{8 9 "85912160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "CheckIfMsgIsActive"}
 1.3 0.88 7.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{393 394 "\[\n
    if (ECAParameters.ActiveMessagesPerScenario == null)\n
        return true;\n
\n
    //if in the XML file the selected message is not specified -> default true\n
    if (!ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario].ContainsKey(msgType))\n
        return true;\n
\n
    return ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario][msgType];\n
\]"}
#4{18 19 "CheckIfMsgIsActive"}
#4{4 5 "bool"}
#4{14 15 "string msgType"}
#4{0 1 ""}
}
#11{#4{9 10 "104297120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "AddIntentHandler"}
 1.3 0.88 6.4 10  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{172 441 "\[\n
    Utility.Log(\"ECA \" + name + \" subscribing to intent \" + intentName);\n
\n
    IntentName.Add(intentName);\n
    IntentManager.Instance.AddIntentHandler(intentName, this);\n
\]"}
#4{16 17 "AddIntentHandler"}
#4{4 5 "void"}
#4{17 42 "string intentName"}
#4{0 1 ""}
 0}
#5{#4{8 9 "85916640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "EmotionManager"}
 1.3 0.879999 5.6 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{14 15 "EmotionManager"}
#4{17 18 "ECAEmotionManager"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "131538713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "CreateIKManager"}
 1.3 0.879999 6 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 157 "\[\n
    Assert.IsNull(ikManager);\n
    IKSetter manager = gameObject.AddComponent<IKSetter>();\n
\n
    return manager;\n
\]"}
#4{15 16 "CreateIKManager"}
#4{16 17 "virtual IKSetter"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#11{#4{8 9 "85708344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 903 "\[\n
\]"}
#4{5 6 "Start"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{8 9 "85582320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.880001 2.4 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{6 7 "Handle"}
#4{12 13 "virtual void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
#5{#4{8 9 "85942128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "VoiceName"}
 1.3 0.879999 3.6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{34 35 "\[ get => myParameters.VoiceName; \]"}
#4{9 10 "VoiceName"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "131538712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "AddIKManager"}
 1.3 0.88 4.8 10  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{171 172 "\[\n
    ikManager = GetComponent<IKSetter>();\n
    if (ikManager == null)\n
        ikManager = CreateIKManager();\n
    Assert.IsNotNull(ikManager);\n
\n
    ikManager.eca = this;\n
\]"}
#4{12 16 "AddIKManager"}
#4{4 14 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "85679976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @215 @65 @476 @0 #7{16 0}
#7{16 0}
#7{16 2@378 @366 }
#7{16 8@242 @427 @390 @354 @290 @278 @464 @415 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 3@52 @189 @229 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @86 @0 @0 @0 @0 }
#1{40@101 @138 @151 @3 @266 @254 @126 @328 @202 @113 @451 @302 @27 @341 @73 @15 @0 @402 @0 @315 @176 @0 @0 @39 @0 @0 @0 @0 @439 @164 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
