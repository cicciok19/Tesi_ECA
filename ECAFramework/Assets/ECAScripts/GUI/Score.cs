using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Score : MonoBehaviour
{
    public Text _scoreTxt;
    double _score;

    // Start is called before the first frame update
    void Start()
    {

    }
    /*
    public void setListOfNodes(GameGraphNode[] nodes)
    {
        _simpleNodes = nodes;
    }
    */

    public void showScoreTab(GameGraphNode[] nodes)
    {
        String finalTab = "number of nodes: " + nodes.Length.ToString() + "\n";
        for(int i = 0; i< nodes.Length; i++)
        {
            if (!nodes[i].IsCompleted)
            {
                finalTab += nodes[i].ReadableName + " has not been made \n";
                continue;
            }
            else
            {
                String info = nodes[i].ReadableName + " is played in " + nodes[i].TimeSpent() + " seconds.";
                if (!nodes[i].IsScheduled)
                    info += " WARNING: not at the right time";
                /*
                if (nodes[i].IsScheduled)
                    info += "at the right order";
                else
                    info += "but not at the right order";
                */
                finalTab += info + "\n";
            }
        }
        finalTab += "\n\n\n FINAL SCORE: " + _score;

        _scoreTxt.text = "REPORT: \n" + finalTab;
    }

    public void updateScore(double score)
    {
        _score = score;
        _scoreTxt.text = "SCORE: " + score.ToString();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
