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


    public ManageQueue(Passenger eca,QueueableObject qo)
    :base(eca)
    {
        this.queueableObject = qo;
        this.eca = eca;
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
        OnCompletedAction();
    }




    public override void StartAction()
    {
       if(eca.ecaTurn == 0)
       {
            OnCompletedAction();
            return;
       }
    
       queueableObject.GoAhead += OnGoAhead;
    }

    public void ChangeVendingMachine(QueueableObject q)
    {
        queueableObject = q;
    }


}
