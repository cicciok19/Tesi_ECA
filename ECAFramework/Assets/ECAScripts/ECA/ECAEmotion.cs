/* File ECAEmotion C# implementation of class ECAEmotion */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// global declaration end

/// <summary>
/// This class represents a specific emotion (eg. joy, sadness, etc).
/// - It keeps track of the value of this specific emotion and its level; 
/// - allows you to specify the parameters that define when to go from one level to another (thrashold values);
/// - All parameters (eg. the maximum and minimum values, thrashold ecc) are provided with default values.
/// </summary>
public class ECAEmotion
{
    public event EventHandler SwitchedLevel;

    protected float _value;

    /// <summary>
    /// By default MaxValue = 1.5, MinValue = -1.5, MediumHighThrashold = 0.5, LowMediumThrashold = -0.5
    /// </summary>
    /// <param name="initialValue"></param>
    public ECAEmotion(AvailableEmotions emotionType, float initialValue = 0)
    {
        EmotionType = emotionType;
        MaxValue = 1.5f;
        MinValue = -1.5f;
        MediumHighThreshold = 0.5f;
        LowMediumThreshold = -0.5f;
        Value = initialValue;
        Level = BelongToLevel(Value);
    }




    private static float Clamp(float value, float min, float max)
    {
        return (value < min) ? min : (value > max) ? max : value;
    }

    //// <summary>
    /// Given a value, the method check which level it belongs to those provided in <see cref="EmotionLevel"/>
    /// </summary>
    /// <param name="value"></param>
    /// <returns>Level of the this emotion for the value passed as parameter</returns>
    private EmotionLevel BelongToLevel(float value)
    {
        if (value > MediumHighThreshold)
            return EmotionLevel.High;
        else if (value < LowMediumThreshold)
            return EmotionLevel.Low;
        else
            return EmotionLevel.Medium;
    }


    /// <summary>
    /// Update the Value adding deltaValue parameter (which can also be negative).
    /// It also checks whether the update involves a change of status <see cref="EmotionLevel"/>
    /// </summary>
    /// <param name="deltaValue">Added to <see cref="Value"/>. use negative values in order to subtract</param>
    /// <returns></returns>
    public float UpdateValue(float deltaValue)
    {
        float newValue = Clamp(Value + deltaValue, MinValue, MaxValue);
        Value = newValue;
        if (!BelongToLevel(newValue).Equals(Level))
        {
            Level = BelongToLevel(newValue);
            if (SwitchedLevel != null)
                SwitchedLevel(this, EventArgs.Empty);
        }
        return Value;
    }


    public float Value
    {
      get {
    	return _value;
      }
     
      set {
    	_value = value;
        Level = BelongToLevel(value);
      }
    }


    public AvailableEmotions EmotionType
    { get; set; }


    public static float MaxValue
    { get; protected set; }


    public static float MinValue
    { get; protected set; }


    public float LowMediumThreshold
    { get; set; }


    public float MediumHighThreshold
    { get; set; }


    public override string ToString()
    {
        return "Emotion Type: " + this.EmotionType.ToString() + "\n" +
                "Actual value = " + this.Value + "\n" +
                "Actual Level = " + this.Level.ToString() + "\n" +
                "Max value = " + MaxValue + " Min value = " + MinValue + " LowMediumThrashold = " + LowMediumThreshold + " MediumHighThrashold = " + MediumHighThreshold + "\n";
    }


    public float NormalizedValue
    {
      get {
    	return (_value - MinValue) / (MaxValue - MinValue);
      }
     
    }


    public EmotionLevel Level
    { get; set; }


}
