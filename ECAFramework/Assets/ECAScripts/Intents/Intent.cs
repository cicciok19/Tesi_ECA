using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Intent
{
    public Intent(string intentName, double score, string recognizedText, KeyWord[] keyWords)
    {
        IntentName = intentName;
        Score = score;
        RecognizedText = recognizedText;
        KeyWords = keyWords;
    }

    public string IntentName{get; set;}
    public double Score { get; set; }
    public string RecognizedText { get; set; }
    public KeyWord[] KeyWords { get; set; }
}
