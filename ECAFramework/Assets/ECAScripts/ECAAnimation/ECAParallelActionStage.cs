using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAParallelActionStage : ECAActionStage
{
    public ECAActionStage[] parallelStages;
    private int counter;
    private readonly object counterLock = new object();

    public ECAParallelActionStage(ECAActionStage[] stages)
    {
        parallelStages = stages;
    }

    public override void AbortStage()
    {
        foreach (var s in parallelStages)
            s.AbortStage();
        base.AbortStage();
    }

    public override void PauseStage()
    {
        base.PauseStage();
        foreach (var s in parallelStages)
            s.PauseStage();
    }

    public override void ResumeStage()
    {
        base.ResumeStage();
        foreach (var s in parallelStages)
            s.ResumeStage();
    }

    public override void StartStage()
    {
        base.StartStage();
        counter = 0;
        foreach (var s in parallelStages)
        {
            s.Animator = animator;
            s.StartStage();
            s.StageFinished += OnStageFinished;
        }
    }

    public override void EndStage()
    {
        State = ActionState.Completed;
        animator.currentStage = null;
        LaunchStageFinished();
    }

    private void OnStageFinished(object sender, EventArgs e)
    {
        lock (counterLock)
        {
            counter++;

            if ((counter == parallelStages.Length))
                EndStage();
        }
    }
}
