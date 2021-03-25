using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProximityAction : SmartAction
{
    public event EventHandler Entered;
    string proximityTriggerID;

    public ProximityAction(int smartActionID, string triggerID) : base(smartActionID)
    {
        proximityTriggerID = triggerID;
    }

    public override void Start()
    {
        base.Start();
        Proximity.OnProximity += OnEntered;

    }

    private void OnEntered(object sender, EventArgs e)
    {
        Proximity proximity = (Proximity)sender;
        if (String.Equals(proximity.ID, this.proximityTriggerID))
        {
            Proximity.OnProximity -= OnEntered;
            //            BodyProximitySmartAction.Finish();
            proximity.enabled = false;
            proximity.gameObject.SetActive(false);
            if (Entered != null)
                Entered(this, EventArgs.Empty);
        }
    }
}
