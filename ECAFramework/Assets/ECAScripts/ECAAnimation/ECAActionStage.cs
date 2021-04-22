/* File ECAActionStage C# implementation of class ECAActionStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;


// global declaration end

public abstract class ECAActionStage
{
    public event EventHandler StageFinished;

    protected ECAAnimator animator;


    public ECAActionStage(ECAAnimator ecaAnimator = null)
    {
       animator = ecaAnimator;
    }

    protected virtual void ActivateBodyParts()
    {
    }


    protected virtual void DisactivateBodyParts()
    {
    }

    public ECAAnimator Animator
    {
      set {animator = value;} 
      get {return animator;}
    }


    public virtual void StartStage()
    {
    }

    public virtual void EndStage()
    {
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


}
