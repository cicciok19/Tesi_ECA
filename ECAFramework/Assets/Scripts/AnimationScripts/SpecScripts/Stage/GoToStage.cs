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
    }

    public override void endStage()
    {
        EcaAnimator.WaitArrival(Destination.position, 0.05f);
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
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
}
