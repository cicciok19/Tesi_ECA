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
        //in questo caso l'ECA si deve alzare solo quando l'utente entra nel trigger, quindi startStage()
        //verrà chiamato solo in quel momento
        EcaAction.CompletedAction += reactToActionFinished;
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
        EcaAnimator.MxM_clearRequiredTags();
        EcaAnimator.MXM_BeginEventWithContact("StandUp", SitPoint);
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



}
