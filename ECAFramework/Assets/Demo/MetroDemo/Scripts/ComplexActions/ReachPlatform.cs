/* File ReachPlatform C# implementation of class ReachPlatform */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;


// global declaration end

public class ReachPlatform : ECAAction
{
    protected Passenger eca;
    protected Station station;
    protected const float CHANGE_IDLE_CHANCE = .6f;

    public ReachPlatform(Passenger eca)
    :base(eca)
    {
        this.eca = eca;
    	station = eca.station;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
    
        Vector3 platformPosition = Randomize.GetRandomPosition(station.GetPlatform());
        GoToStage reachPlatform = new GoToStage(platformPosition);
        reachPlatform.StageFinished += OnReachPlatformFinished;
        TurnStage turnToTrain = new TurnStage(station.train.transform);
        stages.Add(reachPlatform);
        //stages.Add(turnToTrain);
    
        SetStages(stages);
    }

    private void OnReachPlatformFinished(object sender, EventArgs e)
    {
        float chanceChangeIdle = UnityEngine.Random.Range(0f, 1f);

        if(chanceChangeIdle < CHANGE_IDLE_CHANCE)
            eca.MxMecaAnimator.m_animator.SetRequiredTag("Idle");
    }
}
