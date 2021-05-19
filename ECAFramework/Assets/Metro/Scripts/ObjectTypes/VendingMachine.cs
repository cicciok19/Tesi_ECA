/* File VendingMachine C# implementation of class VendingMachine */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Text.RegularExpressions;


// global declaration end

public class VendingMachine : ECAInteractableObject
{
    public event EventHandler QueueUpdated;
    public event EventHandler GoAhead;
    public event EventHandler FreeMachine;

    private PressableObject button;
    private PressableObject screen;
    private TicketReady ticketReady;
    private Destination[] destinations;
    private DestinationExit exitPoint;
    private int ecasQueue;
    private int idx =   0;

    protected const float PROXIMITY_DISTANCE =  0.2f;


    private void Awake()
    {
        button = GetComponentInChildren<ECAButton>();
        screen = GetComponentInChildren<ECAScreen>();
        ticketReady = GetComponentInChildren<TicketReady>();
        destinations = GetComponentsInChildren<Destination>();
        exitPoint = GetComponentInChildren<DestinationExit>();
    }




    public Vector3 GetNextPassengerPosition(Passenger eca)
    {
        //it's not queued
        if(eca.ecaTurn == -1)
        {
            eca.ecaTurn = EcasQueue;
            EcasQueue++;
            Utility.Log(eca.name + " TO " + destinations[ecasQueue - 1].name);

            return destinations[ecasQueue-1].transform.position;
        }
        else
        {
            return destinations[eca.ecaTurn].transform.position;
        }
    }


    public PressableObject GetScreen()
    {
        return screen;
    }


    public Transform GetTicket()
    {
        GameObject ticket = (GameObject)Instantiate(Resources.Load("Prefab/Ticket"), ticketReady.transform);
        ticket.transform.localPosition = new Vector3(0, 0, 0);
        return ticket.transform;
    }


    public PressableObject GetButton()
    {
        return button;
    }


    public Destination[] GetDestinations()
    {
        Destination[] tempDestinations = destinations;

        foreach(var d in tempDestinations)
        {
            int number = Int32.Parse(Regex.Match(d.name, @"\d+").Value);
            destinations[number] = d;
        }

        return destinations;
    }


    public void PassengerArrived(object sender, EventArgs e)
    {
        if (QueueUpdated != null)
            QueueUpdated(this, EventArgs.Empty);
    }


    public Transform GetExitPoint()
    {
        return exitPoint.transform;
    }


    public bool isQueued(ECA eca)
    {
        return Vector3.Distance(eca.transform.position, FrontPosition) <= PROXIMITY_DISTANCE;
    }


    public Vector3 FrontPosition
    {
        get => destinations[0].transform.position;
    }


    public int EcasQueue
    { 
        get => ecasQueue;
        set
        {
            int prevQueueValue = ecasQueue;
            ecasQueue = value;
    
            if (ecasQueue != 0)
                Occupied = true;
            else
                Occupied = false;
    
            if(value!=0 && value < prevQueueValue)
            {
                if (GoAhead != null)
                    GoAhead(this, EventArgs.Empty);
            }
            else if(value == 0)
            {
                if (FreeMachine != null)
                    FreeMachine(this, EventArgs.Empty);
            }
    
        }
    }


}
