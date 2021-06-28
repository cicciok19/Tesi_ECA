using UnityEngine;
using UnityEngine.UI;
using Microsoft.CognitiveServices.Speech;
using System.IO;
using System;
using System.Collections;
using System.Threading;
using System.Collections.Generic;
/// <summary>
/// Necessary info to call Speech method of TtsManager.
/// IsActiveMsg: necessary because if the msg is NOT active and there is a function to execute this must be launched
/// </summary>
public class SpeechInfo
{
    public SpeechInfo(ECAAnimator ecaAnimator, 
                      string ecaLanguage,   
                      string ecaVoiceName, 
                      string textToSpeech, 
                      Action functionToBeExecuted = null, 
                      bool anytime = true, 
                      bool isActiveMsg = true,
                      Func<bool> conditionJustBeforePlay = null)
    {
        EcaAnimator = ecaAnimator;
        EcaLanguage = ecaLanguage;
        EcaVoiceName = ecaVoiceName;
        TextToSpeech = textToSpeech;
        FunctionToBeExecuted = functionToBeExecuted;
        ConditionJustBeforePlay = conditionJustBeforePlay;
        Anytime = anytime;
        IsActiveMsg = isActiveMsg;
    }

    public ECAAnimator EcaAnimator { get; set; }
    public string EcaLanguage { get; set; }
    public string EcaVoiceName { get; set; }
    public String TextToSpeech { get; set; }
    public Action FunctionToBeExecuted { get; set; }
    public Func<bool> ConditionJustBeforePlay { get; set; }
    public bool Anytime { get; set; }
    public bool IsActiveMsg { get; set; }
}

/// <summary>
/// Singleton class that manage server comunication to obtain Audio from specified text.
/// When a request is made, a queuing mechanism is managed if the ECA is already talking. 
/// Furthermore, the request to Azure servers is managed through a new Thread that once obtained the audio, requires its execution 
/// to another script that also deals with lipSync <see cref="ECAAnimator"/>
/// </summary>
public class TtsManager
{
    //for temporary disable STT
    public bool speech = true;

    //Audio info
    private float[] audioData;

    //Txt info
    private Queue msgQueue = new Queue();
    private SpeechInfo currentInfo;

    //variable for thread management
    private Thread speechThread;
    public static volatile bool IsSpeaking = false;

    protected TTSModel model;

    //Singleton management
    private static TtsManager instance = null;
    private TtsManager()
    {
        CreateModel();
    }
    public static TtsManager Instance
    {
        get
        {
            if (instance == null)
                instance = new TtsManager();
            return instance;
        }
    }

    protected virtual void CreateModel()
    {
        throw new NotImplementedException();
    }

    /// <summary>
    /// If the Eca not speaking the request is satisfied, and an eventual fuction to execute is lunched when audio end;
    /// If the Eca is speaking and <see cref="SpeechInfo.Anytime"/> is true the message is enqueued;
    /// If the Eca is speaking and <see cref="SpeechInfo.Anytime"/> is false the message is NOT enqueued and an eventual fuction to execute is lunched immediately;
    /// </summary>
    /// <param name="speechInfo"><see cref="SpeechInfo"/></param>
    public virtual bool Speech(SpeechInfo speechInfo)
    {
        if(speechInfo.TextToSpeech == "")
        {
            if (speechInfo.FunctionToBeExecuted != null)
                speechInfo.FunctionToBeExecuted();
            return false;
        }

        if (!IsSpeaking && speech && speechInfo.IsActiveMsg)
        {
            Utility.Log("ECA: " + speechInfo.EcaVoiceName + " Not speaking. Msg ADDED in the queue: " + speechInfo.TextToSpeech);
            msgQueue.Enqueue(speechInfo);
            ThrowSpeechThread();
            return true;
        }
        else if (IsSpeaking && speechInfo.Anytime && speech && speechInfo.IsActiveMsg)
        {
            Utility.Log("ECA: " + speechInfo.EcaVoiceName + " Is speaking. Msg ADDED in the queue: " + speechInfo.TextToSpeech);
            msgQueue.Enqueue(speechInfo);
            return true;
        }
        else
        {
            Utility.Log("ECA: " + speechInfo.EcaVoiceName + " NOT added in the queue. text = " + speechInfo.TextToSpeech);
            if (speechInfo.FunctionToBeExecuted != null)
                speechInfo.FunctionToBeExecuted();
            return false;
        }
    }
    private void ThrowSpeechThread()
    {
        IsSpeaking = true;

        //ATTENZIONE: ANCORA NON FUNZIONA!!!
        speechThread = new Thread(SpeechThread);
        //speech = new Thread(model.GetSpeechThread());


        currentInfo = (SpeechInfo)msgQueue.Dequeue();
        currentInfo.EcaAnimator.AudioEnded += OnAudioEnd;
        speechThread.Start();
    }
    private void OnAudioEnd(object sender, EventArgs e)
    {
        //Execute function when that audio ended
        if (currentInfo.FunctionToBeExecuted != null)
            currentInfo.FunctionToBeExecuted();

        currentInfo.EcaAnimator.AudioEnded -= OnAudioEnd;

        if (msgQueue.Count > 0)
        {
            ThrowSpeechThread();
        }
        else
            TtsManager.IsSpeaking = false;
    }
    protected virtual void SpeechThread()
    {
        //String text = (String)text_obj;

        // Creates an instance of a speech config with specified subscription key and service region.
        var config = SpeechConfig.FromSubscription(TtsServiceID, TtsZone);

        config.SpeechRecognitionLanguage = currentInfo.EcaLanguage;
        config.SpeechSynthesisVoiceName = currentInfo.EcaVoiceName;

        // Creates a speech synthesizer.
        // Make sure to dispose the synthesizer after use!
        using (var synthsizer = new SpeechSynthesizer(config, null))
        {
            // Starts speech synthesis, and returns after a single utterance is synthesized.
            var result = synthsizer.SpeakTextAsync(currentInfo.TextToSpeech).Result;

            //SSML version
            //var result = synthsizer.SpeakSsmlAsync(text).Result;

            // Checks result.
            if (result.Reason == ResultReason.SynthesizingAudioCompleted)
            {
                // Since native playback is not yet supported on Unity yet (currently only supported on Windows/Linux Desktop),
                // use the Unity API to play audio here as a short term solution.
                // Native playback support will be added in the future release.
                var sampleCount = result.AudioData.Length / 2;
                audioData = new float[sampleCount];
                for (var i = 0; i < sampleCount; ++i)
                {
                    audioData[i] = (short)(result.AudioData[i * 2 + 1] << 8 | result.AudioData[i * 2]) / 32768.0F;
                }
                if (currentInfo.ConditionJustBeforePlay == null || !currentInfo.ConditionJustBeforePlay())
                    UnityMainThreadDispatcher.Instance().Enqueue(currentInfo.EcaAnimator.Play(audioData, currentInfo.TextToSpeech));
                else
                    OnAudioEnd(null, null);
            }
            else if (result.Reason == ResultReason.Canceled)
            {
                var cancellation = SpeechSynthesisCancellationDetails.FromResult(result);
                Utility.LogError("CANCELED:\nReason= " + cancellation.Reason + "\nErrorDetails= " + cancellation.ErrorDetails + " \nDid you update the subscription info?");
                //TtsManager.IsSpeaking = false;
                OnAudioEnd(null, null);
            }
        }
    }

    //Attributes
    public string TtsServiceID { get; set; }
    public string TtsZone { get; set; }
    public string TtsLanguage { get; set; }
    public string TtsVoiceName { get; set; }
}