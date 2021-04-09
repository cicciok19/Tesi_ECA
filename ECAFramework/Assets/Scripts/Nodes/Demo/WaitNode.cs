﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class WaitNode : ParallelAndNode
{
    public WaitNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
    }

    public override void UpdateNode()
    {
        base.UpdateNode();
    }

}
