using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// For each <see cref="Criteria"/>, it defines the threshold values that determine the passage from one <see cref="Labels"/> to another 
/// and the texts associated with these changes.
/// For now, in this project we use only 2 <see cref="SmartActionCriteria"/> of type <see cref="Criteria.Accuracy"/> and <see cref="Criteria.Staging"/> 
/// that can be in 3 different states (<see cref="Labels"/>): <see cref="Labels.Good"/>, <see cref="Labels.Normal"/>, <see cref="Labels.Bad"/>.
/// In general, other parameters could be added later.
/// In general, this class defines:
/// 1) an array of texts: used for Text-To-Speech
/// 2) Threshold values that will be used by other scripts to verify the transition of the state from one Labels to another.
/// </summary>
public class SmartActionCriteria
{
    static int numberOfLabels = Enum.GetNames(typeof(Labels)).Length;
    static int numberOfCriteria = Enum.GetNames(typeof(Criteria)).Length;
   
    public SmartActionCriteria(Criteria criteria, String[] txts, float[] limits)
    {
        CriteriaType = criteria;
        Txts = txts;
        Limits = limits;
    }
    public SmartActionCriteria(string good, string normal, string bad, float goodLimit, float normalLimit, float badLimit)
    {
        //init text valus
        Txts = new string[numberOfLabels];
        Txts[(int)Labels.Good] = good;
        Txts[(int)Labels.Normal] = normal;
        Txts[(int)Labels.Bad] = bad;

        //init limit values
        Limits = new float[numberOfLabels];
        Limits[(int)Labels.Good] = goodLimit;
        Limits[(int)Labels.Normal] = normalLimit;
        Limits[(int)Labels.Bad] = badLimit;

    }

    public String getText(Labels state)
    {
        return Txts[(int)state];
    }
    //getters and setters
    public string Good { get => Txts[(int)Labels.Good]; set => Txts[(int)Labels.Good] = value; }
    public string Normal { get => Txts[(int)Labels.Normal]; set => Txts[(int)Labels.Normal] = value; }
    public string Bad { get => Txts[(int)Labels.Bad]; set => Txts[(int)Labels.Bad] = value; }
    public float GoodLimit { get => Limits[(int)Labels.Good]; set => Limits[(int)Labels.Good] = value; }
    public float NormalLimit { get => Limits[(int)Labels.Normal]; set => Limits[(int)Labels.Normal] = value; }
    public float BadLimit { get => Limits[(int)Labels.Bad]; set => Limits[(int)Labels.Bad] = value; }
    public static int NumberOfCriteria { get => numberOfCriteria; }
    public static int NumberOfLabels { get => numberOfLabels; }

    //Parameters
    public string[] Txts { get; set; }
    public float[] Limits { get; set; }
    public Criteria CriteriaType { get; set; }

    public override string ToString()
    {
        return CriteriaType.ToString() + ":" +
               "\n goodText: " + Good +
               "\n normalText: " + Normal +
               "\n badText: " + Bad +
               "\n goodLimit: " + GoodLimit +
               "\n normalLimit: " + NormalLimit +
               "\n badLimit: " + BadLimit;
    }
}