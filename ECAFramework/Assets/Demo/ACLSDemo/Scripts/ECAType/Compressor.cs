using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Compressor : ECA
{
    private const string START_CPR = "StartCPR";

    private Patient patient;
    private TimeRecorder timeRecorder;
    private CPRPosition cprPosition;
    private SystemManager systemManager;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        timeRecorder = FindObjectOfType<TimeRecorder>();
        cprPosition = patient.GetCPRPosition();
        systemManager = FindObjectOfType<SystemManager>();

        //just for debug
        //HandleStartCPR();
        
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
        switch (intent.IntentName)
        {
            case START_CPR:
                HandleStartCPR();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { START_CPR };
        foreach(string intent in intentName)
            IntentManager.Instance.AddIntentHandler(intent, this);
    }

    private void HandleStartCPR()
    {
        //send message
        //StartCoroutine(CompressFor(10f));
        //do action

        timeRecorder.TimeExpired += OnTimeExpired;
        timeRecorder.CheckTime(this, .1f);
        CPRAction cpr = new CPRAction(this, cprPosition);
        cpr.CompletedAction += OnCPRCompleted;
        actionsList.Enqueue(cpr);
    }

    private IEnumerator CompressFor(float time)
    {
        yield return new WaitForSeconds(time);
    }

    private void OnCPRCompleted(object sender, EventArgs e)
    {
        CPRAction cpr = (CPRAction)sender;
        cpr.CompletedAction -= OnCPRCompleted;
        systemManager.CheckAction(cpr.ActionName);
        patient.OnCPREnded();
    }

    private void OnTimeExpired(object sender, EventArgs e)
    {

        TImeRecorderEventArgs ecaArg = (TImeRecorderEventArgs)e;

        if(ecaArg.eca == this)
        {
            timeRecorder.SendDirectMessage("Sono passati 15 secondi, puoi smettere di fare il massaggio cardiaco");
            timeRecorder.TimeExpired -= OnTimeExpired;
            //dovremmo far finire il CPR
        }
    }
}
