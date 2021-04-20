/* File ECAManager C# implementation of class ECAManager */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public enum Ecas
{
    Default,
    Sophie_G,
    Sophie_R,
    Sophie_B,
    Turi,
    Sophie
}

/// <summary>
/// Singleton class that contains a list of available ECAs accessible via an ID (defined by the Enum: Ecas).
/// It contains a state that represents the general progress of the FULL procedure,
/// represented by the typical attributes defined in the State class <see cref="State"/>.
/// the percentage of completion is increased each time a node of SmartActionNode types is terminated by a quantity equal to 1 / NodeNumber.
/// Accuracy and Staging are a weighted average of individual smart action values
/// </summary>


// global declaration end

public class ECAManager
{
// class declaration start
private static ECAManager instance = null;
private static readonly object padlock = new object();
// class declaration end



    private ECAManager()
    {
        GlobalState = new State();
        /*
        NumberOfNodes = GameObject.FindObjectOfType<GameManager>().NumberOfNodes;
        CompletedNodes = 0;
        PercentageUnit = 1f / NumberOfNodes;
        GlobalState.Accuracy = 1;
        */
        AvailableEcas = new Dictionary<Ecas, ECA>();
    }



    public List<ECA> FocusedECA()
    {
        List<ECA> focusedECAs = new List<ECA>();
        foreach (KeyValuePair<Ecas, ECA> eca in AvailableEcas)
            if (eca.Value.ecaAnimator.IsWatchingMe(Camera.main))
                focusedECAs.Add(eca.Value);
    
        return focusedECAs;
    }


    public void UpdatePercentage()
    {
        GlobalState.Percentage += PercentageUnit;
        if (GlobalState.Percentage > 1)
            GlobalState.Percentage = 1;
    }


    public void SetStartTime()
    {
        GlobalState.StartTaskTime = DateTime.Now;
    }


    public void SetEndTime()
    {
        GlobalState.EndTaskTime = DateTime.Now;
    }


    public void UpdateAccuracy(float localAccuracy)
    {
        Utility.Log("Accuracy formula: " + GlobalState.Accuracy + " - ( 1 - " + localAccuracy + ")/ " + NumberOfNodes);
        GlobalState.Accuracy -= (1 - localAccuracy) / NumberOfNodes;
    }


    public void UpdateStaging(float localStaging)
    {
        Utility.Log("Staging formula: " + GlobalState.Staging + " + (" + localStaging + ")/ " + NumberOfNodes);
        GlobalState.Staging += localStaging / NumberOfNodes;
    }


    public void EndedNode(SmartAction action)
    {
        CompletedNodes++;
        UpdatePercentage();
        UpdateAccuracy(action.Accuracy);
        UpdateStaging(action.Staging);
    }


    public State GlobalState
    { get; set; }


    public int NumberOfNodes
    { get; set; }


    public int CompletedNodes
    { get; set; }


    public float PercentageUnit
    { get; set; }


    public Dictionary<Ecas, ECA> AvailableEcas
    { get; set; }


    public static ECAManager Instance
    {
            get
            {
                lock (padlock)
                {
                    if (instance == null)
                    {
                        instance = new ECAManager();
                    }
                    return instance;
                }
            }
        }


}
