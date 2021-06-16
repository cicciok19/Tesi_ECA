/* File IntentManager C# implementation of class IntentManager */



// global declaration start


//
// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE.md file in the project root for full license information.
//
using System;
using System.Threading.Tasks;
using System.Collections;
using System.Collections.Generic;
using Microsoft.CognitiveServices.Speech;
using Microsoft.CognitiveServices.Speech.Audio;
using Microsoft.CognitiveServices.Speech.Intent;
using UnityEngine;
using UnityEngine.UI;
#if PLATFORM_ANDROID
using UnityEngine.Android;
#endif
using IntentRecognitionResults;
using TinyJson;
using System.Threading;

// global declaration end

/// <summary>
/// The IntentRecognition Singleton class lets the user dictate voice sentences via speech recognition and
/// Natural Language Understanding (NLU). Once captured, the voice is interpreted based
/// on intents and entities returned by the LUIS service.
/// </summary>
/*
    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            //Destroy(this.gameObject);
            #if UNITY_EDITOR
            Utility.LogError("ERROR!!!! you can not use more than one IntentManager");
            UnityEditor.EditorApplication.isPlaying = false;
            #else
                Application.Quit();
            #endif
        }
        else
        {
            Instance = this;
            //IntentHandlers = new List<KeyValuePair<string, IIntentHandler>>();
            //AvailableIntents = new Dictionary<string, string>();
            DontDestroyOnLoad(this.gameObject);
        }
    }
    */
public class IntentManager
{
// class declaration start
private static IntentManager instance = null;
// class declaration end

    //Used to notify that 
    public event EventHandler NotRecognizedIntent;

    private System.Object threadLocker =  new System.Object();
    private IntentRecognizer intentreco;
    private IntentResult intent =  null;

    public string LUISRegion =  string.Empty;
    public string LUISAppKey =  string.Empty;
    public string LUISAppId =  string.Empty;
    public Action<Intent> RecognizedIntent;


    private IntentManager()
    {
    }



    public async void StartContinuousIntentRecognition()
    {
        if (LUISAppId.Length == 0 || LUISAppKey.Length == 0 || LUISRegion.Length == 0)
        {
            Debug.LogError("One or more LUIS subscription parameters are missing. Check your values and try again.");
            return;
        }
        CreateIntentRecognizer();
    
        if (intentreco != null)
        {
            /*
            Alternavely: RecognizeOnceAsync() -> Returns the recognized intent, if any, after one utterance!!
            Starts intent recognition, and returns after a single utterance is recognized. The end of a
            single utterance is determined by listening for silence at the end or until a maximum of 15
            seconds of audio is processed.  The task returns the recognition text as result. 
            Note: Since RecognizeOnceAsync() returns only a single utterance, it is suitable only for single
            shot recognition like command or query. 
            For long-running multi-utterance recognition, use StartContinuousRecognitionAsync() instead.
            */
    
            await intentreco.StartContinuousRecognitionAsync().ConfigureAwait(false);
        }
    }


