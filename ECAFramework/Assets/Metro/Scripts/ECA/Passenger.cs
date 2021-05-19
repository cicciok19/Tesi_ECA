/* File Passenger C# implementation of class Passenger */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;


// global declaration end

public class Passenger : ECA
{

    private Train train;
    private float maxRange;
    private BuyTicket buyTicket;

    protected const float TAKE_TICKET_CHANCE =   0.2f;
    protected EnterTrain enterTrain;
    protected ReachPlatform reachPlatform;
    protected List<ECAAction> actionList =  new List<ECAAction>();
    protected int actionIdx =  0;

    public Station station;
    public int ecaTurn;
    public bool ticketTaken;
    public bool inQueue;


    private void OnActionCompleted(object sender, EventArgs e)
    {
      actionIdx++;
      if(actionIdx < actionList.Count)
    	actionList[actionIdx].StartAction();
    }




    protected override void CreateAnimator()
    {
        ecaAnimator = GetComponent<ECAAnimatorMxM>();
        if (ecaAnimator == null)
            ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();
        Assert.IsNotNull(ecaAnimator);
    
        ecaAnimator.Init();
    }


    protected override void Start()
    {
        base.Start();
    
        ecaTurn = -1;       //non � in coda
    
        station = GameObject.FindObjectOfType<Station>();
        //station.TrainArriving += OnTrainArriving;
    
        train = station.train;
        inQueue = false;
        ticketTaken = false;
    
        float chance = UnityEngine.Random.Range(0f, 1f);
    
        if(chance < TAKE_TICKET_CHANCE)
        {
            Utility.Log(name + " is taking ticket");
        	buyTicket = new BuyTicket(this);
    
    	buyTicket.CompletedAction += OnActionCompleted;
    	actionList.Add(buyTicket);
    
    	GoToTakeTrain();
        }
        else
        {
    	GoToTakeTrain();
        }
        
    
    
        //max distance from the destination (es. door when waiting, binary's empty)
        //maxRange = 5f;
        maxRange = 10f;
    
        actionList[0].StartAction();
    
        //GoToPlatform();
        // buyTicket.GoToVendingMachine();
    }


    protected void GoToTakeTrain()
    {
       ReachPlatform reachPlatform = new ReachPlatform(this);
       reachPlatform.CompletedAction += OnActionCompleted;
       actionList.Add(reachPlatform);
    
       EnterTrain enterTrain = new EnterTrain(this);
       actionList.Add(enterTrain);
       enterTrain.CompletedAction += OnActionCompleted;
    }


}
