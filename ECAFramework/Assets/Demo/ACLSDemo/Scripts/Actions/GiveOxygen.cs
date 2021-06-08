using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GiveOxygen : ECACompositeAction
{
    Oxygen oxygen;
    Transform giveOxygenPosition;
    Transform pumpPosition;

    public GiveOxygen(ECA eca, Oxygen oxygen, Patient patient) : base(eca)
    {
        this.oxygen = oxygen;
        giveOxygenPosition = patient.GetGiveOxygenPosition();
        pumpPosition = patient.GetPumpPosition();
    }

    private void SetupPickMask()
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
        LookStableStage lookPatient = new LookStableStage(giveOxygenPosition);
        WaitStage wait = new WaitStage(1f);
        List<PlaceObjectStage> putOxygen = new List<PlaceObjectStage>()
        {
            new PlaceObjectStage(pickOxygen[0], giveOxygenPosition),
            new PlaceObjectStage(pickOxygen[1], pumpPosition)
        };
        ECAParallelActionStage put = new ECAParallelActionStage(putOxygen.ToArray());


        stages.Add(turnToMask);
        stages.Add(pick);
        stages.Add(turnToPatient);
        stages.Add(wait);
        stages.Add(lookPatient);
        stages.Add(put);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    public override void StartAction()
    {
        SetupPickMask();
        base.StartAction();
    }

}
