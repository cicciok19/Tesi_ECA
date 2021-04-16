using IntentRecognitionResults;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public enum Labels
{
    Good,
    Normal,
    Bad,
    None
}
public enum Criteria
{
    Accuracy,
    Staging
}
public enum Presence
{
    Low,
    Medium,
    High
}
/// <summary>
/// Every time a state element changes in value, the StateUpdated event is launched. 
/// Some attributes are simple (like percentage, startTime ecc), but others are more complex (i.e. Staging and Accuracy that have a <see cref="Labels"/>). 
/// This class is used to transmit additional information by <see cref="SmartAction.StateUpdated"/> event. In particular:
///1) if the newly updated attribute is simple or Labeled
///2) if it were Labeled if the new value caused a Label switch (for example from good to normal)
/// </summary>
public class SmartActionEventArgs: EventArgs
{
    public SmartActionEventArgs(bool isLabeledAttributeUpdated, bool isLabelSwitched = false)
    {
        IsLabeledAttribute = isLabeledAttributeUpdated;
        IsLabelSwitched = isLabelSwitched;
    }

    public bool IsLabeledAttribute { get; private set; }
    public bool IsLabelSwitched { get; private set; }
}

/// <summary>
/// A SmartAction is created to update and store the state of a task over time.
/// It defines significant events that allow other scripts to react when there is some change: 
/// - start, finished, restarted, paused
/// - StateUpdated: launched whenever a state parameter changes (<see cref="SmartActionEventArgs"/>)
/// 
/// In order to update the state, some basic parameters for updating accuracy and staging are defined and setted with some default parameters.
/// - Each <see cref="StagingUpdateTime"/> seconds the staging is increased by <see cref="StagingUpdateFactor"/>;
/// - Each time the <see cref="UpdateAccuracy(float)"/> is called, its value is decreased by float parameter, of by <see cref="AccuracyPenalty"/> if no parameter is not provided;
/// </summary>
public abstract class SmartAction: State
{
    public event EventHandler Started;
    public event EventHandler Finished;
    public event EventHandler Restarted;
    public event EventHandler Paused;
    public event EventHandler<SmartActionEventArgs> StateUpdated;

    protected SmartAction(int smartActionID): base()
    {
        ID = smartActionID;
        LabelOfCriteria = new Labels[Enum.GetNames(typeof(Labels)).Length];
        LabelOfCriteria[(int)Criteria.Accuracy] = Labels.Good;
        LabelOfCriteria[(int)Criteria.Staging] = Labels.Good;
    }

    /// <summary>
    /// Start the action, or stop Pause
    /// </summary>
    public virtual void Start()
    {
        if (!IsPaused)
        {
            //Utility.Log(this.GetType() + " started");
            StartTaskTime = DateTime.Now;
        }
        else
            Utility.Log("Smart Action: " + this.GetType() + " REstarted");

        IsPaused = false;
        IsFinished = false;
        EndTaskTime = DateTime.MinValue;
        Percentage = 0;

        IsStarted = true;

        //throw StateValueUpdated event
        SimpleAttributeUpdated();

        //throw started event
        if (Started != null)
            Started(this, EventArgs.Empty);

        StartUpdateStaging();
    }
    /// <summary>
    /// Set percentage to 1, the end time and throw corresponding events.
    /// </summary>
    public virtual void Finish()
    {
        IsFinished = true;
        StopUpdateStaging();
        EndTaskTime = DateTime.Now;
        Percentage = 1;

        SimpleAttributeUpdated();

        if (Finished != null)
            Finished(this, EventArgs.Empty);
    }
    /// <summary>
    /// Only possible if the action was not completed (finished).
    /// Restart the SmartAction means that all parameters are reset to initial state.
    /// </summary>
    public virtual void Restart()
    {
        if (IsFinished)
        {
            Utility.LogError("can not restart if finished!");
            return;
        }

        Accuracy = 1; //restart from 1
        Percentage = 0;
        Staging = 0;

        LabeledAttributeUpdated(false);

        if (Restarted != null)
            Restarted(this, EventArgs.Empty);
    }
    /// <summary>
    /// when the action is paused, accuracy and staging are no longer updated. To end the pause, call <see cref="Start"/>
    /// </summary>
    public virtual void Pause()
    {
        //Utility.Log("Smart Action: " + this.GetType() + " si Paused");
        IsPaused = true;
        StopUpdateStaging();

        if (Paused != null)
            Paused(this, EventArgs.Empty);
    }

