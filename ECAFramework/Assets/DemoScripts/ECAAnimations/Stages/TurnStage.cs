using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform sitPoint;
    private bool turnToSit;

    //just for debug
    private int i;

    public TurnStage(Transform sitPoint, bool turnToSit) : base()
    {
        this.sitPoint = sitPoint;
        this.turnToSit = turnToSit;

        Debug.DrawRay(sitPoint.transform.position, sitPoint.transform.forward, Color.green, 10);
    }

    public override void StartStage()
    {
        base.StartStage();
        var animatorMxM = (ECAAnimatorMxM)animator;

        i = 0;

        Vector3 dir = sitPoint.forward;

        animatorMxM.m_trajectory.FaceDirectiononIdle = true;
        animatorMxM.m_trajectory.StrafeDirection = dir;

    }

    public override void EndStage()
    {
        base.EndStage();
        var animatorMxM = (ECAAnimatorMxM)animator;
        animatorMxM.m_trajectory.FaceDirectiononIdle = false;

    }

    public override void Update()
    {
        var avatarDir = animator.mecanimAnimator.GetBoneTransform(HumanBodyBones.Head).forward.normalized;
        if(Vector3.Dot(avatarDir, sitPoint.forward) >= 0.8f )
        {
            i++;
            if(i==500)
                EndStage();
        }
    }
}
