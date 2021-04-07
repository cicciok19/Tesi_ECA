using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrainingScenario : ECAGameManager
{
    protected override void CreateActions()
    {
        //dichiarazione di tutte le azioni che mi servono
        ProximityAction ProximityTrigger = new ProximityAction((int)SmartActions.ProximityAction, "TriggerBase");
        ProximityAction ProximityTrigger_1 = new ProximityAction((int)SmartActions.ProximityAction, "SecondTrigger");


        AllSmartActions.Add(SmartActions.ProximityAction, ProximityTrigger);
        AllSmartActions.Add(SmartActions.ProximityAction_1, ProximityTrigger_1);

    }


    protected override void DefineGraphNodes()
    {
        nodes = new GameGraphNode[]
        {
             new ProximityNode((int)Nodes.ProximityNode, (ProximityAction)AllSmartActions[SmartActions.ProximityAction], "Enter the trigger", IsTrainingMode),
             new ProximityNode((int)Nodes.ProximityNode_1, (ProximityAction)AllSmartActions[SmartActions.ProximityAction_1], "Go near body", IsTrainingMode),
        };

        for (int i = 0; i < nodes.Length; i++)
            AllSimpleNodes.Add(nodes[i].ID, nodes[i]);

        this.NumberOfNodes = nodes.Length;
    }


}
