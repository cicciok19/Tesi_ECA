using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DefibrillatorManager : ECA
{
    public string[] intentNames = { "AttachMonitor", "Shock" };
    public event EventHandler ShockFinished;

    private Shock shock;
    private AttachMonitor attachMonitor;
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }
}
