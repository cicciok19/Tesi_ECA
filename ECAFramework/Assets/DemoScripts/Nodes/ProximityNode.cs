using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProximityNode : SmartActionNode  
{
    ProximityAction ProximityAction;
    ECA_sitAction EcaSitAction;
    Transform SitPoint = null;

    public ProximityNode(int id, ProximityAction proximitySmartAction, Transform sitPoint, string readableName, bool isTrainingMode) : 
        base(id, readableName, isTrainingMode)
    {
        ProximityAction = proximitySmartAction;
        SitPoint = sitPoint;
    }

    public ProximityNode(int id, ProximityAction proximitySmartAction, string readableName, bool isTrainingMode) :
    base(id, readableName, isTrainingMode)
    {
        ProximityAction = proximitySmartAction;

    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        ProximityAction.Entered += OnTriggerEntered;
        CurrentSmartAction = this.ProximityAction;
        base.StartNode(speak);

        //inizializzo l'azione dell'ECA
        EcaSitAction = (ECA_sitAction)ECAAnimationManager.allECAActions[ECAActions.SitAction];

        //se sono in modalità training lancia il messaggio di descrizione del task
        if (IsTrainingMode)
        {
            SmartActionCustomArgs args = new SmartActionCustomArgs(ProximityAction, ProximityAction.Start, "Description");
            AskExecutionAfterMessage(args);
        }
    }

    //questo fa la end dell'azione
    private void OnTriggerEntered(object sender, EventArgs e)
    {
        ProximityAction.Entered -= OnTriggerEntered;
        ProximityAction.Finish();
        //ECAAnimationManager.allECAActions[ECAAnimationManager.idx].onCompletedAction();
        if (SitPoint==null)
            ECAAnimationManager.allECAActions[ECAActions.GoToAction].StartAction();
        else
        {
            EcaSitAction.SetSitPoint(SitPoint);
            EcaSitAction.StartAction();
        }

        SetCompleted();
    }
}
