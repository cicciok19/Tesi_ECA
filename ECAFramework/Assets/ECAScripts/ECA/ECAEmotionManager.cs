/* File ECAEmotionManager C# implementation of class ECAEmotionManager */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// Aprraisal variables are used from external events, actions ecc to specify how it must be perceived by an ECA
/// these will then be used to update the agent's emotional state
/// </summary>
/// 

public class EmotionArgs : EventArgs
{
    public EmotionArgs(ECAEmotion emotion)
    {
        ActualEmotion = emotion;
    }
    public ECAEmotion ActualEmotion { get; set; }
}

	public enum AppraisalVariables
{
    Good,
    Bad,
    UnexpectedPositive,
    UnexpectedNegative,
    Nice,
    Nasty
}
/// <summary>
/// possible emotions that the echo can feel
/// </summary>
	public enum AvailableEmotions
{
    Joy,
    Trust,
    Fear,
    Surprise,
    Sadness,
    Disgust,
    Anger,
    Anticipation,
    None
}
/// <summary>
/// Given one of the emotions specified in  <see cref="AvailableEmotions"/>, this can be in one of the following intensity levels
/// </summary>
	public enum EmotionLevel
{
    Low,
    Medium,
    High
}
// global declaration end

/// <summary>
/// Create a set of emotions and use rules in XML file that define how each <see cref="AppraisalVariables"/> affect different emotions.
/// It also keeps track of the current emotion, that is the one with a higher intensity value.
/// Finally launches an event to notify when the emotional state is updated
/// </summary>
public class ECAEmotionManager
{
    public event EventHandler ActualEmotionUpdated;
    public event EventHandler ActualEmotionChanged;

    private ECAEmotion actualEmotion;

    public Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> Rules;

    /// <summary>
    /// Define <see cref="Emotions"/> provided emotions and set rules that define how appraisal variables affect emotions.
    /// </summary>
    /// <param name="xmlDocumentForModel">name of xml document that contains rules about appraisal variables</param>
    public ECAEmotionManager(string xmlDocumentForModel)
    {
    
        ECAEmotion Joy = new ECAEmotion(AvailableEmotions.Joy);
        ECAEmotion Trust = new ECAEmotion(AvailableEmotions.Trust);
        ECAEmotion Fear = new ECAEmotion(AvailableEmotions.Fear);
        ECAEmotion Surprise = new ECAEmotion(AvailableEmotions.Surprise);
        ECAEmotion Sadness = new ECAEmotion(AvailableEmotions.Sadness);
        ECAEmotion Disgust = new ECAEmotion(AvailableEmotions.Disgust);
        ECAEmotion Anger = new ECAEmotion(AvailableEmotions.Anger);
        ECAEmotion Anticipation = new ECAEmotion(AvailableEmotions.Anticipation);
    
        Emotions = new Dictionary<AvailableEmotions, ECAEmotion>{
            {Joy.EmotionType, Joy },
            {Trust.EmotionType, Trust},
            {Fear.EmotionType, Fear},
            {Surprise.EmotionType, Surprise},
            {Sadness.EmotionType, Sadness},
            {Disgust.EmotionType, Disgust},
            {Anger.EmotionType, Anger },
            {Anticipation.EmotionType, Anticipation }
        };

        //initialize random emotion
        int random = UnityEngine.Random.Range(0, Emotions.Count - 2);
        AvailableEmotions[] emotion = (AvailableEmotions[])Enum.GetValues(typeof(AvailableEmotions));
        actualEmotion = Emotions[emotion[random]];

        //just for debug
        //actualEmotion = Anger;
        actualEmotion.SwitchedLevel += OnSwitchedLevel;

        if (xmlDocumentForModel != "")
            Rules = XmlParser.GetEmotionModel(xmlDocumentForModel);
    }

    /// <summary>
    /// Update emotion by appraisal variable.
    /// </summary>
    /// <param name="appraisalVariable"><see cref="AppraisalVariables"/> related to event</param>
    /// <param name="scaleFactor">dull or amplifies the effect</param>
    public void UpdateEmotion(AppraisalVariables appraisalVariable, float scaleFactor = 1.0f)
    {
        if (Rules == null || Rules.Count == 0)
        {
            Utility.LogError("No rules defined");
            return;
        }
        if (Rules.ContainsKey(appraisalVariable))
        {
            var tempActualEmotion = ActualEmotion;

            for (int i = 0; i < Rules[appraisalVariable].Count; i++)
            {
                ECAEmotion EmotionToUpdate = Emotions[Rules[appraisalVariable][i].Key];
                EmotionToUpdate.UpdateValue(Rules[appraisalVariable][i].Value * scaleFactor);
                if (EmotionToUpdate.Value > ActualEmotion.Value)
                {
                    ActualEmotion = EmotionToUpdate;
                } 
            }

            if(tempActualEmotion != ActualEmotion)
            {
                if (ActualEmotionChanged != null)
                {
                    EmotionArgs args = new EmotionArgs(ActualEmotion);
                    ActualEmotionChanged(this, args);
                }
            }
        }
        else
        {
            Utility.LogError("there is no rule that controls this Appraisal Variable: " + appraisalVariable.ToString());
        }
    
        if (ActualEmotionUpdated != null)
            ActualEmotionUpdated(this, EventArgs.Empty);
    }

    /// <summary>
    /// Current main emotion (the one with highest <see cref="ECAEmotion.Value"/>)
    /// </summary>
    public ECAEmotion ActualEmotion
    { get => actualEmotion;
        set 
        {
            actualEmotion.SwitchedLevel -= OnSwitchedLevel;
            actualEmotion = value;
            actualEmotion.SwitchedLevel += OnSwitchedLevel;
        } 
    }


    public override string ToString()
    {
        string s = "";
    
        foreach (KeyValuePair<AvailableEmotions, ECAEmotion> emotion in Emotions)
            s += emotion.Value.ToString() + "\n";
    
        s += "\n\nRULES: \n";
    
        foreach (KeyValuePair<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> rule in Rules)
        {
            for (int i = 0; i < rule.Value.Count; i++)
            {
                s += rule.Key.ToString() + ": " + rule.Value[i].Key.ToString() + " = " + rule.Value[i].Value.ToString() + "\n";
            }
        }
    
        return s;
    }

    /// <summary>
    /// Set the initial emotion
    /// </summary>
    /// <param name="emotion"></param>
    /// <param name="strength"></param>
    public void InitActualEmotion(AvailableEmotions emotion,float strength)
    {
       ActualEmotion = Emotions[emotion];
       ActualEmotion.Value = strength;
    }

    private void OnSwitchedLevel(object sender, EventArgs e)
    {
        if (ActualEmotionUpdated != null)
            ActualEmotionUpdated(this, EventArgs.Empty);
    }


    public Dictionary<AvailableEmotions, ECAEmotion> Emotions
    { get; protected set; }


}
