using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TurnStage : ECAActionStage
{
    private Transform target;
    private bool turnToSit;
    private ECAAnimatorMxM animatorMxM;

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
        Vector3 dir;

        if (turnToSit)
            dir = target.forward;
        else
            dir = (target.position - animatorMxM.Eca.transform.position).normalized;

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
        if (Vector3.Dot(target.forward, animator.Eca.transform.forward) > 0.9f)
            EndStage();
    }

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
        EndStage();
    }
}
