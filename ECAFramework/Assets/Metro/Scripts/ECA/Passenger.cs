using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Passenger : ECA
{
    private ECAAction actualAction = null;
    private Train train;
    private TrainDoor doorSelected = null;
    private Binary binary;
    private PassengerPlace placeSelected = null;
    private float maxRange;

    public override void Init()
    {
        base.Init();
    }

    protected override void Awake()
    {
        base.Awake();
    }

    protected override void Start()
    {
        base.Start();

        train = GameObject.FindObjectOfType<Train>();
        binary = GameObject.FindObjectOfType<Binary>();
        
        //max distance from the destination (es. door when waiting)
        maxRange = 5f;

        train.Arriving += OnTrainArriving;
        //ecaAnimator.navMeshAgent.areaMask = NavMesh.GetAreaFromName("Binary");
        
        GoSomewhere();
    }

    public override void DetachEvent(string handlerName, EventArgs args)
    {
        base.DetachEvent(handlerName, args);
    }

    private void GoSomewhere()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goRandom = new GoToStage(binary.transform, maxRange);
        WaitStage wait = new WaitStage(3f);
        stages.Add(goRandom);
        stages.Add(wait);

        ECAAction newAction = new ECAAction(this, stages);
        actualAction = newAction;
        actualAction.StartAction();

        actualAction.CompletedAction += OnDestinationArrived;

    }

    private void OnDestinationArrived(object sender, EventArgs e)
    {
        actualAction.CompletedAction -= OnDestinationArrived;
        //GoSomewhere();
    }

    private void OnTrainArriving(object sender, EventArgs e)
    {
        Utility.Log("Train is arriving");
        train.DoorsOpen += OnDoorsOpen;

        //actualAction.CurrentStage.AbortStage();
        actualAction.Abort();

        //DO SOMETHING
        GoToStage goNearTrainDoor = new GoToStage(train.GetTrainDoors()[0].transform);
        goNearTrainDoor.StopDistance = 5f;
        ECAAction newAction = new ECAAction(this, goNearTrainDoor);
        actualAction = newAction;
        actualAction.StartAction();
    }

    private void OnDoorsOpen(object sender, EventArgs e)
    {
        Utility.Log("Train is arrived, you can go in");

        //DO SOMETHING
        EnterTrain();
    }

    private void EnterTrain()
    {
        doorSelected = train.GetTrainDoors()[0];

        if (doorSelected.Occupied)
        {
            doorSelected.DoorFree += OnDoorFree;
            Utility.Log(this.gameObject + " tried to enter " + doorSelected.gameObject + " but someone is already entering");
        }
        else
        {
            doorSelected.DoorFree -= OnDoorFree;
            doorSelected.Occupied = true;
            foreach(var p in train.GetPassengerPlaces())
            {
                if (!p.Occupied)
                {
                    placeSelected = p;
                    break;
                }
            }
            GoToStage enter = new GoToStage(placeSelected.transform);
            ECAAction newAction = new ECAAction(this, enter);
            actualAction = newAction;

            //TODO: the next ECA should enter even before that this ECA will arrive at destination
            actualAction.CompletedAction += Entered;
            actualAction.StartAction();

            Utility.Log(this.gameObject + " is entering the train at door " + doorSelected.gameObject);
        }
    }

    private void OnDoorFree(object sender, EventArgs e)
    {
        EnterTrain();
    }

    private void Entered(object sender, EventArgs e)
    {
        actualAction.CompletedAction -= Entered;
        doorSelected.Occupied = false;
        placeSelected.Occupied = true;
    }

}
