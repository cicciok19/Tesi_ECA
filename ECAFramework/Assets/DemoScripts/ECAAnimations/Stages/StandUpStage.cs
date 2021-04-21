using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StandUpStage : ECAActionStage
{
    Transform sitPoint;
    ECAAnimatorMxM animatorMxM;

    public StandUpStage(Transform sitPoint)
    {
        this.sitPoint = sitPoint;
    }

    public override void StartStage()
    {
        animatorMxM = (ECAAnimatorMxM)animator;

        base.StartStage();
        animatorMxM.MxM_ClearRequiredTags();
        animatorMxM.MxM_BeginEvent("StandUp", sitPoint);
        //EcaAnimator.IK_setWeight(false);

        EndStage();
    }

    public override void EndStage()
    {
        animatorMxM.MxM_WaitForEventComplete();
        base.EndStage();
    }

    public override void ReactToActionFinished(object sender, EventArgs e)
    {

    }
}
