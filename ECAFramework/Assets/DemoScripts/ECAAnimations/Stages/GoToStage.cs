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
    protected float range =  0f;
    protected int areaMask;
    protected Vector3 randomDestination;


    public GoToStage(Transform destination)
    : base()
    {
            this.destination = destination.position;
    }


    public GoToStage(Transform center, float range, int areaMask = 1)
    : base()
    {
            this.range = range;
            this.destination = center.position;
            this.areaMask = areaMask;
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
    
        //use this in order to not modify the destination transform
        Vector3 x;
    
        if (range != 0f)
            x = RandomDestination(range);
        else
            x = destination;
    
        animator.navMeshAgent.SetDestination(x);
    }


    public override void EndStage()
    {
        base.EndStage();
    }


    public float StopDistance
    {
        set { stopDistance = value; }
        get { return stopDistance; }
    }


    public Vector3 RandomDestination(float range)
    {
        Vector3 center = destination;
    
        for (int i = 0; i < 30; i++)
        {
            Vector3 randomPoint = center + UnityEngine.Random.insideUnitSphere * range;
            NavMeshHit hit;
    
            if (NavMesh.SamplePosition(randomPoint, out hit, 2f, 1 << areaMask))
            {
                Debug.DrawRay(hit.position, Vector3.up *20, Color.green, 10f);
                Vector3 x = hit.position;
                return x;
            }
        }
    
        //if didn't find a valid position returns ECA actual position
        return animator.Eca.transform.position;
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
