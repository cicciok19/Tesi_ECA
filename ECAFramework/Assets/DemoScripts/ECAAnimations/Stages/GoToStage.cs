/* File GoToStage C# implementation of class GoToStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;


// global declaration end

public class GoToStage : ECAActionStage
{

    private Transform destination;

    protected float stopDistance =   0.5f;


    public GoToStage(Transform destination) : base()
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
        animator.navMeshAgent.SetDestination(destination.position);
    }


    public override void EndStage()
    {
        base.EndStage();
    }


    public float StopDistance
    {
        set { stopDistance = value; } get { return stopDistance; }
    }


    public override void Update()
    {
        base.Update();
        //Debug.Log(Vector3.Distance(destination.position, animator.Eca.transform.position));
        if (Vector3.Distance(destination.position, animator.Eca.transform.position) <= stopDistance + 0.5f)
        {
            animator.navMeshAgent.isStopped = true;
            animator.navMeshAgent.SetDestination(animator.transform.position);
            EndStage();
        }
    }   


}
