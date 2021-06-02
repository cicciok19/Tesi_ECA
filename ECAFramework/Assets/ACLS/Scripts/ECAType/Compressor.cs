using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Compressor : ECA
{
    public string[] intentNames = { "StartCPR" };

    private CPR cpr;

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }
}
