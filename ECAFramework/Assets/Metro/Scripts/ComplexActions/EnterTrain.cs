/* File EnterTrain C# implementation of class EnterTrain */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;
using MxM;


// global declaration end

public class EnterTrain : ECACompositeAction
{

    private TrainDoor doorSelected = null;

    protected Passenger eca;
    protected Train train;
    protected ECAAction goToDoor;
    protected ECAAction enterTrain;
    protected ECAAnimatorMxM ecaAnimatorMxM;

    public EnterTrain(Passenger eca)
    :base(eca)
    {
        this.eca = eca;
    	train = eca.station.train;

        //train.DoorsOpen += OnDoorsOpen;
    }




    private void GoNearTrainDoor()
    {
        doorSelected = train.NearestDoor(eca.transform.position);
        Utility.Log(eca.name + " going to " + doorSelected);
    
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goNear = new GoToStage(Randomize.GetRandomPosition(doorSelected.FrontDoor));
        TurnStage turn = new TurnStage(doorSelected.transform);
        stages.Add(goNear);
        //stages.Add(turn);
    
        goToDoor = new ECAAction(eca, stages);
        actions.Add(goToDoor);
    }


    private void Enter()
    {
        ECAInteractableObject placeSelected = null;

        foreach (var p in train.GetPassengerPlaces())
        {
            if (!p.Occupied)
            {
                placeSelected = p;
                p.Occupied = true;
                break;
            }
        }

        Assert.IsNotNull(placeSelected);
        List<ECAActionStage> stages = new List<ECAActionStage>();
    
    
        switch (placeSelected.GetType().ToString())
        {
            case "SittableObject":
                var chair = (SittableObject)placeSelected;
                GoToStage reachChair = new GoToStage(chair.GetDestination());
                TurnStage turn = new TurnStage(chair.GetSitPoint(), true);
                SitStage sit = new SitStage(chair);
                stages.Add(reachChair);
                stages.Add(turn);
                stages.Add(sit);
                break;
    
            case "GrabbableObject":
                var handle = (GrabbableObject)placeSelected;
                GoToStage reachHandle = new GoToStage(new Vector3(handle.transform.position.x, eca.transform.position.y, handle.transform.position.z));
                TurnStage turnToHandle = new TurnStage(handle.transform);
                PickStage grab = new PickStage(handle.transform, 10f, true);
                stages.Add(reachHandle);
                //stages.Add(turnToHandle);
                stages.Add(grab);
                break;
        }
    
        if(stages.Count != 0)
        {
            enterTrain = new ECAAction(eca, stages);
    	    actions.Add(enterTrain);
        }
    }


    private void OnDoorsOpen(object sender, EventArgs e)
    {
        if (ActualAction != null)
        {
            if (ActualAction == goToDoor && ActualAction.State != ActionState.Completed)
            {
                CompleteAndAdvance();
            }
        }
    }




    protected override void OnActualActionCompleted(object sender, EventArgs e)
    {
        if(train.DoorsOpened)
    	    CompleteAndAdvance();
    }


    protected void SetupAction()
    {
        ecaAnimatorMxM = (ECAAnimatorMxM)eca.ecaAnimator;
        ecaAnimatorMxM.m_animator.RemoveRequiredTag("Run");
        eca.GetComponent<MxMTrajectoryGenerator_BasicAI>().MaxSpeed = 2;

        if (train.DoorsOpened)
            Enter();
        else
        {
            GoNearTrainDoor();
            Enter();
        }
    }




    public override void StartAction()
    {
      train.DoorsOpen += OnDoorsOpen;
      SetupAction();
      base.StartAction();
    }


}
