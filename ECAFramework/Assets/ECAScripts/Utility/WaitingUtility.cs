using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// Since a <see cref="SmartAction"/> is not a MonoBehaviour class, this class acts as an utility for coroutines (rather than threads) for waiting functions 
/// without interrupting the mainthread.
/// </summary>
public class WaitingUtility : MonoBehaviour
{
    public static WaitingUtility Instance { get; private set; }
    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Utility.LogError("NO MORE THAN ONE WAITING UTILITY CAN BE INSTANTIATED");
        }
        else
            Instance = this;
    }

    //STAGING utility
    public void startWaitingStaging(SmartAction act, float delay)
    {
        IEnumerator coroutine = waitStaging(act, delay);
        StartCoroutine(coroutine);
    }
    IEnumerator waitStaging(SmartAction act, float delay)
    {
        if (delay != 0f)
            yield return new WaitForSeconds(delay);

        //Action currentAction = act;
        while (true)
        {
            Utility.Log("new cycle of waiting with interval = " + act.StagingUpdateTime + " For action: " + act.GetType().ToString());
            yield return new WaitForSeconds(act.StagingUpdateTime);
            if (!act.IsStagingActive)
            {
                Utility.Log("STOP update staging For action: " + act.GetType().ToString());
                break;
            }
            act.UpdateStaging();
        }
        yield return null;
    }
    /*
    public void StartWaitingLookAtTime(LookAtAction lookAtAction, int numberOfSec)
    {
        StartCoroutine(countLookAtTime(lookAtAction, numberOfSec));
    }
    IEnumerator countLookAtTime(LookAtAction lookAtAction, int numberOfSec)
    {
        while (lookAtAction.IsWatchingMe)
        {
            double d = DateTime.Now.Subtract(lookAtAction.FirstInteraction).TotalSeconds;
            if (d >= lookAtAction.TimeAmount)
                lookAtAction.TimeElapsed();
                //LookAtMachine.makeTransition(LookAtMachine.LookAtMachineState.Watched);

            yield return null;
        }
    }
    */
}

