/* File ECA C# implementation of class ECA */



// global declaration start


using System;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;



public class ECAParameters
{
    //Static Attributes
    /// <summary>
    /// Messages related to Key SmartActions.
    /// Key = SmartAction ID, Value = TtsInfoContainer related to the action
    /// </summary>
    public static Dictionary<int, TtsInfoContainer> SmartActionMessages { get; set; }
    /// <summary>
    /// Given a Scenario (ex. Training) it defines which messages are enabled
    /// </summary>
    public static Dictionary<ScenarioType, Dictionary<string, bool>> ActiveMessagesPerScenario { get; set; }

    /// <summary>
    /// Set of attributes that characterize an eca
    /// </summary>
    /// <param name="name">name of the ECA</param>
    /// <param name="language">language used for tts</param>
    /// <param name="voiceName">voice used to produce voice</param>
    /// <param name="emotionModel">emotional model that simulate character of this ECA</param>
    /// <param name="ecaPresence">parameter that specifies how much ECA must be present -> intervene on one's own initiative</param>
    public ECAParameters(string name, string language, string voiceName, string emotionModel, Presence ecaPresence = Presence.High)
    {
        Name = name;
        EcaPresence = ecaPresence;
        EmotionModel = emotionModel;
        Language = language;
        VoiceName = voiceName;
    }

    public string Name { get; set; }
    public string Language { get; set; }
    public string VoiceName { get; set; }
    public string EmotionModel { get; set; }
    public Presence EcaPresence { get; set; }

    public override string ToString()
    {
        return "Name = " + Name + "\n" +
                "Language = " + Language + "\n" +
                "Voice name = " + VoiceName + "\n" +
                "XML file for Emotion model = " + EmotionModel + "\n" +
                "Level of presence = " + EcaPresence.ToString() + "\n";
    }
}

/// <summary>
/// Allows access to all the features and properties of a specific eca. 
/// Identified by an ID can be retrieved via <see cref="ECAManager"/> which keeps track of all the eca instanced in the scene.
/// </summary>



// global declaration end

public class ECA : MonoBehaviour, IIntentHandler
{
    /// <summary>
    /// Key: name of message type (corresponding XML tag name)
    /// Value: Set of messages related to the emotional state of the ECA (<see cref="EmotionalMessage"/>.
    /// </summary>
    public Dictionary<string, List<EmotionalMessage>> EmotionalMessages { get; set; }


    public ECAAnimator ECAAnimator;

    /// <summary>
    /// Given the name of a message (XML tag) check if it is enabled according to the current scenario (e.g. training).
    /// Default return value = true
    /// </summary>
    /// <param name="msgType">message to check if enabled</param>
    /// <returns></returns>
    private bool CheckIfMsgIsActive(string msgType)
    {
        if (ECAParameters.ActiveMessagesPerScenario == null)
            return true;
    
        //if in the XML file the selected message is not specified -> default true
        if (!ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario].ContainsKey(msgType))
            return true;
    
