using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeRecorder : ECA
{
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }
}
