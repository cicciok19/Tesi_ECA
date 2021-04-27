using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PassengerPlace : MonoBehaviour
{
    public bool occupied;

    public bool Occupied
    {
        get { return occupied; }
        set { occupied = value; }
    }

    void Start()
    {
        occupied = false;
    }

}
