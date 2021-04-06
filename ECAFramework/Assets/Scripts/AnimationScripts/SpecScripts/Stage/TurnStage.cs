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
        EcaAnimator.IsLookingAt += OnTurningFinished;
    }

    public override void startStage()
    {
        EcaAnimator.LookAt(SitPoint, true);
        //endStage();
    }

    public override void endStage()
    {
        base.endStage();
    }

    public override void reactToActionFinished(object sender, EventArgs e)
    {
        //base.reactToActionFinished();
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

    public void OnTurningFinished(object sender, EventArgs e)
    {
        endStage();
    }
}