        return ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario][msgType];
    }

    /// <summary>
    /// Compare the level of presence of the ECA <see cref="ECAParameters.EcaPresence"/> with that of the SmartAction <see cref="TtsInfoContainer.Weight"/>. 
    /// </summary>
    /// <param name="weight"></param>
    /// <returns></returns>
    private bool SufficientLevel(int weight)
    {
        if ((int)EcaPresence < weight)
        {
            Utility.Log("Not speaking because this action has weight = " + weight + " that is less than Eca Level equal to " + (int)EcaPresence);
            return false;
        }
        else
            return true;
    }

    protected virtual void Awake()
    {
        Utility.Log("ECA " + name + " awaken");
    }

    /// <summary>
    /// First of all it calls the method <see cref="SetEcaId"/>. You MUST override it so that the necessary information can be retrieved from the configuration files.
    /// Set the same ID indicated in the appropriate file.
    /// After taht it retrieves the necessary parameters from the XML files in order to fill <see cref="ECAParameters"/> and get messages in XML file for TTS.
    /// It also set the emotion manager and animator.
    /// finally, it registers the ECA to the IntentHandlers specified by the user
    /// </summary>
    protected virtual void Start()
    {
 
    }

    public virtual void Init()
    {
        SetEcaId();

        IntentName = new List<string>();

        myParameters = XmlParser.GetEcaParameters(ID, Configuration.Instance.XmlDocumentNames.EcaList); //GET parameters of this eca from XML!! BUT, set the ID first (required to select ECA in XML file)
        GeneralMessagesCltn = XmlParser.GetGeneralMessagesCltn(Configuration.Instance.XmlDocumentNames.ListOfMessages, this.ID);

        EmotionManager = new ECAEmotionManager(myParameters.EmotionModel);
        ECAManager.Instance.AvailableEcas.Add(ID, this);

        CreateAnimator();

        SubscribeHandlerToIntentManager();

        Utility.Log("ECA setted");
    }

    /// <summary>
    /// If no animator has been associated from the inspector, the method create a new one <see cref="AddECAAnimator"/>
    /// Finally it call the init method (<see cref="ECAAnimator.Init"/>) of <see cref="ECAAnimator"/> (usually overwritten by the programmer)
    /// </summary>
    protected virtual void CreateAnimator()
    {
        if (ECAAnimator == null)
        {
            ECAAnimator = GetComponent<ECAAnimator>();
            if (ECAAnimator == null)
            {
                ECAAnimator = AddECAAnimator();
                Utility.LogWarning("No ECAAnimator directly assigned by editor to the ECA Script " +
                                    " and no ECAAnimator Component assigned! therefore it was created automatically");
            }
        }

        ECAAnimator.Init();
    }
    /// <summary>
    /// Record the ECA to a new <see cref="Intent"/>
    /// </summary>
    /// <param name="intentName"></param>
    protected void AddIntentHandler(string intentName)
    {
        Utility.Log("ECA " + name + " subscribing to intent " + intentName);
    
        IntentName.Add(intentName);
        IntentManager.Instance.AddIntentHandler(intentName, this);
    }

    /// <summary>
    /// Override thid method in order to handle the recognition of an <see cref="Intent"/> registered by <see cref="AddIntentHandler(string)"/>.
    /// </summary>
    /// <param name="intent"></param>
    public virtual void Handle(Intent intent)
    {
    }

    //DELETE???????? (INTEGRATED IN AddIntentHandler???
    public virtual void SubscribeHandlerToIntentManager()
    {
    }

    protected List<EmotionalMessage> GetGeneralMessagesFor(string key)
    {
      if(EmotionalMessages.ContainsKey(key))
    	return EmotionalMessages[key];
    
      return null;
    }

    /// <summary>
    /// Associate a new component (script) of type <see cref="ECAAnimator"/> to this ECA
    /// </summary>
    /// <returns></returns>
    protected virtual ECAAnimator AddECAAnimator()
    {
      return gameObject.AddComponent<ECAAnimator>();
    }

    /// <summary>
    /// You have to overwrite this method. Initialize the id with one of the ones in <see cref="Ecas"/>
    /// </summary>
    public virtual void SetEcaId()
    {
        //ID = Ecas.Default;
        throw new NotImplementedException();
    }


    public ECAEmotion ActualEmotion
    { 
      get {
    	return EmotionManager.ActualEmotion;
      } 
    
    }

    /// <summary>
    /// Ask TtsManager to speech (convert string in audio -> TTS) a message related to SmartAction state.
    /// </summary>
    /// <param name="smartAction">action related message</param>
    /// <param name="msgType">type of message: name of used tag in the XML document</param>
    /// <param name="functionToBeExecuted">a function to be executed when the audio end</param>
    /// <param name="anytime">if false and Eca is speaking, the messagte will not be queued (will never be reproduced)</param>
    /// <param name="conditionJustBeforePlay">a function that return a bool value. It is executed just before play the audio, in order to check if some condition is still true</param>
    public bool SendMessage(SmartAction smartAction, string msgType, Action functionToBeExecuted = null, bool anytime = true, Func<bool> conditionJustBeforePlay = null)
    {
        bool IsMsgEnabled = false;
    
        TtsInfoContainer container = ECAParameters.SmartActionMessages[smartAction.ID];
    
        if (SufficientLevel((int)container.Weight) && CheckIfMsgIsActive(msgType.ToString()))
            IsMsgEnabled = true;
    
        String txt = "";
        if (msgType.Equals("Support"))
        {
            SmartActionCriteria lastUpdatedCriteria = container.GetCriteriaTTSInfo(smartAction.LastUpdatedCriteria);
            txt = lastUpdatedCriteria.getText(smartAction.GetLabelOfLastSwitchedCriteria());
        }
        else
            txt = container.SmartActionMsgs[msgType];
    
        SpeechInfo speechInfo = new SpeechInfo(ECAAnimator, Language, VoiceName, txt, functionToBeExecuted, anytime, IsMsgEnabled, conditionJustBeforePlay);
        bool acceptedMessage = TtsManager.Instance.Speech(speechInfo);
        return acceptedMessage;
    }

    /// <summary>
    /// Ask TtsManager to speech (convert string in audio -> TTS) a general message (<see cref="EmotionalMessage"/>) without considering emotions
    /// and taking the first of the list. 
    /// </summary>
    /// <param name="msgType"></param>
    /// <param name="functionToBeExecuted"></param>
    /// <param name="anytime"></param>
    public void SendMessage(string msgType, Action functionToBeExecuted = null, bool anytime = true)
    {
        if (!GeneralMessagesCltn.ContainsKey(msgType))
        {
            Debug.LogError("This message does not exist");
            return;
        }
        SpeechInfo speechInfo = new SpeechInfo(ECAAnimator, Language, VoiceName, GeneralMessagesCltn[msgType][0].message, functionToBeExecuted, anytime, CheckIfMsgIsActive(msgType));
        TtsManager.Instance.Speech(speechInfo);
    }

    /// <summary>
    /// Ask TtsManager to speech (convert string in audio -> TTS) a message.
    /// </summary>
    /// <param name="message">content of message</param>
    /// <param name="functionToBeExecuted">a function to be executed when the audio end</param>
    /// <param name="anytime">if false and Eca is speaking, the messagte will not be queued (will never be reproduced)</param>
    public void SendDirectMessage(string message, Action functionToBeExecuted = null, bool anytime = true)
    {
        SpeechInfo speechInfo = new SpeechInfo(ECAAnimator, Language, VoiceName, message, functionToBeExecuted, anytime, true);
        TtsManager.Instance.Speech(speechInfo);
    }


    public Ecas ID
    { get; protected set; }


    public string Name
    { get => myParameters.Name; }


    public string Language
    { get => myParameters.Language; }


    public string VoiceName
    { get => myParameters.VoiceName; }


    public Presence EcaPresence
    { get => myParameters.EcaPresence; }


    public ECAEmotionManager EmotionManager
    { get; set; }


    public ECAParameters myParameters
    { get; set; }
    public Dictionary<string, List<EmotionalMessage>> GeneralMessagesCltn { get; private set; }

    public List<string> IntentName
    { get; set; }


}
