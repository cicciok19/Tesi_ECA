using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Train : MonoBehaviour
{
    private TrainDoor[] doors;
    private PassengerPlace[] places;
    public int passengers;          //to be filled
    public event EventHandler Arriving;
    public event EventHandler DoorsOpen;

    void Start()
    {
        doors = GameObject.FindObjectsOfType<TrainDoor>();
        places = GameObject.FindObjectsOfType<PassengerPlace>();
        StartCoroutine(WaitArriving());
    }

    private IEnumerator WaitArriving()
    {
        yield return new WaitForSeconds(10f);
        if (Arriving != null)
            Arriving(this, EventArgs.Empty);

        StartCoroutine(WaitDoorsOpen());
    }

    private IEnumerator WaitDoorsOpen()
    {
        yield return new WaitForSeconds(10f);
        if (DoorsOpen != null)
            DoorsOpen(this, EventArgs.Empty);
    }

    //TODO: could do a shuffle or analyze the nerarest door and select that one
    public TrainDoor[] GetTrainDoors()
    {
        return doors;
    }

    public PassengerPlace[] GetPassengerPlaces()
    {
        return places;
    }

}
