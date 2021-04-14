using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoScenario : ECAGameManager
{
    GameGraphNode[] allGameNodes;
    protected override void CreateActions()
    {
        ProximityAction firstPaintProximityAction = new ProximityAction((int)SmartActions.firstPaintProximityAction, "FirstPaint");
        ProximityAction secondPaintProximityAction = new ProximityAction((int)SmartActions.secondPaintProximityAction, "SecondPaint");
        ProximityAction thirdPaintProximityAction = new ProximityAction((int)SmartActions.thirdPaintProximityAction, "ThirdPaint");

        PaintInteraction firstPaintInteraction = new PaintInteraction((int)SmartActions.firstPaintInteraction, 1);
        PaintInteraction secondPaintInteraction = new PaintInteraction((int)SmartActions.secondPaintInteraction, 2);
        PaintInteraction thirdPaintInteraction = new PaintInteraction((int)SmartActions.thirdPaintInteraction, 3);

        AllSmartActions.Add(SmartActions.firstPaintProximityAction, firstPaintProximityAction);
        AllSmartActions.Add(SmartActions.secondPaintProximityAction, secondPaintProximityAction);
        AllSmartActions.Add(SmartActions.thirdPaintProximityAction, thirdPaintProximityAction);
        AllSmartActions.Add(SmartActions.firstPaintInteraction, firstPaintInteraction);
        AllSmartActions.Add(SmartActions.secondPaintInteraction, secondPaintInteraction);
        AllSmartActions.Add(SmartActions.thirdPaintInteraction, thirdPaintInteraction);

    }

    protected override void DefineGraphNodes()
    {
        ProximityNode proximityNode_1 = new ProximityNode((int)Nodes.ProximityNode_1, (ProximityAction)AllSmartActions[SmartActions.firstPaintProximityAction], 
            "Go near paint#1", true);
        ProximityNode proximityNode_2 = new ProximityNode((int)Nodes.ProximityNode_2, (ProximityAction)AllSmartActions[SmartActions.secondPaintProximityAction], 
            "Go near paint#2", true);
        ProximityNode proximityNode_3 = new ProximityNode((int)Nodes.ProximityNode_3, (ProximityAction)AllSmartActions[SmartActions.thirdPaintProximityAction], 
            "Go near paint#3", true);

        PaintInteractionNode firstPaintInteractionNode = new PaintInteractionNode((int)Nodes.IntNode_firstPaint, 
            (PaintInteraction)AllSmartActions[SmartActions.firstPaintInteraction], "Interaction Node paint#1", true);
        PaintInteractionNode secondPaintInteractionNode = new PaintInteractionNode((int)Nodes.IntNode_secondPaint,
            (PaintInteraction)AllSmartActions[SmartActions.secondPaintInteraction], "Interaction Node paint#2", true);
        PaintInteractionNode thirdPaintInteractionNode = new PaintInteractionNode((int)Nodes.IntNode_thirdPaint,
            (PaintInteraction)AllSmartActions[SmartActions.thirdPaintInteraction], "Interaction Node paint#3", true);

        FirstPaintNode firstNode = new FirstPaintNode((int)Nodes.firstPaintNode, "First paint node", "Manage first paint interaction",
            new GameGraphNode[] { proximityNode_1, firstPaintInteractionNode }, true);
        SecondPaintNode secondNode = new SecondPaintNode((int)Nodes.secondPaintNode, "Second paint node", "Manage second paint interaction",
            new GameGraphNode[] { proximityNode_2, secondPaintInteractionNode }, true);
        ThirdPaintNode thirdNode = new ThirdPaintNode((int)Nodes.thirdPaintNode, "Third paint node", "Manage third paint interaction",
            new GameGraphNode[] { proximityNode_3, thirdPaintInteractionNode }, true);

        WaitNode waitNode = new WaitNode((int)Nodes.waitNode, "Wait for interaction node", "Enter some trigger to begin new node",
            new GameGraphNode[] { firstNode, secondNode, thirdNode }, true);


        nodes = new GameGraphNode[]
        {
            waitNode,
        };

        allGameNodes = new GameGraphNode[]
        {
            waitNode,
            firstNode,
            secondNode,
            thirdNode,
            firstPaintInteractionNode,
            secondPaintInteractionNode,
            thirdPaintInteractionNode,
            proximityNode_1,
            proximityNode_2,
            proximityNode_3
        };


        for (int i = 0; i < allGameNodes.Length; i++)
            AllSimpleNodes.Add(allGameNodes[i].ID, allGameNodes[i]);

        this.NumberOfNodes = nodes.Length;
    }

}
