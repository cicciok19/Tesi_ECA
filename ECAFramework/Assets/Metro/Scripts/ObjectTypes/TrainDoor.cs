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

    private bool occupied;

    protected Vector3 bounds;
    protected Vector3 center;
    private LandingArea frontDoor;

    public LandingArea FrontDoor { get => frontDoor;  protected set => frontDoor = value; }

    public int id;


    protected void Awake()
    {
        occupied = false;
        // computing object bounds
        frontDoor = GetComponentInChildren<LandingArea>();
    
    }

    public bool Occupied
    {
        get { return occupied; }
        set {
            occupied = value;
            if (value == false)
            {
                if (DoorFree != null)
                    DoorFree(this, EventArgs.Empty);
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        Utility.Log(other.name + " occuping");
        Occupied = true;
    }

    private void OnTriggerExit(Collider other)
    {
        Utility.Log(other.name + " free");
        Occupied = false;
    }


}
