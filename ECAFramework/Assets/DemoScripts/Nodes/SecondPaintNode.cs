using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class SecondPaintNode : SequentialNode
{
    public SecondPaintNode(string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

}
