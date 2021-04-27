/* File ECAActionStage C# implementation of class ECAActionStage */



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

    protected virtual void ActivateLayer(int layerIndex, float weightLayer)
    {

    }

    protected virtual void DeactivateLayer(int layerIndex, float weightLayer)
    {

    }


    protected virtual void OnEventComplete(object sender, EventArgs e)
    {
        EndStage();
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
    }


    public virtual void PauseStage()
    {
        State = ActionState.Paused;
        if (StagePaused != null)
            StagePaused(this, EventArgs.Empty);
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
    	animator.currentStage = this;
    }


    public virtual void EndStage()
    {
        State = ActionState.Completed;
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


    public ActionState State
    {
      set; get;
    }


}
