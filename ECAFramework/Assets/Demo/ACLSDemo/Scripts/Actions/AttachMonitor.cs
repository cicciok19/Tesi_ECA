using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttachMonitor : ECAAction
{
    private Transform defibrillatorTable;
    private Defibrillator defibrillator;
    private ECAButton button;
    private Transform destinationDef;
    private Transform patient;
    private Transform destinationPatient;

    public AttachMonitor(ECA eca, DefibrillatorTable defibrillatorTable, Patient patient) : base(eca)
    {
        this.defibrillatorTable = defibrillatorTable.transform;
        defibrillator = defibrillatorTable.GetDefibrillator();
        destinationDef = defibrillatorTable.GetDestination();
        button = defibrillator.GetButton();
        this.patient = patient.transform;
        destinationPatient = patient.GetDestinationDef();
        actionName = ActionName.AttachMonitor;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToDef = new GoToStage(destinationDef);
        TurnStage turnToDefibrillator = new TurnStage(defibrillatorTable);
        PressStage pressButton = new PressStage(button, HandSide.RightHand);
        GoToStage goToPatient = new GoToStage(destinationPatient);
        TurnStage turnToPatient = new TurnStage(patient);

        stages.Add(goToDef);
        stages.Add(turnToDefibrillator);
        stages.Add(pressButton);
        stages.Add(goToPatient);
        stages.Add(turnToPatient);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }

}
