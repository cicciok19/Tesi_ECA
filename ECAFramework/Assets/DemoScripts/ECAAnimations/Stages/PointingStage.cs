using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PointingStage : ECAActionStage
{
    Transform Target;
    IKECA IkManager;

    public PointingStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform target) : base(ecaAction, ecaAnimator)
    {
        Target = target;
        IkManager = ecaAnimator.gameObject.GetComponent<IKECA>();
        IkManager.SetTargetAimIK(IkManager.LeftHandIK, target, 0.1f);

        TryToSitIK.StopPointing += OnStopPointing;
    }

    public override void EndStage()
    {
        base.EndStage();
        IkManager.SetWeightTargetAimIK(IkManager.LeftHandIK, 0);
    }

    public override void StartStage()
    {
        base.StartStage();
        IkManager.SetWeightTargetAimIK(IkManager.LeftHandIK, 1);
    }

    private void OnStopPointing(object sender, EventArgs e)
    {
        EndStage();
    }

}
