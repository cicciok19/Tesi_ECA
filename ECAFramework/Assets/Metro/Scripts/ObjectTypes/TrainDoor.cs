using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TrainDoor : MonoBehaviour
{
    private bool occupied;
    public int id;

    public event EventHandler DoorFree;

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

    void Start()
    {
        occupied = false;
    }

}