    //Staging management
    /// <summary>
    /// Since SmartAction class is not a MonoBehaviour it is used <see cref="WaitingUtility"/> in order to keep time.
    /// After a <see cref="StagingInitialDelay"/> (that by default is zero) start to decrease Staging by <see cref="StagingUpdateFactor"/> 
    /// each <see cref="StagingUpdateTime"/> seconds.
    /// </summary>
    public void StartUpdateStaging()
    {
        //srtart updating staging
        IsStagingActive = true;
        //GameObject.FindObjectOfType<WaitingUtility>().startWaitingStaging(this, StagingInitialDelay);
        WaitingUtility.Instance.startWaitingStaging(this, StagingInitialDelay);
    }
    /// <summary>
    /// Every <see cref="StagingUpdateTime"/> the <see cref="State.Staging"/> is updated. 
    /// In particular it has decreased by a factor equal to <see cref="StagingUpdateFactor"/>.
    /// Throw <see cref="StateUpdated"/> event.
    /// </summary>
    public virtual void UpdateStaging()
    {
        //if (Staging == 1 || IsPaused || !IsStarted || IsFinished)
        if (IsPaused || !IsStarted || IsFinished)
            return;

        float newValue = Staging + StagingUpdateFactor;
        if (newValue > 1)
            newValue = 1;

        LastUpdatedCriteria = Criteria.Staging;

        Labels newState = CheckStateSwitching(this.ID, (int)Criteria.Staging, Staging, newValue);

        Staging = newValue;

        //update staging level and throw relative event
        if (newState != Labels.None)
        {
            StagingLabel = newState;
            LabeledAttributeUpdated(true);
        }
        else
            LabeledAttributeUpdated(false);
    }
    public virtual void StopUpdateStaging()
    {
        IsStagingActive = false;
    }

    //Accuracy management
    /// <summary>
    /// Decrease <see cref="State.Accuracy"/> by parameter value (or default value if not specified = <see cref="AccuracyPenalty"/>)
    /// </summary>
    /// <param name="penalty"></param>
    public virtual void UpdateAccuracy(float penalty = float.NaN)
    {
        if (IsPaused || !IsStarted || IsFinished)
            return;

        float subtractValue;
        if (float.IsNaN(penalty))
            subtractValue = AccuracyPenalty;
        else
            subtractValue = penalty;

        float newValue = Accuracy - subtractValue;
        if (newValue < 0f)
            newValue = 0f;

        Labels newState = CheckStateSwitching(this.ID, (int)Criteria.Accuracy, Accuracy, newValue);
        Accuracy = newValue;

        LastUpdatedCriteria = Criteria.Accuracy;

        //update accuracy level and throw relative event
        if (newState != Labels.None)
        {
            AccuracyLabel = newState;
            LabeledAttributeUpdated(true);
        }
        else
            LabeledAttributeUpdated(false);
    }

    //Events management
    protected virtual void SimpleAttributeUpdated()
    {
        if (StateUpdated != null)
            StateUpdated(this, new SmartActionEventArgs(false));
    }
    protected virtual void LabeledAttributeUpdated(bool isLabelSwitched)
    {
        if (StateUpdated != null)
            StateUpdated(this, new SmartActionEventArgs(true, isLabelSwitched));
    }

    //Update percentage
    protected virtual void IncrementPercentage(float incrementAmount)
    {
        Utility.Log("IncrementAmount = " + incrementAmount);
        Percentage += incrementAmount;
        if (Percentage > 1)
            Percentage = 1;

        SimpleAttributeUpdated();
    }

