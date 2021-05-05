/* File GoToStage C# implementation of class GoToStage */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.AI;


// global declaration end

public class GoToStage : ECAActionStage
{

    private Vector3 destination;
    protected float stopDistance = 0.5f;
    public float StopDistance
    {
        set { stopDistance = value; }
        get { return stopDistance; }
    }


    public GoToStage(Transform destination)
    : base()
    {
            this.destination = destination.position;
    }

    public GoToStage(Vector3 destination)
    : base()
    {
            this.destination = destination;
    }

    private void OnArrivedECA(object sender, EventArgs e)
    {
        EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();
        Vector3 x = destination;

        //use this in order to not modify the destination transform
        if (animator.Eca.ecaInTrigger == 0)
            animator.navMeshAgent.SetDestination(x);
        else
            animator.Eca.currentAction.Pause();
    }

    public override void EndStage()
    {
        base.EndStage();
        //animator.Eca.DisactivateNavMeshAgent();
    }



    public override void AbortStage()
    {
        base.AbortStage();
        animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
    }

    public override void PauseStage()
    {
        base.PauseStage();
        animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
    }

    public override void ResumeStage()
    {
        base.ResumeStage();
        //animator.Eca.ActivateNavMeshAgent();
        StartStage();
    }


    public override void Update()
    {
        base.Update();
    
        if (Vector3.Distance(destination, animator.Eca.transform.position) <= stopDistance + 0.5f)
        {
            animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
            EndStage();
        }
    }


}
