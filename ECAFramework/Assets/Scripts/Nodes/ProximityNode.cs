using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProximityNode : SmartActionNode  
{
    ProximityAction proximityAction;
    ECA_sitAction eca_sitAction;

    public ProximityNode(int id, ProximityAction proximitySmartAction, string readableName, bool isTrainingMode) : 
        base(id, readableName, isTrainingMode)
    {
        proximityAction = proximitySmartAction;
    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        proximityAction.Entered += OnTriggerEntered;
        CurrentSmartAction = this.proximityAction;
        base.StartNode(speak);

        //inizializzo l'azione dell'ECA
        eca_sitAction = (ECA_sitAction)ECAAnimationManager.allECAActions["SitAction"];

        //se sono in modalità training lancia il messaggio di descrizione del task
        if (IsTrainingMode)
        {
            SmartActionCustomArgs args = new SmartActionCustomArgs(proximityAction, proximityAction.Start, "Description");
            AskExecutionAfterMessage(args);
        }
        eca_sitAction.startAction();
    }

    //questo fa la end dell'azione
    private void OnTriggerEntered(object sender, EventArgs e)
    {
        proximityAction.Entered -= OnTriggerEntered;
        proximityAction.Finish();
        eca_sitAction.onCompletedAction();
        SetCompleted();
    }
}
