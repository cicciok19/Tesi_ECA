/* File ECA C# implementation of class ECA */



// global declaration start


using System;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;
using UnityEngine.Assertions;
using RootMotion.FinalIK;
using UnityEngine.AI;

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

    public ECAAnimator ecaAnimator;
    public bool stopped = false;
    public event EventHandler Stationary;

    public HandSide typePick;

    public int ecaInTrigger = 0;

    private bool CheckIfMsgIsActive(string msgType)
    {
        if (ECAParameters.ActiveMessagesPerScenario == null)
            return true;
    
        //if in the XML file the selected message is not specified -> default true
        if (!ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario].ContainsKey(msgType))
            return true;
    
        return ECAParameters.ActiveMessagesPerScenario[Configuration.Instance.ActualScenario][msgType];
    }


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
        AddIKManager();
        if (GetComponent<Rigidbody>() == null)
            gameObject.AddComponent<Rigidbody>().useGravity = false;
    }


    protected virtual void Start()
    {
    }


    protected void AddIntentHandler(string intentName)
    {
        Utility.Log("ECA " + name + " subscribing to intent " + intentName);
    
        IntentName.Add(intentName);
        IntentManager.Instance.AddIntentHandler(intentName, this);
    }

    protected List<EmotionalMessage> GetGeneralMessagesFor(string key)
    {
      if(EmotionalMessages.ContainsKey(key))
    	return EmotionalMessages[key];
    
      return null;
    }


    protected virtual ECAAnimator AddECAAnimator()
    {
      return gameObject.AddComponent<ECAAnimator>();
    }


    protected virtual void CreateAnimator()
    {
        if (ecaAnimator == null)
        {
            ecaAnimator = GetComponent<ECAAnimator>();
            if (ecaAnimator == null)
            {
                ecaAnimator = AddECAAnimator();
                Utility.LogWarning("No ECAAnimator directly assigned by editor to the ECA Script " +
                                    " and no ECAAnimator Component assigned! therefore it was created automatically");
            }
        }
    
        ecaAnimator.Init();
    }


    protected void AddIKManager()
    {
        ikManager = GetComponent<IKSetter>();
        if (ikManager == null)
            ikManager = CreateIKManager();
        Assert.IsNotNull(ikManager);
    
        ikManager.eca = this;
    }


    protected virtual IKSetter CreateIKManager()
    {
        Assert.IsNull(ikManager);
        IKSetter manager = gameObject.AddComponent<IKSetter>();
    
        return manager;
    }




    public virtual void SetEcaId()
    {
        ID = Ecas.Default;
    }


    public ECAEmotion ActualEmotion
    { 
      get {
    	return EmotionManager.ActualEmotion;
      } 
    
    }


    public Dictionary<string, List<EmotionalMessage>> EmotionalMessages
    { get; set; }


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
        
            SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, txt, functionToBeExecuted, anytime, IsMsgEnabled, conditionJustBeforePlay);
            bool acceptedMessage = TtsManager.Instance.Speech(speechInfo);
            return acceptedMessage;
    }


    public void SendMessage(string msgType, Action functionToBeExecuted = null, bool anytime = true)
    {
            if (!GeneralMessagesCltn.ContainsKey(msgType))
            {
                Debug.LogError("This message does not exist");
                return;
            }
            SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, GeneralMessagesCltn[msgType][0].message, functionToBeExecuted, anytime, CheckIfMsgIsActive(msgType));
            TtsManager.Instance.Speech(speechInfo);
    }


    public void SendDirectMessage(string message, Action functionToBeExecuted = null, bool anytime = true)
    {
        SpeechInfo speechInfo = new SpeechInfo(ecaAnimator, Language, VoiceName, message, functionToBeExecuted, anytime, true);
        TtsManager.Instance.Speech(speechInfo);
    }


    public virtual void Init()
    {
        SetEcaId();
    
        IntentName = new List<string>();
    
        myParameters = XmlParser.GetEcaParameters(ID, Configuration.Instance.XmlDocumentNames.EcaList); //GET parameters of this eca from XML!! BUT, set the ID first (required to select ECA in XML file)
        GeneralMessagesCltn = XmlParser.GetGeneralMessagesCltn(Configuration.Instance.XmlDocumentNames.ListOfMessages, this.ID);
    
        EmotionManager = new ECAEmotionManager(myParameters.EmotionModel);
        //ECAManager.Instance.AvailableEcas.Add(ID, this);
    
        CreateAnimator();
    
        SubscribeHandlerToIntentManager();
    
        Utility.Log("ECA setted");
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


    public virtual void HandleIntentNotRecognized()
    {
    }


    public Dictionary<string, List<EmotionalMessage>> GeneralMessagesCltn
    { get; private set; }


    public IKSetter ikManager
    {
      protected set; get;
    }


    public virtual void DetachEvent(string handlerName, EventArgs args)
    {
    }


    public ECAEmotionManager EmotionManager
    { get; set; }


    public ECAParameters myParameters
    { get; set; }


    public List<string> IntentName
    { get; set; }


    public ECAAction currentAction
    {
      get {
    	return ecaAnimator.CurrentAction;
      }
    }


    public virtual void Handle(Intent intent)
    {
    }


    public virtual void SubscribeHandlerToIntentManager()
    {
    }

    protected virtual void OnTriggerEnter(Collider other)
    {
        Passenger otherEca;

        if (other.TryGetComponent<Passenger>(out otherEca))
        {
            if (!otherEca.stopped || otherEca.inQueue)
            {
                stopped = true;
                currentAction.Pause();
                otherEca.Stationary += OtherEcaIsStationary;
                ecaInTrigger++;
            }
        }
    }

    protected virtual void OnTriggerExit(Collider other)
    {
        Passenger otherEca;

        if (other.TryGetComponent<Passenger>(out otherEca))
        {
            ecaInTrigger--;
            if (ecaInTrigger <= 0)
            {
                ecaInTrigger = 0;
                stopped = false;
                otherEca.Stationary -= OtherEcaIsStationary;
                currentAction.Resume();
            }
        }
    }

    protected virtual void PlaceReached(object sender, EventArgs e)
    {
        stopped = true;

        if (Stationary != null)
            Stationary(this, EventArgs.Empty);
    }

    protected virtual void OtherEcaIsStationary(object sender, EventArgs e)
    {
        stopped = false;
        //mi devo disiscrivere dall'evento dell'altro eca Stationary
        //sender.Stationary -= OtherEcaIsStationary;
        currentAction.Resume();
    }

    public void DisactivateNavMeshAgent()
    {
        GetComponent<NavMeshAgent>().enabled = false;
    }

    public void ActivateNavMeshAgent()
    {
        GetComponent<NavMeshAgent>().enabled = true;
    }

}
