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


    public GoToStage(Transform destination)
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
        animator.GoTo(destination.position, 0.05f);
        animator.HasArrived += OnArrivedECA;
    }


    public override void EndStage()
    {
        base.EndStage();
    }


}
