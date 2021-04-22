/* File SitStage C# implementation of class SitStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;


// global declaration end

class SitStage : ECAActionStage
{

    private Transform sitPoint;
    private Transform leftFootEffector;
    private Transform rightFootEffector;

    protected SittableObject sittableObject;


    public SitStage(SittableObject obj)
    {
        Assert.IsNotNull(obj);
    
        sittableObject = obj;
        sitPoint = sittableObject.GetSitPoint();
        rightFootEffector = sittableObject.GetRightFootTransform();
        leftFootEffector = sittableObject.GetLeftFootTransform();
    }




    protected void SetWeightsForSitting()
    {
        ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);
    
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.bodyEffector, 0.6f, 0.02f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightFootEffector, 0.7f, 0.01f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 0.7f, 0.01f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0.2f, 0.05f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0.2f, 0.05f);
    }




    public override void StartStage()
    {
        Utility.Log("SitStage::StartStage");
        animator.TriggerAnimation("SitDown", sitPoint);
    
        SetWeightsForSitting();
        sittableObject.Occupied = true;
    
        animator.TriggeredAnimationComplete += OnEventComplete;
        animator.WaitForTriggeredAnimationComplete();
    }


    public override void EndStage()
    {
        animator.SetAnimationGroup("Sitting");
        base.EndStage();
    }


}
