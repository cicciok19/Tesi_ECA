using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointAtStage : ECAActionStage
{
    Transform target;
    float time;

    bool wait1;
    bool wait2;
    bool sem;
    bool mecanimAnimator;

    ECAAnimatorMxM animatorMxM;

    public PointAtStage(Transform target, float time) : base()
    {
        this.time = time;
        this.target = target;
    }

    public override void StartStage()
    {
        base.StartStage();
        animatorMxM = (ECAAnimatorMxM)base.animator;

        wait1 = false;
        wait2 = false;
        sem = false;
        mecanimAnimator = false;

        ikManager.SetTargetAimIK(ikManager.leftHandIK, target, 1, .5f);

        ActivateLayer(1);
        ActivateBodyParts();
        animatorMxM.MxM_BlendController(1f, true);
        WaitFor(time);
    }

    public override void EndStage()
    {
        animatorMxM.MxM_BlendController(2.5f, false);

        DisactivateBodyParts();

        ikManager.leftHandIK.solver.target = null;

        base.EndStage();
    }


    protected override void OnWaitCompleted()
    {
        if (wait1 == false)
        {
            ikManager.SetWeightTargetAimIK(ikManager.leftHandIK, 0f, .5f);
            wait1 = true;
        }
        else if (wait2 == true)
        {
            wait2 = false;
            EndStage();
        }
    }


    public override void Update()
    {
        base.Update();


        if (ikManager.leftHandIK.solver.IKPositionWeight < .02f && wait1 && !sem)
        {
            sem = true;
            wait1 = false;
            DeactivateLayer(1);
        }

        if (animatorMxM.mecanimAnimator.GetLayerWeight(1) < .01f && mecanimAnimator)
        {
            mecanimAnimator = false;
            animatorMxM.MxM_BlendController(5f, false);
            wait1 = true;
            wait2 = true;
            WaitFor(2f);
        }
    }

    protected override void DeactivateLayer(int layerIndex)
    {
        base.DeactivateLayer(layerIndex);
        mecanimAnimator = true;
    }


    protected override void ActivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, true);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
    }

    protected override void DisactivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, false);
    }

}
