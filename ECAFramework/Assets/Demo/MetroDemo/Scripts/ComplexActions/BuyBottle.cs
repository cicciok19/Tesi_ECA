using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class BuyBottle : ECACompositeAction
{
    public event EventHandler BottleBought;

    private Distributor distributor;
    private Passenger passenger;
    private Station station;
    protected bool queuedECA = false;

    protected GoToStage goingToDistributor = null;
    protected GoToStage goingToLastPosition = null;
    protected SelectBottle selectBottle;
    protected ManageQueue manageQueue;



    public BuyBottle(Passenger eca) : base(eca)
    {
        this.passenger = eca;
        station = eca.station;
        distributor = station.GetDistributor(eca);
        //ticket = vendingMachine.GetComponentInChildren<GrabbableObject>();
    }

    private void SelectDrink()
    {
        selectBottle = new SelectBottle(passenger, distributor);
        selectBottle.CompletedAction += BottleTaken;
        actions.Add(selectBottle);
    }

    private void BottleTaken(object sender, EventArgs e)
    {
        distributor.EcasQueue--;     //questo chiama il GoAhead

        if (BottleBought != null)
            BottleBought(this, EventArgs.Empty);
    }

    protected void GoToDistributor()
    {
        goingToLastPosition = new GoToStage(distributor.GetLastPosition());
        goingToDistributor = new GoToStage(distributor.GetNextPassengerPosition(passenger));

        List<ECAActionStage> stages = new List<ECAActionStage>();

        stages.Add(goingToLastPosition);
        stages.Add(goingToDistributor);

        ECAAction goToVendingMachine = new ECAAction(passenger, stages);
        actions.Add(goToVendingMachine);

        goToVendingMachine.CompletedAction += OnDistributorReached;

        distributor.QueueUpdated += GetNewDestination;
    }

    protected void CompleteQueueing()
    {
        manageQueue = new ManageQueue(passenger, distributor);  
        actions.Add(manageQueue);
    }

    private void GetNewDestination(object sender, EventArgs e)
    {
        if (queuedECA)
            return;

        Distributor = station.GetDistributor(passenger);

        Utility.Log(passenger.name + " going in queue");
        if (goingToLastPosition.State == ActionState.Running)
        {
            goingToLastPosition.ChangeDestination(distributor.GetLastPosition());
            goingToDistributor.ChangeDestination(distributor.GetNextPassengerPosition(passenger), false);
        }
        else
            goingToDistributor.ChangeDestination(distributor.GetNextPassengerPosition(passenger));
    }

    protected void OnDistributorReached(object sender, EventArgs e)
    {
        Utility.Log(" arrived " + passenger.name);

        ECAAction goToDistributor = (ECAAction)sender;
        goToDistributor.CompletedAction -= OnDistributorReached;
        distributor.QueueUpdated -= GetNewDestination;

        passenger.ecaTurn = distributor.EcasQueue;
        distributor.EcasQueue++;

        queuedECA = true;
    }

    protected override void CreateActionList()
    {
        base.CreateActionList();
        GoToDistributor();
        CompleteQueueing();
        SelectDrink();
    }

    public Distributor Distributor
    {
        get => distributor;
        private set
        {
            distributor.QueueUpdated -= GetNewDestination;
            distributor = value;
            distributor.QueueUpdated += GetNewDestination;

            selectBottle.ChangeDistributor(distributor);
            manageQueue.ChangeQueueableObject(distributor);
        }
    }
}
