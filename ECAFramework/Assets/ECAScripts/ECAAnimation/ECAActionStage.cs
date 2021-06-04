/* File ECAActionStage C# implementation of class ECAActionStage */

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
using UnityEngine.Assertions;
using System;

	public enum ActionState {
	Inactive,
	Running,
	Paused,
	Aborted,
	Completed
}


// global declaration end

public abstract class ECAActionStage
{
    public event EventHandler StageFinished;
    public event EventHandler StageAborted;
    public event EventHandler StagePaused;

    protected ECAAnimator animator;
    protected bool waitStatus = false;
    protected double waitTime;
    protected DateTime startTime;


    public ECAActionStage(ECAAnimator ecaAnimator = null)
    {
       animator = ecaAnimator;
       State = ActionState.Inactive;
    }




    protected virtual void ActivateBodyParts()
    {
    }


    protected virtual void DisactivateBodyParts()
    {
    }


    protected virtual void OnEventComplete(object sender, EventArgs e)
    {
        EndStage();
    }


    protected virtual void ActivateLayer(int layerIndex)
    {
        animator.SetWeightLayerMecanicAnimator(layerIndex, 1);
    }


    protected virtual void DeactivateLayer(int layerIndex)
    {
        animator.SetWeightLayerMecanicAnimator(layerIndex, 0);
    }


    protected void WaitFor(float seconds)
    {
        waitStatus = true;
        waitTime = seconds * 1000;
        startTime = DateTime.Now;
    }


    protected virtual void OnWaitCompleted()
    {
    }




    public ECAAnimator Animator
    {
      set {animator = value;} 
      get {return animator;}
    }


    public IKSetter ikManager
    {
      get {
    	Assert.IsNotNull(animator);
    	return animator.Eca.ikManager;
      }
    }


    public virtual void Update()
    {
      if(waitStatus)
      {
    	double elapsedMillisecs = ((TimeSpan)(DateTime.Now - startTime)).TotalMilliseconds;
    
    	if(elapsedMillisecs > waitTime)
    	{
    		waitStatus = false;
    		OnWaitCompleted();
     	}
      }
    }

    public virtual void LateUpdate()
    {

    }


    public virtual void PauseStage()
    {
        State = ActionState.Paused;
        if (StagePaused != null)
            StagePaused(this, EventArgs.Empty);
    }

    public virtual void ResumeStage()
    {
        State = ActionState.Running;
    }


    public virtual void AbortStage()
    {
        Utility.Log("Stage " + GetType() + " AbortStage() called");
    
        State = ActionState.Aborted;
    
        if (StageAborted != null)
            StageAborted(this, EventArgs.Empty);
    }


    public virtual void StartStage()
    {
    	State = ActionState.Running;
        if (animator.currentStage == null || animator.currentStage.GetType().ToString() != "ECAParallelActionStage")
            animator.currentStage = this;
    }


    public virtual void EndStage()
    {
        State = ActionState.Completed;
        if(animator.currentStage.GetType().ToString() != "ECAParallelActionStage")
            animator.currentStage = null;
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
    }


    public virtual void ReactToActionStart(object sender, EventArgs e)
    {
    }


    public virtual void ReactToStateUpdate(object sender, EventArgs e)
    {
    }


    public virtual void ReactToLabelUpdate(object sender, EventArgs e)
    {
    }


    public virtual void ReactToActionFinished(object sender, EventArgs e)
    {
    }

    public virtual void ReactToEmotionUpdated(ECAEmotion emotion) { }

    public virtual void ReactToEmotionChanged(ECAEmotion emotion) { }


    public ActionState State
    {
      set; get;
    }

    protected void LaunchStageFinished()
    {
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
    }


}
