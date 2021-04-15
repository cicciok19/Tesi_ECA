using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAAction
{
    public event EventHandler CompletedAction;

    public ECAActionStage[] AllStages;
    public ECAAnimator EcaAnimator;
    public int CurrentStageIdx;

    public ECAAction(ECAAnimator ecaAnimator)
    {
        EcaAnimator = ecaAnimator;
    }

    /// <summary>
    /// Inizializza l'azione, deve essere chiamato nel costruttore dell'azione. Sottoscrivo gli eventi per il primo stage.
    /// </summary>
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

    /// <summary>
    /// Fa iniziare l'azione inizializzando il primo stage
    /// </summary>
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

    /// <summary>
    /// Chiamato ogni volta che finisce uno stage, serve per iniziare quello successivo. Se era l'ultimo, segnalo il completamento dell'azione
    /// </summary>
    public virtual void NextStage()
    {
        if (CurrentStage != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            CurrentStage.StageFinished += OnStageFinished;
            CurrentStage.StartStage();
        }
        else
            OnCompletedAction();
    }

    /// <summary>
    /// Quando uno stage viene completato mi disiscrivo dall'evento, aggiorno il currentStageIdx e inizializzo lo stage successivo
    /// </summary>
    public virtual void OnStageFinished(object sender, EventArgs e)
    {
        CurrentStage.StageFinished -= OnStageFinished;
        CurrentStageIdx++;
        NextStage();
    }

    /// <summary>
    /// Chiamato quando un'azione viene completata
    /// </summary>
    public virtual void OnCompletedAction()
    {
        if (CompletedAction != null)
            CompletedAction(this, EventArgs.Empty);
    }


    public virtual void OnStateUpdate() { }
    public virtual void OnLabelUpdate() { }
}
