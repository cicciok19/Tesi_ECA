using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class GoToStage : ECAActionStage
{
    private Transform Destination;

    public GoToStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform destination) : base(ecaAction, ecaAnimator)
    {
        Destination = destination;
    }

    public override void startStage()
    {
        base.startStage();
        EcaAnimator.GoTo(Destination.position, 0.05f);
        EcaAnimator.HasArrived += OnArrivedECA;
    }

    public override void endStage()
    {
        base.endStage();
    }

    public override void reactToActionFinished()
    {
        base.reactToActionFinished();
    }

    public override void reactToActionStart()
    {
        base.reactToActionStart();
    }

    public override void reactToLabelUpdate()
    {
        base.reactToLabelUpdate();
    }

    public override void reactToStateUpdate()
    {
        base.reactToStateUpdate();
    }

    private void OnArrivedECA(object sender, EventArgs e)
    {
        endStage();
    }

}
