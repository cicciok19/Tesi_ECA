using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PaintInteractionNode : SmartActionNode
{
    PaintInteraction paintInteraction;

    public PaintInteractionNode(int id, PaintInteraction action, string readableName, bool isTrainingMode) : base(id, readableName, isTrainingMode)
    {
        paintInteraction = action;
    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        if (IsTrainingMode)
        {
            SmartActionCustomArgs args = new SmartActionCustomArgs(paintInteraction, paintInteraction.Start, "Description");
            AskExecutionAfterMessage(args);
        }
    }

    protected override void TriggerNode()
    {
        base.TriggerNode();
    }
    public override void SetCompleted()
    {
        base.SetCompleted();
    }
}
