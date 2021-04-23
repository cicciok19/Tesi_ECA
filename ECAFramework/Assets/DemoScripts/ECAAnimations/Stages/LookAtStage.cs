/* File LookAtStage C# implementation of class LookAtStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;


// global declaration end

public class LookAtStage : ECAActionStage
{

    protected Transform lookAtObject;


    public LookAtStage(Transform lookAtObject) : base()
    {
        this.lookAtObject = lookAtObject;
    }




    private void OnWaitComplete(object sender, EventArgs e)
    {
        EndStage();
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

}
