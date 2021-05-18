using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class BuyTicket
{
    Passenger eca;
    VendingMachine vendingMachine;

    public event EventHandler TicketBought;
    public event EventHandler Arrived;

    public BuyTicket(Passenger eca)
    {
        this.eca = eca;
        vendingMachine = this.eca.station.GetVendingMachine();
    }

    public void GoToVendingMachine()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToVendingMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));
        TurnStage turn = new TurnStage(vendingMachine.transform);
        stages.Add(goToVendingMachine);
        stages.Add(turn);
        ECAAction newAction = new ECAAction(eca, stages);
        newAction.StartAction();

        vendingMachine.QueueUpdated += GetNewDestination;
        newAction.CompletedAction += EvaluateQueue;
    }

    private void EvaluateQueue(object sender, EventArgs e)
    {
        //se l'eca non era ancora in fila
        if (!eca.inQueue)
        {
            eca.inQueue = true;

            //se la macchinetta è libera, il suo turno è il primo
            if (eca.ecaTurn == 0)
            {
                vendingMachine.QueueUpdated -= GetNewDestination;
                SelectTicket();
            }
            //altrimenti devo vedere quanto è lunga la fila e settarlo di conseguenza
            else
            {
                Utility.Log(eca.name + " waiting in queue");
                vendingMachine.GoAhead += GetNewDestination;
            }
        }
        else
        {
            eca.ecaTurn--;
            if (eca.ecaTurn == 0)
            {
                vendingMachine.GoAhead -= GetNewDestination;
                SelectTicket();
            }
            else
            {
                ECAAction newAction = new ECAAction(eca, new GoToStage(vendingMachine.GetNextPassengerPosition(eca)));
                newAction.StartAction();
            } 
        }
    }

    private void SelectTicket()
    {
        Utility.Log(eca.name + " selecting ticket");

        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToDestination = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));
        PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.RightHand);
        PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand);
        PickStage takeTicket = new PickStage(vendingMachine.GetTicket(), 10, false, HandSide.RightHand);
        DropStage dropTicket = new DropStage(takeTicket);
        stages.Add(goToDestination);
        stages.Add(useScreen);
        stages.Add(pressButton);
        stages.Add(takeTicket);
        stages.Add(dropTicket);

        ECAAction newAction = new ECAAction(eca, stages);
        newAction.StartAction();

        newAction.CompletedAction += TicketTaken;
    }

    private void TicketTaken(object sender, EventArgs e)
    {
        vendingMachine.EcasQueue--;     //questo chiama il GoAhead

        if (TicketBought != null)
            TicketBought(this, EventArgs.Empty);
    }

    private void GetNewDestination(object sender, EventArgs e)
    {
        Utility.Log(eca.name + " going in queue");

        vendingMachine.QueueUpdated -= GetNewDestination;

        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToVendingMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));
        Utility.Log(eca.name + " advance at " + vendingMachine.GetNextPassengerPosition(eca));
        TurnStage turn = new TurnStage(vendingMachine.transform);
        stages.Add(goToVendingMachine);
        stages.Add(turn);
        ECAAction newAction = new ECAAction(eca, stages);
        newAction.StartAction();

        //newAction.CompletedAction += vendingMachine.PassengerArrived;
        newAction.CompletedAction += EvaluateQueue;
    }

    public void Evaluate()
    {
        if(eca.ecaTurn == 0)
        {
            SelectTicket();
        }
    }
}
