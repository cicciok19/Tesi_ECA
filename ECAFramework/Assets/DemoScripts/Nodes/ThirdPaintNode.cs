using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class ThirdPaintNode : SequentialNode
{
    public ThirdPaintNode(string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

}
