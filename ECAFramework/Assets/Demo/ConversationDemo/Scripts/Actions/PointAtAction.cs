using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class PointAtAction : ECAAction
{
    private ConversationalPatient patient;
    private MessageAction action;

    public PointAtAction(ConversationalPatient eca, MessageAction action, bool canAbort = true) : base(eca, canAbort)
    {
        patient = eca;
        this.action = action;
    }

    public override void SetupAction()
    {
        base.SetupAction();

        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for GoTo is null");

        List<ECAActionStage> stages = new List<ECAActionStage>();

        StandUpStage standUp = new StandUpStage(patient.chair);
        if (patient.Sitted) stages.Add(standUp);
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
        }
        else    //if there's no destination only pointAt
        {
            stages.Add(pointAt);
        }

        SetStages(stages);
    }

}
