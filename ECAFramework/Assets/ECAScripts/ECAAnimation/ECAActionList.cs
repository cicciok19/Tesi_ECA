using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAActionList 
{
    List<ECAAction> actions = new List<ECAAction>();

    public void Enqueue(ECAAction action)
    {
        actions.Add(action);
        action.CompletedAction += GoAhead;
    }

    public void Dequeue(ECAAction action)
    {
        actions.Remove(action);
    }

    public void StartActions()
    {
        actions[0].StartAction();
    }

    public void Push(ECAAction action)
    {
        actions.Insert(0, action);
    }

    private void GoAhead(object sender, EventArgs e)
    {
        ECAAction action = (ECAAction)sender;

        action.CompletedAction -= GoAhead;
        Dequeue(action);

        if(actions.Count != 0)
        {
            actions[0].StartAction();
        }
    }
}
