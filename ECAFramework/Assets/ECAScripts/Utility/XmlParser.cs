/* File XmlParser C# implementation of class XmlParser */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using UnityEngine;
using UnityEngine.Assertions;




// global declaration end

class XmlParser
{
// class declaration start
public static string InfoPath = "";
// class declaration end

    private static XmlDocument getDoc(string documentName)
    {
        string xmlFile = documentName;
    
        XmlDocument doc = new XmlDocument();
        xmlFile = xmlFile.Replace(System.IO.Path.GetExtension(xmlFile), "");
    
        if (InfoPath != "")
            xmlFile = InfoPath + "/" + xmlFile;
    
        TextAsset xmlAsset = (TextAsset)Resources.Load(xmlFile);
        try
        {
            doc.LoadXml(xmlAsset.text);
        }
        catch (Exception e)
        {
            Utility.LogError("error in loading file " + xmlFile + " :: " + e);
            return null;
        }
        return doc;
    }


    private static XmlNode getSimpleNode(XmlNode fatherNode, string nameOfNode)
    {
        XmlNode node = fatherNode.SelectSingleNode(nameOfNode);
        if (node == null)
            Utility.LogError("the Node: " + fatherNode.Name + " does not contain child node: " + nameOfNode);
    
        return node;
    }


    private static XmlAttribute getAttribute(XmlNode node, string attributeName)
    {
        XmlAttribute attribute = node.Attributes[attributeName];
        if (attribute != null)
            return attribute;
        else
        {
            Utility.LogError("Attribute: " + attributeName + " not foud in the Node: " + node.Name);
            return null;
        }
    }




    public static ECAParameters GetEcaParameters(Ecas id, string documentName)
    {
        XmlDocument doc = getDoc(documentName);
        XmlNodeList AllEcaNodes = doc.SelectNodes("/ecas/eca");
        XmlNode wantedEcaNode = null;
    
        foreach(XmlNode ecaNode in AllEcaNodes)
        {
            if (getAttribute(ecaNode, "id").InnerText == id.ToString())
                wantedEcaNode = ecaNode;
        }
        if (wantedEcaNode == null)
        {
            Utility.LogError("Eca node with ID = " + id.ToString() + " not foud");
            return null;
        }
        string name = getSimpleNode(wantedEcaNode, "name").InnerText;
        string language = getSimpleNode(wantedEcaNode, "language").InnerText;
        string voiceName = getSimpleNode(wantedEcaNode, "voiceName").InnerText;
        string emotionModel = getSimpleNode(wantedEcaNode, "emotionModel").InnerText;
        string presence = getSimpleNode(wantedEcaNode, "presence").InnerText;
    
        if (presence != "")
            return new ECAParameters(name, language, voiceName, emotionModel, ToEnum<Presence>(presence));
        else
            return new ECAParameters(name, language, voiceName, emotionModel);
    }


    public static Dictionary<int, TtsInfoContainer> GetSmartActionMessages(string documentName)
    {
        Dictionary<int, TtsInfoContainer> textDB = new Dictionary<int, TtsInfoContainer>();
    
        XmlDocument doc = getDoc(documentName);
    
        XmlNodeList nodeList = doc.SelectNodes("/game/actions/action");
    
        //cycling all Action Nodes
        foreach (XmlNode node in nodeList)
        {
            Dictionary<string, string> smartActionMsgs = new Dictionary<string, string>();
    
            //Get Name of Action
            String actionName = getAttribute(node, "name").InnerText;
            TtsInfoContainer textContainer = new TtsInfoContainer(actionName);
    
            //Get weight
            XmlNode ttsNode = getSimpleNode(node, "tts");
            try
            {
                textContainer.Weight = ToEnum<Presence>(getAttribute(ttsNode, "weight").InnerText);
            }
            catch (ArgumentException)
            {
                Utility.LogError("Weight value not defined in StateAttribute.Weight");
                return null;
            }
    
            //Get Action msgs
            for (int i = 0; i < ttsNode.ChildNodes.Count; i++)
            {
                XmlNode currentNode = ttsNode.ChildNodes[i];
                string currentNodeName = currentNode.Name;
                if (currentNodeName == "Criteria")
                {
                    //cycling all criteria (Accuracy and Staging for now)
                    foreach (Criteria criteria in Enum.GetValues(typeof(Criteria)))
                    {
                        XmlNode criteriaNode = getSimpleNode(currentNode, criteria.ToString());
    
                        String[] LableTxt = new String[SmartActionCriteria.NumberOfLabels];
                        float[] LableValue = new float[SmartActionCriteria.NumberOfLabels];
    
                        //cycling all Labels (Good, Bad, Normal) for now
                        foreach (Labels lable in Enum.GetValues(typeof(Labels)))
                        {
                            if (lable.Equals(Labels.None))
                                continue;
    
                            LableTxt[(int)lable] = getAttribute(criteriaNode, lable.ToString().ToLower() + "Txt").InnerText;
                            LableValue[(int)lable] = (float)XmlConvert.ToDouble(getAttribute(criteriaNode, lable.ToString().ToLower() + "Limit").InnerText);
                        }
                        textContainer.SetCriteriaTTSInfo(criteria, new SmartActionCriteria(criteria, LableTxt, LableValue));
                    }
                }
                else
                {
                    smartActionMsgs.Add(currentNode.Name, currentNode.InnerText);
                }
            }
            textContainer.SmartActionMsgs = smartActionMsgs;
            //recovery ID from the Enum "Actions"
            int id = (int)ToEnum<SmartActions>(actionName);
    
            textDB.Add(id, textContainer);
    
        }
        return textDB;
    }

