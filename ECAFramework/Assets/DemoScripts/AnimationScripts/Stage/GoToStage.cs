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

    public override void StartStage()
    {
        base.StartStage();
        EcaAnimator.GoTo(Destination.position, 0.05f);
        EcaAnimator.HasArrived += OnArrivedECA;
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    private void OnArrivedECA(object sender, EventArgs e)
    {
        EndStage();
    }

}
