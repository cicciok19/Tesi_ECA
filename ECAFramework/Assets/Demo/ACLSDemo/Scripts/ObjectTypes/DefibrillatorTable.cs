using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefibrillatorTable : MonoBehaviour
{
    private Defibrillator defibrillator;
    private Transform leftFootPosition;
    private Transform bodyTarget;
    private Destination destination;

    private void Start()
    {
        defibrillator = GetComponentInChildren<Defibrillator>();
        leftFootPosition = GetComponentInChildren<LeftFootPosition>().transform;
        bodyTarget = GetComponentInChildren<BodyTarget>().transform;
        destination = GetComponentInChildren<Destination>();
    }

    public Defibrillator GetDefibrillator()
    {
        return defibrillator;
    }

    public Transform GetLeftFootPosition()
    {
        return leftFootPosition;
    }

    public Transform GetBodyTarget()
    {
        return bodyTarget;
    }

    public Transform GetDestination()
    {
        return destination.transform;
    }
}
