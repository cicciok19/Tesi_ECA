using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using RootMotion.FinalIK;
using RootMotion;
using System;

public class DropStage : ECAActionStage
{
    private PickStage pickStage;
    private InteractionSystem interactionSystem;
    private InteractionObject obj;
    private TypePick typePick;

    private ECAAnimatorMxM animatorMxM;

    private Vector3 dropPosition;
    private Quaternion dropRotation;
    private Vector3 pickDownPosition;
    private Vector3 objInitialPosition;
    private Quaternion pickDownRotation;
    private Quaternion objInitiaRotation;
    private bool dropping;
    private float holdWeight, holdWeightVel;


    public DropStage(PickStage pickStage, Transform dropPosition) : base()
    {
        this.pickStage = pickStage;
        this.typePick = pickStage.typePick;

        this.dropPosition = dropPosition.position;
        this.dropRotation = dropPosition.rotation;
    }

    public DropStage(PickStage pickStage) : base()
    {
        this.pickStage = pickStage;
        this.interactionSystem = pickStage.interactionSystem;
        this.obj = pickStage.obj;
    }

    public override void StartStage()
    {
        base.StartStage();

        animatorMxM = (ECAAnimatorMxM)animator;

        this.interactionSystem = pickStage.interactionSystem;
        this.obj = pickStage.obj;

        pickDownPosition = dropPosition;
        pickDownRotation = dropRotation;
        objInitialPosition = obj.transform.position;
        objInitiaRotation = obj.transform.rotation;

        dropping = true;
        holdWeight = 0f;
        holdWeightVel = 0f;
    }

    public override void EndStage()
    {
        base.EndStage();

        interactionSystem.ResumeAll();
    }

    public override void LateUpdate()
    {
        if (dropping)
        {
            holdWeight = Mathf.SmoothDamp(holdWeight, 1f, ref holdWeightVel, .3f);

            obj.transform.position = Vector3.Lerp(objInitialPosition, pickDownPosition, holdWeight);
            obj.transform.rotation = Quaternion.Lerp(objInitiaRotation, pickDownRotation, holdWeight);
        }

        if (obj.transform.position == pickDownPosition)
        {
            dropping = false;

            /*animatorMxM.MxM_BlendController(1f, false);

            DisactivateBodyParts();

            if (typePick == TypePick.LeftHand)
            {
                DeactivateLayer(3);
            }
            else if (typePick == TypePick.RightHand)
            {
                DeactivateLayer(4);
            }
            else if (typePick == TypePick.BothHands)
            {
                DeactivateLayer(3);
                DeactivateLayer(4);
            }*/


            EndStage();
        }
    }

    /*
    protected override void DisactivateBodyParts()
    {
        if (typePick == TypePick.LeftHand)
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
        else if (typePick == TypePick.RightHand)
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, false);
        else if (typePick == TypePick.BothHands)
        {
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, false);
            animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, false);
        }

        animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, false);
    }
    */
}
