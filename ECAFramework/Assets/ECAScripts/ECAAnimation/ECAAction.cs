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

    public int CurrentStageIdx;
    public ECAActionStage[] AllStages;
    public ECAAnimator EcaAnimator;
    public IKSetter ikManager;


    public ECAAction(ECA eca, List<ECAActionStage> stages)
    {
        EcaAnimator = eca.ecaAnimator;
        foreach(var stage in stages)
        {
    	    stage.Animator = eca.ecaAnimator;
            //stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
        SetupAction();
    }


    public ECAAction(ECAAnimator ecaAnimator, List<ECAActionStage> stages)
    {
        EcaAnimator = ecaAnimator;
        foreach(var stage in stages)
        {
            stage.Animator = ecaAnimator;
            //stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
        SetupAction();
    }




    protected virtual void GetIkManager(ECA eca)
    {
        ikManager = eca.GetComponent<IKSetter>();
    }


    protected virtual void OnStageFinished(object sender, EventArgs e)
    {
        Detach(CurrentStage);
        CurrentStageIdx++;
        NextStage();
    }


    protected virtual void OnStageAborted(object sender, EventArgs e)
    {
        Utility.Log("Stage " + sender.GetType() + "has aborted");
        Detach(CurrentStage);
    }


    protected virtual void OnStagePaused(object sender, EventArgs e)
    {
        Utility.Log("Stage " + sender.GetType() + "has paused");
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




    public virtual void SetupAction()
    {
        CurrentStageIdx = 0;
        CurrentStage.StageFinished += OnStageFinished;
    }


    public void Abort()
    {
        Utility.Log("Action aborted");
        State = ActionState.Aborted;
    }


    public ECAActionStage CurrentStage
    {
        get
        {
            if (CurrentStageIdx >= 0 && CurrentStageIdx < AllStages.Length)
                return AllStages[CurrentStageIdx];
    
            return null;
        }
    }


    public virtual void StartAction()
    {
        if (AllStages != null)
        {
            if(CurrentStage != null)
            {
    		State = ActionState.Running;
    		Attach(CurrentStage);
                	CurrentStage.StartStage();
            }
        }
    }


    public virtual void NextStage()
    {
        if (CurrentStage != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            Attach(CurrentStage);
            CurrentStage.StartStage();
        }
        else
            OnCompletedAction();
    }


    public virtual void OnCompletedAction()
    {
        if (CompletedAction != null)
            CompletedAction(this, EventArgs.Empty);
    }


    public virtual void OnStateUpdate()
    {
    }


    public virtual void OnLabelUpdate()
    {
    }


    public ActionState State
    {
        set {
    	if(CurrentStage == null)
    		return;
    
            if (value == ActionState.Paused)
    		CurrentStage.PauseStage();
    	    else
    	    if(value == ActionState.Aborted)
    		    CurrentStage.AbortStage();
    	    else
                	CurrentStage.State = value;
        }
      get {
    	if(CurrentStage != null)
    		return CurrentStage.State;
    	else
    		return ActionState.Inactive;
      }
    }


}
