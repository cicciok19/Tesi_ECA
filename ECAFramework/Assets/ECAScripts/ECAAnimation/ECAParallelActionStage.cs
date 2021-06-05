using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAParallelActionStage : ECAActionStage
{
    public ECAActionStage[] parallelStages;
    private bool doNotAdvance;

    public ECAParallelActionStage(ECAActionStage[] stages)
    {
        parallelStages = stages;
        doNotAdvance = true;
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
        Debug.Log("HO FINITO CAZZO");
        LaunchStageFinished();
    }

    private void OnStageFinished(object sender, EventArgs e)
    {
        doNotAdvance = false;

        foreach (var s in parallelStages)
        {
            if (s.State != ActionState.Completed)
                doNotAdvance = true;
        }

        if(!doNotAdvance)
            EndStage();
    }
}
