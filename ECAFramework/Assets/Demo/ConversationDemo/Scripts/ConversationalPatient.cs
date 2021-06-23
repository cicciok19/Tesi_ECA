using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class ConversationalPatient : ECA
{
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { };     //fill list

        foreach (var intent in intentName)
            IntentManager.Instance.AddIntentHandler(intent, this);

    }

    protected void HandleMessageAction(EmotionalMessage message)
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
            }

            Assert.IsNotNull(ecaAction, "MessageAction is not referred to a valid action");
            actionsList.Enqueue(ecaAction);
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
        GoToStage goToDestination = new GoToStage(pickDestination.transform);
        PickStage pickUp = new PickStage(grabbableObject.transform, 1, false, HandSide.RightHand);
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
        
        return new ECAAction(this, stages);
    }

    private ECAAction CreateGoToAction(MessageAction action)
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        Destination destination = obj.GetComponentInChildren<Destination>();
        Assert.IsNotNull(destination, "Object parameter hasn't a destination point attached");

        return new ECAAction(this, new GoToStage(destination.transform));
    }

    private ECAAction CreatePointAtAction(MessageAction action)
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        List<ECAActionStage> stages = new List<ECAActionStage>();

        if (obj.GetComponentInChildren<Destination>() != null)
        {
            Destination destination = obj.GetComponentInChildren<Destination>();
            stages.Add(new GoToStage(destination.transform));
        }

        int time = 0;
        PointAtStage pointAt;
        if (action.secondParameter != "")
            time = Int32.Parse(action.secondParameter);

        if (time != 0)
            pointAt = new PointAtStage(obj.transform, time);
        else
            pointAt = new PointAtStage(obj.transform, 2);

        stages.Add(pointAt);

        return new ECAAction(this, stages);
    }
}