    //OLD VERSION
    /*
    public static Dictionary<string, string> GetGeneralMessages(string documentName)
    {
        Dictionary<string, string> generalMsgs = new Dictionary<string, string>();
    
        XmlDocument doc = getDoc(documentName);
        XmlNode ttsNode = doc.SelectSingleNode("/game/tts");
    
        for (int i = 0; i < ttsNode.ChildNodes.Count; i++)
        {
            if(ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)
                generalMsgs.Add(ttsNode.ChildNodes[i].Name, ttsNode.ChildNodes[i].InnerText);
        }
    
        return generalMsgs;
    }
    */
    public static Dictionary<string, string> GetGeneralMessages(string documentName, Ecas eca)
    {
        Dictionary<string, string> generalMsgs = new Dictionary<string, string>();

        XmlDocument doc = getDoc(documentName);
        XmlNodeList ttsNodes = doc.SelectNodes("/game/tts");

        foreach (XmlNode ttsNode in ttsNodes)
        {
            XmlAttribute ecaIDs = getAttribute(ttsNode, "ecaID");
            if (ecaIDs == null || ecaIDs.InnerText.Contains(eca.ToString()))
            {
                for (int i = 0; i < ttsNode.ChildNodes.Count; i++)
                {
                    if (ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)
                        generalMsgs.Add(ttsNode.ChildNodes[i].Name, ttsNode.ChildNodes[i].InnerText);
                }
            }
        }
        return generalMsgs;
    }


    public static Dictionary<ScenarioType, Dictionary<string, bool>> GetActiveMessagesPerScenario(string xmlDocumentName)
    {
        Dictionary<ScenarioType, Dictionary<string, bool>> isActiveMsg = new Dictionary<ScenarioType, Dictionary<string, bool>>();
        XmlDocument doc = getDoc(xmlDocumentName);
        XmlNodeList gameTypes = doc.SelectNodes("activatedMsgs/gameType");
    
        foreach (XmlNode gameTypeNode in gameTypes)
        {
            Dictionary<string, bool> IsMsgActivated = new Dictionary<string, bool>();
    
            string gameTypeName = gameTypeNode.Attributes["name"].InnerText;
            for (int i = 0; i < gameTypeNode.ChildNodes.Count; i++)
            {
                bool IsActive = false;
                string isActiveStr = gameTypeNode.ChildNodes[i].Attributes["isActive"].InnerText;
                if (isActiveStr == "YES")
                    IsActive = true;
    
                IsMsgActivated.Add(gameTypeNode.ChildNodes[i].Name, IsActive);
            }
            isActiveMsg.Add(ToEnum<ScenarioType>(gameTypeName), IsMsgActivated);
        }
    
    
        return isActiveMsg;
    }


    public static void InitAzureConfiguration(string xmlFileConfiguration)
    {
        XmlDocument doc = getDoc(xmlFileConfiguration);
    
        //Luis configuration:
        XmlNode luisConf = doc.SelectSingleNode("configuration/luisAttributes");
        string luisId = getSimpleNode(luisConf, "luisAppId").InnerText;
        string luisAppKey = getSimpleNode(luisConf, "luisAppKey").InnerText;
        string luisRegion = getSimpleNode(luisConf, "luisRegion").InnerText;
        string luisLanguage = getSimpleNode(luisConf, "language").InnerText;
    
        Utility.Log("Info found: ID= " + luisId + " AppKey= " + luisAppKey + " Region = " + luisRegion + " language = " + luisLanguage);
    
        IntentManager.Instance.LUISAppId = luisId;
        IntentManager.Instance.LUISAppKey = luisAppKey;
        IntentManager.Instance.LUISRegion = luisRegion;
        IntentManager.Instance.SpeechRecognitionLanguage = luisLanguage;
    
        //Tts configuration
        XmlNode ttsConf = doc.SelectSingleNode("configuration/ttsParameters");
        string serviceId = getSimpleNode(ttsConf, "serviceId").InnerText;
        string serviceZone = getSimpleNode(ttsConf, "serviceZone").InnerText;
    
        TtsManager.Instance.TtsServiceID = serviceId;
        TtsManager.Instance.TtsZone = serviceZone;
    }


