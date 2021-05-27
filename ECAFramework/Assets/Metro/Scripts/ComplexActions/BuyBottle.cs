using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class BuyBottle : ECACompositeAction
{
    private Distributor distributor;
    private Passenger eca;
    protected bool queuedECA = false;
    protected GoToStage goingToDistributor = null;

    public event EventHandler BottleBought;
        
    public BuyBottle(Passenger eca) : base(eca)
    {
        this.eca = eca;
        distributor = this.eca.station.GetDistributor(eca);
    }

    private void SelectDrink()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        /*PickStage pickMoney = new PickStage(distributor, 10, false, HandSide.RightHand);
        DropStage enterMoney = new DropStage(pickMoney, distributor.GetEnterMoney());*/
        PressStage pressButton = new PressStage(distributor.GetRandomButton(), HandSide.LeftHand);
        PickStage pickBottle = new PickStage(distributor.GetGrabbableGameObject(), 10, false, HandSide.RightHand);
        DropStage dropBottle = new DropStage(pickBottle);
        GoToStage exitQueue = new GoToStage(distributor.GetExitPoint());

        /*stages.Add(pickMoney);
        stages.Add(enterMoney);*/
        stages.Add(pressButton);
        stages.Add(pickBottle);
        stages.Add(dropBottle);
        stages.Add(exitQueue);

        ECAAction newAction = new ECAAction(eca, stages);
        newAction.CompletedAction += BottleTaken;

        actions.Add(newAction);
    }

    private void BottleTaken(object sender, EventArgs e)
    {
        distributor.EcasQueue--;     //questo chiama il GoAhead

        if (BottleBought != null)
            BottleBought(this, EventArgs.Empty);
    }

    protected void GoToDistributor()
    {
        GoToStage goingToDistributor = new GoToStage(distributor.GetNextPassengerPosition(eca), distributor.transform);
        TurnStage turn = new TurnStage(distributor.transform);

        List<ECAActionStage> stages = new List<ECAActionStage>();

        stages.Add(goingToDistributor);
        //stages.Add(turn);


        ECAAction goToDistributor = new ECAAction(eca, stages);
        actions.Add(goToDistributor);

        goToDistributor.CompletedAction += OnDistributorReached;
        //goToDistributor.CompletedAction += distributor.PassengerArrived;

        distributor.QueueUpdated += GetNewDestination;
    }

    protected void CompleteQueueing()
    {
        actions.Add(new ManageQueue(eca, distributor));
    }

    private void GetNewDestination(object sender, EventArgs e)
    {
        if (queuedECA)
            return;

        Utility.Log(eca.name + " going in queue");
        goingToDistributor.ChangeDestination(distributor.GetNextPassengerPosition(eca));
    }

    protected void OnDistributorReached(object sender, EventArgs e)
    {
        Utility.Log(" arrived " + eca.name);

        ECAAction goToDistributor = (ECAAction)sender;
        goToDistributor.CompletedAction -= OnDistributorReached;
        distributor.QueueUpdated -= GetNewDestination;
        //goToDistributor.CompletedAction -= distributor.PassengerArrived;

        eca.ecaTurn = distributor.EcasQueue;
        distributor.EcasQueue++;
        
        queuedECA = true;
    }

    protected override void CreateActionList()
    {
        base.CreateActionList();
        GoToDistributor();
        CompleteQueueing();
        SelectDrink();
    }

    public override void StartAction()
    {
        CreateActionList();
        base.StartAction();
    }
}
