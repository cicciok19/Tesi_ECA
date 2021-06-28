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
    public bool Sitted { get; protected set; } = false;
    private ECAAction sitAction;


    protected override void Start()
    {
        base.Start();

        //send message greetings (and trigger animation, if you want to
        chair = FindObjectOfType<SittableObject>();
       /* sitAction = Sit();
        actionsList.Enqueue(sitAction);*/
        actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 1)));
        SendMessageRequest(PRESENTATION);
    }

    private void Update()
    {
        //just for debug
        if(Input.GetKeyDown(KeyCode.C))
            SendMessageRequest(CHILDREN);
        if (Input.GetKeyDown(KeyCode.E))
            SendMessageRequest(EXPLAIN_DISEASE);
        //try with TTS client
        if (Input.GetKeyDown(KeyCode.Space))
            SendDirectMessageRequest("Hello doctor, my name is Sophie");
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
        SendMessageRequest(intent.IntentName);


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
        actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 0)));

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
                ecaAction = new PointAtAction(this, action);
                actionsList.Enqueue(ecaAction);
            }

            if (action.IsSit())
            {
                Utility.Log("Sit down");
                ecaAction = Sit();
                Sitted = true;
            }



            Assert.IsNotNull(ecaAction, "MessageAction is not referred to a valid action");
            if (Sitted)
                actionsList.Enqueue(Sit());
            else
                actionsList.Enqueue(new ECAAction(this, new TurnStage(ecaAnimator.camera.transform)));
            actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 1)));
        }
    }

    private ECAAction Sit()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachChair = new GoToStage(chair.GetDestination(), null, false);
        TurnStage turn = new TurnStage(chair.GetSitPoint(), true);
        WaitStage wait = new WaitStage(.6f);
        SitStage sit = new SitStage(chair);
        stages.Add(reachChair);
        stages.Add(wait);
        stages.Add(turn);
        stages.Add(sit);

        ECAAction action = new ECAAction(this, stages);
        return action;
    }

}
