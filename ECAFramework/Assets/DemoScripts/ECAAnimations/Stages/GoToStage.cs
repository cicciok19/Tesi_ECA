/* File GoToStage C# implementation of class GoToStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.AI;

public class GoToStage : ECAActionStage
{
    //global declaration start
    private Transform destination;
    protected float stopDistance =   0.5f;
    protected float range = 0f;
    protected int areaMask;
    

    protected Vector3 randomDestination;

    public float StopDistance
    {
        set { stopDistance = value; }
        get { return stopDistance; }
    }

    //global declaration end


    public GoToStage(Transform destination) : base()
    {
        this.destination = destination;
    }

    /// <summary>
    /// Use this if you want to generate a random destination around the center
    /// </summary>
    /// <param name="center"></param>
    /// <param name="range"></param>
    public GoToStage(Transform center, float range, int areaMask = 1) : base()
    {
        this.range = range;
        this.destination = center;
        this.areaMask = areaMask;
    }


    public override void StartStage()
    {
        base.StartStage();

        //use this in order to not modify the destination transform
        Vector3 x;

        if (range != 0f)
            x = RandomDestination(range);
        else
            x = destination.position;

        animator.navMeshAgent.SetDestination(x);
    }


    public override void EndStage()
    {
        base.EndStage();
    }

    private void OnArrivedECA(object sender, EventArgs e)
    {
        EndStage();
    }

    public override void Update()
    {
        base.Update();

        if (Vector3.Distance(destination.position, animator.Eca.transform.position) <= stopDistance + 0.5f)
        {
            animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
            EndStage();
        }
    }   

    /// <summary>
    /// Select a random destination in the NavMesh. Tries 30 times, if can't find a correct point returns false
    /// </summary>
    /// <param name="range">max distance from the ECA</param>
    /// <param name="x">destination point that this method returns</param>
    /// <returns></returns>
    public Vector3 RandomDestination(float range)
    {
        Vector3 center = destination.transform.position;

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

    //when the stage is aborted the ECA will stop waliùking
    public override void AbortStage()
    {
        base.AbortStage();
        animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
    }
}
