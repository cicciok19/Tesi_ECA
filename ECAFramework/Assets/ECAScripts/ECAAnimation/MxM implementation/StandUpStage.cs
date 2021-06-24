/* File StandUpStage C# implementation of class StandUpStage */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

class StandUpStage : ECAActionStage
{
    private Transform leftFootEffector;
    private Transform rightFootEffector;

    protected Transform sitPoint;
    protected SittableObject sittableObject;

    public StandUpStage(SittableObject obj) : base()
    {
        Assert.IsNotNull(obj);
    
        sittableObject = obj;
        sitPoint = sittableObject.GetSitPoint();
        rightFootEffector = sittableObject.GetRightFootTransform();
        leftFootEffector = sittableObject.GetLeftFootTransform();
    }
    public override void StartStage()
    {
        base.StartStage();
        animator.TriggerAnimation("StandUp", sitPoint);

        SetWeightsToStandUp();

        animator.TriggeredAnimationComplete += OnEventComplete;
        animator.WaitForTriggeredAnimationComplete();
    }

    protected void SetWeightsToStandUp()
    {
        ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);
        
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.bodyEffector, 0, 0.01f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightFootEffector, 0, 0.01f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 0, 0.01f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0, 0.05f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0, 0.05f);
    }

    public override void EndStage()
    {
        animator.TriggeredAnimationComplete -= OnEventComplete;
        sittableObject.Occupied = false;
        animator.Eca.ActivateNavMeshAgent();

        animator.ClearAnimationGroup();

        base.EndStage();
    }
}
