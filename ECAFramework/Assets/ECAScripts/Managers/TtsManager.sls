:ArrayOb.273{6:Dictionary.4369{32 18:SLSProperty.286331392{:String.17{9 10 "104293984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "TtsZone"}
 1.3 0.88 2.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{7 8 "TtsZone"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104542232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "TtsVoiceName"}
 1.3 0.88 4.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{12 13 "TtsVoiceName"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "104348472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "speech"}
 1.3 1.88 2.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{6 7 "speech"}
#4{4 5 "bool"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{5 6 " true"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86362376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1954 1955 "using UnityEngine;\n
using UnityEngine.UI;\n
using Microsoft.CognitiveServices.Speech;\n
using System.IO;\n
using System;\n
using System.Collections;\n
using System.Threading;\n
using System.Collections.Generic;\n
/// <summary>\n
/// Necessary info to call Speech method of TtsManager.\n
/// IsActiveMsg: necessary because if the msg is NOT active and there is a function to execute this must be launched\n
/// </summary>\n
\n
\n
public class SpeechInfo\n
\[\n
    public SpeechInfo(ECAAnimator ecaAnimator, \n
                      string ecaLanguage,   \n
                      string ecaVoiceName, \n
                      string textToSpeech, \n
                      Action functionToBeExecuted = null, \n
                      bool anytime = true, \n
                      bool isActiveMsg = true,\n
                      Func<bool> conditionJustBeforePlay = null)\n
    \[\n
        EcaAnimator = ecaAnimator;\n
        EcaLanguage = ecaLanguage;\n
        EcaVoiceName = ecaVoiceName;\n
        TextToSpeech = textToSpeech;\n
        FunctionToBeExecuted = functionToBeExecuted;\n
        ConditionJustBeforePlay = conditionJustBeforePlay;\n
        Anytime = anytime;\n
        IsActiveMsg = isActiveMsg;\n
    \]\n
\n
    public ECAAnimator EcaAnimator \[ get; set; \]\n
    public string EcaLanguage \[ get; set; \]\n
    public string EcaVoiceName \[ get; set; \]\n
    public String TextToSpeech \[ get; set; \]\n
    public Action FunctionToBeExecuted \[ get; set; \]\n
    public Func<bool> ConditionJustBeforePlay \[ get; set; \]\n
    public bool Anytime \[ get; set; \]\n
    public bool IsActiveMsg \[ get; set; \]\n
\]\n
\n
\n
/// <summary>\n
/// Singleton class that manage server comunication to obtain Audio from specified text.\n
/// When a request is made, a queuing mechanism is managed if the ECA is already talking. \n
/// Furthermore, the request to Azure servers is managed through a new Thread that once obtained the audio, requires its execution \n
/// to another script that also deals with lipSync <see cref=\"ECAAnimator\"/>\n
/// </summary>\n
\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "86368264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{90 91 "public static volatile bool IsSpeaking = false;\n
private static TtsManager instance = null;"}
}
:SLSPrivateMethod.286331408{#4{9 10 "104292808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "OnAudioEnd"}
 1.3 0.88 4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{315 316 "\[\n
    //Execute function when that audio ended\n
    if (currentInfo.FunctionToBeExecuted != null)\n
        currentInfo.FunctionToBeExecuted();\n
\n
    currentInfo.EcaAnimator.AudioEnded -= OnAudioEnd;\n
\n
    if (msgQueue.Count > 0)\n
    \[\n
        ThrowSpeechThread();\n
    \]\n
    else\n
        TtsManager.IsSpeaking = false;\n
\]"}
#4{10 11 "OnAudioEnd"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSPrivateConstructor.286331648{#4{9 10 "104349792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "creator"}
 0.299999 0.88 2.8 47  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "104296728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "SpeechThread"}
 1.3 0.88 4.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2134 2135 "\[\n
    //String text = (String)text_obj;\n
\n
    // Creates an instance of a speech config with specified subscription key and service region.\n
    var config = SpeechConfig.FromSubscription(TtsServiceID, TtsZone);\n
\n
    config.SpeechRecognitionLanguage = currentInfo.EcaLanguage;\n
    config.SpeechSynthesisVoiceName = currentInfo.EcaVoiceName;\n
\n
    // Creates a speech synthesizer.\n
    // Make sure to dispose the synthesizer after use!\n
    using (var synthsizer = new SpeechSynthesizer(config, null))\n
    \[\n
        // Starts speech synthesis, and returns after a single utterance is synthesized.\n
        var result = synthsizer.SpeakTextAsync(currentInfo.TextToSpeech).Result;\n
\n
        //SSML version\n
        //var result = synthsizer.SpeakSsmlAsync(text).Result;\n
\n
        // Checks result.\n
        if (result.Reason == ResultReason.SynthesizingAudioCompleted)\n
        \[\n
            // Since native playback is not yet supported on Unity yet (currently only supported on Windows/Linux Desktop),\n
            // use the Unity API to play audio here as a short term solution.\n
            // Native playback support will be added in the future release.\n
            var sampleCount = result.AudioData.Length / 2;\n
            audioData = new float[sampleCount];\n
            for (var i = 0; i < sampleCount; ++i)\n
            \[\n
                audioData[i] = (short)(result.AudioData[i * 2 + 1] << 8 | result.AudioData[i * 2]) / 32768.0F;\n
            \]\n
            if (currentInfo.ConditionJustBeforePlay == null || !currentInfo.ConditionJustBeforePlay())\n
                UnityMainThreadDispatcher.Instance().Enqueue(currentInfo.EcaAnimator.Play(audioData));\n
            else\n
                OnAudioEnd(null, null);\n
        \]\n
        else if (result.Reason == ResultReason.Canceled)\n
        \[\n
            var cancellation = SpeechSynthesisCancellationDetails.FromResult(result);\n
            Utility.LogError(\"CANCELED:\\nReason= \" + cancellation.Reason + \"\\nErrorDetails= \" + cancellation.ErrorDetails + \" \\nDid you update the subscription info?\");\n
            //TtsManager.IsSpeaking = false;\n
            OnAudioEnd(null, null);\n
        \]\n
    \]\n
\]"}
#4{12 13 "SpeechThread"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "104349352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "currentInfo"}
 1.8 1.88 4.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "currentInfo"}
#4{10 11 "SpeechInfo"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "103671000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{17 18 "public TtsManager"}
 19.8914 2.2 10.88 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{17 18 "public TtsManager"}
#4{0 7 ""}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "104299472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{147 148 "\[\n
        get\n
        \[\n
            if (instance == null)\n
                instance = new TtsManager();\n
            return instance;\n
        \]\n
    \]"}
#4{8 9 "Instance"}
#4{17 18 "static TtsManager"}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "104351112"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "msgQueue"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "msgQueue"}
#4{5 6 "Queue"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{12 13 " new Queue()"}
#4{0 1 ""}
}
#9{#4{9 10 "104295944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ThrowSpeechThread"}
 1.3 0.88 6.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{201 202 "\[\n
    IsSpeaking = true;\n
    speechThread = new Thread(SpeechThread);\n
    currentInfo = (SpeechInfo)msgQueue.Dequeue();\n
    currentInfo.EcaAnimator.AudioEnded += OnAudioEnd;\n
    speechThread.Start();\n
\]"}
#4{17 18 "ThrowSpeechThread"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "104347152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "speechThread"}
 1.6 1.88 4.8 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "speechThread"}
#4{6 7 "Thread"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "104354192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "audioData"}
 2.2 1.88 3.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "audioData"}
