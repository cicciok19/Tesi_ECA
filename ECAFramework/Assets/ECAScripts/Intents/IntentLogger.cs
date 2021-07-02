using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class IntentLogger
{
    private static IntentLogger _instance = null;
    private string path = "Assets/Demo/ConversationDemo/Logs";
    private string filename;

    public static IntentLogger Instance
    {
        get
        {
            if (_instance == null)
                _instance = new IntentLogger();
            return _instance;
        }
    }

    public void Init(string filename)
    {
        this.filename = filename;

        path = path + "/" + filename + "_IL.txt";
        string content = filename + " | INTENT LOGGER"  + "\n";
        File.WriteAllText(path, content);
    }

    public void IntentRecognized(string intentName, string speechRecognized, double score)
    {
        string line = "RECOGNIZED | in: " + intentName + ", sr: " + speechRecognized + ", score: " + score.ToString() + "\n";
        File.AppendAllText(path, line);
    }

    public void IntentNotRecognized(string speechRecognized)
    {
        string line = "NOT RECOGNIZED | sr: " + speechRecognized;
        File.AppendAllText(path, line);
    }

    public void SpeechNotRecognized()
    {
        string line = "SPEECH NOT RECOGNIZED";
        File.AppendAllText(path, line);
    }


}
