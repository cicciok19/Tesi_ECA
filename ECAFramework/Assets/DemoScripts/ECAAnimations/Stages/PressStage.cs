using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PressStage : ECAActionStage
{
    PressableObject objToPress;
    ECAAnimatorMxM animatorMxM;
    int counter;
    HandSide handSide;

    bool startEvaluate;
    bool ended;
    bool sem;

    public PressStage(PressableObject obj, HandSide hs = HandSide.Nothing, int c = 0) : base()
    {
        objToPress = obj;
        if (c == 0)
            counter = (int)Mathf.Round(UnityEngine.Random.Range(2f, 5f));
        else
            counter = c;
        handSide = hs;
    }


    public override void StartStage()
    {
        base.StartStage();
        animatorMxM = (ECAAnimatorMxM)base.animator;

        if(handSide == HandSide.Nothing)
        {
            Transform rightHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
            Transform leftHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);

            if (Vector3.Distance(rightHand.position, objToPress.transform.position) < Vector3.Distance(leftHand.position, objToPress.transform.position))
                handSide = HandSide.RightHand;
            else
                handSide = HandSide.LeftHand;
        }

        startEvaluate = false;
        ended = false;
        sem = false;


        ikManager.AimCompleted += OnAimCompleted;

        if(handSide == HandSide.LeftHand)
        {
            ActivateLayer(1);
            ikManager.SetTargetAimIK(ikManager.leftHandIK, objToPress.GetPressPosition().transform, 1, .5f);
        }
        else if(handSide == HandSide.RightHand)
        {
            ActivateLayer(2);
            ikManager.SetTargetAimIK(ikManager.rightHandIK, objToPress.GetPressPosition().transform, 1, .5f);
        }

        ActivateBodyParts();
        animatorMxM.MxM_BlendController(1f, true);
    }

    public override void Update()
    {
        base.Update();

        if (startEvaluate)
        {
            if(handSide == HandSide.LeftHand)
            {
                if (ikManager.leftHandIK.solver.IKPositionWeight < .02f && !sem)
                {
                    sem = true;
                    DeactivateLayer(1);
                }
                if (animatorMxM.mecanimAnimator.GetLayerWeight(1) < .01f && !ended)
                {
                    animatorMxM.MxM_BlendController(5f, false);
                    ended = true;
                    WaitFor(2f);
                }
            }
            else if (handSide == HandSide.RightHand)
            {
                if (ikManager.rightHandIK.solver.IKPositionWeight < .02f && !sem)
                {
                    sem = true;
                    DeactivateLayer(2);
                }
                if (animatorMxM.mecanimAnimator.GetLayerWeight(2) < .01f && !ended)
                {
                    animatorMxM.MxM_BlendController(5f, false);
                    ended = true;
                    WaitFor(2f);
                }
            }
        }

    }

    private void OnAimCompleted(object sender, EventArgs e)
    {
        //WaitFor(UnityEngine.Random.Range(2.0f, 5.0f));
        WaitFor(0.5f);
    }

    protected override void OnWaitCompleted()
    {
        counter--;

        if (counter == 0 && !ended)
        {
            startEvaluate = true;
            if(handSide == HandSide.LeftHand)
                ikManager.SetWeightTargetAimIK(ikManager.leftHandIK, 0f, 0.2f);
            else
                ikManager.SetWeightTargetAimIK(ikManager.rightHandIK, 0f, 0.2f);

        }
        else if(counter > 0)
        {
            if (handSide == HandSide.LeftHand)
                ikManager.SetTargetAimIK(ikManager.leftHandIK, Randomize.GetRandomPosition(objToPress.gameObject));
            else
                ikManager.SetTargetAimIK(ikManager.rightHandIK, Randomize.GetRandomPosition(objToPress.gameObject));
        }

        if (ended)
            EndStage();

    }

    protected override void ActivateBodyParts()
    {
        if(handSide == HandSide.LeftHand)
        {
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
        }
        else if (handSide == HandSide.RightHand)
        {
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightArm, true);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, true);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightHandIK, true);
        }

        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, true);
    }

    protected override void DisactivateBodyParts()
    {
        if (handSide == HandSide.LeftHand)
        {
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, false);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, false);
        }
        else if (handSide == HandSide.RightHand)
        {
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightArm, false);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, false);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightHandIK, false);
        }

        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, false);
    }
}
