using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAActionList 
{
    List<ECAAction> actions = new List<ECAAction>();
    private ECAAction currentAction;

    public void Enqueue(ECAAction action)
    {
        actions.Add(action);
        StartActions();
    }

    public void Dequeue(ECAAction action)
    {
        actions.Remove(action);
    }

    public void Abort(ECAAction action)
    {
        if (action.CanAbort)
        {
            if (action == currentAction)
            {
                currentAction.Abort();
                currentAction.CompletedAction -= GoAhead;
                currentAction = null;
            }
            action.Abort();
            Dequeue(action);
        }
        else
            Debug.LogError("You cannot abort action: " + action);

        StartActions();
    }

    public void AbortAll()
    {
        var size = actions.Count;

        for (int i = size - 1; i >= 0; i--)
        {
            if (actions[i].CanAbort)
            {
                if (actions[i] == currentAction)
                {
                    currentAction.Abort();
                    currentAction.CompletedAction -= GoAhead;
                    currentAction = null;
                }
                actions[i].Abort();
                Dequeue(actions[i]);
            }
        }

        if(actions.Count != 0)
            StartActions();
    }

    public void StartActions()
    {
        if (currentAction == null)
        {
            FirstAction.StartAction();
            FirstAction.CompletedAction += GoAhead;
            currentAction = FirstAction;
        }
    }

    public void Push(ECAAction action)
    {
        actions.Insert(0, action);
    }

    private void GoAhead(object sender, EventArgs e)
    {
        ECAAction action = (ECAAction)sender;

        Dequeue(action);
        action.CompletedAction -= GoAhead;
        currentAction = null;

        if(actions.Count != 0)
        {
            FirstAction.StartAction();
            FirstAction.CompletedAction += GoAhead;
            //currentAction = FirstAction;
        }
    }

    private ECAAction FirstAction
    {
        get => actions[0];
    }

    public ECAAction CurrentAction
    {
        get => currentAction;
    }
}
