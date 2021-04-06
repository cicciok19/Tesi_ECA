using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StandUpStage : ECAActionStage
{
    Transform SitPoint;

    public StandUpStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
        EcaAction.CompletedAction += reactToActionFinished;
    }

    private void OnEventComplete(object sender, EventArgs e)
    {
        endStage();
    }

    public override void startStage()
    {
        base.startStage();
    }

    public override void endStage()
    {
        base.endStage();
    }

    public override void reactToActionFinished(object sender, EventArgs e)
    {
        //base.reactToActionFinished();
        EcaAnimator.MxM_clearRequiredTags();
        EcaAnimator.MXM_BeginEventWithContact("StandUp", SitPoint);
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
