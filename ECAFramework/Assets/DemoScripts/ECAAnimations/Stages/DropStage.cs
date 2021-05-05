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
    private Transform target;
    private TypePick typePick;
    private InteractionSystem interactionSystem;
    private InteractionObject obj;

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

        this.dropPosition = dropPosition.position;
        this.dropRotation = dropPosition.rotation;
    }

    public DropStage(PickStage pickStage) : base()
    {
        this.pickStage = pickStage;
        this.target = pickStage.target;
        this.typePick = pickStage.typePick;
        this.interactionSystem = pickStage.interactionSystem;
        this.obj = pickStage.obj;
    }

    public override void StartStage()
    {
        base.StartStage();

        this.target = pickStage.target;
        this.typePick = pickStage.typePick;
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

        if(obj.transform.position == pickDownPosition)
        {
            dropping = false;
            EndStage();
        }
    }
}
