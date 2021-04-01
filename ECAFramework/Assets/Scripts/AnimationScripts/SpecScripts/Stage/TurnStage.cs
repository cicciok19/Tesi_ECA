using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform SitPoint;

    public TurnStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
    }

    public override void startStage()
    {
        EcaAnimator.LookAt(SitPoint, true);
    }

    public override void endStage()
    {
        base.endStage();
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
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
