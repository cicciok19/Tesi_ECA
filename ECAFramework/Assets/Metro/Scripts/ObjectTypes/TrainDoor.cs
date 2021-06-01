/* File TrainDoor C# implementation of class TrainDoor */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Assertions;
using UnityEngine.AI;


// global declaration end

public class TrainDoor : MonoBehaviour
{
    public event EventHandler DoorFree;

    protected Vector3 bounds;
    protected Vector3 center;
    private LandingArea frontDoor;

    public LandingArea FrontDoor { get => frontDoor;  protected set => frontDoor = value; }

    public int id;


    protected void Awake()
    {
        // computing object bounds
        frontDoor = GetComponentInChildren<LandingArea>();
    }


}
