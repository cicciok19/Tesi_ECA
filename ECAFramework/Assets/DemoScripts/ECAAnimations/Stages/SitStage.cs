using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class SitStage : ECAActionStage
{
    private Transform SitPoint;
    public EventHandler StageFinished;

    public SitStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
    }

    public override void StartStage()
    {
        base.StartStage();
        EcaAnimator.MxM_BeginEvent("SitDown", SitPoint);
        EcaAnimator.IK_setWeight(true);
        EndStage();
    }

    public override void EndStage()
    {
        EcaAnimator.MxM_SetTag("Sitting");
        base.EndStage();
    }

}
