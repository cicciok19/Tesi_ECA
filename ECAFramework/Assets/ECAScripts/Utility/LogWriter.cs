using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class LogWriter : MonoBehaviour
{
    [SerializeField] string logName;
    [SerializeField] private string path = "Assets/Demo/ACLSDemo/Logs";
    private System.DateTime date;
    private float startTime;

    private void Start()
    {
        date = System.DateTime.Now;
        startTime = Time.time;
        //CreateDocument();
    }

    private void CreateDocument()
    {
        date = System.DateTime.Now;
        path = path + "/" + logName + ".txt";
        string content = logName + " | " + date.ToString() + "\n";
        File.WriteAllText(path, content );
    }

    public void AddCorrectActionLog(string action)
    {
        string correct = "  | CORRECT | : " + action + "\n";
        File.AppendAllText(path, correct);
    }

    public void AddWrongActionLog(string action)
    {
        string wrong = "  | WRONG | : " + action + "\n";
        File.AppendAllText(path, wrong);
    }

    public void AddForgottenActionsLog(Node node)
    {
        string text = "  /WRONG ADVANCE/ \n";
        text += "  You forgot to do/trigger these actions: \n";

        foreach(string s in node.incompleteActions)
            text += "    - " + s + "\n";

        text += node.NodeName.ToString() + " aborted \n";
        File.AppendAllText(path, text);
    }

    public void AddCompleteNodeLog(string node)
    {;
        File.AppendAllText(path, node + " node completed \n\n");
        //AddNewNodeLog(newNode);
    }

    public void AddNewNodeLog(string nodeName)
    {
        if (!File.Exists(path))
            CreateDocument();
        File.AppendAllText(path, nodeName + " setted \n");
    }

    public void AddEndApplicationLog()
    {
        var actualTime = Time.time;
        //int minutes = (actualTime - startTime) % 60;
        string end = "APPLICATION CLOSED";
        File.AppendAllText(path, end);
    }
}
