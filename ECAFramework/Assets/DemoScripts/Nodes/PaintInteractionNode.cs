using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PaintInteractionNode : SmartActionNode
{
    PaintInteraction PaintInteraction;

    public PaintInteractionNode(int id, PaintInteraction action, string readableName, bool isTrainingMode) : base(id, readableName, isTrainingMode)
    {
        PaintInteraction = action;
    }

    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        if (IsTrainingMode)
        {
            SmartActionCustomArgs args = new SmartActionCustomArgs(PaintInteraction, PaintInteraction.Start, "Description");
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
