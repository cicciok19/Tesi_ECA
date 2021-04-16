using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform SitPoint;
    private bool OppositeDirection;

    public TurnStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint, bool oppDir) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
        OppositeDirection = oppDir;
        EcaAnimator.IsLookingAt += OnTurningFinished;
    }

    public override void StartStage()
    {
        EcaAnimator.LookAt(SitPoint, OppositeDirection);
        //endStage();
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public void OnTurningFinished(object sender, EventArgs e)
    {
        EndStage();
    }
}
