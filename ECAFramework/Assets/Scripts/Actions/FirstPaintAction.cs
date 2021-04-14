using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PaintInteraction : SmartAction
{
    public int paintID;
    public int totalAnswers = 2;
    public int actualAnswers;
    public GameObject eca;

    //mi iscrivo agli intent che devo gestire
    public PaintInteraction(int smartActionID, int paintNumber) : base(smartActionID)
    {
        paintID = paintNumber;
        actualAnswers = 0;
    }

    public void onWrongAnswer(object sender, EventArgs e)
    {
        UpdateAccuracy(0.2f);
    }

    public void onCorrectAnswer(object sender, EventArgs e)
    {
        actualAnswers++;
        if (actualAnswers == totalAnswers)
            Finish();
    }

    public override void Start()
    {
        base.Start();
        eca = GameObject.FindGameObjectWithTag("ECA");
        eca.GetComponent<ECASophie>().SubscriveToRelativePaintIntents(paintID);
        eca.GetComponent<ECASophie>().CorrectAnswer += onCorrectAnswer;
        eca.GetComponent<ECASophie>().WrongAnswer += onWrongAnswer;
    }

    public override void UpdateStaging()
    {
        base.UpdateStaging();
    }

    public override void Finish()
    {
        base.Finish();
        ECAAnimationManager.allECAActions[ECAActions.SitAction].onCompletedAction();
    }
}
