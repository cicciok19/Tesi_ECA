using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrainingScenario : ECAGameManager
{
    protected override void CreateActions()
    {
        //dichiarazione di tutte le azioni che mi servono
        ProximityAction ProximityTrigger = new ProximityAction((int)SmartActions.ProximityAction, "TriggerBase");

        AllSmartActions.Add(SmartActions.ProximityAction, ProximityTrigger);
    }

    protected override void DefineGraphNodes()
    {
        nodes = new GameGraphNode[]
        {
             new ProximityNode((int)Nodes.ProximityNode, (ProximityAction)AllSmartActions[SmartActions.ProximityAction], "Go near body", IsTrainingMode),
        };

        for (int i = 0; i < nodes.Length; i++)
            AllSimpleNodes.Add(nodes[i].ID, nodes[i]);

        this.NumberOfNodes = nodes.Length;
    }


}
