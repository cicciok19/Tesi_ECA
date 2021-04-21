using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class WaitStage : ECAActionStage
{
    float time;
    public WaitStage(float time)
    {
        this.time = time;
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();
        animator.WaitComplete += OnWaitComplete;
        animator.Wait(time);
    }

    private void OnWaitComplete(object sender, EventArgs e)
    {
        EndStage();
    }

}
