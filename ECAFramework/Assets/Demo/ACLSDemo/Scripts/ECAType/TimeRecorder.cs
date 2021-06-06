using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

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
        if (TimeExpired != null)
            TimeExpired(this, EventArgs.Empty);
    }
}
