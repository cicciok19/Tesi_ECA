using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class GiveOxygen : ECACompositeAction
{
    Oxygen oxygen;
    Transform giveOxygenPosition;
    Transform pumpPosition;
    Transform destinationMask;
    Transform destinationPump;
    List<PickStage> pickOxygen;
    protected new ActionName actionName = ActionName.GiveOxygen;

    public GiveOxygen(ECA eca, Oxygen oxygen, Patient patient, AirwayTable airwayTable) : base(eca)
    {
        this.oxygen = oxygen;
        giveOxygenPosition = patient.GetGiveOxygenPosition();
        pumpPosition = patient.GetPumpPosition();
        destinationMask = airwayTable.GetDestinationMask();
        destinationPump = airwayTable.GetDestinationPump();
    }

    private void SetupPickMask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        TurnStage turnToMask = new TurnStage(oxygen.GetOxygenMask());
        pickOxygen = new List<PickStage>()
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
            new PlaceObjectStage(pickOxygen[0], giveOxygenPosition, true),
            new PlaceObjectStage(pickOxygen[1], pumpPosition, false)
        };
        ECAParallelActionStage put = new ECAParallelActionStage(putOxygen.ToArray());

        WaitStage waitPost = new WaitStage(4f);


        stages.Add(turnToMask);
        stages.Add(pick);
        stages.Add(turnToPatient);
        stages.Add(wait);
        stages.Add(lookPatient);
        stages.Add(put);
        stages.Add(waitPost);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void SetupPoseMask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        LookStableStage lookNull = new LookStableStage(giveOxygenPosition, 0.0001f);

        List<FullBodyBipedEffector> effectors = new List<FullBodyBipedEffector>() {FullBodyBipedEffector.LeftHand};
        ResumeInteractionStage poseMask = new ResumeInteractionStage(effectors);

        TurnStage turnToTable = new TurnStage(giveOxygenPosition);
        WaitStage wait = new WaitStage(1f);

        List<DropStage> drop = new List<DropStage>()
        {
            new DropStage(pickOxygen[0], destinationMask),
            new DropStage(pickOxygen[1], destinationPump)
        };

        ECAParallelActionStage dropOxygen = new ECAParallelActionStage(drop.ToArray());

        TurnStage turnToPatient = new TurnStage(giveOxygenPosition);

        stages.Add(lookNull);
        stages.Add(poseMask);
        //stages.Add(turnToTable);
        stages.Add(wait);
        stages.Add(dropOxygen);
        stages.Add(turnToPatient);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    public override void StartAction()
    {
        SetupPickMask();
        SetupPoseMask();
        base.StartAction();
    }

}
