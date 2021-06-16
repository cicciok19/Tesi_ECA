using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class Node
{
    protected Dictionary<ActionName, bool> actions = new Dictionary<ActionName, bool>(); //il bool serve per capire se l'azione è stata già fatta

    protected NodeName nodeName;

    bool finished = false;
    int counter = 0;

    public Node(NodeName nodeName, List<ActionName> actionNames)
    {
        this.nodeName = nodeName;

        foreach (ActionName actionName in actionNames)
            actions.Add(actionName, false);
    }

    public bool IsCorrectAction(ActionName actionName)
    {
        if (actions.ContainsKey(actionName))
        {
            if (!actions[actionName])
            {
                counter++;
                actions[actionName] = true;
                if (counter == actions.Count)
                    Finished = true;
                return true;
            }
            else
                return false;
        }
        else
            return false;
    }

    public bool Finished
    {
        get => finished;
        set
        {
            finished = value;
            if(finished == true)
            {
                //risettiamo i bool a false perché il nodo potrebbe essere richiamato
                actions = actions.ToDictionary(p => p.Key, p => false);               
            }
        }
    }

    public NodeName NodeName
    {
        get => nodeName;
    }
}
