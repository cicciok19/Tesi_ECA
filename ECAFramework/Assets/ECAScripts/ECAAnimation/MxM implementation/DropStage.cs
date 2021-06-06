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

    private Transform dropTransform;
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

        this.dropTransform = dropPosition;
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

        ikManager.interactionSystem.StopInteraction(pickStage.effector);
        ikManager.interactionSystem.ResumeAll();
    }

    public override void EndStage()
    {
        base.EndStage();

    }

    public override void LateUpdate()
    {
        if (dropping)
        {
            /*holdWeight = Mathf.SmoothDamp(holdWeight, 1f, ref holdWeightVel, .3f);

            obj.transform.position = Vector3.Lerp(objInitialPosition, pickDownPosition, holdWeight);
            obj.transform.rotation = Quaternion.Lerp(objInitiaRotation, pickDownRotation, holdWeight);
            */
            dropping = false;

            if (typePick == HandSide.LeftHand)
            {
                ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, dropTransform);
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, .9f, .6f);
            }
            if (typePick == HandSide.RightHand)
            {
                ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, dropTransform);
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, .9f, .6f);
            }
        }
    }

    public override void Update()
    {
        if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight > .89f)
        {
            obj.GetComponent<InteractionObject>().enabled = false;
            obj.transform.SetParent(dropTransform);

            Debug.Log("position obj postdrop: " + obj.transform.position);

            if (typePick == HandSide.LeftHand)
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0f);
            if (typePick == HandSide.RightHand)
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0f);


            Debug.Log("position obj postdrop: " + obj.transform.position);
            EndStage();
        }
    }
}
