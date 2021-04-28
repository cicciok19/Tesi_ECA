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
    protected LandingArea frontDoor;

    public int id;


    protected void Awake()
    {
        occupied = false;
        // computing object bounds
        frontDoor = GetComponentInChildren<LandingArea>();
    
    }




    public Vector3 GetRandomPosition(float extent = 1.0f)
    {
       return frontDoor.GetRandomPosition();
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


}