#4{7 8 "float[]"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104293592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "TtsServiceID"}
 1.3 0.88 4.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{12 13 "TtsServiceID"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104544192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "TtsLanguage"}
 1.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{11 12 "TtsLanguage"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104294768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Speech"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1000 1001 "\[\n
    if(speechInfo.TextToSpeech == \"\")\n
    \[\n
        if (speechInfo.FunctionToBeExecuted != null)\n
            speechInfo.FunctionToBeExecuted();\n
        return false;\n
    \]\n
\n
    if (!IsSpeaking && speech && speechInfo.IsActiveMsg)\n
    \[\n
        Utility.Log(\"ECA: \" + speechInfo.EcaVoiceName + \" Not speaking. Msg ADDED in the queue: \" + speechInfo.TextToSpeech);\n
        msgQueue.Enqueue(speechInfo);\n
        ThrowSpeechThread();\n
        return true;\n
    \]\n
    else if (IsSpeaking && speechInfo.Anytime && speech && speechInfo.IsActiveMsg)\n
    \[\n
        Utility.Log(\"ECA: \" + speechInfo.EcaVoiceName + \" Is speaking. Msg ADDED in the queue: \" + speechInfo.TextToSpeech);\n
        msgQueue.Enqueue(speechInfo);\n
        return true;\n
    \]\n
    else\n
    \[\n
        Utility.Log(\"ECA: \" + speechInfo.EcaVoiceName + \" NOT added in the queue. text = \" + speechInfo.TextToSpeech);\n
        if (speechInfo.FunctionToBeExecuted != null)\n
            speechInfo.FunctionToBeExecuted();\n
        return false;\n
    \]\n
\]"}
#4{6 7 "Speech"}
#4{12 13 "virtual bool"}
#4{21 22 "SpeechInfo speechInfo"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @109 @42 @50 @0 #6{16 4@177 @135 @94 @162 }
#6{16 0}
#6{16 3@150 @58 @82 }
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@70 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @27 @0 @0 @0 }
#1{30@216 @192 @3 @204 @15 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @123 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
