/* File GoToStage C# implementation of class GoToStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.AI;


// global declaration end

public class GoToStage : ECAActionStage
{

    private Transform destination;
    protected float stopDistance =   0.5f;
    protected float range = 0f;

    protected Vector3 randomDestination;

    public float StopDistance
    {
        set { stopDistance = value; }
        get { return stopDistance; }
    }


    public GoToStage(Transform destination) : base()
    {
        this.destination = destination;
    }

    public GoToStage(float range) : base()
    {
        this.range = range;
    }


    public override void StartStage()
    {
        base.StartStage();

        if (range != 0f)
            RandomDestination(range);
        else
            animator.navMeshAgent.SetDestination(destination.position);
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
        if (destination != null && Vector3.Distance(destination.position, animator.Eca.transform.position) <= stopDistance + 0.5f)
        {
            animator.navMeshAgent.isStopped = true;
            EndStage();
        }
        else if (Vector3.Distance(randomDestination, animator.Eca.transform.position) <= stopDistance + 0.5f)
            EndStage();
    }   

    /// <summary>
    /// Select a random destination in the NavMesh. Tries 30 times, if can't find a correct point returns false
    /// </summary>
    /// <param name="range">max distance from the ECA</param>
    /// <returns></returns>
    public bool RandomDestination(float range)
    {
        Vector3 center = animator.Eca.transform.position;

        for (int i = 0; i < 50; i++)
        {
            Vector3 randomPoint = center + UnityEngine.Random.insideUnitSphere * range;
            NavMeshHit hit;

            if (NavMesh.SamplePosition(randomPoint, out hit, 1.0f, NavMesh.AllAreas))
            {
                randomDestination = hit.position;
                animator.navMeshAgent.SetDestination(randomDestination);
                return true;
            }
        }

        return false;

    }


}
