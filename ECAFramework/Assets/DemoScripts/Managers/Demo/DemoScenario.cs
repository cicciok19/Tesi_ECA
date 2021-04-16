using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoScenario : ECAGameManager
{
    /// <summary>
    /// Tutti i nodi presenti nell'applicazione, compresi i nodi figli dei SequentialNode e degli AggregateNode.
    /// Serve per far iscrivere l'ECA agli eventi dei vari nodi.
    /// </summary>
    GameGraphNode[] allGameNodes;

    protected override void CreateActions()
    {
        ProximityAction FirstPaintProximityAction = new ProximityAction((int)SmartActions.firstPaintProximityAction, "FirstPaint");
        ProximityAction SecondPaintProximityAction = new ProximityAction((int)SmartActions.secondPaintProximityAction, "SecondPaint");
        ProximityAction ThirdPaintProximityAction = new ProximityAction((int)SmartActions.thirdPaintProximityAction, "ThirdPaint");

        PaintInteraction FirstPaintInteraction = new PaintInteraction((int)SmartActions.firstPaintInteraction, 1);
        PaintInteraction SecondPaintInteraction = new PaintInteraction((int)SmartActions.secondPaintInteraction, 2);
        PaintInteraction ThirdPaintInteraction = new PaintInteraction((int)SmartActions.thirdPaintInteraction, 3);

        AllSmartActions.Add(SmartActions.firstPaintProximityAction, FirstPaintProximityAction);
        AllSmartActions.Add(SmartActions.secondPaintProximityAction, SecondPaintProximityAction);
        AllSmartActions.Add(SmartActions.thirdPaintProximityAction, ThirdPaintProximityAction);
        AllSmartActions.Add(SmartActions.firstPaintInteraction, FirstPaintInteraction);
        AllSmartActions.Add(SmartActions.secondPaintInteraction, SecondPaintInteraction);
        AllSmartActions.Add(SmartActions.thirdPaintInteraction, ThirdPaintInteraction);

    }

    protected override void DefineGraphNodes()
    {
        GameObject[] SitPoints = GameObject.FindGameObjectsWithTag("Sit");

        ProximityNode ProximityNode_1 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.firstPaintProximityAction], 
            "Go near paint#1", true);
        ProximityNode ProximityNode_2 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.secondPaintProximityAction], 
            SitPoints[0].transform,"Go near paint#2", true);
        ProximityNode ProximityNode_3 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.thirdPaintProximityAction], 
            "Go near paint#3", true);

        PaintInteractionNode FirstPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.firstPaintInteraction], 
            "Interaction Node paint#1", true);
        PaintInteractionNode SecondPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.secondPaintInteraction], 
            "Interaction Node paint#2", true);
        PaintInteractionNode ThirdPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.thirdPaintInteraction], 
            "Interaction Node paint#3", true);

        FirstPaintNode FirstNode = new FirstPaintNode("First paint node", "Manage first paint interaction",
            new GameGraphNode[] { ProximityNode_1, FirstPaintInteractionNode }, true);
        SecondPaintNode SecondNode = new SecondPaintNode("Second paint node", "Manage second paint interaction",
            new GameGraphNode[] { ProximityNode_2, SecondPaintInteractionNode }, true);
        ThirdPaintNode ThirdNode = new ThirdPaintNode("Third paint node", "Manage third paint interaction",
            new GameGraphNode[] { ProximityNode_3, ThirdPaintInteractionNode }, true);

        WaitNode WaitForUserInteractionNode = new WaitNode("Wait for interaction node", "Enter some trigger to begin new node",
            new GameGraphNode[] { FirstNode, SecondNode, ThirdNode }, true);


        nodes = new GameGraphNode[]
        {
            WaitForUserInteractionNode,
        };

        allGameNodes = new GameGraphNode[]
        {
            WaitForUserInteractionNode,
            FirstNode,
            SecondNode,
            ThirdNode,
            FirstPaintInteractionNode,
            SecondPaintInteractionNode,
            ThirdPaintInteractionNode,
            ProximityNode_1,
            ProximityNode_2,
            ProximityNode_3
        };


        for (int i = 0; i < allGameNodes.Length; i++)
            AllSimpleNodes.Add(allGameNodes[i].ID, allGameNodes[i]);

        this.NumberOfNodes = nodes.Length;
    }

}
