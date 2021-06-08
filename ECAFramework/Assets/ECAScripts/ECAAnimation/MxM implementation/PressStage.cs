using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Assertions;
using RootMotion.FinalIK;

public class PressStage : ECAActionStage
{
    internal PressableObject target;
    internal HandSide hand = HandSide.Nothing;
    internal FullBodyBipedEffector effector;

    internal ECAAnimatorMxM animatorMxM;
    internal Animator mecanimAnimator;

    internal InteractionObject interactionObj; // The object to pick up
    private Transform pivot; // The pivot point of the hand targets
    InteractionTarget interactionTarget;

    float timer, speed;
    private Transform startPosition;
    private bool startEvaluate = false;
    private int counter;

    public PressStage(PressableObject target, HandSide hs = HandSide.Nothing) : base()
    {
        this.target = target;
        Assert.IsNotNull(target);
        hand = hs;
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();

        animatorMxM = (ECAAnimatorMxM)animator;

        interactionObj = target.GetComponent<InteractionObject>();
        Assert.IsNotNull(interactionObj);

        InteractionTarget interactionTarget = interactionObj.GetComponentInChildren<InteractionTarget>();
        Assert.IsNotNull(interactionTarget);


        //does the start of the interactionSystem, mandatory
        SetupInteractionSystem();

        //choose type pick and starts the interaction
        SetTypePick();

        WaitFor(2f);
    }

    public override void Update()
    {
        base.Update();

        timer += Time.deltaTime * speed * (interactionTarget != null ? interactionTarget.interactionSpeedMlp : 1f);
        
        if (startEvaluate)
        {
            if (interactionObj.GetValue(InteractionObject.WeightCurve.Type.PoserWeight, interactionTarget, timer) < 0.01f)
                EndStage();
        }
    }

    protected override void OnWaitCompleted()
    {
        startEvaluate = true;
    }

    private void SetupInteractionSystem()
    {
        ikManager.interactionSystem.Start();
        ikManager.interactionSystem.speed = .5f;
        speed = ikManager.interactionSystem.speed;
    }

    private void SetTypePick()
    {
        if (hand == HandSide.Nothing)
        {
            Transform rightHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
            Transform leftHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);

            if (Vector3.Distance(rightHand.position, interactionObj.transform.position) < Vector3.Distance(leftHand.position, interactionObj.transform.position))
            {
                hand = HandSide.RightHand;
            }
            else
            {
                hand = HandSide.LeftHand;
            }
        }

        if (hand == HandSide.LeftHand)
        {
            effector = FullBodyBipedEffector.LeftHand;
            startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, interactionObj, true);
        }
        else if (hand == HandSide.RightHand)
        {
            effector = FullBodyBipedEffector.RightHand;
            startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, interactionObj, true);
        }
    }
}