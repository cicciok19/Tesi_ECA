using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using CrazyMinnow.SALSA;

public class ConversationalPatient : ECA
{
    private const string BAD_NEW = "BadNew";
    private const string CHILDREN = "Children";
    private const string CURE = "Cure";
    private const string EXPLAIN_DISEASE = "ExplainDisease";
    private const string GENERAL_HEALTH = "GeneralHealth";
    private const string PRESENTATION = "Presentation";
    private const string WEATHER = "Weather";
    private const string NONE = "None";

    public SittableObject chair;
    private ECAAction sitAction;
    private Salsa salsa;
    private string ecaName;

    private TTSClient client;

    protected override void Start()
    {
        base.Start();
        
        ecaName = this.name;
        salsa = GetComponent<Salsa>();

        client = new TTSClient(this);

        //send message greetings (and trigger animation, if you want to
        chair = FindObjectOfType<SittableObject>();
        sitAction = Sit();
        actionsList.Enqueue(sitAction);

        //SendMessage(PRESENTATION);
    }

    private void Update()
    {

        //just for debug
        if(Input.GetKeyDown(KeyCode.C))
            SendMessage(CHILDREN);
        if (Input.GetKeyDown(KeyCode.E))
            SendMessage(EXPLAIN_DISEASE);
        //try with TTS client
        if (Input.GetKeyDown(KeyCode.Space))
            SendMessageRequest("Hi, my name is Sophie and I'm happy to meet you");
    }

    public override void SetEcaId()
    {
        base.SetEcaId();
        ID = Ecas.HospitalPatient;
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);

        switch (intent.IntentName)
        {
            //change emotion based on the intent
            case BAD_NEW:
                EmotionManager.UpdateEmotion(AppraisalVariables.UnexpectedNegative);
                break;
            case CHILDREN:
                EmotionManager.UpdateEmotion(AppraisalVariables.Nice);
                break;
            case EXPLAIN_DISEASE:
                EmotionManager.UpdateEmotion(AppraisalVariables.Good, .2f);
                break;
            case PRESENTATION:
                EmotionManager.UpdateEmotion(AppraisalVariables.Nice, .3f);
                break;
            case CURE:
                EmotionManager.UpdateEmotion(AppraisalVariables.Good, .5f);
                break;
            case GENERAL_HEALTH:
                break;
            case NONE:
                break;
        }

        //then send message
        SendMessage(intent.IntentName);


    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { BAD_NEW, CHILDREN, CURE, EXPLAIN_DISEASE, GENERAL_HEALTH, PRESENTATION, WEATHER, NONE};     //fill list

        foreach (var intent in intentName)
            IntentManager.Instance.AddIntentHandler(intent, this);

    }

    protected override void HandleMessageAction(EmotionalMessage message)
    {
        if (message.action == "")
            return;

        // serving action
        //MessageAction action = message.parsedAction;
        List<MessageAction> actions = message.parsedActions;

        for (int i = 0; i < actions.Count; i++)
        {
            MessageAction action = actions[i];
            ECAAction ecaAction = null;

            if (action.IsMoveTo())
            {
                Utility.Log("Going to " + action.firstParameter);
                ecaAction = new GoToAction(this, action);
                actionsList.Enqueue(ecaAction);
            }

            if (action.IsPickUp())
            {
                Utility.Log("Picking up " + action.firstParameter);
                ecaAction = new PickUpAction(this, action);
                actionsList.Enqueue(ecaAction);
            }

            if(action.IsPointAt())
            {
                Utility.Log("Pointing at " + action.firstParameter);
                ecaAction = new GoToAction(this, action);
                actionsList.Enqueue(ecaAction);
            }

            Assert.IsNotNull(ecaAction, "MessageAction is not referred to a valid action");
            actionsList.Enqueue(Sit());

        }
    }

    private ECAAction Sit()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachChair = new GoToStage(chair.GetDestination());
        TurnStage turn = new TurnStage(chair.GetSitPoint(), true);
        SitStage sit = new SitStage(chair);
        stages.Add(reachChair);
        stages.Add(turn);
        stages.Add(sit);

        ECAAction action = new ECAAction(this, stages);
        return action;
    }

    private void SendMessageRequest(string message)
    {
        client.SendMessage(message, ecaName);
        client.AudioGenerated += OnAudioGenerated;
    }

    private void OnAudioGenerated(object sender, EventArgs e)
    {
        client.AudioGenerated -= OnAudioGenerated;
        ecaAnimator.audioSource.clip = (AudioClip)Resources.Load("Audio/" + ecaName + ".wav");
        salsa.audioSrc.Play();
    }
}
