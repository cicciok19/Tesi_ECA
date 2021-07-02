using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class PickUpAction : ECAAction
{
    private MessageAction action;
    private ConversationalPatient patient;

    public PickUpAction(ConversationalPatient eca, MessageAction action, bool canAbort = true) : base(eca, canAbort)
    {
        patient = eca;
        this.action = action;
    }

    public override void SetupAction()
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for pickUp is null");

        GrabbableObject grabbableObject = obj.GetComponentInChildren<GrabbableObject>();
        Assert.IsNotNull(grabbableObject, "Object parameter hasn't a grabbable object attached");

        Destination pickDestination = obj.GetComponentInChildren<Destination>();
        Assert.IsNotNull(pickDestination, "Object parameter hasn't a destination point attached");

        List<ECAActionStage> stages = new List<ECAActionStage>();
        StandUpStage standUp = new StandUpStage(patient.chair);
        GoToStage goToDestination = new GoToStage(pickDestination.transform);
        PickStage pickUp = new PickStage(grabbableObject.transform, 1, false, HandSide.RightHand);
        if (patient.Sitted) stages.Add(standUp);
        stages.Add(goToDestination);
        stages.Add(pickUp);

        if (action.secondParameter != "")
        {
            Rubbish rubbish = GameObject.FindGameObjectWithTag(action.secondParameter).GetComponent<Rubbish>();
            Transform dropPosition = rubbish.GetDropPosition();
            Assert.IsNotNull(dropPosition, "Drop position for pickUp is null");

            Transform dropDestination = rubbish.GetDestination();
            Assert.IsNotNull(pickDestination, "Drop position hasn't a destination point attached");

            GoToStage goToDrop = new GoToStage(dropDestination.transform);
            DropStage drop = new DropStage(pickUp, dropPosition.transform, .01f, true);
            stages.Add(goToDrop);
            stages.Add(drop);
        }

        SetStages(stages);

    }
}
