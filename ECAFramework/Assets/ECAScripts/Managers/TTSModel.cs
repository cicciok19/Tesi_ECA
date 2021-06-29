using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class TTSModel
{
    public AvailableTTS ttsType;
    public virtual void GenerateSpeechThread() { }
    public virtual void GenerateSpeechThread(SpeechInfo currentInfo) { }
}

