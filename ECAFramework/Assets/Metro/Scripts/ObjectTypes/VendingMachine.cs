using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class VendingMachine : ECAInteractableObject
{
    private PressableObject button;
    private PressableObject screen;
    private TicketReady ticketReady;
    private Destination[] destinations;
    private ECA lastPassenger;
    private int ecasQueue;

    private int idx = 0;

    public int EcasQueue 
    { 
        get => ecasQueue;
        set
        { 
            if (ecasQueue != 0)
                Occupied = true;
            else if(value!=0 && value < ecasQueue)
            {
                if (GoAhead != null)
                    GoAhead(this, EventArgs.Empty);
            }
            else if(value == 0)
            {
                if (FreeMachine != null)
                    FreeMachine(this, EventArgs.Empty);
            }

            ecasQueue = value;
        }
    }

    public event EventHandler GoAhead;
    public event EventHandler FreeMachine;

    private void Awake()
    {
        button = GetComponentInChildren<ECAButton>();
        screen = GetComponentInChildren<ECAScreen>();
        ticketReady = GetComponentInChildren<TicketReady>();
        destinations = GetComponentsInChildren<Destination>();
    }

    public Transform GetNextPassengerPosition()
    {
        /*if (lastPassenger == null)
            return destinations[++idx].transform; //da modificare
        else
            return destinations[++idx].transform;     //da sistemare perchè deve esserci un offset*/
        return destinations[0].transform;
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
}