    private void CreateIntentRecognizer()
    {
        if (LUISAppKey.Length == 0 || LUISAppKey == "YourLUISAppKey")
        {
            Utility.LogError("ERROR: Missing service credentials");
            return;
        }
    
        if (intentreco == null)
        {
            /*
            Creates an instance of a speech config with specified subscription key
            and service region. Note that in contrast to other services supported by
            the Cognitive Services Speech SDK, the Language Understanding service
            requires a specific subscription key from https://www.luis.ai/.
            The Language Understanding service calls the required key 'endpoint key'.
            Once you've obtained it, replace with below with your own Language Understanding subscription key
            and service region (e.g., "westus").
            The default language is "en-us".
    
            By default, LUIS recognizes intents in US English(en-us). 
            By assigning a locale code to the SpeechRecognitionLanguage property of the speech configuration, 
            you can recognize intents in other languages. For example, add config.SpeechRecognitionLanguage = "de-de" -> recognize intents in German
            */
            var config = SpeechConfig.FromSubscription(LUISAppKey, LUISRegion);
            if (this.SpeechRecognitionLanguage != null)
                config.SpeechRecognitionLanguage = this.SpeechRecognitionLanguage;
            intentreco = new IntentRecognizer(config);
    
            /*
            AddIntent method
            Arguments
            intentName: The name of the intent as defined in the LUIS app. Must match the LUIS intent name exactly.
            intentID: An ID assigned to a recognized intent by the Speech SDK. Can be whatever you like; 
            does not need to correspond to the intent name as defined in the LUIS app. 
            If multiple intents are handled by the same code, for instance, you could use the same ID for them.
            */
    
            // Creates a Language Understanding model using the app id, and adds specific intents from your model
            var model = LanguageUnderstandingModel.FromAppId(LUISAppId);
    
            if (IntentHandlers.Count == 0)
            {
                Utility.LogError("There is no intent setted in AvailableIntents attribute");
                return;
            }
            foreach (KeyValuePair<string, List<IIntentHandler>> intent in IntentHandlers)
                intentreco.AddIntent(model, intent.Key);
    
            // Subscribes to speech events.
            intentreco.Recognizing += OnRecognizingIntent;
            intentreco.Recognized += OnRecognizedIntent;
            intentreco.SpeechStartDetected += OnSpeechStart;
            intentreco.SpeechEndDetected += OnSpeechEnd;
            intentreco.Canceled += OnCanceledIntentRecognition;
            intentreco.SessionStarted += OnSessionStart;
            intentreco.SessionStopped += OnSessionStop;
        }
    }


    private void OnSessionStart(object sender, SessionEventArgs e)
    {
        Debug.Log("Session started event. Event:" + e.ToString());
    }


    private void OnSessionStop(object sender, SessionEventArgs e)
    {
        Debug.Log("Session event. Event: " + e.ToString());
        Debug.Log("Session Stop detected. Stop the recognition");
    }


    private void OnSpeechStart(object sender, RecognitionEventArgs e)
    {
        Debug.Log("SpeechStartDetected received: offset: " + e.Offset);
    }


    private void OnSpeechEnd(object sender, RecognitionEventArgs e)
    {
        Debug.Log("SpeechEndDetected received: offset: " + e.Offset);
        Debug.Log("Speech end detected.");
    }


