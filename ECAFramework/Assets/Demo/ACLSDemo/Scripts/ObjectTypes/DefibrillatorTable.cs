using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefibrillatorTable : MonoBehaviour
{
    private Defibrillator defibrillator;
    private Transform leftFootPosition;
    private Transform bodyTarget;
    private Destination destination;
    private Transform paddleRightPosition;
    private Transform paddleLeftPosition;

    private void Awake()
    {
        defibrillator = GetComponentInChildren<Defibrillator>();
        leftFootPosition = GetComponentInChildren<LeftFootPosition>().transform;
        bodyTarget = GetComponentInChildren<BodyTarget>().transform;
        destination = GetComponentInChildren<Destination>();
        paddleLeftPosition = GetComponentInChildren<PaddleLeftPosition>().transform;
        paddleRightPosition = GetComponentInChildren<PaddleRightPosition>().transform;
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

    public Transform GetPaddleLeftPosition()
    {
        return paddleLeftPosition;
    }

    public Transform GetPaddleRightPosition()
    {
        return paddleRightPosition;
    }
}
