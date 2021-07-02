using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class LookAtAction : ECAAction
{
    private MessageAction action;
    public LookAtAction(ECA eca, MessageAction action, bool canAbort = true) : base(eca, canAbort)
    {
        this.action = action;
    }

    public override void SetupAction()
    {
        base.SetupAction();
        GameObject obj = GameObject.FindGameObjectWithTag(action.firstParameter);
        Assert.IsNotNull(obj, "Object parameter for pickUp is null");

        TurnStage turn = new TurnStage(obj.transform);
        LookStableStage lookAt = new LookStableStage(obj.transform, 1);
        WaitStage waitFor = new WaitStage(2f);

        List<ECAActionStage> stages = new List<ECAActionStage>();
        stages.Add(turn);
        stages.Add(lookAt);
        stages.Add(waitFor);

        SetStages(stages);
    }
}
