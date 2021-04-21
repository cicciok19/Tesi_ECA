using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class LookAtStage : ECAActionStage
{
    Transform lookAtObject;
    IKECA ikManager;

    public LookAtStage(Transform lookAtObject, IKECA ikManager)
    {
        this.lookAtObject = lookAtObject;
        this.ikManager = ikManager;
    }

    public override void EndStage()
    {
        ikManager.SetWeightTargetAimIK(ikManager.headIK, 0);
        base.EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();

        animator.WaitComplete += OnWaitComplete;
        ikManager.SetTargetAimIK(ikManager.headIK, lookAtObject);
        animator.Wait(6f);
    }

    private void OnWaitComplete(object sender, EventArgs e)
    {
        EndStage();
    }
}
