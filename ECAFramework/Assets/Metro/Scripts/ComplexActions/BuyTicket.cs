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
    protected VendingMachine vendingMachine;
    protected bool queuedECA =  false;
    protected GoToStage goingToMachine =  null;


    public BuyTicket(Passenger eca)
    :base(eca)
    {
        this.eca = eca;
        vendingMachine = this.eca.station.GetVendingMachine(eca);
    }

    private void SelectTicket()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.RightHand);
        PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand);
        PickStage takeTicket = new PickStage(vendingMachine, 10, false, HandSide.RightHand);
        DropStage dropTicket = new DropStage(takeTicket);
        stages.Add(useScreen);
        stages.Add(pressButton);
        stages.Add(takeTicket);
        stages.Add(dropTicket);
        stages.Add(new GoToStage(vendingMachine.GetExitPoint()));
    
    
        ECAAction newAction = new ECAAction(eca, stages);
        newAction.CompletedAction += TicketTaken;
    
    
        actions.Add(newAction);
    }


    private void TicketTaken(object sender, EventArgs e)
    {
        vendingMachine.EcasQueue--;     //questo chiama il GoAhead
    
        if (TicketBought != null)
            TicketBought(this, EventArgs.Empty);
    }


    private void GetNewDestination(object sender, EventArgs e)
    {
        if(queuedECA)
    	    return;
    
        Utility.Log(eca.name + " going in queue");
        goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(eca));
        
    
    /*
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToVendingMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));
        Utility.Log(eca.name + " advance at " + vendingMachine.GetNextPassengerPosition(eca));
        TurnStage turn = new TurnStage(vendingMachine.transform);
        stages.Add(goToVendingMachine);
        stages.Add(turn);
    
        if(goingToMachine != null)
    	goingToMachine.CompletedAction -= EvaluateQueue;
    
        oldGoing = goingToMachine;
    
    
        goingToMachine = new ECAAction(eca, stages);
        action.Add(goingToMachine);    
    
    
        //newAction.CompletedAction += vendingMachine.PassengerArrived;
        newAction.CompletedAction += EvaluateQueue;
    */
    }




    protected void GoToVendingMachine()
    {
        GoToStage goingToMachine  = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));
        TurnStage turn = new TurnStage(vendingMachine.transform);
    
        List<ECAActionStage> stages = new List<ECAActionStage>();
    
        stages.Add(goingToMachine);
        stages.Add(turn);
    
    
        ECAAction goToVendingMachine = new ECAAction(eca, stages);
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
        actions.Add(new ManageQueue(eca, vendingMachine));
    }


    protected void OnVendingMachineReached(object sender, EventArgs e)
    {
        Utility.Log(" arrived " + eca.name);
    
        ECAAction goToVendingMachine = (ECAAction)sender;
        goToVendingMachine.CompletedAction -= OnVendingMachineReached;
        queuedECA = true;
    }




    public override void StartAction()
    {
        CreateActionList();
        base.StartAction();
    }


}
