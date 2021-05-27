/* File BuyTicket C# implementation of class BuyTicket */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;


// global declaration end

public class BuyTicket : ECACompositeAction
{
    public event EventHandler TicketBought;
    public event EventHandler Arrived;

    protected Passenger eca;
    protected Station station;
    protected VendingMachine vendingMachine;
    protected GrabbableObject ticket;
    protected bool queuedECA =  false;
    protected GoToStage goingToMachine =  null;
    protected GoToStage goingToLastPosition = null;
    protected SelectProduct selectTicket;
    protected ManageQueue manageQueue;


    public BuyTicket(Passenger eca)
    :base(eca)
    {
        this.eca = eca;
        station = eca.station;
        vendingMachine = this.eca.station.GetVendingMachine(eca);
        ticket = vendingMachine.GetComponentInChildren<GrabbableObject>();
    }

    private void SelectTicket()
    {
        selectTicket = new SelectProduct(eca, vendingMachine);
        selectTicket.CompletedAction += TicketTaken;
        actions.Add(selectTicket);
    }


    private void TicketTaken(object sender, EventArgs e)
    {
        vendingMachine.EcasQueue--;     //questo chiama il GoAhead

        eca.ticketTaken = true;

        if (TicketBought != null)
            TicketBought(this, EventArgs.Empty);
    }


    private void GetNewDestination(object sender, EventArgs e)
    {
        if(queuedECA)
    	    return;

        VendingMachine = station.GetVendingMachine();

        Utility.Log(eca.name + " going in queue");
        if(goingToLastPosition.State == ActionState.Running)
        {
            goingToLastPosition.ChangeDestination(vendingMachine.GetLastPosition());
            goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(eca), false);
        } 
        else
            goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(eca));
    }




    protected void GoToVendingMachine()
    {
        goingToLastPosition = new GoToStage(vendingMachine.GetLastPosition(), vendingMachine.transform);
        goingToMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(eca), vendingMachine.transform);

        List<ECAActionStage> stages = new List<ECAActionStage>();

        stages.Add(goingToLastPosition);
        stages.Add(goingToMachine);
    
        ECAAction goToVendingMachine = new ECAAction(eca, stages);
        actions.Add(goToVendingMachine);

        goToVendingMachine.CompletedAction += OnVendingMachineReached;
        //goToVendingMachine.CompletedAction += OnLastPositionReached;

        vendingMachine.QueueUpdated += GetNewDestination;
    }

    protected override void CreateActionList()
    {
        GoToVendingMachine();
        CompleteQueueing();
        SelectTicket();
    }


    protected void CompleteQueueing()
    {
        manageQueue = new ManageQueue(eca, vendingMachine);
        actions.Add(manageQueue);
    }


    protected void OnVendingMachineReached(object sender, EventArgs e)
    {
        Utility.Log(" arrived " + eca.name);
    
        ECAAction goToVendingMachine = (ECAAction)sender;
        goToVendingMachine.CompletedAction -= OnVendingMachineReached;
        vendingMachine.QueueUpdated -= GetNewDestination;

        eca.ecaTurn = vendingMachine.EcasQueue;
        vendingMachine.EcasQueue++;

        queuedECA = true;
    }




    public override void StartAction()
    {
        CreateActionList();
        base.StartAction();
    }

    public VendingMachine VendingMachine
    {
        get => vendingMachine;
        set
        {
            vendingMachine.QueueUpdated -= GetNewDestination;
            vendingMachine = value;
            vendingMachine.QueueUpdated += GetNewDestination;

            selectTicket.ChangeVendingMachine(vendingMachine);
            manageQueue.ChangeVendingMachine(vendingMachine);
        }
    }


}
