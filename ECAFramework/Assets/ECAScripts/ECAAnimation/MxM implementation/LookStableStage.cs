using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class LookStableStage : ECAActionStage
{
    private Transform objToLook;
    private float weight;

    public LookStableStage(Transform objToLook, float weight = .8f) : base()
    {
        this.objToLook = objToLook;
        this.weight = weight;
    }

    public override void StartStage()
    {
        base.StartStage();
        if (weight != 0 && ikManager.headIK.solver.target != objToLook)
            ikManager.SetTargetAimIK(ikManager.headIK, objToLook, weight, 1.2f);
        else
            ikManager.SetWeightTargetAimIK(ikManager.headIK, weight);

        WaitFor(.1f);
        //EndStage();
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
        EndStage();
    }
}
