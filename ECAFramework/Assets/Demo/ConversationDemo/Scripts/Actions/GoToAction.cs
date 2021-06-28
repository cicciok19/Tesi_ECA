using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class GoToAction : ECAAction
{
    private ConversationalPatient patient;
    private MessageAction action;

    public GoToAction(ConversationalPatient eca,MessageAction action, bool canAbort = true) : base(eca, canAbort)
    {
        patient = eca;
        this.action = action;
    }

    public override void SetupAction()
    {
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        Destination destination = obj.GetComponentInChildren<Destination>();
        Assert.IsNotNull(destination, "Object parameter hasn't a destination point attached");
        StandUpStage standUp = new StandUpStage(patient.chair);
        GoToStage goTo = new GoToStage(destination.transform);
        
        List<ECAActionStage> stages = new List<ECAActionStage>();

        if (patient.Sitted) stages.Add(standUp);
        stages.Add(goTo);
        SetStages(stages);
    }
}
