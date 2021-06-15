using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckScreen : ECAAction
{
    protected new ActionName actionName = ActionName.CheckRythm;
    DefibrillatorTable defibrillatorTable;
    DefibrillatorScreen screen;

    public CheckScreen(ECA eca, DefibrillatorTable defibrillatorTable, bool canAbort = true) : base(eca, canAbort)
    {
        this.defibrillatorTable = defibrillatorTable;
        screen = defibrillatorTable.GetDefibrillator().GetScreen();
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        TurnStage turnToTable = new TurnStage(defibrillatorTable.transform);
        CheckScreenStage checkScreen = new CheckScreenStage(eca, screen.GetPatientState());

        stages.Add(turnToTable);
        stages.Add(checkScreen);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }
}
