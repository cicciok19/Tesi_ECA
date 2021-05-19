/* File ECAAction C# implementation of class ECAAction */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Linq;


// global declaration end

public class ECAAction
{
    public event EventHandler CompletedAction;

    protected int actualStageIdx;
    protected ECA eca;

    public ECAAnimator ecaAnimator;
    public ECAActionStage[] AllStages;
    public IKSetter ikManager;


    public ECAAction(ECA eca, List<ECAActionStage> stages)
    {
        this.eca = eca;
        ecaAnimator = eca.ecaAnimator;
        SetStages(stages);
    }


    public ECAAction(ECAAnimator ecaAnimator, List<ECAActionStage> stages)
    {
        this.ecaAnimator = ecaAnimator;
        this.eca = ecaAnimator.Eca;
        foreach (var stage in stages)
        {
            stage.Animator = ecaAnimator;
            //stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
        actualStageIdx = 0;
    }


    public ECAAction(ECA eca, ECAActionStage stage)
    {
        this.eca = eca;
        ecaAnimator = eca.ecaAnimator;
        AllStages = new ECAActionStage[1];
        AllStages[0] = stage;
        stage.Animator = eca.ecaAnimator;
        actualStageIdx = 0;
    }


    public ECAAction(ECA eca)
    {
        this.eca = eca;
        ecaAnimator = eca.ecaAnimator;
    }




    protected virtual void GetIkManager(ECA eca)
    {
        ikManager = eca.GetComponent<IKSetter>();
    }


    protected virtual void OnStageFinished(object sender, EventArgs e)
    {
        Detach(ActualStage);
        actualStageIdx++;
        NextStage();
    }


    protected virtual void OnStageAborted(object sender, EventArgs e)
    {
        Utility.Log("Stage " + sender.GetType() + " has aborted");
        Detach(ActualStage);
    }


    protected virtual void OnStagePaused(object sender, EventArgs e)
    {
        Utility.Log("Stage " + sender.GetType() + " has paused");
    }


    protected void Attach(ECAActionStage stage)
    {
        stage.StageFinished += OnStageFinished;
        stage.StageAborted += OnStageAborted;
        stage.StagePaused += OnStagePaused;
    }


    protected void Detach(ECAActionStage stage)
    {
        stage.StageFinished -= OnStageFinished;
        stage.StageAborted -= OnStageAborted;
        stage.StagePaused -= OnStagePaused;
    }


    protected virtual void OnStateUpdate(object sender, EventArgs e)
    {
    }


    protected virtual void OnLabelUpdate(object sender, EventArgs e)
    {
    }


    protected virtual void NextStage()
    {
        if (ActualStage != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            Attach(ActualStage);
            ActualStage.StartStage();
        }
        else
            OnCompletedAction();
    }


    protected void SetStages(List<ECAActionStage> stages)
    {
        foreach(var stage in stages)
        {
    	    stage.Animator = eca.ecaAnimator;
            //stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
        actualStageIdx = 0;
    }




    public void Pause()
    {
        Utility.Log("Action paused");
        State = ActionState.Paused;
    }


    public void Abort()
    {
        Utility.Log("Action aborted");
        State = ActionState.Aborted;
    }


    public void Resume()
    {
        if(State == ActionState.Paused)
        {
            Utility.Log("Action resumed");
            State = ActionState.Running;
            ActualStage.ResumeStage();
        }
    }


    public virtual void OnEmotionChanged(ECAEmotion emotion)
    {
        ActualStage.ReactToEmotionChanged(emotion);
    }


    public virtual void OnEmotionUpdated(ECAEmotion emotion)
    {
        ActualStage.ReactToEmotionUpdated(emotion);
    }


    public virtual void StartAction()
    {
        if (AllStages != null)
        {
            if(ActualStage != null)
            {
    		if(ecaAnimator.actualAction != null && 
    		(ecaAnimator.actualAction.State == ActionState.Running || ecaAnimator.actualAction.State == ActionState.Paused))
    			  ecaAnimator.actualAction.Abort();
    
    		State = ActionState.Running;
    		Attach(ActualStage);	
    		ActualStage.StartStage();
    		ecaAnimator.actualAction = this;
            }
        }
    }


    public virtual void OnCompletedAction()
    {
        State = ActionState.Completed;
    
        if (CompletedAction != null)
            CompletedAction(this, EventArgs.Empty);
    }


    public ActionState State
    {
        set {
    	if(ActualStage == null)
    		return;
    
            if (value == ActionState.Paused)
    		    ActualStage.PauseStage();
    	    else
    	    if(value == ActionState.Aborted)
    		    ActualStage.AbortStage();
    	    else
                ActualStage.State = value;
        }
      get {
    	if(ActualStage != null)
    		return ActualStage.State;
    	else
    		return ActionState.Inactive;
      }
    }


    public ECAActionStage ActualStage
    {
        get
        {
            try
            {
                if (AllStages != null && actualStageIdx >= 0 && actualStageIdx < AllStages.Length)
                    return AllStages[actualStageIdx];
    
            }
            catch (Exception e)
            {
                Utility.LogError("Generated exception :: " + e.Message);
            }
    
    
            return null;
        }
    }


}
