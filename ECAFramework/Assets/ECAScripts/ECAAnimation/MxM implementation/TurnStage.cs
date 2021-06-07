using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using RootMotion.FinalIK;

public class TurnStage : ECAActionStage
{
    private Transform target;
    private bool turnToSit;
    private ECAAnimatorMxM animatorMxM;
    private Transform leftFootPosition;
    private Vector3 dir;

    public TurnStage(Transform target, bool turnToSit = false, Transform leftFootPosition = null) : base()
    {
        this.target = target;
        this.turnToSit = turnToSit;
        this.leftFootPosition = leftFootPosition;

        //Debug.DrawRay(target.transform.position, target.transform.forward, Color.green, 10);
    }

    public override void StartStage()
    {
        base.StartStage();
        animatorMxM = (ECAAnimatorMxM)base.animator;

        if (turnToSit)
            dir = target.forward;
        else
        {
            var targetOnPlane = new Vector3();
            targetOnPlane = target.position;
            targetOnPlane.y = animatorMxM.Eca.transform.position.y;
            dir = (targetOnPlane - animatorMxM.Eca.transform.position).normalized;
            //Debug.DrawRay(target.transform.position, dir, Color.green, 10);
        }

        animatorMxM.m_trajectory.FaceDirectiononIdle = true;
        animatorMxM.m_trajectory.StrafeDirection = dir;

        WarpFoot();
        //TODO: change this, it's just for debug
        //WaitFor(.5f);
    }

    public override void EndStage()
    {
        base.EndStage();
        animatorMxM.m_trajectory.FaceDirectiononIdle = false;
    }

    public override void Update()
    {
        base.Update();
        //Debug.Log(Vector3.Dot(dir, animatorMxM.Eca.transform.forward));
        if (Vector3.Dot(dir, animatorMxM.Eca.transform.forward) > 0.9f)
            EndStage();
        else
            animatorMxM.m_trajectory.StrafeDirection = dir;
    }

    private void WarpFoot()
    {
        if(leftFootPosition != null)
        {
            if (ikManager.fullBodyBipedIK.solver.leftFootEffector.positionWeight == 0) 
            {
                ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, null, null, null, leftFootPosition.transform);
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 1);
            }
            else
            {
                ikManager.SetWeightsFullBodyIK(ikManager.fullBodyBipedIK.solver.leftFootEffector, 0);
            }
        }
    }
}
