using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckScreen : ECAAction
{
    
    DefibrillatorTable defibrillatorTable;
    DefibrillatorScreen screen;
    Patient patient;

    public CheckScreen(ECA eca, DefibrillatorTable defibrillatorTable, Patient patient, bool canAbort = true) : base(eca, canAbort)
    {
        this.defibrillatorTable = defibrillatorTable;
        screen = defibrillatorTable.GetDefibrillator().GetScreen();
        this.patient = patient;
        actionName = ActionName.CheckRythm;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        GoToStage goToTable = new GoToStage(defibrillatorTable.GetDestination());
        CheckScreenStage checkScreen = new CheckScreenStage(eca, screen.GetPatientState());
        GoToStage goToPatient = new GoToStage(patient.GetDestinationDef());

        stages.Add(goToTable);
        stages.Add(checkScreen);
        stages.Add(goToPatient);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }
}
