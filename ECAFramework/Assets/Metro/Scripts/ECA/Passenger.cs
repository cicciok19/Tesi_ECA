using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Passenger : ECA
{
    //global declaration start

    private ECAAction actualAction = null;
    private Train train;
    private TrainDoor doorSelected = null;
    private Binary binary;
    private PassengerPlace placeSelected = null;
    private float maxRange;

    //global declaration end

    protected override void Start()
    {
        base.Start();

        train = GameObject.FindObjectOfType<Train>();
        binary = GameObject.FindObjectOfType<Binary>();

        //max distance from the destination (es. door when waiting, binary's empty)
        //maxRange = 5f;
        maxRange = 10f;


        train.Arriving += OnTrainArriving;
        int maskIndex = NavMesh.GetAreaFromName("Binary");
        ecaAnimator.navMeshAgent.areaMask = (1 << maskIndex) | (1 << 0);
        
        GoSomewhere();
    }

    //ACTIONS START

    private void GoSomewhere()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goRandom = new GoToStage(binary.transform, maxRange, 3);
        stages.Add(goRandom);

        ECAAction newAction = new ECAAction(this, stages);
        actualAction = newAction;
        actualAction.StartAction();

        actualAction.CompletedAction += OnDestinationArrived;

    }

    private void GoNearTrainDoor()
    {
        GoToStage goNearTrainDoor = new GoToStage(train.GetTrainDoors()[0].transform, maxRange, 3);
        //goNearTrainDoor.StopDistance = 5f;
        ECAAction newAction = new ECAAction(this, goNearTrainDoor);
        actualAction = newAction;
        actualAction.StartAction();
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



    //ACTIONS END

    //DELEGATES START

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

    private void OnTrainArriving(object sender, EventArgs e)
    {
        Utility.Log("Train is arriving");
        train.DoorsOpen += OnDoorsOpen;

        actualAction.Abort();

        //DO SOMETHING
        GoNearTrainDoor();
    }

    private void OnDoorsOpen(object sender, EventArgs e)
    {
        Utility.Log("Train is arrived, you can go in");

        ecaAnimator.navMeshAgent.areaMask = (1 << 3) | (1 << 10) | (1 << 4) | (1 << 0);

        //DO SOMETHING
        EnterTrain();
    }


    private void OnDestinationArrived(object sender, EventArgs e)
    {
        actualAction.CompletedAction -= OnDestinationArrived;
        ecaAnimator.navMeshAgent.areaMask = 1 << NavMesh.GetAreaFromName("Binary");
        //GoSomewhere();
    }

    //DELEGATES END

}
