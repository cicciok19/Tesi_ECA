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

    protected VendingMachine vendingMachine;
    protected bool queuedECA =   false;
    protected GoToStage goingToMachine =   null;
    protected Passenger passenger;
    protected Station station;
    protected GrabbableObject ticket;
    protected GoToStage goingToLastPosition =  null;
    protected SelectTicket selectTicket;
    protected ManageQueue manageQueue;


    public BuyTicket(Passenger eca)
    :base(eca)
    {
        this.passenger = eca;
        station = eca.station;
        vendingMachine = this.passenger.station.GetVendingMachine(eca);
        ticket = vendingMachine.GetComponentInChildren<GrabbableObject>();
        canAbort = false;
    }




    private void SelectTicket()
    {
        selectTicket = new SelectTicket(passenger, vendingMachine);
        selectTicket.CompletedAction += TicketTaken;
        actions.Add(selectTicket);
    }


    private void TicketTaken(object sender, EventArgs e)
    {
        vendingMachine.EcasQueue--;     //questo chiama il GoAhead
    
        passenger.ticketTaken = true;
    
        if (TicketBought != null)
            TicketBought(this, EventArgs.Empty);
    }


    private void GetNewDestination(object sender, EventArgs e)
    {
        if(queuedECA)
    	    return;
    
        VendingMachine = station.GetVendingMachine();
    
        Utility.Log(passenger.name + " going in queue");
        if(goingToLastPosition.State == ActionState.Running)
        {
            goingToLastPosition.ChangeDestination(vendingMachine.GetLastPosition());
            goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(passenger), false);
        } 
        else
            goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(passenger));
    }




    protected void GoToVendingMachine()
    {
        goingToLastPosition = new GoToStage(vendingMachine.GetLastPosition());
        goingToMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(passenger));
    
        List<ECAActionStage> stages = new List<ECAActionStage>();
    
        stages.Add(goingToLastPosition);
        stages.Add(goingToMachine);
    
        ECAAction goToVendingMachine = new ECAAction(passenger, stages, false);
        actions.Add(goToVendingMachine);
    
        goToVendingMachine.CompletedAction += OnVendingMachineReached;
    
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
        manageQueue = new ManageQueue(passenger, vendingMachine, false);
        actions.Add(manageQueue);
    }


    protected void OnVendingMachineReached(object sender, EventArgs e)
    {
        Utility.Log(" arrived " + passenger.name);
    
        ECAAction goToVendingMachine = (ECAAction)sender;
        goToVendingMachine.CompletedAction -= OnVendingMachineReached;
        vendingMachine.QueueUpdated -= GetNewDestination;
    
        passenger.ecaTurn = vendingMachine.EcasQueue;
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
        private set
        {
            vendingMachine.QueueUpdated -= GetNewDestination;
            vendingMachine = value;
            vendingMachine.QueueUpdated += GetNewDestination;
    
            selectTicket.ChangeVendingMachine(vendingMachine);
            manageQueue.ChangeQueueableObject(vendingMachine);
        }
    }


}
