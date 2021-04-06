using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAAction
{
    public event EventHandler CompletedAction;
    public ECAActionStage[] allStages;
    public int currentStageIdx;

    public ECAAnimator EcaAnimator;

    public SmartActionNode smNode;

    public ECAAction(ECAAnimator ecaAnimator)
    {
        EcaAnimator = ecaAnimator;
    }

    public virtual void SetupAction()
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

    public virtual void nextStage()
    {
        if (currentStage != null)
        {
            currentStage.StageFinished += onStageFinished;
            currentStage.startStage();
        }
        else
            onCompletedAction();
    }

    public virtual void onStageFinished(object sender, EventArgs e)
    {
        currentStage.StageFinished -= onStageFinished;
        currentStageIdx++;
        nextStage();
    }

    public virtual void onStateUpdate() { }
    public virtual void onLabelUpdate() { }
    public virtual void onCompletedAction()
    {
        if (CompletedAction != null)
            CompletedAction(this, EventArgs.Empty);

    }
}
