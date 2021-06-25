using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class WaitStage : ECAActionStage
{
    float time;
    public WaitStage(float time) : base()
    {
        this.time = time;
    }

    public override void StartStage()
    {
        base.StartStage();
        WaitFor(time);
    }

    protected override void OnWaitCompleted()
    {
        Debug.Log("End Wait");
        base.OnWaitCompleted();
        EndStage();
    }

}
