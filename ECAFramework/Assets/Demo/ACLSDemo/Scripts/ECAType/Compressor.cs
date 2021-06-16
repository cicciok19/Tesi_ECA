using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Compressor : ECA
{
    private const string START_CPR = "StartCPR";
    private const string START_KEY = "CPRStart";
    private const string END_KEY = "CPRCompleted";

    private Patient patient;
    private TimeRecorder timeRecorder;
    private CPRPosition cprPosition;
    private SystemManager systemManager;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        timeRecorder = FindObjectOfType<TimeRecorder>();
        cprPosition = patient.GetCPRPosition();
        systemManager = FindObjectOfType<SystemManager>();

        //just for debug
        //HandleStartCPR();
        EmotionManager.InitActualEmotion(AvailableEmotions.Trust, 0f);
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
        switch (intent.IntentName)
        {
            case START_CPR:
                HandleStartCPR();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { START_CPR };
        foreach(string intent in intentName)
            IntentManager.Instance.AddIntentHandler(intent, this);
    }

    private void HandleStartCPR()
    {
        //send message
        //StartCoroutine(CompressFor(10f));
        //do action

        timeRecorder.TimeExpired += OnTimeExpired;
        timeRecorder.CheckTime(this, .1f);
        CPRAction cpr = new CPRAction(this, cprPosition);
        cpr.CompletedAction += OnCPRCompleted;
        actionsList.Enqueue(cpr);
    }

    protected EmotionalMessage GetMessageForIntentKey(string key)
    {
        List<EmotionalMessage> list = GetGeneralMessagesFor(key);

        if (list == null)
        {
            Utility.LogWarning("No messages for key " + key);
            return EmotionalMessage.zero;
        }

        AvailableEmotions actualEmotion = ActualEmotion.EmotionType;

        List<EmotionalMessage> listForEmotion = new List<EmotionalMessage>();
        for (int i = 0; i < list.Count; i++)
        {
            if (list[i].emotion == actualEmotion || list[i].emotion == AvailableEmotions.None)
                listForEmotion.Add(list[i]);
        }


        int idx = (int)UnityEngine.Random.Range(0, listForEmotion.Count);
        EmotionalMessage message = listForEmotion[idx];

        return message;
    }

    private IEnumerator CompressFor(float time)
    {
        yield return new WaitForSeconds(time);
    }

    private void OnCPRCompleted(object sender, EventArgs e)
    {
        CPRAction cpr = (CPRAction)sender;
        cpr.CompletedAction -= OnCPRCompleted;
        EmotionalMessage message = GetMessageForIntentKey(END_KEY);
        SendDirectMessage(message.message);
        
        systemManager.CheckAction(cpr.ActionName);
        patient.OnCPREnded();
    }

    protected void HandleMessageAction(EmotionalMessage message)
    {
        if (message.action == "")
            return;

        // serving action
        //MessageAction action = message.parsedAction;
        List<MessageAction> actions = message.parsedActions;

        for (int i = 0; i < actions.Count; i++)
        {
            MessageAction action = actions[i];
            if (action.IsMoveTo())
            {
                Utility.Log("Going to " + action.parameter);
                //Type objName = (Type)action.parameter;
                //var obj = FindObjectOfType<>();
            }
        }

    }

    private void OnTimeExpired(object sender, EventArgs e)
    {

        TImeRecorderEventArgs ecaArg = (TImeRecorderEventArgs)e;

        if(ecaArg.eca == this)
        {
            timeRecorder.SendDirectMessage("Sono passati 15 secondi, puoi smettere di fare il massaggio cardiaco");
            timeRecorder.TimeExpired -= OnTimeExpired;
            //dovremmo far finire il CPR
        }
    }
}
