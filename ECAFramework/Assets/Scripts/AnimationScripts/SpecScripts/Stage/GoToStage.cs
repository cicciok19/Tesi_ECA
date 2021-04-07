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

    public override void reactToActionFinished(object sender, EventArgs e)
    {
        //base.reactToActionFinished();
    }

    public override void reactToActionStart(object sender, EventArgs e)
    {
        base.reactToActionStart(sender, e);
    }

    public override void reactToLabelUpdate(object sender, EventArgs e)
    {
        base.reactToLabelUpdate(sender, e);
    }

    public override void reactToStateUpdate(object sender, EventArgs e)
    {
        base.reactToStateUpdate(sender, e);
    }

    private void OnArrivedECA(object sender, EventArgs e)
    {
        endStage();
    }

}
