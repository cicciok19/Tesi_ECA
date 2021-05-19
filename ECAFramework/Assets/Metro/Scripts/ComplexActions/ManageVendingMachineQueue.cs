/* File ManageVendingMachineQueue C# implementation of class ManageVendingMachineQueue */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;

// global declaration end

public class ManageVendingMachineQueue : ECAAction
{

    protected VendingMachine vendingMachine = null;
    protected Passenger eca;


    public ManageVendingMachineQueue(Passenger eca,VendingMachine vm)
    :base(eca)
    {
        this.vendingMachine = vm;
        this.eca = eca;
    }




    protected void OnGoAhead(object sender, EventArgs e)
    {
        eca.ecaTurn--;
        ECAAction advance = new ECAAction(eca, new GoToStage(vendingMachine.GetNextPassengerPosition(eca)));
        advance.StartAction();
    
      if(eca.ecaTurn == 0)
      {
    	advance.CompletedAction += OnArrivedToMachine;
       	vendingMachine.GoAhead -= OnGoAhead;
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
    
       vendingMachine.GoAhead += OnGoAhead;
    }


}
