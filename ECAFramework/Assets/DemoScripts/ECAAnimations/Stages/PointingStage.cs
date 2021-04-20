using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PointingStage : ECAActionStage
{
    Transform Target;
    IKECA IkManager;
    AvatarMask Mask;

    public PointingStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform target) : base(ecaAction, ecaAnimator)
    {
        Target = target;
        IkManager = ecaAnimator.gameObject.GetComponent<IKECA>();
        IkManager.SetTargetAimIK(IkManager.LeftHandIK, target, 0.1f);

        TryToSitIK.StopPointing += OnStopPointing;
    }

    public override void EndStage()
    {
        base.EndStage();
        IkManager.SetWeightTargetAimIK(IkManager.LeftHandIK, 0);

        DisactivateBodyParts();
        EcaAnimator.MxM_BlendInController(0);
    }

    public override void StartStage()
    {
        base.StartStage();
        IkManager.SetWeightTargetAimIK(IkManager.LeftHandIK, 1);

        ActivateBodyParts();
        EcaAnimator.MxM_BlendInController(1f);
    }

    private void OnStopPointing(object sender, EventArgs e)
    {
        EndStage();
    }

    protected override void ActivateBodyParts()
    {
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
    }

    protected override void DisactivateBodyParts()
    {
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, false);
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
        EcaAnimator.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, false);
    }

}
