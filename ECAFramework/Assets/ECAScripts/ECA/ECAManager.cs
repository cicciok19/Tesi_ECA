/* File ECAManager C# implementation of class ECAManager */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
	public enum Ecas
{
    Sophie_G,
    Sophie_R,
    Sophie_B,
    Turi,
    Sophie
}

// global declaration end

/// <summary>
/// Singleton class that contains a list of available ECAs accessible via an ID (defined by the Enum: Ecas).
/// It contains a state that represents the general progress of the FULL procedure,
/// represented by the typical attributes defined in the State class <see cref="State"/>.
/// the percentage of completion is increased each time a node of SmartActionNode types is terminated by a quantity equal to 1 / NodeNumber.
/// Accuracy and Staging are a weighted average of individual smart action values
/// </summary>
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

    /// <summary>
    /// Return a list of ECA watched by the user. Useful for example to know which ECA must respond
    /// </summary>
    /// <returns></returns>
    public List<ECA> FocusedECA()
    {
        List<ECA> focusedECAs = new List<ECA>();
        foreach (KeyValuePair<Ecas, ECA> eca in AvailableEcas)
            if (eca.Value.ECAAnimator.IsWatchingMe(Camera.main))
                focusedECAs.Add(eca.Value);
    
        return focusedECAs;
    }

    #region GlobalStateManaging

    public void UpdatePercentage()
    {
        GlobalState.Percentage += PercentageUnit;
        if (GlobalState.Percentage > 1)
            GlobalState.Percentage = 1;
    }

    /// <summary>
    /// tipically colled from the GameManager in order to set the start game time
    /// </summary>
    public void SetStartTime()
    {
        GlobalState.StartTaskTime = DateTime.Now;
    }

    /// <summary>
    /// tipically colled from the GameManager in order to set the end game time
    /// </summary>
    public void SetEndTime()
    {
        GlobalState.EndTaskTime = DateTime.Now;
    }

    /// <summary>
    /// called from all SmartActionNodes in order to update accuracy. Global accuracy is computed as an avarage of all completed nodes
    /// in relation to the total number of nodes
    /// </summary>
    /// <param name="localAccuracy"> Accuracy of just completed SmartAction</param>
    public void UpdateAccuracy(float localAccuracy)
    {
        Utility.Log("Accuracy formula: " + GlobalState.Accuracy + " - ( 1 - " + localAccuracy + ")/ " + NumberOfNodes);
        GlobalState.Accuracy -= (1 - localAccuracy) / NumberOfNodes;
    }

    /// <summary>
    /// called from all SmartActionNodes in order to update Staging. Global Staging is computed as an avarage of all completed nodes
    /// in relation to the total number of nodes
    /// </summary>
    /// <param name="localAccuracy"> Staging of just completed SmartAction</param>
    public void UpdateStaging(float localStaging)
    {
        Utility.Log("Staging formula: " + GlobalState.Staging + " + (" + localStaging + ")/ " + NumberOfNodes);
        GlobalState.Staging += localStaging / NumberOfNodes;
    }

    /// <summary>
    /// Call from the ended node in order to update <see cref="GlobalState"/>
    /// </summary>
    /// <param name="action"></param>
    public void EndedNode(SmartAction action)
    {
        CompletedNodes++;
        UpdatePercentage();
        UpdateAccuracy(action.Accuracy);
        UpdateStaging(action.Staging);
    }

    #endregion

    public State GlobalState
    { get; set; }


    public int NumberOfNodes
    { get; set; }


    public int CompletedNodes
    { get; set; }


    public float PercentageUnit
    { get; set; }

    /// <summary>
    /// Available ECAs in the application
    /// </summary>
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
