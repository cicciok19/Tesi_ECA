using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointAtStage : ECAActionStage
{
    Transform target;
    float time;

    ECAAnimatorMxM animatorMxM;

    public PointAtStage(Transform target, float time) : base()
    {
        this.time = time;
    }


    public override void StartStage()
    {
        base.StartStage();
        animatorMxM = (ECAAnimatorMxM)animator;

        ikManager.SetTargetAimIK(ikManager.leftHandIK, target);
        
        //ikManager.SetWeightTargetAimIK(ikManager.leftHandIK, 1);

        animatorMxM.WaitComplete += OnWaitComplete;

        ActivateBodyParts();
        animatorMxM.MxM_BlendController(1f);
        animatorMxM.Wait(time);
    }

    public override void EndStage()
    {
        ikManager.SetWeightTargetAimIK(ikManager.leftHandIK, 0f);

        //DisactivateBodyParts();

        animatorMxM.WaitComplete -= OnWaitComplete;
        animatorMxM.MxM_BlendController(0);

        base.EndStage();
    }


    private void OnWaitComplete(object sender, EventArgs e)
    {
        EndStage();
    }

    protected override void ActivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
    }

    protected override void DisactivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, false);
    }
}
