using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// The class collects the necessary information that defines the state of a generic Task.
/// these elements are:
/// - Percentage
/// - Accuracy
/// - Staging
/// - StartTaskTime
/// - EndTaskTime
/// </summary>
public class State
{

    public State()
    {
        Percentage = 0.0f;
        Accuracy = 1.0f;
        StartTaskTime = DateTime.MinValue;
        Staging = 0.0f;
    }
    public State(float percentage, float accuracy, DateTime startTaskTime, float staging)
    {
        Percentage = percentage;
        Accuracy = accuracy;
        StartTaskTime = startTaskTime;
        Staging = staging;
    }

    //State parameters
    public float Percentage { get; set; }
    public float Accuracy { get; set; }
    public float Staging { get; set; }
    public DateTime StartTaskTime { get; set; }
    public DateTime EndTaskTime { get; set; }

    public override string ToString()
    {
        return "Percentage: " + Percentage + "\n" +
            "Accuracy: " + Math.Round(Accuracy, 1) + "\n" +
            "Start Time: " + StartTaskTime + "\n" +
            "Staging: " + Staging + "\n" +
            "End Time: " + EndTaskTime; ;
    }
}
