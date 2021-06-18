using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class Shock : ECACompositeAction
{
    private Defibrillator defibrillator;
    private DefibrillatorManager defManager;
    private Transform defLeftPosition;
    private Transform defRightPosition;
    private Transform turnAtPosition;
    private Transform leftFootPosition;
    private Transform bodyTarget;
    private Transform destination;
    private Transform destinationPatient;
    private Transform destinationPaddleLeft;
    private Transform destinationPaddleRight;

    private int nShock;
    private Patient patient;

    private List<PickStage> pickStages;
    private List<PlaceObjectStage> placePaddles;
    private ECAAction takePaddles;
    private ECAAction usePaddles;

    public Shock(DefibrillatorManager eca, DefibrillatorTable defibrillatorTable, Patient patient, int nShock) : base(eca)
    {
        defManager = eca;
        this.patient = patient;
        this.defibrillator = defibrillatorTable.GetDefibrillator();
        defLeftPosition = patient.GetDefLeftPosition();
        defRightPosition = patient.GetDefRightPosition();
        turnAtPosition = patient.GetDefLeftPosition();
        leftFootPosition = defibrillatorTable.GetLeftFootPosition();
        bodyTarget = defibrillatorTable.GetBodyTarget();
        destination = defibrillatorTable.GetDestination();
        destinationPatient = patient.GetDestinationDef();
        destinationPaddleLeft = defibrillatorTable.GetPaddleLeftPosition();
        destinationPaddleRight = defibrillatorTable.GetPaddleRightPosition();

        this.nShock = nShock;

        actionName = ActionName.Shock;

        //CreateActionList();
    }

    private void PickPaddles()
    {
        GoToStage goToDef = new GoToStage(destination);

        pickStages = new List<PickStage>()
        {
            new PickStage(defibrillator.GetLeftPaddle().transform, .5f, false, HandSide.LeftHand),
            new PickStage(defibrillator.GetRightPaddle().transform, .5f, false, HandSide.RightHand)
        };

        ECAParallelActionStage pick = new ECAParallelActionStage(pickStages.ToArray());
        GoToStage goToPatient = new GoToStage(destinationPatient);
        TurnStage turnToPatient = new TurnStage(turnAtPosition, false, leftFootPosition, bodyTarget);

        List<ECAActionStage> list = new List<ECAActionStage>();
        list.Add(goToDef);
        list.Add(pick);
        list.Add(goToPatient);
        list.Add(turnToPatient);

        takePaddles = new ECAAction(defManager, list);
        actions.Add(takePaddles);
    }

    private void UseShock()
    {
        List<ECAActionStage> list = new List<ECAActionStage>();

        placePaddles = new List<PlaceObjectStage>()
        {
            new PlaceObjectStage(pickStages[0], defLeftPosition, true),
            new PlaceObjectStage(pickStages[1], defRightPosition, true)
        };

        ECAParallelActionStage place = new ECAParallelActionStage(placePaddles.ToArray());
        list.Add(place);

        for (int i = 0; i < nShock; i++) {
            //shock
            WaitStage waitShock = new WaitStage(3f);
            waitShock.StageFinished += SendShock;
            list.Add(waitShock);
        }

        ECAAction action = new ECAAction(defManager, list);
        actions.Add(action);
    }

    private void PlacePaddles()
    {
        List<ECAActionStage> list = new List<ECAActionStage>();

        WaitStage firstWait = new WaitStage(2f);
        TurnStage turnToTable = new TurnStage(patient.transform, false, leftFootPosition, bodyTarget);
        WaitStage wait = new WaitStage(.5f);

        List<FullBodyBipedEffector> effectors = new List<FullBodyBipedEffector>() { FullBodyBipedEffector.LeftHand, FullBodyBipedEffector.RightHand};
        ResumeInteractionStage posePaddles = new ResumeInteractionStage(effectors);

        GoToStage goToTable = new GoToStage(destination);

        List<DropStage> dropPaddles = new List<DropStage>()
        {
            new DropStage(pickStages[0], destinationPaddleLeft),
            new DropStage(pickStages[1], destinationPaddleRight)
        };

        ECAParallelActionStage parallelDrop = new ECAParallelActionStage(dropPaddles.ToArray());

        GoToStage goToPatient = new GoToStage(destinationPatient);

        list.Add(firstWait);
        list.Add(turnToTable);
        list.Add(wait);
        list.Add(posePaddles);
        list.Add(goToTable);
        //list.Add(wait);
        list.Add(parallelDrop);
        list.Add(goToPatient);

        ECAAction action = new ECAAction(defManager, list);
        actions.Add(action);
    }

    protected override void CreateActionList()
    {
        PickPaddles();
        UseShock();
        PlacePaddles();
        //base.CreateActionList();
    }

    private void SendShock(object sender, EventArgs e)
    {
        WaitStage wait = (WaitStage)sender;
        wait.StageFinished -= SendShock;
        defManager.SendDirectMessage("Scarica!");
        ecaAnimator.AudioEnded += OnCommunicationEnded;
    }

    private void OnCommunicationEnded(object sender, EventArgs e)
    {
        ecaAnimator.AudioEnded -= OnCommunicationEnded;
        patient.OnShockReceived();
    }
}
