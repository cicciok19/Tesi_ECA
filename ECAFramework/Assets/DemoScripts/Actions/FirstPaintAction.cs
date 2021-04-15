using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PaintInteraction : SmartAction
{
    public int PaintID;
    public int TotalAnswers = 2;
    public int ActualAnswers;
    public GameObject Eca;

    //mi iscrivo agli intent che devo gestire
    public PaintInteraction(int smartActionID, int paintNumber) : base(smartActionID)
    {
        PaintID = paintNumber;
        ActualAnswers = 0;
    }

    public void OnWrongAnswer(object sender, EventArgs e)
    {
        UpdateAccuracy(0.2f);
    }

    public void OnCorrectAnswer(object sender, EventArgs e)
    {
        ActualAnswers++;
        if (ActualAnswers == TotalAnswers)
            Finish();
    }

    public override void Start()
    {
        base.Start();
        Eca = GameObject.FindGameObjectWithTag("ECA");
        Eca.GetComponent<ECASophie>().SubscriveToRelativePaintIntents(PaintID);
        Eca.GetComponent<ECASophie>().CorrectAnswer += OnCorrectAnswer;
        Eca.GetComponent<ECASophie>().WrongAnswer += OnWrongAnswer;
    }

    public override void UpdateStaging()
    {
        base.UpdateStaging();
    }

    public override void Finish()
    {
        base.Finish();
        ECAAnimationManager.allECAActions[ECAActions.SitAction].OnCompletedAction();
    }
}
