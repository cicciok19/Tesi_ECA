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
    public event EventHandler TimeExpired;

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public void CheckTime(ECA eca, float timeInMinutes)
    {
        StartCoroutine(SetTimer(eca, timeInMinutes * 60));
    }

    IEnumerator SetTimer(ECA eca, float time)
    {
        yield return new WaitForSeconds(time);

        if (TimeExpired != null)
            TimeExpired(this, new TImeRecorderEventArgs(eca));
    }
}
