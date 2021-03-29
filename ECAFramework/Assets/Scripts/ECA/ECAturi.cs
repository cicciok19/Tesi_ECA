using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECATuri : ECA
{
    public override void SetEcaId()
    {
        ID = Ecas.Turi;
    }
    // Start is called before the first frame update
    protected  override void Start()
    {
        base.Start();
        SubscribeToActionsEvents();
        SubscribeToNodesEvents();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public override void SubscribeHandlerToIntentManager()
    {
        //definisco gli intent che mi servono per questo ECA
        IntentName = new List<string> { "None, Presentation,  Help" };
        //aggiungo gli handler per ogni intent definito prima
        IntentManager.Instance.AddIntentHandler(IntentName[0], this);
        IntentManager.Instance.AddIntentHandler(IntentName[1], this);
        IntentManager.Instance.AddIntentHandler(IntentName[2], this);
    }

    public override void Handle(Intent intent)
    {
        //controllo quali sono gli ECA a cui mi sto rivolgendo
        List<ECA> focusedEcas = ECAManager.Instance.FocusedECA();

        //vedo quali di questi intent è quello giusto
        // - mando il messaggio relativo
        // - (facoltativo) aggiorno le emozioni
        // - (facoltativo) rimuovo l'intent nel caso in cui non mi serva più, es. Presentation
        switch (intent.IntentName)
        {
            case "None":
                if (focusedEcas.Count == 0 || focusedEcas.Contains(this))
                    SendMessage("Misunderstood");
                EmotionManager.updateEmotion(AppraisalVariables.UnexpectedNegative, 0.5f);
                break;
            case "Presentation":
                SendMessage("Presentation");
                if (focusedEcas.Count == 0 || focusedEcas.Contains(this))
                    SendMessage("Presentation");
                IntentManager.Instance.RemoveIntentHandler("Presentation", this);
                break;
            case "Help":
                if (ECAManager.Instance.FocusedECA().Contains(ECAManager.Instance.AvailableEcas[Ecas.PhoneOperator]))
                    return;
                EmotionManager.updateEmotion(AppraisalVariables.Good, 0.3f);
                //GiveHelpMessage();
                break;
        }
    }

    //reagisce agli eventi relativi all'applicazione
    //es. cambiamenti di stato di una task, in modo tale da dare suggerimenti o in generale messaggi
    public void SubscribeToActionsEvents()
    {
        foreach (KeyValuePair<SmartActions, SmartAction> Actions in ECAGameManager.AllSmartActions)
        {
            Actions.Value.StateUpdated += OnStateUpdated;
            Actions.Value.Finished += OnActionFinished;
        }
    }
    public void SubscribeToNodesEvents()
    {
        foreach (KeyValuePair<int, GameGraphNode> nodes in ECAGameManager.AllSimpleNodes)
            if (nodes.Value is SmartActionNode)
            {
                SmartActionNode smNode = (SmartActionNode)nodes.Value;
                smNode.OnAskingExecutionAfterMessage += ExecuteAfterMessage;
            }
    }

    //serve per far iniziare la smart action solo dopo aver fornito un messaggio di descrizione della task
    //questo vale solo in questo caso, perchè si tratta dell'ECA istruttore
    private void ExecuteAfterMessage(object sender, SmartActionCustomArgs e)
    {
        if (!e.SmartAction.IsStarted)
            SendMessage(e.SmartAction, e.MessageType, e.FunctionToExecute, e.AnyTime);
        else
            //if was pause -> do not play start message (description of the task)
            e.SmartAction.Start();
        ECAAnimationManager.allAnimations[EventDefinitions.SitDown].actionStart();
    }

    //viene chiamato quando finisco una smart action
    // 1. riproduce il messaggio di fine task
    // 2. aggiorna le emozioni dell'ECA
    // 3. ripristina il valore dell'evento in modo da segnalare che l'azione è finita e può cominciarne un'altra
    private void OnActionFinished(object sender, EventArgs e)
    {
        SmartAction smartAction = (SmartAction)sender;
        //send audio
        SendMessage(smartAction, "EndTask", null, true);

        //update emotions
        if (Labels.Good.Equals(smartAction.AccuracyLabel) && Labels.Good.Equals(smartAction.StagingLabel))
            EmotionManager.updateEmotion(AppraisalVariables.Good);
        else if (Labels.Good.Equals(smartAction.AccuracyLabel) || Labels.Good.Equals(smartAction.StagingLabel))
            EmotionManager.updateEmotion(AppraisalVariables.Good, 0.8f);
        else
            EmotionManager.updateEmotion(AppraisalVariables.Good, 0.4f);

        //CHIAMO ANIMAZIONE ECA
        ECAAnimationManager.allAnimations[EventDefinitions.SitDown].actionFinished();

        smartAction.Finished -= OnActionFinished;
    }

    //chiamato ogni volta che cambia lo stato della smart action in modo da reagire al cambiamento
    //in questo metodo vado a vedere che label ho raggiunto e basta
    //il metodo che riproduce il messaggio è GiveSupport
    private void OnStateUpdated(object sender, SmartActionEventArgs e)
    {

        SmartAction smartAction = (SmartAction)sender;
        bool isMessageAccepted;

        //if the state continues to worsen once the bad label is reached -> update emotions differently (lessened),
        //and continue to give support
        if (e.IsLabeledAttribute && !e.IsLabelSwitched)
        {
            //some criteria has reached the limit value
            if (smartAction.GetLabelOfCriteria(smartAction.LastUpdatedCriteria).Equals(Labels.Bad))
            {
                EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.1f);
                isMessageAccepted = SendMessage(smartAction, "Support", null, false);
                /*if (GivingSupport != null)
                    GivingSupport(isMessageAccepted);
                    */
            }
            return;
        }

        //not give support if label is not switched
        if (!e.IsLabelSwitched)
            return;

        
        GiveSupport(smartAction);
    }


    //valuto la label che ho raggiunto e riproduco il relativo messaggio
    private void GiveSupport(SmartAction smartAction)
    {
        //bool isMessageAccepted;


        switch (smartAction.GetLabelOfLastSwitchedCriteria())
        {
            case Labels.Bad:
                EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.4f);
                if (smartAction.LastSwitchedCriteria.Equals(Criteria.Staging))
                {
                    StagingLabelUpdated(smartAction);

                    //if staging has already reached the bad level, the update time is increased
                    smartAction.StagingUpdateTime = 80f;
                }
                else
                    AccuracyLabelUpdated(smartAction);

                //CHIAMO ANIMAZIONE ECA

                break;
            case Labels.Normal:
                EmotionManager.updateEmotion(AppraisalVariables.Bad, 0.4f);
                if (smartAction.LastSwitchedCriteria.Equals(Criteria.Staging))
                    StagingLabelUpdated(smartAction);
                else
                    AccuracyLabelUpdated(smartAction);

                /*
                if (smartAction == ECAGameManager.AllSmartActions[SmartActions.PoseTriangle])
                {
                    SendMessage(smartAction, "Support", null, true);
                    if (GivingSupport != null)
                        GivingSupport(true);
                    return;
                }
                isMessageAccepted = SendMessage(smartAction, "Support", null, false);
                if (GivingSupport != null)
                    GivingSupport(isMessageAccepted);
                */

                //CHIAMO ANIMAZIONE ECA
                break;
            case Labels.Good:
                EmotionManager.updateEmotion(AppraisalVariables.Good);

                //CHIAMO ANIMAZIONE ECA
                break;
        }
    }

    /// <summary>
    /// Internal Func "isPlayed" is launched just before playing the message. 
    /// This feature is used to update the log file if and when the message is played
    /// </summary>
    /// <param name="smartAction"></param>
    private void StagingLabelUpdated(SmartAction smartAction)
    {
        //serve per notificare al file di log che p stato emesso un mex di supporto
        /*Func<bool> isPlayed = () =>
        {
            if (!smartAction.IsFinished && !smartAction.IsPaused)
            {
                NotifyGivingSupport(true);
                return true;
            }
            NotifyGivingSupport(false);
            return false;
        };
        */
        //SendMessage(smartAction, "Support", null, true, isPlayed);
        SendMessage(smartAction, "Support", null, true);
    }
    private void AccuracyLabelUpdated(SmartAction smartAction)
    {
        bool isMessageAccepted;

        isMessageAccepted = SendMessage(smartAction, "Support", null, false);
        //notifico che è stato emesso un mex di supporto
        /*if (GivingSupport != null)
            GivingSupport(isMessageAccepted);
            */
    }



}
