using RootMotion.FinalIK;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using MxM;

public class PressButtonStage : ECAActionStage
{
    internal PressableObject target;
    internal HandSide hand = HandSide.Nothing;
    internal FullBodyBipedEffector effector;

    internal ECAAnimatorMxM animatorMxM;
    internal Animator mecanimAnimator;

    internal InteractionObject interactionObj; // The object to pick up
    private Transform pivot; // The pivot point of the hand targets

    private Transform startPosition;
    private bool startEvaluate = false;


    public PressButtonStage(PressableObject target, HandSide hs = HandSide.Nothing) : base()
    {
        this.target = target;
        Assert.IsNotNull(target);
        hand = hs;
    }

    public override void StartStage()
    {
        base.StartStage();

        animatorMxM = (ECAAnimatorMxM)animator;

        interactionObj = target.GetComponentInChildren<InteractionObject>();
        Assert.IsNotNull(interactionObj);

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
                startPosition = leftHand;
            }

        }

        SetupInteractionSystem();

        if (hand == HandSide.LeftHand)
        {
            effector = FullBodyBipedEffector.LeftHand;
            startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, interactionObj, false);
        }
        else if (hand == HandSide.RightHand)
        {
            effector = FullBodyBipedEffector.RightHand;
            startPosition = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, interactionObj, false);
        }

        WaitFor(2f);
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
        startEvaluate = true;
    }

    public override void Update()
    {
        base.Update();
        if (startEvaluate)
        {
            if (hand == HandSide.RightHand)
            {
                if (Vector3.Distance(startPosition.position, animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand).position) < 0.5f)
                    EndStage();
            }
            else
            {
                if (Vector3.Distance(startPosition.position, animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand).position) < 0.5f)
                    EndStage();
            }
        }
 
    }

    private void SetupInteractionSystem()
    {
        ikManager.interactionSystem.Start();
        ikManager.interactionSystem.speed = .5f;
    }
}
