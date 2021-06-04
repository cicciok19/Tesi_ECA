using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GiveOxygen : ECAAction
{
    Transform oxygenMask;
    Transform giveOxygenPosition;

    public GiveOxygen(ECA eca, Transform oxygenMask, Transform giveOxygenPosition) : base(eca)
    {
        this.oxygenMask = oxygenMask;
        this.giveOxygenPosition = giveOxygenPosition;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        TurnStage turnToMask = new TurnStage(oxygenMask);
        PickStage pickMask = new PickStage(oxygenMask, 1f);
        TurnStage turnToPatient = new TurnStage(giveOxygenPosition);
        WaitStage wait = new WaitStage(2f);
        DropStage putMaskToPatient = new DropStage(pickMask, giveOxygenPosition);

        stages.Add(turnToMask);
        stages.Add(pickMask);
        stages.Add(turnToPatient);
        stages.Add(wait);
        stages.Add(putMaskToPatient);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }
}
