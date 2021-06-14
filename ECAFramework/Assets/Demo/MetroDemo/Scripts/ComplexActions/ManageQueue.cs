/* File ManageVendingMachineQueue C# implementation of class ManageVendingMachineQueue */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;

// global declaration end

public class ManageQueue : ECAAction
{

    protected QueueableObject queueableObject = null;
    protected Passenger eca;
    protected bool inQueue;

    public ManageQueue(Passenger eca,QueueableObject qo, bool canAbort = true)
    :base(eca)
    {
        this.queueableObject = qo;
        this.eca = eca;
        this.canAbort = canAbort;
    }

    protected void OnGoAhead(object sender, EventArgs e)
    {
        eca.ecaTurn--;
        ECAAction advance = new ECAAction(eca, new GoToStage(queueableObject.GetNextPassengerPosition(eca)));
        advance.StartAction();
    
    if(eca.ecaTurn == 0)
    {
        advance.CompletedAction += OnArrivedToMachine;
        queueableObject.GoAhead -= OnGoAhead;
    }
    
    }


    protected void OnArrivedToMachine(object sender, EventArgs e)
    {
        Utility.Log(eca.name + " completed queue");
        OnCompletedAction();
    }


    public override void StartAction()
    {
        inQueue = true;

        if(eca.ecaTurn == 0)
        {
            ECAAction newAction = new ECAAction(eca, new GoToStage(queueableObject.GetNextPassengerPosition(eca)));
            newAction.StartAction();
            newAction.CompletedAction += OnArrivedToMachine;
            //OnCompletedAction();
            return;
        }
    
        queueableObject.GoAhead += OnGoAhead;
    }

    public void ChangeQueueableObject(QueueableObject q)
    {
        if (inQueue)
        {
            queueableObject.GoAhead -= OnGoAhead;
            queueableObject = q;
            queueableObject.GoAhead += OnGoAhead;
        }
        else
            queueableObject = q;
    }


}
