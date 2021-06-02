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
    private InteractionObject obj;
    private HandSide typePick;

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
        this.obj = pickStage.obj;
    }

    public override void StartStage()
    {
        base.StartStage();

        animatorMxM = (ECAAnimatorMxM)animator;

        this.obj = pickStage.obj;

        //Transform dropPosition = animatorMxM.Eca.GetComponentInChildren<DropPosition>().transform;

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
        ikManager.interactionSystem.StopInteraction(pickStage.effector);
        ikManager.interactionSystem.ResumeAll();
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

            EndStage();
        }
    }
}
