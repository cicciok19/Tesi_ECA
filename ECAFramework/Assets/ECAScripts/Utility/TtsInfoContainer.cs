using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// This class is a container for all information related to the various actions needed for SpeechToText.
/// In particular an array of <see cref="SmartActionCriteria"/> for now made up of 2 elements: Accuracy obj and Staging obj.
/// <see cref="Weight"/> is used to determine the importance of the action in the game. In this way, the ECA can decide (based on its <see cref="ECA.EcaPresence"/>) 
/// whether to reproduce the message or not.
/// The other elements are self-explanatory.
/// </summary>
public class TtsInfoContainer
{
    private SmartActionCriteria[] stateAttributes;

    public TtsInfoContainer(String actionName)
    {
        stateAttributes = new SmartActionCriteria[SmartActionCriteria.NumberOfCriteria];
        ActionName = actionName;
        SmartActionMsgs = new Dictionary<string, string>();
    }
    
    public void SetCriteriaTTSInfo(Criteria type, SmartActionCriteria obj)
    {
        stateAttributes[(int)type] = obj;
    }
    public SmartActionCriteria GetCriteriaTTSInfo(Criteria attribute)
    {
        if((int)attribute > stateAttributes.Length)
        {
            Utility.LogError("ERROR: Not all state elements have been initialized. " +
                                "Check if they are in the xml file or if they are not considered in the parser script" +
                                " Number of state elements are: " + SmartActionCriteria.NumberOfCriteria);
            return null;
        }

        return stateAttributes[(int)attribute];
    }
   
    public String ActionName { get; set; }
    public Presence Weight { get; set; }
    public Dictionary<string, string> SmartActionMsgs { get; set; }
    public override string ToString()
    {
        String s = "";
        foreach(SmartActionCriteria attribute in stateAttributes)
            s += attribute.ToString() + " \n";

        foreach (KeyValuePair<string, string> txt in SmartActionMsgs)
            s += txt.Key + ": " + txt.Value + "\n";

        //s += "Description: " + Description + "\n End Message: " + EndMessage + "\n Help Message: " + HelpMessage + "\n";
        return "TextContainer of " + this.ActionName + " With Weight of: " + Weight + "\n " + s;
    }
}

