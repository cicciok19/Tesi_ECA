using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using UnityEngine;

public class QueueableObject : MonoBehaviour
{
    public event EventHandler QueueUpdated;
    public event EventHandler GoAhead;
    public event EventHandler FreeMachine;

    protected const float PROXIMITY_DISTANCE = 0.2f;


    private Destination[] destinations;
    private DestinationExit exitPoint;

    private int ecasQueue;
    private int idx = 0;

    protected  virtual void Awake()
    {
        destinations = GetComponentsInChildren<Destination>();
        exitPoint = GetComponentInChildren<DestinationExit>();
    }

    public Destination[] GetDestinations()
    {
        Destination[] tempDestinations = destinations;

        //order destinations
        foreach (var d in tempDestinations)
        {
            int number = Int32.Parse(Regex.Match(d.name, @"\d+").Value);
            destinations[number] = d;
        }

        return destinations;
    }

    public Vector3 GetNextPassengerPosition(Passenger eca)
    {
        //it's not queued
        if (eca.ecaTurn == -1)
        {
            eca.ecaTurn = EcasQueue;
            EcasQueue++;
            Utility.Log(eca.name + " TO " + destinations[ecasQueue - 1].name);

            return destinations[ecasQueue - 1].transform.position;
        }
        else
        {
            return destinations[eca.ecaTurn].transform.position;
        }
    }

    public void PassengerArrived(object sender, EventArgs e)
    {
        if (QueueUpdated != null)
            QueueUpdated(this, EventArgs.Empty);
    }

    public bool isQueued(ECA eca)
    {
        return Vector3.Distance(eca.transform.position, FrontPosition) <= PROXIMITY_DISTANCE;
    }

    public Vector3 FrontPosition
    {
        get => destinations[0].transform.position;
    }

    public Transform GetExitPoint()
    {
        return exitPoint.transform;
    }

    public int EcasQueue
    {
        get => ecasQueue;
        set
        {
            int prevQueueValue = ecasQueue;
            ecasQueue = value;

            //se diminuisce il numero di eca in fila
            if (value != 0 && value < prevQueueValue)
            {
                if (GoAhead != null)
                    GoAhead(this, EventArgs.Empty);
            }
            else if (value == 0)
            {
                if (FreeMachine != null)
                    FreeMachine(this, EventArgs.Empty);
            }

        }
    }

    public bool Full
    {
        get
        {
            if (ecasQueue < destinations.Length)
                return false;
            else
                return true;
        }
    }

    public virtual Transform GetGrabbableGameObject()
    {
        return null;
    }
}
