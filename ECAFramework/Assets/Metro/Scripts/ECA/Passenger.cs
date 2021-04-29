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
    private PassengerPlace placeSelected =   null;
    private float maxRange;

    protected Station station;


    private void GoToPlatform()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        Vector3 platformPosition = Randomize.GetRandomPosition(station.GetPlatform());
        GoToStage reachPlatform = new GoToStage(platformPosition);
        TurnStage turnToTrain = new TurnStage(train.transform);
        stages.Add(reachPlatform);
        stages.Add(turnToTrain);

        ECAAction newAction = new ECAAction(this, stages);

        newAction.CompletedAction += OnPlatformReached;
        newAction.StartAction();
    }


    private void GoNearTrainDoor()
    {
        doorSelected = station.train.NearestDoor(transform.position);
        Utility.Log("Going to " + doorSelected);
        ECAAction newAction = new ECAAction(this, new GoToStage(Randomize.GetRandomPosition(doorSelected.FrontDoor)));
        newAction.StartAction();
    }


    private void EnterTrain()
    {
        if (doorSelected.Occupied)
        {
            doorSelected.DoorFree += OnDoorFree;
            Utility.Log(this.gameObject + " tried to enter " + doorSelected.gameObject + " but someone is already entering");
        }
        else
        {
            doorSelected.DoorFree -= OnDoorFree;
            //doorSelected.Occupied = true;
    
            foreach(var p in station.train.GetPassengerPlaces())
            {
                if (!p.Occupied)
                {
                    placeSelected = p;
                    break;
                }
            }
    
            GoToStage enter = new GoToStage(placeSelected.transform);
            ECAAction newAction = new ECAAction(this, enter);

            //TODO: the next ECA should enter even before that this ECA will arrive at destination
            //newAction.CompletedAction += Entered;
            doorSelected.DoorFree += Entered;
            newAction.StartAction();
    
            Utility.Log(this.gameObject + " is entering the train at door " + doorSelected.gameObject);
        }
    }


    private void OnDoorFree(object sender, EventArgs e)
    {
        EnterTrain();
    }


    private void Entered(object sender, EventArgs e)
    {
        currentAction.CompletedAction -= Entered;
        doorSelected.Occupied = false;
        placeSelected.Occupied = true;
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
        Utility.Log("" + name);
        currentAction.CompletedAction -= OnPlatformReached;
    }




    protected override void Start()
    {
        base.Start();
    
        station = GameObject.FindObjectOfType<Station>();
        station.TrainArriving += OnTrainArriving;
    
        train = station.train;
    
        //max distance from the destination (es. door when waiting, binary's empty)
        //maxRange = 5f;
        maxRange = 10f;
    
    
        int maskIndex = NavMesh.GetAreaFromName("Binary");
        
        GoToPlatform();
    }

    protected override void CreateAnimator()
    {
        ecaAnimator = GetComponent<ECAAnimatorMxM>();
        if (ecaAnimator == null)
            ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();
        Assert.IsNotNull(ecaAnimator);

        ecaAnimator.Init();
    }


}
