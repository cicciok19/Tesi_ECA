using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class LogWriter : MonoBehaviour
{
    [SerializeField] string logName;
    [SerializeField] private string path = "Assets/Demo/ACLSDemo/Logs";
    private System.DateTime date;
    StreamWriter writer;

    private void Start()
    {
        date = System.DateTime.Now;
        CreateDocument();
    }

    private void CreateDocument()
    {
        path = path + "/" + logName + ".txt";
        File.Create(path).Dispose();
        writer = new StreamWriter(path);

        writer.WriteLine(logName + " | " + date.ToString());
    }

    public void AddCorrectActionLog(string action)
    {
        string correct = "  | CORRECT | : " + action;
        writer.WriteLine(correct);
    }

    public void AddWrongActionLog(string action)
    {
        string wrong = "  | WRONG | : " + action;
        writer.WriteLine(wrong);
    }

    public void AddForgottenActionsLog(Node node)
    {
        string text = "You forgot to do/trigger these actions: \n";

        foreach(string s in node.incompleteActions)
        {
            text += "  " + s + "\n";
        }

        writer.Write(text);
    }

    public void AddCompleteNodeLog(string newNode)
    {
        writer.WriteLine("NODE COMPLETED");
        AddNewNodeLog(newNode);
    }

    public void AddNewNodeLog(string nodeName)
    {
        writer.WriteLine(nodeName.ToUpper() + " SETTED");
    }
}
