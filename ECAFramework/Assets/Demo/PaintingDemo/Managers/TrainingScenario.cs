using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrainingScenario : ECAGameManager
{
    
    protected override void CreateActions()
    {

    }


    protected override void DefineGraphNodes()
    {
        nodes = new GameGraphNode[]
        {

        };

        for (int i = 0; i < nodes.Length; i++)
            AllSimpleNodes.Add(nodes[i].ID, nodes[i]);

        this.NumberOfNodes = nodes.Length;
    }


}
