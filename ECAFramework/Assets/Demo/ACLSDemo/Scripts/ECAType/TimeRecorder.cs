using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TImeRecorderEventArgs : EventArgs
{
    public ECA eca;

    public TImeRecorderEventArgs(ECA eca)
    {
        this.eca = eca;
    }
}

public class TimeRecorder : ECA
{
    public string[] intentNames = { "StartRecord", "StopRecord" };
    private float startTime;
    private ECAAction recordAction;

    public event EventHandler TimeExpired;

    protected override void Start()
    {
        base.Start();
        HandleStartRecord(5f);
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    public void CheckTime(ECA eca, float timeInMinutes)
    {
        StartCoroutine(SetTimer(eca, timeInMinutes * 60));
    }

    private void HandleStartRecord(float time)
    {
        //send message
        Debug.Log("INIZIO ATTESA DI " + time + " SECONDI");
        recordAction = new ECAAction(this, new WaitStage(time));
        recordAction.CompletedAction += OnTimeExpired;
        recordAction.StartAction();
    }

    private void OnTimeExpired(object sender, EventArgs e)
    {
        recordAction.CompletedAction -= OnTimeExpired;
        //send message
        Debug.Log("FINE ATTESA");
        /*if (TimeExpired != null)
            TimeExpired(this, EventArgs.Empty);
        */
    }

    IEnumerator SetTimer(ECA eca, float time)
    {
        yield return new WaitForSeconds(time);

        if (TimeExpired != null)
            TimeExpired(this, new TImeRecorderEventArgs(eca));
    }
}
