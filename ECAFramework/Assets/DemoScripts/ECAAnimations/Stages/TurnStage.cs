using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform sitPoint;
    private bool turnToSit;

    public TurnStage(Transform sitPoint, bool turnToSit)
    {
        this.sitPoint = sitPoint;
        this.turnToSit = turnToSit;

    }

    public override void StartStage()
    {
        animator.IsLookingAt += OnTurningFinished;
        animator.LookAt(sitPoint, turnToSit);
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
