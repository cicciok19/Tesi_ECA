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


    public ReachPlatform(Passenger eca)
    :base(eca)
    {
            this.eca = eca;
    	station = eca.station;
    }




    private void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
    
        Vector3 platformPosition = Randomize.GetRandomPosition(station.GetPlatform());
        GoToStage reachPlatform = new GoToStage(platformPosition);
        TurnStage turnToTrain = new TurnStage(station.train.transform);
        stages.Add(reachPlatform);
        stages.Add(turnToTrain);
    
        SetStages(stages);
    }




    public override void StartAction()
    {
      SetupAction();
      base.StartAction();
    }


}