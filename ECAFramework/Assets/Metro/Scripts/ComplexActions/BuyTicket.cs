using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class BuyTicket
{
    Passenger eca;
    VendingMachine vendingMachine;

    public event EventHandler TicketBought;

    public BuyTicket(Passenger eca)
    {
        //devo ricordarmi di inizializzare AllStages e il currentIdx altrimenti non funzinoa nulla
        this.eca = eca;
        vendingMachine = this.eca.station.GetVendingMachine();
    }

    public void GoToVendingMachine()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToVendingMachine = new GoToStage(vendingMachine.GetNextPassengerPosition());
        TurnStage turn = new TurnStage(vendingMachine.transform);
        stages.Add(goToVendingMachine);
        stages.Add(turn);
        ECAAction newAction = new ECAAction(eca, stages);
        newAction.StartAction();

        newAction.CompletedAction += EvaluateQueue;
    }

    private void EvaluateQueue(object sender, EventArgs e)
    {
        //se l'eca non era ancora in fila
        if (!eca.inQueue)
        {
            eca.inQueue = true;

            //se la macchinetta è libera, il suo turno è il primo
            if (vendingMachine.EcasQueue == 0)
            {
                eca.ecaTurn = 1;
                vendingMachine.EcasQueue++;
                SelectTicket();
            }
            //altrimenti devo vedere quanto è lunga la fila e settarlo di conseguenza
            else
            {
                eca.ecaTurn = vendingMachine.EcasQueue + 1;
                vendingMachine.EcasQueue++;
                vendingMachine.GoAhead += EvaluateQueue;
            }
        }
        else
        {
            eca.ecaTurn--;
            if (eca.ecaTurn == 1)
            {
                SelectTicket();
                vendingMachine.GoAhead -= EvaluateQueue;
            }
            else
            {
                ECAAction newAction = new ECAAction(eca, new GoToStage(vendingMachine.GetNextPassengerPosition()));
                newAction.StartAction();
            } 
        }
    }

    private void SelectTicket()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        //PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.LeftHand, 3);
        //PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand, 1);
        PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.RightHand, 3);
        PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand);
        PickStage takeTicket = new PickStage(vendingMachine.GetTicket(), 10, false, HandSide.RightHand);
        DropStage dropTicket = new DropStage(takeTicket);           //non va bene...
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


}
