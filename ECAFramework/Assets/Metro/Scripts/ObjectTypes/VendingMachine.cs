using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class VendingMachine : ECAInteractableObject
{
    private PressableObject button;
    private PressableObject screen;
    private TicketReady ticketReady;
    private Destination destination;
    private Passenger lastPassenger;
    private int ecasQueue;

    private int idx = 0;

    public event EventHandler QueueUpdated;

    public int EcasQueue 
    { 
        get => ecasQueue;
        set
        { 
            if (ecasQueue != 0)
                Occupied = true;

            if(value!=0 && value < ecasQueue)
            {
                if (GoAhead != null)
                    GoAhead(this, EventArgs.Empty);
            }
            else if(value == 0)
            {
                if (FreeMachine != null)
                    FreeMachine(this, EventArgs.Empty);

                lastPassenger = null;
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
        destination = GetComponentInChildren<Destination>();
    }

    public Vector3 GetNextPassengerPosition(Passenger eca)
    {
        if (lastPassenger == null)
        {
            return destination.transform.position;
        }
        else
        {
            var newPosition = lastPassenger.transform.position - lastPassenger.transform.forward;
            Debug.DrawRay(newPosition, Vector3.up, Color.blue, 20f);
            return newPosition;
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

    public Transform GetDestination()
    {
        return destination.transform;
    }

    public void PassengerArrived(object sender, EventArgs e)
    {
        lastPassenger = (Passenger)sender;
        

        if (QueueUpdated != null)
            QueueUpdated(this, EventArgs.Empty);
    }
}
