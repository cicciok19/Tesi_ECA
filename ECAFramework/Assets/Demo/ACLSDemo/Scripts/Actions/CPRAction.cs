using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CPRAction : ECAAction
{
    private CPRPosition cprPosition;
    protected new ActionName actionName = ActionName.Cpr;

    public CPRAction(ECA eca, CPRPosition cprPosition) : base(eca)
    {
        this.cprPosition = cprPosition;
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        CPRStage stage = new CPRStage(cprPosition);
        stages.Add(stage);
        SetStages(stages);
    }
}
