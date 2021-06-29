using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Microsoft.CognitiveServices.Speech;
using System;

public class AzureTTSModel : TTSModel
{
    
    public AzureTTSModel()
    {
        ttsType = AvailableTTS.Azure;
    }

    public override void GenerateSpeechThread(SpeechInfo currentInfo)
    {
        //String text = (String)text_obj;
        float[] audioData;

        // Creates an instance of a speech config with specified subscription key and service region.
        var config = SpeechConfig.FromSubscription(TtsManager.Instance.TtsServiceID, TtsManager.Instance.TtsZone);

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
                    TtsManager.Instance.OnAudioEnd(this, EventArgs.Empty);
            }
            else if (result.Reason == ResultReason.Canceled)
            {
                var cancellation = SpeechSynthesisCancellationDetails.FromResult(result);
                Utility.LogError("CANCELED:\nReason= " + cancellation.Reason + "\nErrorDetails= " + cancellation.ErrorDetails + " \nDid you update the subscription info?");
                //TtsManager.IsSpeaking = false;
                TtsManager.Instance.OnAudioEnd(this, EventArgs.Empty);
                
            }
        }
    }

}
