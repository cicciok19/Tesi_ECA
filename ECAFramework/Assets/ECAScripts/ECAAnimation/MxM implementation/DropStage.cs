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
    private bool dropping;

    public DropStage(PickStage pickStage, Transform dropTransform) : base()
    {
        this.pickStage = pickStage;
        this.typePick = pickStage.typePick;
        this.dropTransform = dropTransform;
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

        dropping = true;

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
            dropping = false;

            if (typePick == HandSide.LeftHand)
            {
                ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, dropTransform);
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, .9f, .8f);
            }
            if (typePick == HandSide.RightHand)
            {
                ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, dropTransform);
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, .9f, .8f);
            }
        }
    }

    public override void Update()
    {
        if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight > .98f)
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
