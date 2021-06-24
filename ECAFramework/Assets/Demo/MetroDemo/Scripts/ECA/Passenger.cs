/* File Passenger C# implementation of class Passenger */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;
using MxM;


// global declaration end

public class Passenger : ECA
{

    private Train train;
    private BuyTicket buyTicket;
    private BuyBottle buyBottle;
    public float maxDistanceReacheable = 5f;

    [SerializeField] protected const float TAKE_TICKET_CHANCE = .2f;
    [SerializeField] protected const float TAKE_DRINK_CHANCE = .2f;
    [SerializeField] protected const float TAKE_TRAIN_CHANCE = 1f;

    protected EnterTrain enterTrain;
    protected ReachPlatform reachPlatform;

    public ECAAnimatorMxM MxMecaAnimator;

    public Station station;
    public int ecaTurn;
    public bool ticketTaken;
    public bool bottleTaken;


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
        MxMecaAnimator = GetComponent<ECAAnimatorMxM>();

        train = station.train;
        ticketTaken = false;
        bottleTaken = false;

        //train.Arriving += OnTrainArriving;
        train.DoorsOpen += OnTrainArriving;

        float chanceTicket = UnityEngine.Random.Range(0f, 1f);
        float chanceBottle = UnityEngine.Random.Range(0f, 1f);
        float chanceTakeTrain = UnityEngine.Random.Range(0f, 1f);

        //evaluate probability of taking the ticket
        if (chanceTicket < TAKE_TICKET_CHANCE)
            TakeTIcket();
        else
            ticketTaken = true;

        if(chanceBottle < TAKE_DRINK_CHANCE)
            TakeBottle();
    	
        //a prescindere l'obiettivo finale è andare a prendere il treno
        if(chanceTakeTrain < TAKE_TRAIN_CHANCE)
            GoToTakeTrain();
    }

    private void TakeTIcket()
    {
        Utility.Log(name + " is taking ticket");
        buyTicket = new BuyTicket(this);
        actionsList.Enqueue(buyTicket);
    }

    private void TakeBottle()
    {
        Utility.Log(name + " is taking drink");
        buyBottle = new BuyBottle(this);
        actionsList.Enqueue(buyBottle);
    }

    protected void GoToTakeTrain()
    {
        reachPlatform = new ReachPlatform(this);
        actionsList.Enqueue(reachPlatform);
    }

    private void OnTrainArriving(object sender, EventArgs e)
    {
        MxMecaAnimator.m_animator.RemoveRequiredTag("Idle");
        enterTrain = new EnterTrain(this);
        actionsList.Enqueue(enterTrain);

        if (ticketTaken)
        {
            if(actionsList.CurrentAction != null)
                actionsList.AbortAll();

            train.DoorsOpen -= OnTrainArriving;
        }
    }
}
