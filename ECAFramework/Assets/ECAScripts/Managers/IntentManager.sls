:ArrayOb.273{6:Dictionary.4369{32 29:SLSThisIcon.286331409{:String.17{9 10 "103676520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{20 21 "public IntentManager"}
 19.3429 2.2 12.8 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  11.0686 4.53772 0
 0  0 #4{20 21 "public IntentManager"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 1#4{46 47 "public event EventHandler NotRecognizedIntent;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "86279088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "CreateIntentRecognizer"}
 1.3 0.88 8.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2770 2771 "\[\n
    if (LUISAppKey.Length == 0 || LUISAppKey == \"YourLUISAppKey\")\n
    \[\n
        Utility.LogError(\"ERROR: Missing service credentials\");\n
        return;\n
    \]\n
\n
    if (intentreco == null)\n
    \[\n
        /*\n
        Creates an instance of a speech config with specified subscription key\n
        and service region. Note that in contrast to other services supported by\n
        the Cognitive Services Speech SDK, the Language Understanding service\n
        requires a specific subscription key from https://www.luis.ai/.\n
        The Language Understanding service calls the required key 'endpoint key'.\n
        Once you've obtained it, replace with below with your own Language Understanding subscription key\n
        and service region (e.g., \"westus\").\n
        The default language is \"en-us\".\n
\n
        By default, LUIS recognizes intents in US English(en-us). \n
        By assigning a locale code to the SpeechRecognitionLanguage property of the speech configuration, \n
        you can recognize intents in other languages. For example, add config.SpeechRecognitionLanguage = \"de-de\" -> recognize intents in German\n
        */\n
        var config = SpeechConfig.FromSubscription(LUISAppKey, LUISRegion);\n
        if (this.SpeechRecognitionLanguage != null)\n
            config.SpeechRecognitionLanguage = this.SpeechRecognitionLanguage;\n
        intentreco = new IntentRecognizer(config);\n
\n
        /*\n
        AddIntent method\n
        Arguments\n
        intentName: The name of the intent as defined in the LUIS app. Must match the LUIS intent name exactly.\n
        intentID: An ID assigned to a recognized intent by the Speech SDK. Can be whatever you like; \n
        does not need to correspond to the intent name as defined in the LUIS app. \n
        If multiple intents are handled by the same code, for instance, you could use the same ID for them.\n
        */\n
\n
        // Creates a Language Understanding model using the app id, and adds specific intents from your model\n
        var model = LanguageUnderstandingModel.FromAppId(LUISAppId);\n
\n
        if (IntentHandlers.Count == 0)\n
        \[\n
            Utility.LogError(\"There is no intent setted in AvailableIntents attribute\");\n
            return;\n
        \]\n
        foreach (KeyValuePair<string, List<IIntentHandler>> intent in IntentHandlers)\n
            intentreco.AddIntent(model, intent.Key);\n
\n
        // Subscribes to speech events.\n
        intentreco.Recognizing += OnRecognizingIntent;\n
        intentreco.Recognized += OnRecognizedIntent;\n
        intentreco.SpeechStartDetected += OnSpeechStart;\n
        intentreco.SpeechEndDetected += OnSpeechEnd;\n
        intentreco.Canceled += OnCanceledIntentRecognition;\n
        intentreco.SessionStarted += OnSessionStart;\n
        intentreco.SessionStopped += OnSessionStop;\n
    \]\n
\]"}
#4{22 23 "CreateIntentRecognizer"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104299864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "OnDisable"}
 1.3 0.88 3.6 19  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{32 33 "\[\n
    StopIntentRecognition();\n
\]"}
#4{9 10 "OnDisable"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "86018104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "intentreco"}
 2 1.88 4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "intentreco"}
#4{16 17 "IntentRecognizer"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "104292416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "IntentHandlers"}
 1.3 0.88 5.6 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{14 15 "IntentHandlers"}
#4{40 41 "Dictionary<string, List<IIntentHandler>>"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "86017224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "LUISAppId"}
 1.3 1.88 3.6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "LUISAppId"}
#4{6 7 "string"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{14 15 "  string.Empty"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86365704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1520 1521 "//\n
// Copyright (c) Microsoft. All rights reserved.\n
// Licensed under the MIT license. See LICENSE.md file in the project root for full license information.\n
//\n
using System;\n
using System.Threading.Tasks;\n
using System.Collections;\n
using System.Collections.Generic;\n
using Microsoft.CognitiveServices.Speech;\n
using Microsoft.CognitiveServices.Speech.Audio;\n
using Microsoft.CognitiveServices.Speech.Intent;\n
using UnityEngine;\n
using UnityEngine.UI;\n
#if PLATFORM_ANDROID\n
using UnityEngine.Android;\n
#endif\n
using IntentRecognitionResults;\n
using TinyJson;\n
using System.Threading;\n
\n
\n
/// <summary>\n
/// The IntentRecognition Singleton class lets the user dictate voice sentences via speech recognition and\n
/// Natural Language Understanding (NLU). Once captured, the voice is interpreted based\n
/// on intents and entities returned by the LUIS service.\n
/// </summary>\n
/*\n
    private void Awake()\n
    \[\n
        if (Instance != null && Instance != this)\n
        \[\n
            //Destroy(this.gameObject);\n
            #if UNITY_EDITOR\n
            Utility.LogError(\"ERROR!!!! you can not use more than one IntentManager\");\n
            UnityEditor.EditorApplication.isPlaying = false;\n
            #else\n
                Application.Quit();\n
            #endif\n
        \]\n
        else\n
        \[\n
            Instance = this;\n
            //IntentHandlers = new List<KeyValuePair<string, IIntentHandler>>();\n
            //AvailableIntents = new Dictionary<string, string>();\n
            DontDestroyOnLoad(this.gameObject);\n
        \]\n
    \]\n
    */\n
"}
}
#8{#4{9 10 "104297512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{25 26 "SpeechRecognitionLanguage"}
 1.3 0.88 10 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{25 26 "SpeechRecognitionLanguage"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104294376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "RemoveIntentHandler"}
 0.3 0.88 7.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{359 360 "\[\n
    Utility.Log(\"Removing \" + intentName + \"to IntentManager\");\n
    if (IntentHandlers.ContainsKey(intentName))\n
    \[\n
        for (int i = 0; i < IntentHandlers[intentName].Count; i++)\n
            if (handler == IntentHandlers[intentName][i])\n
            \[\n
                IntentHandlers[intentName].RemoveAt(i);\n
                break;\n
            \]\n
    \]\n
\]"}
#4{19 20 "RemoveIntentHandler"}
#4{4 5 "void"}
#4{41 42 "string intentName, IIntentHandler handler"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86366728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{45 46 "private static IntentManager instance = null;"}
}
#8{#4{8 9 "86281832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.879999 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{150 151 "\[\n
        get\n
        \[\n
            if (instance == null)\n
                instance = new IntentManager();\n
            return instance;\n
        \]\n
    \]"}
#4{8 9 "Instance"}
#4{20 21 "static IntentManager"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{8 9 "86019864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "LUISAppKey"}
 1.3 1.88 4 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "LUISAppKey"}
#4{6 7 "string"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{14 15 "  string.Empty"}
#4{0 1 ""}
}
#11{#4{9 10 "109957696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{32 33 "StartContinuousIntentRecognition"}
 0.3 0.88 12.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1055 1056 "\[\n
    if (LUISAppId.Length == 0 || LUISAppKey.Length == 0 || LUISRegion.Length == 0)\n
    \[\n
        Debug.LogError(\"One or more LUIS subscription parameters are missing. Check your values and try again.\");\n
        return;\n
    \]\n
    CreateIntentRecognizer();\n
\n
    if (intentreco != null)\n
    \[\n
        /*\n
        Alternavely: RecognizeOnceAsync() -> Returns the recognized intent, if any, after one utterance!!\n
        Starts intent recognition, and returns after a single utterance is recognized. The end of a\n
        single utterance is determined by listening for silence at the end or until a maximum of 15\n
        seconds of audio is processed.  The task returns the recognition text as result. \n
        Note: Since RecognizeOnceAsync() returns only a single utterance, it is suitable only for single\n
        shot recognition like command or query. \n
        For long-running multi-utterance recognition, use StartContinuousRecognitionAsync() instead.\n
        */\n
\n
        await intentreco.StartContinuousRecognitionAsync().ConfigureAwait(false);\n
    \]\n
\]"}
#4{32 33 "StartContinuousIntentRecognition"}
#4{10 11 "async void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104296336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{27 28 "OnCanceledIntentRecognition"}
 1.3 0.88 10.8 10  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{521 522 "\[\n
    Debug.Log(\"CANCELED: Reason= \" + e.Reason);\n
    UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.RecognizingStopped());\n
\n
    if (e.Reason == CancellationReason.Error)\n
    \[\n
        Debug.LogError(\"AUTH ERROR, check if valid appID: \" + this.LUISAppId + \" APP key: \" + this.LUISAppKey + \" Region: \" + this.LUISRegion);\n
        Debug.Log(\"CANCELED: ErrorDetails= \" + e.ErrorDetails);\n
        Debug.Log(\"CANCELED: Did you update the subscription info?\");\n
        OnError();\n
    \]\n
\]"}
#4{27 28 "OnCanceledIntentRecognition"}
#4{4 5 "void"}
#4{51 52 "object sender, IntentRecognitionCanceledEventArgs e"}
#4{0 1 ""}
}
#11{#4{9 10 "104297120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "AddIntentHandler"}
 0.3 0.879999 6.4 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{503 504 "\[\n
    /*\n
    if (AvailableIntents == null)\n
        AvailableIntents = new Dictionary<string, string>();\n
    AvailableIntents.Add(intentName);\n
    */\n
    Utility.Log(\"Adding \" + intentName + \"to IntentManager\");\n
\n
    if (IntentHandlers == null)\n
        IntentHandlers = new Dictionary<string, List<IIntentHandler>>();\n
\n
    if (IntentHandlers.ContainsKey(intentName))\n
        IntentHandlers[intentName].Add(handler);\n
    else\n
        IntentHandlers.Add(intentName, new List<IIntentHandler> \[ handler \]);\n
\]"}
#4{16 17 "AddIntentHandler"}
#4{4 5 "void"}
#4{41 42 "string intentName, IIntentHandler handler"}
#4{0 1 ""}
}
#11{#4{9 10 "104298688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "StopIntentRecognition"}
 0.3 0.88 8.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{736 737 "\[\n
    UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.RecognizingStopped());\n
\n
    if (intentreco != null)\n
    \[\n
        await intentreco.StopContinuousRecognitionAsync().ConfigureAwait(false);\n
        intentreco.Recognizing -= OnRecognizingIntent;\n
        intentreco.Recognized -= OnRecognizingIntent;\n
        intentreco.SpeechStartDetected -= OnSpeechStart;\n
        intentreco.SpeechEndDetected -= OnSpeechEnd;\n
        intentreco.Canceled -= OnCanceledIntentRecognition;\n
        intentreco.SessionStarted -= OnSessionStart;\n
        intentreco.SessionStopped -= OnSessionStop;\n
        intentreco.Dispose();\n
        intentreco = null;\n
        Debug.Log(\"Intent Recognizer is now stopped.\");\n
    \]\n
\]"}
#4{21 22 "StopIntentRecognition"}
#4{10 11 "async void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104293200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnSessionStop"}
 1.3 0.88 5.2 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{121 122 "\[\n
    Debug.Log(\"Session event. Event: \" + e.ToString());\n
    Debug.Log(\"Session Stop detected. Stop the recognition\");\n
\]"}
#4{13 14 "OnSessionStop"}
#4{4 5 "void"}
#4{33 34 "object sender, SessionEventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "104297904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "OnRecognizingIntent"}
 1.3 0.88 7.6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{193 215 "\[\n
    if (e.Result.Reason == ResultReason.RecognizingSpeech)\n
        UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.ShowRecognizedText(e.Result.Text));\n
\]"}
#4{19 20 "OnRecognizingIntent"}
#4{4 5 "void"}
#4{43 44 "object sender, IntentRecognitionEventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "104295552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnSpeechStart"}
 1.3 0.88 5.2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{71 72 "\[\n
    Debug.Log(\"SpeechStartDetected received: offset: \" + e.Offset);\n
\]"}
#4{13 14 "OnSpeechStart"}
#4{4 5 "void"}
#4{37 38 "object sender, RecognitionEventArgs e"}
#4{0 1 ""}
}
#9{#4{8 9 "86016784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "RecognizedIntent"}
 1.3 1.88 6.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "RecognizedIntent"}
#4{14 15 "Action<Intent>"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "96089400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "OnError"}
 1.3 0.88 2.8 28  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{54 55 "\[\n
    OnDisable();\n
    Thread.CurrentThread.Abort();\n
\]"}
#4{7 8 "OnError"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "86018544"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "intent"}
 2.8 1.88 2.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "intent"}
#4{12 13 "IntentResult"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{6 7 "  null"}
#4{0 1 ""}
}
#11{#4{8 9 "86278304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{30 31 "StartSingleSentenceRecognition"}
 0.3 0.88 12 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{386 387 "\[\n
    if (LUISAppId.Length == 0 || LUISAppKey.Length == 0 || LUISRegion.Length == 0)\n
    \[\n
        Debug.LogError(\"One or more LUIS subscription parameters are missing. Check your values and try again.\");\n
        return;\n
    \]\n
    CreateIntentRecognizer();\n
\n
    if (intentreco != null)\n
        await intentreco.RecognizeOnceAsync().ConfigureAwait(false);\n
\n
    StopIntentRecognition();\n
\]"}
#4{30 31 "StartSingleSentenceRecognition"}
#4{10 11 "async void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104298296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "OnRecognizedIntent"}
 1.3 0.88 7.2 37  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2579 2580 "\[\n
    if (e.Result.Reason == ResultReason.RecognizedIntent)\n
    \[\n
        string s = \"RECOGNIZED: Intent= \" + e.Result.IntentId + \" Text= \" + e.Result.Text;\n
        //Utility.Log(\"RECOGNIZED: Intent= \" + e.Result.IntentId + \" Text= \" + e.Result.Text);\n
        lock (threadLocker)\n
        \[\n
            string json = e.Result.Properties.GetProperty(PropertyId.LanguageUnderstandingServiceResponse_JsonResult);\n
            var result = json.FromJson<IntentResult>();\n
            if (result != null)\n
            \[\n
                intent = result;\n
                string recognizedIntentName = intent.topScoringIntent.intent;\n
\n
                s += \" WITH score = \" + intent.topScoringIntent.score;\n
                Utility.Log(s);\n
\n
                //Insert result inside Intent and KeyWord class that could be extendend when LUIS will be sobstituted\n
                KeyWord[] keyWords = new KeyWord[intent.entities.Count];\n
                for (int i = 0; i < intent.entities.Count; i++)\n
                    keyWords[i] = new KeyWord(intent.entities[i].score, intent.entities[i].type, intent.entities[i].entity);\n
\n
                Intent recognizedIntent = new Intent(intent.topScoringIntent.intent, intent.topScoringIntent.score, e.Result.Text, keyWords);\n
\n
                Action callHanlders = () =>\n
                \[\n
                    if (IntentHandlers.ContainsKey(recognizedIntentName))\n
                        for (int i = 0; i < IntentHandlers[recognizedIntentName].Count; i++)\n
                            IntentHandlers[recognizedIntentName][i].Handle(recognizedIntent);\n
\n
                    intent = null;\n
\n
                    //StartIntentRecognition.Instance.ShowRecognizedText(\"\");\n
                \];\n
                UnityMainThreadDispatcher.Instance().Enqueue(callHanlders);\n
\n
                if (RecognizedIntent != null)\n
                    UnityMainThreadDispatcher.Instance().Enqueue(() => RecognizedIntent(recognizedIntent));\n
            \]\n
        \]\n
    \]\n
    else if (NotRecognizedIntent != null)\n
    \[\n
        UnityMainThreadDispatcher.Instance().Enqueue(() => NotRecognizedIntent(this, EventArgs.Empty));\n
        IntentHandlers[\"None\"][0].HandleIntentNotRecognized();\n
    \]\n
\n
    if (e.Result.Reason == ResultReason.RecognizedSpeech)\n
    \[\n
        Debug.Log(\"RECOGNIZED: Text= \" + e.Result.Text);\n
        UnityMainThreadDispatcher.Instance().Enqueue(() => IntentRecognitionBehaviour.Instance.ShowRecognizedText(e.Result.Text));\n
    \]\n
    else if (e.Result.Reason == ResultReason.NoMatch)\n
    \[\n
        Debug.Log(\"NOMATCH: Speech could not be recognized.\");\n
    \]\n
\]"}
#4{18 19 "OnRecognizedIntent"}
#4{4 5 "void"}
#4{43 44 "object sender, IntentRecognitionEventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "104299080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "OnSpeechEnd"}
 1.3 0.88 4.4 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{108 109 "\[\n
    Debug.Log(\"SpeechEndDetected received: offset: \" + e.Offset);\n
    Debug.Log(\"Speech end detected.\");\n
\]"}
#4{11 12 "OnSpeechEnd"}
#4{4 5 "void"}
#4{37 38 "object sender, RecognitionEventArgs e"}
#4{0 1 ""}
}
#7{#4{8 9 "86016344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "threadLocker"}
 1.6 1.88 4.8 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "threadLocker"}
#4{13 14 "System.Object"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{21 22 "  new System.Object()"}
#4{0 1 ""}
}
:SLSPrivateConstructor.286331648{#4{8 9 "86019424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "creator"}
 0.299999 0.88 2.8 47  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{13 14 "IntentManager"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{8 9 "86018984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "LUISRegion"}
 1.3 1.88 4 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "LUISRegion"}
#4{6 7 "string"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{14 15 "  string.Empty"}
#4{0 1 ""}
}
#6{#4{9 10 "104295160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnSessionStart"}
 1.3 0.88 5.6 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{66 67 "\[\n
    Debug.Log(\"Session started event. Event:\" + e.ToString());\n
\]"}
#4{14 15 "OnSessionStart"}
#4{4 5 "void"}
#4{33 34 "object sender, SessionEventArgs e"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @85 @118 @0 #5{16 3@316 @42 @265 }
#5{16 0}
#5{16 10@18 @358 @202 @226 @304 @214 @292 @166 @30 @253 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@331 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @343 @0 @139 @0 @70 @0 @238 @0 @0 @0 }
#1{30@280 @190 @154 @106 @57 @93 @0 @0 @0 @0 @0 @178 @0 @0 @0 @0 @0 @0 @0 @0 @126 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
