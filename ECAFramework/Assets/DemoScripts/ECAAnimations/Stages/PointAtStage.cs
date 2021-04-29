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
        animatorMxM = (ECAAnimatorMxM)animator;

        wait1 = false;
        wait2 = false;
        sem = false;
        mecanimAnimator = false;

        ikManager.SetTargetAimIK(ikManager.leftHandIK, target, 1, .5f);
        
        //ikManager.SetWeightTargetAimIK(ikManager.leftHandIK, 1);

        animatorMxM.WaitComplete += OnWaitComplete;

        ActivateLayer(1,1);
        ActivateBodyParts();
        animatorMxM.MxM_BlendController(1f);
        animatorMxM.Wait(time);
    }

    public override void EndStage()
    {

        animatorMxM.WaitComplete -= OnWaitComplete;
        animatorMxM.MxM_BlendController(2.5f);

        DisactivateBodyParts();

        ikManager.leftHandIK.solver.target = null;

        base.EndStage();
    }


    private void OnWaitComplete(object sender, EventArgs e)
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

    protected override void ActivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, true, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true, true);
    }

    protected override void DisactivateBodyParts()
    {
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, false, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, false, false);
        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, false, true);
    }

    public override void Update()
    {
        base.Update();

        if (ikManager.leftHandIK.solver.IKPositionWeight < .02f && wait1 && !sem)
        {
            sem = true;
            wait1 = false;
            DeactivateLayer(1,0);
        }

        if (animatorMxM.mecanimAnimator.GetLayerWeight(1) < .01f && mecanimAnimator)
        {
            mecanimAnimator = false;
            animatorMxM.MxM_BlendController(5f);
            wait1 = true;
            wait2 = true;
            animatorMxM.Wait(2f);
        }
    }

    protected override void DeactivateLayer(int layerIndex, float weightLayer)
    {
        animatorMxM.SetWeightLayerMecanicAnimator(layerIndex, weightLayer);
        mecanimAnimator = true;
    }

    protected override void ActivateLayer(int layerIndex, float weightLayer)
    {
        animatorMxM.SetWeightLayerMecanicAnimator(layerIndex, weightLayer);
    }
}
