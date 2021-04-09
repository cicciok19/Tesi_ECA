using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class ThirdPaintNode : SequentialNode
{
    public ThirdPaintNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

}
