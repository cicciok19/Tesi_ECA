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


    public ECAAction(ECA eca, List<ECAActionStage> stages)
    {
        EcaAnimator = eca.ecaAnimator;
        foreach(var stage in stages)
        {
    	    stage.Animator = eca.ecaAnimator;
            stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
    }


    public ECAAction(ECAAnimator ecaAnimator, List<ECAActionStage> stages)
    {
        EcaAnimator = ecaAnimator;
        foreach(var stage in stages)
        {
            stage.Animator = ecaAnimator;
            stage.StageFinished += OnStageFinished;
        }
    
        AllStages = stages.ToArray();
    }




    public virtual void SetupAction()
    {
        CurrentStageIdx = 0;
        CurrentStage.StageFinished += OnStageFinished;
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
                CurrentStage.StartStage();
            }
        }
    }


    public virtual void NextStage()
    {
        if (CurrentStage != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            //CurrentStage.StageFinished += OnStageFinished;
            CurrentStage.StartStage();
        }
        else
            OnCompletedAction();
    }


    public virtual void OnStageFinished(object sender, EventArgs e)
    {
        CurrentStage.StageFinished -= OnStageFinished;
        CurrentStageIdx++;
        NextStage();
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


}
