using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CPRAction : ECAAction
{
    private CPRPosition cprPosition;

    public CPRAction(ECA eca, CPRPosition cprPosition) : base(eca)
    {
        this.cprPosition = cprPosition;
        actionName = ActionName.Cpr;
    }

    public override void StartAction()
    {
        base.StartAction();
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        WaitStage wait = new WaitStage(1f);
        CPRStage stage = new CPRStage(cprPosition);
        stages.Add(wait);
        stages.Add(stage);
        SetStages(stages);
    }
}
