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
      set; get;
    }


    public override void Update()
    {
        if (Vector3.Distance(destination.position, animator.Eca.transform.position) <= stopDistance)
            EndStage();
    }   


}
