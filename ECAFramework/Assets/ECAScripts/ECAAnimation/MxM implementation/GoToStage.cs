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
    private Transform objToFace;

    private bool warping =  false;
    private bool useWarping = true;
    private bool changeOrientationWhileWalking = false;

    private Vector3 warpDirection =  new Vector3();

    private float startWarpSpeed =  0;
    private float finalWarpSpeed =  0.3f;
    private float actualWarpSpeed =  0;

    protected float stopDistance =  0.5f;
    protected int areaMask;

    private ECAAnimatorMxM animatorMxM;


    public GoToStage(Transform destination, Transform objToFace = null, bool useWarping = true)
    : base()
    {
        this.useWarping = useWarping;
        this.destination = destination.position;
        if (objToFace != null)
            this.objToFace = objToFace;
    }


    public GoToStage(Vector3 destination, Transform objToFace = null, bool useWarping = true)
    : base()
    {
        this.useWarping = useWarping;
        this.destination = destination;
        if(objToFace!= null)
            this.objToFace = objToFace;
    }


    private void OnArrivedECA(object sender, EventArgs e)
    {
        EndStage();
    }




    public override void StartStage()
    {
        base.StartStage();
        //use this in order to not modify the destination transform
        Vector3 x = destination;

        animatorMxM = (ECAAnimatorMxM)animator;
    
        animator.navMeshAgent.SetDestination(x);
        animator.Eca.ecaInTrigger = 0;
    }


    public override void EndStage()
    {
        if (objToFace != null)
            animatorMxM.MxM_StopStrafing();
        animator.Eca.stopped = true;

        base.EndStage();
    }


    public float StopDistance
    {
        set { stopDistance = value; }
        get { return stopDistance; }
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

        float distance = Vector3.Distance(destination, animator.Eca.transform.position);

        if (distance <= 5f && !changeOrientationWhileWalking)
        {
            changeOrientationWhileWalking = true;
            if(objToFace != null)
                animatorMxM.MxM_StartStrafing(objToFace);
        }
    
        if (distance <= stopDistance + 0.5f && !warping)
        {
            //animator.navMeshAgent.SetDestination(animator.Eca.transform.position);
            //Debug.DrawRay(animator.Eca.transform.position, animator.Eca.transform.forward * 20, Color.red, 20f);
            warpDirection = animator.Eca.transform.forward;
            
            warping = true;
        }

        if (warping && useWarping)
        {
            if (distance >= 0.35f)
            {
                actualWarpSpeed = Mathf.SmoothDamp(actualWarpSpeed, 1f, ref startWarpSpeed, 3);
                animator.Eca.transform.position = Vector3.Lerp(animator.Eca.transform.position, destination, actualWarpSpeed);
            }
            else
                EndStage();
        }
        else if (warping && !useWarping)
            EndStage();
    }


    public void ChangeDestination(Vector3 newDestination, bool changeInstantly = true)
    {
        destination = newDestination;
        if(changeInstantly)
            animator.navMeshAgent.SetDestination(newDestination);
    }


}
