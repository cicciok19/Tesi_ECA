/* File Passenger C# implementation of class Passenger */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;


// global declaration end

public class Passenger : ECA
{

    private Train train;
    private TrainDoor doorSelected =   null;
    private ECAInteractableObject placeSelected =   null;
    private float maxRange;

    private BuyTicket buyTicket;

    public bool inQueue;
    public bool ticketTaken;
    public int ecaTurn;

    public Station station;

    protected override void Start()
    {
        base.Start();

        ecaTurn = -1;       //non è in coda

        station = GameObject.FindObjectOfType<Station>();
        station.TrainArriving += OnTrainArriving;

        train = station.train;
        inQueue = false;
        ticketTaken = false;

        buyTicket = new BuyTicket(this);
        buyTicket.TicketBought += OnTicketBought;

        //max distance from the destination (es. door when waiting, binary's empty)
        //maxRange = 5f;
        maxRange = 10f;


        //GoToPlatform();
        buyTicket.GoToVendingMachine();
    }

    protected override void CreateAnimator()
    {
        ecaAnimator = GetComponent<ECAAnimatorMxM>();
        if (ecaAnimator == null)
            ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();
        Assert.IsNotNull(ecaAnimator);

        ecaAnimator.Init();
    }

    private void GoToPlatform()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        Vector3 platformPosition = Randomize.GetRandomPosition(station.GetPlatform());
        GoToStage exitQueue = new GoToStage(station.GetVendingMachine().GetExitPoint());
        GoToStage reachPlatform = new GoToStage(platformPosition);
        TurnStage turnToTrain = new TurnStage(train.transform);
        stages.Add(exitQueue);
        stages.Add(reachPlatform);
        stages.Add(turnToTrain);

        ECAAction newAction = new ECAAction(this, stages);

        newAction.CompletedAction += OnPlatformReached;
        newAction.StartAction();
    }


    private void GoNearTrainDoor()
    {
        doorSelected = station.train.NearestDoor(transform.position);
        Utility.Log(name + " going to " + doorSelected);

        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goNear = new GoToStage(Randomize.GetRandomPosition(doorSelected.FrontDoor));
        TurnStage turn = new TurnStage(doorSelected.transform);
        stages.Add(goNear);
        stages.Add(turn);
        ECAAction newAction = new ECAAction(this, stages);
        newAction.StartAction();
    }


    private void EnterTrain()
    {
        foreach(var p in station.train.GetPassengerPlaces())
        {
            if (!p.Occupied)
            {
                placeSelected = p;
                p.Occupied = true;
                break;
            }
        }

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
                GoToStage reachHandle = new GoToStage(new Vector3(handle.transform.position.x, transform.position.y, handle.transform.position.z));
                TurnStage turnToHandle = new TurnStage(handle.transform);
                PickStage grab = new PickStage(handle.transform, .3f, true);
                stages.Add(reachHandle);
                stages.Add(turnToHandle);
                stages.Add(grab);
                break;
        }

        if(stages.Count != 0)
        {
            ECAAction newAction = new ECAAction(this, stages);
            newAction.StartAction();

            newAction.CompletedAction += PlaceReached;

            Utility.Log(this.gameObject + " is entering the train at door " + doorSelected.gameObject);
        }
    }



    private void OnDoorFree(object sender, EventArgs e)
    {
        EnterTrain();
    }


    private void OnTrainArriving(object sender, EventArgs e)
    {
        Utility.Log("Train is arriving");
    
        station.train.DoorsOpen += OnDoorsOpen;
        GoNearTrainDoor();
    }


    private void OnDoorsOpen(object sender, EventArgs e)
    {
        Utility.Log("Train is arrived, you can go in");

        EnterTrain();
    }


    private void OnPlatformReached(object sender, EventArgs e)
    {
        Utility.Log(" " + name);
        currentAction.CompletedAction -= OnPlatformReached;
    }

    private void OnTicketBought(object sender, EventArgs e)
    {
        ticketTaken = true;
        if (train.trainArrived)
        {
            GoNearTrainDoor();
            //devo settare qualhe booleano 
        }
            
        else if (train.doorsOpened)
            EnterTrain();
        else
            GoToPlatform();
    }
}
