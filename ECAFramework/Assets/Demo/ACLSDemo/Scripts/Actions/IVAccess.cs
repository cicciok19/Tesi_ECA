using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class IVAccess : ECAAction
{
    private IVTube ivTube;
    private Transform injectionPosition;
    private Vector3 destination;
    private MedicationProvider medicationProvider;

    public IVAccess(ECA eca, IVTube ivTube, Patient patient) : base(eca)
    {
        medicationProvider = (MedicationProvider)eca;
        this.ivTube = ivTube;
        injectionPosition = patient.GetInjectionPosition();
        destination = medicationProvider.GetDestinationNearTable();
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToTable = new GoToStage(ivTube.GetDestination());
        PickStage pickTube = new PickStage(ivTube.GetVeinTube(), 1f, false, HandSide.RightHand);
        GoToStage goToMainPosition = new GoToStage(destination);
        LookStableStage lookVein = new LookStableStage(injectionPosition);
        DropStage findVein = new DropStage(pickTube, injectionPosition);
        LookStableStage noLook = new LookStableStage(injectionPosition, 0);

        stages.Add(goToTable);
        stages.Add(pickTube);
        stages.Add(goToMainPosition);
        stages.Add(lookVein);
        stages.Add(findVein);
        stages.Add(noLook);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }
}