    public static Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> GetEmotionModel(string XmlFileEmotionModel)
    {
        Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> model = new Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>>();
        XmlDocument doc = getDoc(XmlFileEmotionModel);
        XmlNode root = doc.SelectSingleNode("model");
    
        foreach (AppraisalVariables variables in Enum.GetValues(typeof(AppraisalVariables)))
        {
            List<KeyValuePair<AvailableEmotions, float>> affectedEmotions = new List<KeyValuePair<AvailableEmotions, float>>();
            XmlNode appraiseVarNode = getSimpleNode(root, variables.ToString());
            for (int i = 0; i < appraiseVarNode.ChildNodes.Count; i++)
            {
                XmlNode node = appraiseVarNode.ChildNodes[i];
                AvailableEmotions affectedEmotion = ToEnum<AvailableEmotions>(node.Name);
                affectedEmotions.Add(new KeyValuePair<AvailableEmotions, float>(affectedEmotion, (float)XmlConvert.ToDouble(node.InnerText)));
            }
            model.Add(variables, affectedEmotions);
        }
        return model;
    }

    public static Dictionary<string, List<EmotionalMessage>> GetGeneralMessagesCltn(string documentName, Ecas eca)
    {
        Dictionary<string, List<EmotionalMessage>> generalMsgs = new Dictionary<string, List<EmotionalMessage>>();

        XmlDocument doc = getDoc(documentName);
        XmlNodeList ttsNodes = doc.SelectNodes("/game/tts");

        foreach (XmlNode ttsNode in ttsNodes)
        {
            XmlAttribute ecaIDs = getAttribute(ttsNode, "ecaID");
            if (ecaIDs != null && !ecaIDs.InnerText.Contains(eca.ToString()))
                continue;

            for (int i = 0; i < ttsNode.ChildNodes.Count; i++)
            {
                if (ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)
                {
                    string key = ttsNode.ChildNodes[i].Name;
                    string value = ttsNode.ChildNodes[i].InnerText;
                    string emotion = "None";
                    string action = "";

                    if (ttsNode.ChildNodes[i].Attributes["emotion"] != null)
                        emotion = ttsNode.ChildNodes[i].Attributes["emotion"].InnerText;

                    if (ttsNode.ChildNodes[i].Attributes["action"] != null)
                        action = ttsNode.ChildNodes[i].Attributes["action"].InnerText;

                    if (!generalMsgs.ContainsKey(key))
                        generalMsgs[key] = new List<EmotionalMessage>();

                    EmotionalMessage message = new EmotionalMessage(value, ToEnum<AvailableEmotions>(emotion), action);

                    generalMsgs[key].Add(message);
                }
            }
        }

        return generalMsgs;
    }

    //OLD VERSION
    /*
    public static Dictionary<string, List<EmotionalMessage>> GetGeneralMessagesCltn(string documentName)
    {
        Dictionary<string, List<EmotionalMessage>> generalMsgs = new Dictionary<string, List<EmotionalMessage>>();
    
        XmlDocument doc = getDoc(documentName);
        XmlNode ttsNode = doc.SelectSingleNode("/game/tts");
    
        for (int i = 0; i < ttsNode.ChildNodes.Count; i++)
        {
            if(ttsNode.ChildNodes[i].NodeType != XmlNodeType.Comment)
    	{
    		string key = ttsNode.ChildNodes[i].Name;
    		string value = ttsNode.ChildNodes[i].InnerText;
    		string emotion = "None";
    		string action = "";
    
    		if(ttsNode.ChildNodes[i].Attributes["emotion"] != null)
    			emotion = ttsNode.ChildNodes[i].Attributes["emotion"].InnerText;
    
    		if(ttsNode.ChildNodes[i].Attributes["action"] != null)
    			action = ttsNode.ChildNodes[i].Attributes["action"].InnerText;
    
    		if(!generalMsgs.ContainsKey(key))
    			generalMsgs[key] = new List<EmotionalMessage>();
    
    		EmotionalMessage message = new EmotionalMessage(value, ToEnum<AvailableEmotions>(emotion), action);
    
    		generalMsgs[key].Add(message);
    	}
        }
    
        return generalMsgs;
    }
    */
    public static T ToEnum<T>(string value)
    {
        if (!typeof(T).IsEnum)
            throw new Exception("T must be an Enumeration type.");
        return (T)Enum.Parse(typeof(T), value, false);
    }
}
