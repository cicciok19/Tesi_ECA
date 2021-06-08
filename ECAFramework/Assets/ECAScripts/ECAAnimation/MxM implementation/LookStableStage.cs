using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class LookStableStage : ECAActionStage
{
    private Transform objToLook;

    public LookStableStage(Transform objToLook) : base()
    {
        this.objToLook = objToLook;
    }

    public override void StartStage()
    {
        base.StartStage();
        ikManager.SetTargetAimIK(ikManager.headIK, objToLook, .8f, 1.2f);
        EndStage();
    }
}
