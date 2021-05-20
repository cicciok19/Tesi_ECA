/* File VendingMachine C# implementation of class VendingMachine */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Text.RegularExpressions;


// global declaration end

public class VendingMachine : QueueableObject
{
    private PressableObject button;
    private PressableObject screen;
    private RetireProduct ticketReady;


    protected const float PROXIMITY_DISTANCE =  0.2f;


    protected override void Awake()
    {
        base.Awake();
        button = GetComponentInChildren<ECAButton>();
        screen = GetComponentInChildren<ECAScreen>();
        ticketReady = GetComponentInChildren<RetireProduct>();
    }

    public PressableObject GetScreen()
    {
        return screen;
    }


    public override Transform GetGrabbableGameObject()
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
