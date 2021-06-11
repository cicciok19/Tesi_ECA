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
    private bool dropped;

    public DropStage(PickStage pickStage, Transform dropTransform) : base()
    {
        this.pickStage = pickStage;
        this.typePick = pickStage.typePick;
        this.dropTransform = dropTransform;
    }

    public DropStage(PickStage pickStage) : base()
    {
        this.pickStage = pickStage;
        this.typePick = pickStage.typePick;
    }

    public override void StartStage()
    {
        base.StartStage();

        animatorMxM = (ECAAnimatorMxM)animator;

        this.obj = pickStage.obj;

        dropping = true;
        dropped = false;

        ikManager.interactionSystem.StopInteraction(pickStage.effector);

        WaitFor(.8f);
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
        if (typePick == HandSide.LeftHand)
        {
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, .9f, .5f);
        }
        if (typePick == HandSide.RightHand)
        {
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, .9f, .5f);
        }
        dropping = false;
    }

    public override void Update()
    {
        base.Update();

        if ((ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight > .89f || ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight > .89f) && !dropping && !dropped)
        {
            obj.GetComponent<InteractionObject>().enabled = false;
            obj.transform.SetParent(dropTransform);

            if (typePick == HandSide.LeftHand)
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0f, .5f);
            if (typePick == HandSide.RightHand)
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0f, .5f);

            Debug.Log("position obj postdrop: " + obj.transform.position);
            dropped = true;
        }

        if (dropped)
        {
            if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight < .02f || ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight < .02f)
                EndStage();
        }


    }
}
