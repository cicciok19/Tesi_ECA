using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StandUpStage : ECAActionStage
{
    Transform SitPoint;

    public StandUpStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
        //in questo caso l'ECA si deve alzare solo quando l'utente entra nel trigger, quindi startStage()
        //verrà chiamato solo in quel momento
        EcaAction.CompletedAction += ReactToActionFinished;
    }

    public override void StartStage()
    {
        base.StartStage();
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void ReactToActionFinished(object sender, EventArgs e)
    {
        EcaAnimator.MxM_clearRequiredTags();
        EcaAnimator.MxM_BeginEvent("StandUp", SitPoint);
        EcaAnimator.IK_setWeight(false);
    }
}
