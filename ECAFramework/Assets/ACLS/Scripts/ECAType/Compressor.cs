using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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
        HandleStartCPR();
        
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleStartCPR()
    {
        //send message
        StartCoroutine(CompressFor(10f));
        //do action
        cpr = new CPRAction(this, cprPosition);
        cpr.StartAction();
    }

    private IEnumerator CompressFor(float time)
    {
        yield return new WaitForSeconds(time);
    }
}
