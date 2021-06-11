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
    private BuyTicket buyTicket;
    private BuyBottle buyBottle;
    public float maxDistanceReacheable = 5f;

    protected const float TAKE_TICKET_CHANCE = .5f;
    protected const float TAKE_DRINK_CHANCE = .5f;

    protected EnterTrain enterTrain;
    protected ReachPlatform reachPlatform;
    protected List<ECAAction> actionList =  new List<ECAAction>();
    protected int actionIdx =  0;

    public Station station;
    public int ecaTurn;
    public bool ticketTaken;
    public bool bottleTaken;



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
    
        ecaTurn = -1;       //non è in coda
        
    
        station = GameObject.FindObjectOfType<Station>();
    
        train = station.train;
        ticketTaken = false;
        bottleTaken = false;

        train.Arriving += OnTrainArriving;

        float chanceTicket = UnityEngine.Random.Range(0f, 1f);
        float chanceBottle = UnityEngine.Random.Range(0f, 1f);

        //evaluate probability of taking the ticket
        if (chanceTicket < TAKE_TICKET_CHANCE)
        {
            Utility.Log(name + " is taking ticket");
            buyTicket = new BuyTicket(this);

            buyTicket.CompletedAction += OnActionCompleted;
            actionList.Add(buyTicket);
        }
        else
            ticketTaken = true;

        if(chanceBottle < TAKE_DRINK_CHANCE)
        {
            Utility.Log(name + " is taking drink");
            buyBottle = new BuyBottle(this);

            buyBottle.CompletedAction += OnActionCompleted;
            actionList.Add(buyBottle);
        }
    	
        //a prescindere l'obiettivo finale è andare a prendere il treno
        GoToTakeTrain();
        
        actionList[0].StartAction();
    }


    protected void GoToTakeTrain()
    {
       reachPlatform = new ReachPlatform(this);
       reachPlatform.CompletedAction += OnActionCompleted;
       actionList.Add(reachPlatform);
    
       enterTrain = new EnterTrain(this);
       actionList.Add(enterTrain);
       enterTrain.CompletedAction += OnActionCompleted;
    }

    private void OnTrainArriving(object sender, EventArgs e)
    {
        ECAAction currentAction = actionList[actionIdx];
        if (currentAction != enterTrain && ticketTaken)
        {
            currentAction.Abort();
            Debug.Log(currentAction.ToString());
            actionList = null;
            enterTrain.StartAction();
        }
    }



}
