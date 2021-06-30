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

    private IKEffector effector;
    private Transform dropTransform;
    private bool dropping;
    private bool dropped;
    private float duration;
    private bool activeRigidBody;

    public DropStage(PickStage pickStage, Transform dropTransform, float duration = .5f, bool activeRigidBody = false) : base()
    {
        this.pickStage = pickStage;
        this.typePick = pickStage.typePick;
        this.dropTransform = dropTransform;
        this.duration = duration;
        this.activeRigidBody = activeRigidBody;
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
        //ikManager.interactionSystem.speed = 0.2f;

        ikManager.interactionSystem.StopInteraction(pickStage.effector);

        WaitFor(1f);
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
        if (typePick == HandSide.LeftHand)
        {
            effector = ikManager.fullBodyBipedIK.solver.leftHandEffector;
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, .9f, duration);
        }
        else if (typePick == HandSide.RightHand)
        {
            effector = ikManager.fullBodyBipedIK.solver.rightHandEffector;
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, .9f, duration);
        }
        else if(typePick == HandSide.BothHands)
        {
            effector = ikManager.fullBodyBipedIK.solver.rightHandEffector;
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, .9f, duration);
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, dropTransform);
            ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, .9f, duration);
        }
        dropping = false;
    }

    public override void Update()
    {
        base.Update();

        if (effector != null)
        {
            if (effector.positionWeight > .89f && !dropping && !dropped)
            {
                obj.GetComponent<InteractionObject>().enabled = false;

                if (!activeRigidBody)
                    obj.transform.SetParent(dropTransform);
                else
                    obj.transform.SetParent(dropTransform);

                if (typePick == HandSide.LeftHand)
                    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0f, 2.5f);
                if (typePick == HandSide.RightHand)
                    ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0f, 2.5f);

                Debug.Log("position obj postdrop: " + obj.transform.position);
                dropped = true;

                if (activeRigidBody)
                {
                    if (obj.GetComponent<Rigidbody>() == null)
                        obj.gameObject.AddComponent<Rigidbody>();

                    obj.gameObject.GetComponent<Rigidbody>().useGravity = true;
                    obj.gameObject.GetComponent<Rigidbody>().isKinematic = false;
                }

            }
        }

        if (dropped)
        {
            //Debug.Log(effector.positionWeight);

            if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight < .02f || effector.positionWeight < .02f)
                EndStage();
        }


    }
}
