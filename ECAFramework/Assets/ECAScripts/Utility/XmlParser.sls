:ArrayOb.273{6:Dictionary.4369{16 14:SLSPrivateMethod.286331408{:String.17{9 10 "104491344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "getDoc"}
 1.3 0.88 2.4 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{488 489 "\[\n
    string xmlFile = documentName;\n
\n
    XmlDocument doc = new XmlDocument();\n
    xmlFile = xmlFile.Replace(System.IO.Path.GetExtension(xmlFile), \"\");\n
\n
    if (InfoPath != \"\")\n
        xmlFile = InfoPath + \"/\" + xmlFile;\n
\n
    TextAsset xmlAsset = (TextAsset)Resources.Load(xmlFile);\n
    try\n
    \[\n
        doc.LoadXml(xmlAsset.text);\n
    \]\n
    catch (Exception e)\n
    \[\n
        Utility.LogError(\"error in loading file \" + xmlFile + \" :: \" + e);\n
        return null;\n
    \]\n
    return doc;\n
\]"}
#4{6 7 "getDoc"}
#4{18 19 "static XmlDocument"}
#4{19 20 "string documentName"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104491736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "GetSmartActionMessages"}
 1.3 0.88 8.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2682 2683 "\[\n
    Dictionary<int, TtsInfoContainer> textDB = new Dictionary<int, TtsInfoContainer>();\n
\n
    XmlDocument doc = getDoc(documentName);\n
\n
    XmlNodeList nodeList = doc.SelectNodes(\"/game/actions/action\");\n
\n
    //cycling all Action Nodes\n
    foreach (XmlNode node in nodeList)\n
    \[\n
        Dictionary<string, string> smartActionMsgs = new Dictionary<string, string>();\n
\n
        //Get Name of Action\n
        String actionName = getAttribute(node, \"name\").InnerText;\n
        TtsInfoContainer textContainer = new TtsInfoContainer(actionName);\n
\n
        //Get weight\n
        XmlNode ttsNode = getSimpleNode(node, \"tts\");\n
        try\n
        \[\n
            textContainer.Weight = ToEnum<Presence>(getAttribute(ttsNode, \"weight\").InnerText);\n
        \]\n
        catch (ArgumentException)\n
        \[\n
            Utility.LogError(\"Weight value not defined in StateAttribute.Weight\");\n
            return null;\n
        \]\n
\n
        //Get Action msgs\n
        for (int i = 0; i < ttsNode.ChildNodes.Count; i++)\n
        \[\n
            XmlNode currentNode = ttsNode.ChildNodes[i];\n
            string currentNodeName = currentNode.Name;\n
            if (currentNodeName == \"Criteria\")\n
            \[\n
                //cycling all criteria (Accuracy and Staging for now)\n
                foreach (Criteria criteria in Enum.GetValues(typeof(Criteria)))\n
                \[\n
                    XmlNode criteriaNode = getSimpleNode(currentNode, criteria.ToString());\n
\n
                    String[] LableTxt = new String[SmartActionCriteria.NumberOfLables];\n
                    float[] LableValue = new float[SmartActionCriteria.NumberOfLables];\n
\n
                    //cycling all Lables (Good, Bad, Normal) for now\n
                    foreach (Lables lable in Enum.GetValues(typeof(Lables)))\n
                    \[\n
                        if (lable.Equals(Lables.None))\n
                            continue;\n
\n
                        LableTxt[(int)lable] = getAttribute(criteriaNode, lable.ToString().ToLower() + \"Txt\").InnerText;\n
                        LableValue[(int)lable] = (float)XmlConvert.ToDouble(getAttribute(criteriaNode, lable.ToString().ToLower() + \"Limit\").InnerText);\n
                    \]\n
                    textContainer.SetCriteriaTTSInfo(criteria, new SmartActionCriteria(criteria, LableTxt, LableValue));\n
                \]\n
            \]\n
            else\n
            \[\n
                smartActionMsgs.Add(currentNode.Name, currentNode.InnerText);\n
            \]\n
        \]\n
        textContainer.SmartActionMsgs = smartActionMsgs;\n
        //recovery ID from the Enum \"Actions\"\n
        int id = (int)ToEnum<SmartActions>(actionName);\n
\n
        textDB.Add(id, textContainer);\n
\n
    \]\n
    return textDB;\n
\]"}
#4{22 23 "GetSmartActionMessages"}
#4{40 41 "static Dictionary<int, TtsInfoContainer>"}
#4{19 20 "string documentName"}
#4{0 1 ""}
}
#5{#4{9 10 "104911344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "ToEnum<T>"}
 1.3 0.88 3.6 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{144 145 "\[\n
    if (!typeof(T).IsEnum)\n
        throw new Exception(\"T must be an Enumeration type.\");\n
    return (T)Enum.Parse(typeof(T), value, false);\n
\]"}
#4{9 10 "ToEnum<T>"}
#4{8 9 "static T"}
#4{12 13 "string value"}
#4{0 1 ""}
}
#5{#4{9 10 "104495264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "InitAzureConfiguration"}
 1.3 0.88 8.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1143 1144 "\[\n
    XmlDocument doc = getDoc(xmlFileConfiguration);\n
\n
    //Luis configuration:\n
    XmlNode luisConf = doc.SelectSingleNode(\"configuration/luisAttributes\");\n
    string luisId = getSimpleNode(luisConf, \"luisAppId\").InnerText;\n
    string luisAppKey = getSimpleNode(luisConf, \"luisAppKey\").InnerText;\n
    string luisRegion = getSimpleNode(luisConf, \"luisRegion\").InnerText;\n
    string luisLanguage = getSimpleNode(luisConf, \"language\").InnerText;\n
\n
    Utility.Log(\"Info found: ID= \" + luisId + \" AppKey= \" + luisAppKey + \" Region = \" + luisRegion + \" language = \" + luisLanguage);\n
\n
    IntentManager.Instance.LUISAppId = luisId;\n
    IntentManager.Instance.LUISAppKey = luisAppKey;\n
    IntentManager.Instance.LUISRegion = luisRegion;\n
    IntentManager.Instance.SpeechRecognitionLanguage = luisLanguage;\n
\n
    //Tts configuration\n
    XmlNode ttsConf = doc.SelectSingleNode(\"configuration/ttsParameters\");\n
    string serviceId = getSimpleNode(ttsConf, \"serviceId\").InnerText;\n
    string serviceZone = getSimpleNode(ttsConf, \"serviceZone\").InnerText;\n
\n
    TtsManager.Instance.TtsServiceID = serviceId;\n
    TtsManager.Instance.TtsZone = serviceZone;\n
\]"}
#4{22 23 "InitAzureConfiguration"}
#4{11 12 "static void"}
#4{27 28 "string xmlFileConfiguration"}
#4{0 1 ""}
}
#5{#4{9 10 "104493304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{28 29 "GetActiveMessagesPerScenario"}
 1.3 0.88 11.2 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{928 929 "\[\n
    Dictionary<ScenarioType, Dictionary<string, bool>> isActiveMsg = new Dictionary<ScenarioType, Dictionary<string, bool>>();\n
    XmlDocument doc = getDoc(xmlDocumentName);\n
    XmlNodeList gameTypes = doc.SelectNodes(\"activatedMsgs/gameType\");\n
\n
    foreach (XmlNode gameTypeNode in gameTypes)\n
    \[\n
        Dictionary<string, bool> IsMsgActivated = new Dictionary<string, bool>();\n
\n
        string gameTypeName = gameTypeNode.Attributes[\"name\"].InnerText;\n
        for (int i = 0; i < gameTypeNode.ChildNodes.Count; i++)\n
        \[\n
            bool IsActive = false;\n
            string isActiveStr = gameTypeNode.ChildNodes[i].Attributes[\"isActive\"].InnerText;\n
            if (isActiveStr == \"YES\")\n
                IsActive = true;\n
\n
            IsMsgActivated.Add(gameTypeNode.ChildNodes[i].Name, IsActive);\n
        \]\n
        isActiveMsg.Add(ToEnum<ScenarioType>(gameTypeName), IsMsgActivated);\n
    \]\n
\n
\n
    return isActiveMsg;\n
\]"}
#4{28 29 "GetActiveMessagesPerScenario"}
#4{57 58 "static Dictionary<ScenarioType, Dictionary<string, bool>>"}
#4{22 23 "string xmlDocumentName"}
#4{0 1 ""}
}
#3{#4{9 10 "104912128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "getAttribute"}
 1.3 0.88 4.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{256 257 "\[\n
    XmlAttribute attribute = node.Attributes[attributeName];\n
    if (attribute != null)\n
        return attribute;\n
    else\n
    \[\n
        Utility.LogError(\"Attribute: \" + attributeName + \" not foud in the Node: \" + node.Name);\n
        return null;\n
    \]\n
\]"}
#4{12 13 "getAttribute"}
#4{19 20 "static XmlAttribute"}
#4{34 35 "XmlNode node, string attributeName"}
#4{0 1 ""}
}
#5{#4{9 10 "104497224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "GetEcaParameters"}
 1.3 0.88 6.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1030 1031 "\[\n
    XmlDocument doc = getDoc(documentName);\n
    XmlNodeList AllEcaNodes = doc.SelectNodes(\"/ecas/eca\");\n
    XmlNode wantedEcaNode = null;\n
\n
    foreach(XmlNode ecaNode in AllEcaNodes)\n
    \[\n
        if (getAttribute(ecaNode, \"id\").InnerText == id.ToString())\n
            wantedEcaNode = ecaNode;\n
    \]\n
    if (wantedEcaNode == null)\n
    \[\n
        Utility.LogError(\"Eca node with ID = \" + id.ToString() + \" not foud\");\n
        return null;\n
    \]\n
    string name = getSimpleNode(wantedEcaNode, \"name\").InnerText;\n
    string language = getSimpleNode(wantedEcaNode, \"language\").InnerText;\n
    string voiceName = getSimpleNode(wantedEcaNode, \"voiceName\").InnerText;\n
    string emotionModel = getSimpleNode(wantedEcaNode, \"emotionModel\").InnerText;\n
    string presence = getSimpleNode(wantedEcaNode, \"presence\").InnerText;\n
\n
    if (presence != \"\")\n
        return new ECAParameters(name, language, voiceName, emotionModel, ToEnum<Presence>(presence));\n
    else\n
        return new ECAParameters(name, language, voiceName, emotionModel);\n
\]"}
#4{16 17 "GetEcaParameters"}
#4{20 21 "static ECAParameters"}
#4{28 29 "Ecas id, string documentName"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86314736"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{143 144 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System.Xml;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
\n
\n
"}
}
#5{#4{9 10 "104493696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetEmotionModel"}
 1.3 0.88 6 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1016 1017 "\[\n
    Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> model = new Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>>();\n
    XmlDocument doc = getDoc(XmlFileEmotionModel);\n
    XmlNode root = doc.SelectSingleNode(\"model\");\n
\n
    foreach (AppraisalVariables variables in Enum.GetValues(typeof(AppraisalVariables)))\n
    \[\n
        List<KeyValuePair<AvailableEmotions, float>> affectedEmotions = new List<KeyValuePair<AvailableEmotions, float>>();\n
        XmlNode appraiseVarNode = getSimpleNode(root, variables.ToString());\n
        for (int i = 0; i < appraiseVarNode.ChildNodes.Count; i++)\n
        \[\n
            XmlNode node = appraiseVarNode.ChildNodes[i];\n
            AvailableEmotions affectedEmotion = ToEnum<AvailableEmotions>(node.Name);\n
            affectedEmotions.Add(new KeyValuePair<AvailableEmotions, float>(affectedEmotion, (float)XmlConvert.ToDouble(node.InnerText)));\n
        \]\n
        model.Add(variables, affectedEmotions);\n
    \]\n
    return model;\n
\]"}
#4{15 16 "GetEmotionModel"}
#4{83 84 "static Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>>"}
#4{26 27 "string XmlFileEmotionModel"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86313456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{35 36 "public static string InfoPath = \"\";"}
}
#3{#4{9 10 "104496048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "getSimpleNode"}
 1.3 0.88 5.2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{209 210 "\[\n
    XmlNode node = fatherNode.SelectSingleNode(nameOfNode);\n
    if (node == null)\n
        Utility.LogError(\"the Node: \" + fatherNode.Name + \" does not contain child node: \" + nameOfNode);\n
\n
    return node;\n
\]"}
#4{13 14 "getSimpleNode"}
#4{14 15 "static XmlNode"}
#4{37 38 "XmlNode fatherNode, string nameOfNode"}
#4{0 1 ""}
}
#5{#4{9 10 "104492521"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GetGeneralMessages"}
 1.3 0.88 7.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{433 434 "\[\n
    Dictionary<string, string> generalMsgs = new Dictionary<string, string>();\n
\n
    XmlDocument doc = getDoc(documentName);\n
    XmlNode ttsNode = doc.SelectSingleNode(\"/game/tts\");\n
\n
    for (int i = 0; i < ttsNode.ChildNodes.Count; i++)\n
    \[\n
        if(ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)\n
            generalMsgs.Add(ttsNode.ChildNodes[i].Name, ttsNode.ChildNodes[i].InnerText);\n
    \]\n
\n
    return generalMsgs;\n
\]"}
#4{18 19 "GetGeneralMessages"}
#4{33 34 "static Dictionary<string, string>"}
#4{19 20 "string documentName"}
#4{0 1 ""}
}
#5{#4{9 10 "104492520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "GetGeneralMessagesCltn"}
 1.3 0.88 8.8 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1000 1001 "\[\n
    Dictionary<string, List<EmotionalMessage>> generalMsgs = new Dictionary<string, List<EmotionalMessage>>();\n
\n
    XmlDocument doc = getDoc(documentName);\n
    XmlNode ttsNode = doc.SelectSingleNode(\"/game/tts\");\n
\n
    for (int i = 0; i < ttsNode.ChildNodes.Count; i++)\n
    \[\n
        if(ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)\n
\t\[\n
\t\tstring key = ttsNode.ChildNodes[i].Name;\n
\t\tstring value = ttsNode.ChildNodes[i].InnerText;\n
\t\tstring emotion = \"None\";\n
\t\tstring action = \"\";\n
\n
\t\tif(ttsNode.ChildNodes[i].Attributes[\"emotion\"] != null)\n
\t\t\temotion = ttsNode.ChildNodes[i].Attributes[\"emotion\"].InnerText;\n
\n
\t\tif(ttsNode.ChildNodes[i].Attributes[\"action\"] != null)\n
\t\t\taction = ttsNode.ChildNodes[i].Attributes[\"action\"].InnerText;\n
\n
\t\tif(!generalMsgs.ContainsKey(key))\n
\t\t\tgeneralMsgs[key] = new List<EmotionalMessage>();\n
\n
\t\tEmotionalMessage message = new EmotionalMessage(value, ToEnum<AvailableEmotions>(emotion), action);\n
\n
\t\tgeneralMsgs[key].Add(message);\n
\t\]\n
    \]\n
\n
    return generalMsgs;\n
\]"}
#4{22 23 "GetGeneralMessagesCltn"}
#4{49 50 "static Dictionary<string, List<EmotionalMessage>>"}
#4{19 20 "string documentName"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "85939920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{9 10 "XmlParser"}
 21.3543 2.2 5.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{9 10 "XmlParser"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @151 @87 @107 @0 #9{16 0}
#9{16 0}
#9{16 3@3 @115 @63 }
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@75 @15 @127 @51 @39 @95 @27 @0 @0 @139 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
