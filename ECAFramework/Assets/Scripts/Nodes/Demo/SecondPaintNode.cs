using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class SecondPaintNode : SequentialNode
{
    public SecondPaintNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

}
