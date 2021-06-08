using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GiveOxygen : ECACompositeAction
{
    Oxygen oxygen;
    Transform giveOxygenPosition;

    public GiveOxygen(ECA eca, Oxygen oxygen, Transform giveOxygenPosition) : base(eca)
    {
        this.oxygen = oxygen;
        this.giveOxygenPosition = giveOxygenPosition;
    }

    public void SetupPickMask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        TurnStage turnToMask = new TurnStage(oxygen.GetOxygenMask());
        List<PickStage> pickOxygen = new List<PickStage>()
        {
            new PickStage(oxygen.GetOxygenMask(), 1, false, HandSide.LeftHand),
            new PickStage(oxygen.GetOxygenPump(), 1, false, HandSide.RightHand)
        };
        ECAParallelActionStage pick = new ECAParallelActionStage(pickOxygen.ToArray());
        TurnStage turnToPatient = new TurnStage(giveOxygenPosition);
        WaitStage wait = new WaitStage(.2f);
        PlaceObjectStage putMaskToPatient = new PlaceObjectStage(pickOxygen[0], giveOxygenPosition);

        stages.Add(turnToMask);
        stages.Add(pick);
        stages.Add(turnToPatient);
        stages.Add(wait);
        stages.Add(putMaskToPatient);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    public override void StartAction()
    {
        SetupPickMask();
        base.StartAction();
    }

}