    //Label management
    /// <summary>
    /// In order to correctly access to this array, use the <see cref="Criteria"/> enumerator that defines possible criteria (for now accuracy and staging).
    /// </summary>
    protected Labels[] LabelOfCriteria { get; set; }
    /// <summary>
    /// When is setted, also the <see cref="LastSwitchedCriteria"/> is updated and becomes: "Criteria.Accuracy".
    /// </summary>
    public Labels AccuracyLabel
    {
        get
        {
            return LabelOfCriteria[(int)Criteria.Accuracy];
        }
        set
        {
            LabelOfCriteria[(int)Criteria.Accuracy] = value;
            LastSwitchedCriteria = Criteria.Accuracy;
        }
    }
    /// <summary>
    /// When is setted, also the <see cref="LastSwitchedCriteria"/> is updated and becomes: "Criteria.Staging".
    /// </summary>
    public Labels StagingLabel
    {
        get
        {
            return LabelOfCriteria[(int)Criteria.Staging];
        }
        set
        {
            LabelOfCriteria[(int)Criteria.Staging] = value;
            LastSwitchedCriteria = Criteria.Staging;
        }
    }

    public Criteria LastUpdatedCriteria { get; set; }
    public Criteria LastSwitchedCriteria { get; set; }
    public Labels GetLabelOfCriteria(Criteria criteria)
    {
        return LabelOfCriteria[(int)criteria];
    }
    public Labels GetLabelOfLastSwitchedCriteria()
    {
        return LabelOfCriteria[(int)LastSwitchedCriteria];
    }

    /// <summary>
    /// Checks whether the change from the current value to the new value causes a <see cref="Labels"/> change.
    /// Return <see cref="Labels.None"/> if the new value is still within the current label.
    /// </summary>
    /// <param name="id">SmartAction ID</param>
    /// <param name="SmartActionCriteria">Criteria that has been updated</param>
    /// <param name="previous">previous value of this criteria</param>
    /// <param name="newValue">new value of this criteria</param>
    public static Labels CheckStateSwitching(int id, int criteria, float previous, float newValue)
    {
        Labels newState = Labels.None;
        if (ECAParameters.SmartActionMessages == null)
            return newState;

        TtsInfoContainer thisActionContainer = null;

        if (ECAParameters.SmartActionMessages.ContainsKey(id))
            thisActionContainer = ECAParameters.SmartActionMessages[id];
        else
            return Labels.None;


        switch (criteria)
        {
            case (int)Criteria.Accuracy:
                SmartActionCriteria accuracy = thisActionContainer.GetCriteriaTTSInfo(Criteria.Accuracy);
                if (newValue > accuracy.BadLimit && newValue <= accuracy.NormalLimit
                    && (previous <= accuracy.BadLimit || previous > accuracy.NormalLimit))
                {
                    Utility.Log("set current accuracy actionState of " + id + " to Normal");
                    newState = Labels.Normal;
                }
                else if (newValue >= 0f && newValue <= accuracy.BadLimit && previous > accuracy.BadLimit)
                {
                    Utility.Log("set current accuracy actionState of " + id + " to Bad");
                    newState = Labels.Bad;
                }
                else if (newValue > accuracy.NormalLimit && previous <= accuracy.NormalLimit)
                {
                    Utility.Log("current accuracy actionState of " + id + " return to Good");
                    newState = Labels.Good;
                }
                break;

            case (int)Criteria.Staging:
                SmartActionCriteria staging = thisActionContainer.GetCriteriaTTSInfo(Criteria.Staging);
                if (newValue >= staging.NormalLimit && newValue < staging.BadLimit && (previous < staging.NormalLimit || previous >= staging.BadLimit))
                {
                    Utility.Log("set current staging actionState of " + id + " to Normal");
                    newState = Labels.Normal;
                }
                else if (newValue >= staging.BadLimit && previous < staging.BadLimit)
                {
                    Utility.Log("set current staging actionState of " + id + " to Bad");
                    newState = Labels.Bad;
                }
                else if (newValue >= staging.GoodLimit && newValue < staging.NormalLimit && previous >= staging.NormalLimit)
                {
                    Utility.Log("current staging actionState of " + id + " return to Good");
                    newState = Labels.Good;
                }
                break;
        }
        return newState;
    }

    //Constant values for update State
    public float StagingUpdateFactor { get; set; } = 0.1f;
    public float StagingUpdateTime { get; set; } = 5f;
    public float AccuracyPenalty { get; set; } = 0.1f;
    public float StagingInitialDelay { get; set; } = 0f;

    //Attributes
    public int ID { get; set; }
    public bool IsStarted { get; set; }
    public bool IsFinished { get; set; }
    public bool IsPaused { get; set; }
    public bool IsStagingActive { get; set; }

    public override string ToString()
    {
        return base.ToString();
    }
}
