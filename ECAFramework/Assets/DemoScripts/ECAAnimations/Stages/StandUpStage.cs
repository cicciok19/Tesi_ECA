using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StandUpStage : ECAActionStage
{
    Transform sitPoint;
    ECAAnimatorMxM animatorMxM;
    IKECA ikManager;

    public StandUpStage(Transform sitPoint)
    {
        this.sitPoint = sitPoint;
    }

    //if you want to use IK use this constructor
    public StandUpStage(Transform sitPoint, IKECA ikManager)
    {
        this.sitPoint = sitPoint;
        this.ikManager = ikManager;
    }

    public override void StartStage()
    {
        animatorMxM = (ECAAnimatorMxM)animator;

        base.StartStage();
        animatorMxM.MxM_ClearRequiredTags();
        animatorMxM.MxM_BeginEvent("StandUp", sitPoint);

        if (ikManager != null)
            ikManager.SetWeightsToStandUp();

        animatorMxM.EventComplete += OnEventComplete;
        animatorMxM.MxM_WaitForEventComplete();
    }

    public override void EndStage()
    {
        base.EndStage();
    }
}
