using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedicationProvider : ECA
{
    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return base.AddECAAnimator();
    }
}
