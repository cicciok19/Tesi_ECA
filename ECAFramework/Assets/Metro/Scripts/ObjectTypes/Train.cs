using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Train : MonoBehaviour
{
    private TrainDoor[] doors;
    public event EventHandler Arriving;
    public event EventHandler Arrived;

    void Start()
    {
        doors = GameObject.FindObjectsOfType<TrainDoor>();
        StartCoroutine(WaitArriving());
    }

    private IEnumerator WaitArriving()
    {
        yield return new WaitForSeconds(10f);
        if (Arriving != null)
            Arriving(this, EventArgs.Empty);

        StartCoroutine(WaitArrived());
    }

    private IEnumerator WaitArrived()
    {
        yield return new WaitForSeconds(10f);
        if (Arrived != null)
            Arrived(this, EventArgs.Empty);
    }

    //TODO: could do a shuffle or analyze the nerarest door and select that one
    public TrainDoor[] GetTrainDoors()
    {
        return doors;
    }

}
