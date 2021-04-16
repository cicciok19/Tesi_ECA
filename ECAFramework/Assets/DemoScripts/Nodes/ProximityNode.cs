using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProximityNode : SmartActionNode  
{
    ProximityAction ProximityAction;
    Transform SitPoint = null;

    public ProximityNode(ProximityAction proximitySmartAction, Transform sitPoint, string readableName, bool isTrainingMode) : 
        base(readableName, isTrainingMode)
    {
        ProximityAction = proximitySmartAction;
        SitPoint = sitPoint;
    }

    public ProximityNode(ProximityAction proximitySmartAction, string readableName, bool isTrainingMode) :
    base(readableName, isTrainingMode)
    {
        ProximityAction = proximitySmartAction;

    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        ProximityAction.Entered += OnTriggerEntered;
        CurrentSmartAction = this.ProximityAction;
        base.StartNode(speak);

        //se sono in modalità training lancia il messaggio di descrizione del task
        if (IsTrainingMode)
        {
            SmartActionCustomArgs args = new SmartActionCustomArgs(ProximityAction, ProximityAction.Start, "Description");
            AskExecutionAfterMessage(args);
        }
    }

    //questo fa la end dell'azione e viene chiamato quando l'utente entra nel trigger del relativo quadro
    private void OnTriggerEntered(object sender, EventArgs e)
    {
        ProximityAction.Entered -= OnTriggerEntered;
        ProximityAction.Finish();

        //DEVO GESTIRE LE ANIMAZIONI DELL'ECA

        SetCompleted();
    }
}
