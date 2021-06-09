using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Compressor : ECA
{
    public string[] intentNames = { "StartCPR" };

    private CPRAction cpr;
    private Patient patient;
    private TimeRecorder timeRecorder;
    private CPRPosition cprPosition;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        timeRecorder = FindObjectOfType<TimeRecorder>();
        cprPosition = patient.GetCPRPosition();

        //ikManager.ChangeFadeInTime(5f);

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
            case "StartCPR":
                HandleStartCPR();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        IntentName = new List<string> { "StartCPR" };
        IntentManager.Instance.AddIntentHandler(IntentName[0], this);
    }

    private void HandleStartCPR()
    {
        //send message
        //StartCoroutine(CompressFor(10f));
        //do action
        cpr = new CPRAction(this, cprPosition);
        cpr.CompletedAction += OnCPRCompleted;
        cpr.StartAction();
    }

    private IEnumerator CompressFor(float time)
    {
        yield return new WaitForSeconds(time);
    }

    private void OnCPRCompleted(object sender, EventArgs e)
    {
        patient.OnCPREnded();
    }
}
