using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

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

    private SittableObject chair;
    private ECAAction sitAction;

    private TTSClient client;

    protected override void Start()
    {
        base.Start();

        client = new TTSClient();

        //send message greetings (and trigger animation, if you want to
        chair = FindObjectOfType<SittableObject>();
        sitAction = Sit();
        actionsList.Enqueue(sitAction);

        //SendMessage(PRESENTATION);
    }

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.C))
            SendMessage(CHILDREN);
        if (Input.GetKeyDown(KeyCode.E))
            SendMessage(EXPLAIN_DISEASE);
        if (Input.GetKeyDown(KeyCode.Space))
            client.SendMessage("Ciao, sono ciccio");
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
                break;
            case CHILDREN:
                break;
            case EXPLAIN_DISEASE:
                break;
            case PRESENTATION:
                break;
            case CURE:
                break;
            case GENERAL_HEALTH:
                break;
            case NONE:
                break;
        }

        //then send message
        SendMessage(PRESENTATION);


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
                ecaAction = CreateGoToAction(action);
                actionsList.Enqueue(ecaAction);
            }

            if (action.IsPickUp())
            {
                Utility.Log("Picking up " + action.firstParameter);
                ecaAction = CreatePickUpAction(action);
                actionsList.Enqueue(ecaAction);
            }

            if(action.IsPointAt())
            {
                Utility.Log("Pointing at " + action.firstParameter);
                ecaAction = CreatePointAtAction(action);
                actionsList.Enqueue(ecaAction);
            }

            Assert.IsNotNull(ecaAction, "MessageAction is not referred to a valid action");
            actionsList.Enqueue(Sit());

        }

    }

    private ECAAction CreatePickUpAction(MessageAction action)
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for pickUp is null");

        GrabbableObject grabbableObject = obj.GetComponentInChildren<GrabbableObject>();
        Assert.IsNotNull(grabbableObject, "Object parameter hasn't a grabbable object attached");

        Destination pickDestination = obj.GetComponentInChildren<Destination>();
        Assert.IsNotNull(pickDestination, "Object parameter hasn't a destination point attached");

        List<ECAActionStage> stages = new List<ECAActionStage>();
        StandUpStage standUp = new StandUpStage(chair);
        GoToStage goToDestination = new GoToStage(pickDestination.transform);
        PickStage pickUp = new PickStage(grabbableObject.transform, 1, false, HandSide.RightHand);
        stages.Add(standUp);
        stages.Add(goToDestination);
        stages.Add(pickUp);

        if (action.secondParameter != "")
        {
            GameObject dropPosition = GameObject.FindGameObjectWithTag(action.secondParameter);
            Assert.IsNotNull(dropPosition, "Drop position for pickUp is null");

            Destination dropDestination = dropPosition.GetComponentInChildren<Destination>();
            Assert.IsNotNull(pickDestination, "Drop position hasn't a destination point attached");

            GoToStage goToDrop = new GoToStage(dropDestination.transform);
            DropStage drop = new DropStage(pickUp, dropPosition.transform);
            stages.Add(goToDrop);
            stages.Add(drop);
        }

        ECAAction pickAction = new ECAAction(this, stages);

        //return new ECACompositeAction(this, new List<ECAAction>() { pickAction, sitAction });
        return pickAction;
    }

    private ECAAction CreateGoToAction(MessageAction action)
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        Destination destination = obj.GetComponentInChildren<Destination>();
        Assert.IsNotNull(destination, "Object parameter hasn't a destination point attached");

        StandUpStage standUp = new StandUpStage(chair);
        GoToStage goTo = new GoToStage(destination.transform);
        List<ECAActionStage> stages = new List<ECAActionStage>() { standUp, goTo };

        ECAAction goToAction = new ECAAction(this, stages);

        //return new ECACompositeAction(this, new List<ECAAction>() { goToAction, sitAction });
        return goToAction;
    }


    private ECAAction CreatePointAtAction(MessageAction action)
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        List<ECAActionStage> stages = new List<ECAActionStage>();

        StandUpStage standUp = new StandUpStage(chair);
        stages.Add(standUp);
        //setup ointAtStage
        int time = 0;
        PointAtStage pointAt;
        if (action.secondParameter != "")
            time = Int32.Parse(action.secondParameter);

        if (time != 0)
            pointAt = new PointAtStage(obj.transform, time);
        else
            pointAt = new PointAtStage(obj.transform, 2);


        //setup optional GoToStage
        if (obj.GetComponentInChildren<Destination>() != null)
        {
            Destination destination = obj.GetComponentInChildren<Destination>();
            stages.Add(new GoToStage(destination.transform));
            stages.Add(pointAt);

            ECAAction goAndPoint = new ECAAction(this, stages);
            ECACompositeAction ecaAction = new ECACompositeAction(this, new List<ECAAction>() { goAndPoint, sitAction });
            return ecaAction;
        }
        else    //if there's no destination only pointAt
        {
            stages.Add(pointAt);
            ECAAction ecaAction = new ECAAction(this, stages);
            return ecaAction;
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
}
