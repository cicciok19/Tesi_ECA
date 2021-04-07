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

    /// <summary>
    /// Inizializza l'azione, deve essere chiamato nel costruttore dell'azione. Sottoscrivo gli eventi per il primo stage.
    /// </summary>
    public virtual void SetupAction()
    {
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

    /// <summary>
    /// Fa iniziare l'azione inizializzando il primo stage
    /// </summary>
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

    /// <summary>
    /// Chiamato ogni volta che finisce uno stage, serve per iniziare quello successivo. Se era l'ultimo, segnalo il completamento dell'azione
    /// </summary>
    public virtual void nextStage()
    {
        if (currentStage != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            currentStage.StageFinished += onStageFinished;
            currentStage.startStage();
        }
        else
            onCompletedAction();
    }

    /// <summary>
    /// Quando uno stage viene completato mi disiscrivo dall'evento, aggiorno il currentStageIdx e inizializzo lo stage successivo
    /// </summary>
    public virtual void onStageFinished(object sender, EventArgs e)
    {
        currentStage.StageFinished -= onStageFinished;
        currentStageIdx++;
        nextStage();
    }

    /// <summary>
    /// Chiamato quando un'azione viene completata
    /// </summary>
    public virtual void onCompletedAction()
    {
        if (CompletedAction != null)
            CompletedAction(this, EventArgs.Empty);

    }


    public virtual void onStateUpdate() { }
    public virtual void onLabelUpdate() { }
}
