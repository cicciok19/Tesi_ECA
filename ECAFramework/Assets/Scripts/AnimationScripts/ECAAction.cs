using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAAction : MonoBehaviour
{
    //questi sono eventi che vengono lanciati dal nodo e sul quale si devono mettere in ascolto gli stage
    public event EventHandler<EventArgs> SpeakTimeout;
    public event EventHandler<EventArgs> OnStarted;
    public event EventHandler<EventArgs> OnCompleted;
    public event EventHandler<EventArgs> OnTriggered;

    public ECAActionStage[] allStages;
    public int currentStageIdx;

    public ECAAnimator EcaAnimator;

    public ECAAction(ECAAnimator ecaAnimator)
    {
        EcaAnimator = ecaAnimator;
    }

    private void Start()
    {
        //quando specializzo lo script devo avere un riferimento alla smart action attuale e devo
        //sottoscrivere i suoi eventi per poter reagire
        currentStageIdx = 0;
        currentStage.StageFinished += onStageFinished;
    }

    public ECAActionStage currentStage
    {
        get
        {
            if (currentStageIdx >= 0 && currentStageIdx < allStages.Length)
                return allStages[currentStageIdx];

            return null;
        }
    }

    public virtual void startAction()
    {
        if (allStages != null)
        {
            if(currentStage != null)
            {
                currentStage.startStage();
            }
        }
    }

    public void nextStage()
    {
        if (currentStage != null)
        { 
            currentStage.StageFinished += onStageFinished;
            currentStage.startStage();
        }
        else
            completedAction();
    }

    public void onStageFinished(object sender, EventArgs e)
    {
        currentStage.StageFinished -= onStageFinished;
        currentStageIdx++;
        nextStage();
    }

    public virtual void onStateUpdate() { }
    public virtual void onLabelUpdate() { }
    public virtual void completedAction() { }
}
