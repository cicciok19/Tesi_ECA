using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProximityAction : SmartAction
{
    public event EventHandler Entered;
    string ProximityTriggerID;

    public ProximityAction(int smartActionID, string triggerID) : base(smartActionID)
    {
        ProximityTriggerID = triggerID;
        Start();
    }

    public override void Start()
    {
        base.Start();
        Proximity.OnProximity += OnEntered;

    }

    private void OnEntered(object sender, EventArgs e)
    {
        Proximity Proximity = (Proximity)sender;
        if (String.Equals(Proximity.ID, this.ProximityTriggerID))
        {
            Proximity.OnProximity -= OnEntered;
            Proximity.enabled = false;
            EventArgs ev = new EventArgs();
            Proximity.gameObject.SetActive(false);
            if (Entered != null)
                Entered(this, EventArgs.Empty);
        }
    }
}
