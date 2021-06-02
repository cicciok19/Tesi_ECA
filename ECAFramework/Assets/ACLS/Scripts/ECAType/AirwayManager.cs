using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "StopOxygen", "AdvancedAirwayCapnography" };
    private GiveOxygen giveOxygen;
    private Capnography capnography;

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }
}
