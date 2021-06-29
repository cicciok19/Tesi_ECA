using System;
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
    Transform destinationTable;
    Transform destinationPatient;
    List<PickStage> pickOxygen;

    public GiveOxygen(ECA eca, Oxygen oxygen, Patient patient, AirwayTable airwayTable) : base(eca)
    {
        this.oxygen = oxygen;
        giveOxygenPosition = patient.GetGiveOxygenPosition();
        pumpPosition = patient.GetPumpPosition();
        destinationPatient = patient.GetDestinationAir();
        destinationTable = airwayTable.GetDestination();
        destinationMask = airwayTable.GetDestinationMask();
        destinationPump = airwayTable.GetDestinationPump();
        actionName = ActionName.GiveOxygen;
    }

    private void SetupPickMask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToMask = new GoToStage(destinationTable);
        pickOxygen = new List<PickStage>()
        {
            new PickStage(oxygen.GetOxygenMask(), 1, false, HandSide.LeftHand),
            new PickStage(oxygen.GetOxygenPump(), 1, false, HandSide.RightHand)
        };
        ECAParallelActionStage pick = new ECAParallelActionStage(pickOxygen.ToArray());
        LookStableStage lookPatient = new LookStableStage(giveOxygenPosition);
        GoToStage goToPatient = new GoToStage(destinationPatient);
        WaitStage wait = new WaitStage(1f);
        List<PlaceObjectStage> putOxygen = new List<PlaceObjectStage>()
        {
            new PlaceObjectStage(pickOxygen[0], giveOxygenPosition, true),
            new PlaceObjectStage(pickOxygen[1], pumpPosition, false)
        };
        ECAParallelActionStage put = new ECAParallelActionStage(putOxygen.ToArray());
        WaitStage waitPost = new WaitStage(7f);
        waitPost.StageFinished += OnOxygenGiven;


        stages.Add(goToMask);
        stages.Add(pick);
        stages.Add(goToPatient);
        stages.Add(lookPatient);
        stages.Add(wait);
        stages.Add(put);
        stages.Add(waitPost);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void SetupPoseMask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        LookStableStage lookNull = new LookStableStage(giveOxygenPosition, 0f);

        List<FullBodyBipedEffector> effectors = new List<FullBodyBipedEffector>() {FullBodyBipedEffector.LeftHand};
        ResumeInteractionStage poseMask = new ResumeInteractionStage(effectors);

        GoToStage goToTable = new GoToStage(destinationTable);
        WaitStage wait = new WaitStage(1f);

        List<DropStage> drop = new List<DropStage>()
        {
            new DropStage(pickOxygen[0], destinationMask, .1f),
            new DropStage(pickOxygen[1], destinationPump, .1f)
        };

        ECAParallelActionStage dropOxygen = new ECAParallelActionStage(drop.ToArray());

        GoToStage goToPatient = new GoToStage(destinationPatient);

        stages.Add(lookNull);
        stages.Add(poseMask);
        stages.Add(goToTable);
        //stages.Add(wait);
        stages.Add(dropOxygen);
        stages.Add(goToPatient);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void OnOxygenGiven(object sender, EventArgs e)
    {
        eca.SendDirectMessage("Ho finito di dare l'ossigeno.");
    }

    public override void StartAction()
    {
        SetupPickMask();
        SetupPoseMask();
        base.StartAction();
    }

}
