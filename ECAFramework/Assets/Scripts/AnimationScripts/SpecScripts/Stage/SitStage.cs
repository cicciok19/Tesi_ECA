using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class SitStage : ECAActionStage
{
    private Transform SitPoint;
    public EventHandler StageFinished;

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
        EcaAnimator.MxM_SetTag("Sitting");
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
}
