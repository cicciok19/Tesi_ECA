using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RubbishTable : MonoBehaviour
{
    private Destination destination;
    private TablePlane plane;

    void Awake()
    {
        destination = GetComponentInChildren<Destination>();
        plane = GetComponentInChildren<TablePlane>();
    }
    
    public Transform GetDestination()
    {
        return destination.transform;
    }

    public Transform GetDropPosition()
    {
        return Randomize.GetRandomPosition(plane.gameObject, 1, 1, 0, 1);
    }
}