    private void OnRecognizingIntent(object sender, IntentRecognitionEventArgs e)
    {
        if (e.Result.Reason == ResultReason.RecognizingSpeech)
            UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.ShowRecognizedText(e.Result.Text));
    }


    private void OnRecognizedIntent(object sender, IntentRecognitionEventArgs e)
    {
        Debug.Log(e.Result);
        if (e.Result.Reason == ResultReason.RecognizedIntent)
        {
            string s = "RECOGNIZED: Intent= " + e.Result.IntentId + " Text= " + e.Result.Text;
            //Utility.Log("RECOGNIZED: Intent= " + e.Result.IntentId + " Text= " + e.Result.Text);
            lock (threadLocker)
            {
                string json = e.Result.Properties.GetProperty(PropertyId.LanguageUnderstandingServiceResponse_JsonResult);
                var result = json.FromJson<IntentResult>();
                if (result != null)
                {
                        intent = result;
                    string recognizedIntentName = intent.topScoringIntent.intent;

                    s += " WITH score = " + intent.topScoringIntent.score;
                    Utility.Log(s);

                    //Insert result inside Intent and KeyWord class that could be extendend when LUIS will be sobstituted
                    KeyWord[] keyWords = new KeyWord[intent.entities.Count];
                    for (int i = 0; i < intent.entities.Count; i++)
                        keyWords[i] = new KeyWord(intent.entities[i].score, intent.entities[i].type, intent.entities[i].entity);

                    Intent recognizedIntent = new Intent(intent.topScoringIntent.intent, intent.topScoringIntent.score, e.Result.Text, keyWords);

                    Action callHanlders = () =>
                    {
                        if (IntentHandlers.ContainsKey(recognizedIntentName))
                            for (int i = 0; i < IntentHandlers[recognizedIntentName].Count; i++)
                                IntentHandlers[recognizedIntentName][i].Handle(recognizedIntent);

                        intent = null;

                        //StartIntentRecognition.Instance.ShowRecognizedText("");
                    };
                    UnityMainThreadDispatcher.Instance().Enqueue(callHanlders);

                    if (RecognizedIntent != null)
                        UnityMainThreadDispatcher.Instance().Enqueue(() => RecognizedIntent(recognizedIntent));
                }
            }
        }
        else if (NotRecognizedIntent != null)
        {
            UnityMainThreadDispatcher.Instance().Enqueue(() => NotRecognizedIntent(this, EventArgs.Empty));
            IntentHandlers["None"][0].HandleIntentNotRecognized();
        }
    
        if (e.Result.Reason == ResultReason.RecognizedSpeech)
        {
            Debug.Log("RECOGNIZED: Text= " + e.Result.Text);
            UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.ShowRecognizedText(e.Result.Text));
        }
        else if (e.Result.Reason == ResultReason.NoMatch)
        {
            Debug.Log("NOMATCH: Speech could not be recognized.");
        }
    }


    private void OnCanceledIntentRecognition(object sender, IntentRecognitionCanceledEventArgs e)
    {
        Debug.Log("CANCELED: Reason= " + e.Reason);
        UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.RecognizingStopped());

        if (e.Reason == CancellationReason.Error)
        {
            Debug.LogError("AUTH ERROR, check if valid appID: " + this.LUISAppId + " APP key: " + this.LUISAppKey + " Region: " + this.LUISRegion);
            Debug.Log("CANCELED: ErrorDetails= " + e.ErrorDetails);
            Debug.Log("CANCELED: Did you update the subscription info?");
            OnError();
        }
    }

    private void OnError()
    {
        OnDisable();
        Thread.CurrentThread.Abort();
    }

    private void OnDisable()
    {
        StopIntentRecognition();
    }




    public async void StartSingleSentenceRecognition()
    {
        if (LUISAppId.Length == 0 || LUISAppKey.Length == 0 || LUISRegion.Length == 0)
        {
            Debug.LogError("One or more LUIS subscription parameters are missing. Check your values and try again.");
            return;
        }
        CreateIntentRecognizer();
    
        if (intentreco != null)
            await intentreco.RecognizeOnceAsync().ConfigureAwait(false);
    
        StopIntentRecognition();
    }


    public async void StopIntentRecognition()
    {
        UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.RecognizingStopped());
    
        if (intentreco != null)
        {
            await intentreco.StopContinuousRecognitionAsync().ConfigureAwait(false);
            intentreco.Recognizing -= OnRecognizingIntent;
            intentreco.Recognized -= OnRecognizingIntent;
            intentreco.SpeechStartDetected -= OnSpeechStart;
            intentreco.SpeechEndDetected -= OnSpeechEnd;
            intentreco.Canceled -= OnCanceledIntentRecognition;
            intentreco.SessionStarted -= OnSessionStart;
            intentreco.SessionStopped -= OnSessionStop;
            intentreco.Dispose();
            intentreco = null;
            Debug.Log("Intent Recognizer is now stopped.");
        }
    }


    public void RemoveIntentHandler(string intentName, IIntentHandler handler)
    {
        Utility.Log("Removing " + intentName + "to IntentManager");
        if (IntentHandlers.ContainsKey(intentName))
        {
            for (int i = 0; i < IntentHandlers[intentName].Count; i++)
                if (handler == IntentHandlers[intentName][i])
                {
                    IntentHandlers[intentName].RemoveAt(i);
                    break;
                }
        }
    }


    public Dictionary<string, List<IIntentHandler>> IntentHandlers
    { get; set; }


    public string SpeechRecognitionLanguage
    { get; set; }


    public void AddIntentHandler(string intentName, IIntentHandler handler)
    {
        /*
        if (AvailableIntents == null)
            AvailableIntents = new Dictionary<string, string>();
        AvailableIntents.Add(intentName);
        */
        Utility.Log("Adding " + intentName + "to IntentManager");

        if (IntentHandlers == null)
            IntentHandlers = new Dictionary<string, List<IIntentHandler>>();
    
        if (IntentHandlers.ContainsKey(intentName))
            IntentHandlers[intentName].Add(handler);
        else
            IntentHandlers.Add(intentName, new List<IIntentHandler> { handler });
    }


    public static IntentManager Instance
    {
            get
            {
                if (instance == null)
                    instance = new IntentManager();
                return instance;
            }
        }


}
