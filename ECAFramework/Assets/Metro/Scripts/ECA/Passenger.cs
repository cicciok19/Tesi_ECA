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

    public bool stopped = false;
    public event EventHandler Stationary;


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
        doorSelected.DoorFree -= Entered;
        doorSelected.Occupied = false;
        placeSelected.Occupied = true;

        currentAction.CompletedAction += PlaceReached;
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

    private void OnTriggerEnter(Collider other)
    {
        Passenger otherEca;
        
        if (other.TryGetComponent<Passenger>(out otherEca))
        {
            if (!otherEca.stopped)
            {
                stopped = true;
                currentAction.Pause();
                otherEca.Stationary += OtherEcaIsStationary;
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        Passenger otherEca;

        if (other.TryGetComponent<Passenger>(out otherEca))
        {
                stopped = false;
                otherEca.Stationary -= OtherEcaIsStationary;
                currentAction.Resume();
        }
    }

    private void PlaceReached(object sender, EventArgs e)
    {
        gameObject.GetComponent<NavMeshAgent>().enabled = false;
        gameObject.AddComponent<NavMeshObstacle>().carving = true;

        if (Stationary != null)
            Stationary(this, EventArgs.Empty);
    }

    private void OtherEcaIsStationary(object sender, EventArgs e)
    {
        stopped = false;
        //mi devo disiscrivere dall'evento dell'altro eca Stationary
        //sender.Stationary -= OtherEcaIsStationary;
        currentAction.Resume();
    }

}
