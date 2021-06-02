using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedicationProvider : ECA
{
    public string[] intentNames = { "IVAccess", "Epinephrine", "Amiodarone" };

    private UseMedicine useMedicine;
    private IVAccess ivAccess;

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }
}
