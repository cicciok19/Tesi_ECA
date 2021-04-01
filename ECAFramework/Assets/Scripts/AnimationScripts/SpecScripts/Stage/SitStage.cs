using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class SitStage : ECAActionStage
{
    private Transform SitPoint;

    public SitStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
    }

    public override void startStage()
    {
        base.startStage();
        EcaAnimator.MXM_BeginEventWithContact("SitDown", SitPoint);
        endStage();
    }

    public override void endStage()
    {
        base.endStage();
        EcaAnimator.MxM_SetTag("Sitting");
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
