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


    public SitStage(SittableObject obj) : base()
    {
        Assert.IsNotNull(obj);
    
        sittableObject = obj;
        sitPoint = sittableObject.GetSitPoint();
        rightFootEffector = sittableObject.GetRightFootTransform();
        leftFootEffector = sittableObject.GetLeftFootTransform();
    }




    protected void SetWeightsForSitting()
    {
        //ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);
    
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.bodyEffector, 0.6f, 0.5f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightFootEffector, 0.7f, 0.5f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 0.7f, 0.5f);
        //ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0.25f, 0.5f);
        //ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0.25f, 0.5f);
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();

        SetWeightsForSitting();
    }

    public override void Update()
    {
        base.Update();
    }

    public override void StartStage()
    {
        base.StartStage();

        ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);

        animator.Eca.DisactivateNavMeshAgent();

        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftHandEffector, 0.25f, 0.5f);
        ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.rightHandEffector, 0.25f, 0.5f);

        animator.TriggerAnimation("SitDown", sitPoint);

        WaitFor(.2f);
        animator.Eca.DetachEvent("SittableBusy", EventArgs.Empty);
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
