using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Proximity : MonoBehaviour
{
    public static event EventHandler OnProximity;
    public string ID = "";

    void Start()
    {
        if (ID == "")
            Utility.LogError("ID is NOT SETTED!!");
    }
    private void OnTriggerStay(Collider other)
    {
        if (other.tag == "Player")
        {
            Utility.Log("Player Entered");
            if (OnProximity != null)
                OnProximity(this, EventArgs.Empty);
        }
    }
}
