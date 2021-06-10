using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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

    private List<PickStage> pickStages;
    private List<PlaceObjectStage> placePaddles;
    private ECAAction takePaddles;
    private ECAAction usePaddles;

    public Shock(DefibrillatorManager eca, DefibrillatorTable defibrillatorTable, Patient patient) : base(eca)
    {
        defManager = eca;
        this.defibrillator = defibrillatorTable.GetDefibrillator();
        defLeftPosition = patient.GetDefLeftPosition();
        defRightPosition = patient.GetDefRightPosition();
        turnAtPosition = patient.GetDefLeftPosition();
        leftFootPosition = defibrillatorTable.GetLeftFootPosition();
        bodyTarget = defibrillatorTable.GetBodyTarget();
        destination = defibrillatorTable.GetDestination();
        destinationPatient = patient.GetDestinationDef();

        CreateActionList();
    }

    private void PickPaddles()
    {
        GoToStage goToDef = new GoToStage(destination);

        pickStages = new List<PickStage>()
        {
            new PickStage(defibrillator.GetLeftPaddle().transform, 1, false, HandSide.LeftHand),
            new PickStage(defibrillator.GetRightPaddle().transform, 1, false, HandSide.RightHand)
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
        placePaddles = new List<PlaceObjectStage>()
        {
            new PlaceObjectStage(pickStages[0], defLeftPosition),
            new PlaceObjectStage(pickStages[1], defRightPosition)
        };
        ECAParallelActionStage place = new ECAParallelActionStage(placePaddles.ToArray());
        WaitStage waitForShock = new WaitStage(2f);
        //shock

        List<ECAActionStage> list = new List<ECAActionStage>();
        list.Add(place);
        list.Add(waitForShock);

        ECAAction action = new ECAAction(defManager, list);
        actions.Add(action);
    }

    protected override void CreateActionList()
    {
        PickPaddles();
        UseShock();
        base.CreateActionList();
    }

}
