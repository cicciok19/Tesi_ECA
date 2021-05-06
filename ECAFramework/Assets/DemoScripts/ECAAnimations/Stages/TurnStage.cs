using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform target;
    private bool turnToSit;
    private ECAAnimatorMxM animatorMxM;
    private Vector3 dir;

    public TurnStage(Transform target, bool turnToSit = false) : base()
    {
        this.target = target;
        this.turnToSit = turnToSit;

        
        Debug.DrawRay(target.transform.position, target.transform.forward, Color.green, 10);
    }

    public override void StartStage()
    {
        base.StartStage();
        animatorMxM = (ECAAnimatorMxM)animator;

        if (turnToSit)
            dir = target.forward;
        else
        {
            var targetOnPlane = new Vector3();
            targetOnPlane = target.position;
            targetOnPlane.y = animator.Eca.transform.position.y;
            dir = (targetOnPlane - animatorMxM.Eca.transform.position).normalized;
        }

        animatorMxM.m_trajectory.FaceDirectiononIdle = true;
        animatorMxM.m_trajectory.StrafeDirection = dir;

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
        if (Vector3.Dot(dir, animator.Eca.transform.forward) > 0.9f)
            EndStage();
    }
}
