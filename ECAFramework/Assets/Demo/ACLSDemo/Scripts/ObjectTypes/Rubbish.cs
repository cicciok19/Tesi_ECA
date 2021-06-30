using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rubbish : MonoBehaviour
{
    private Destination destination;
    private DropPosition dropPosition;

    void Awake()
    {
        destination = GetComponentInChildren<Destination>();
        dropPosition = GetComponentInChildren<DropPosition>();
    }
    
    public Transform GetDestination()
    {
        return destination.transform;
    }

    public Transform GetDropPosition()
    {
        return dropPosition.transform;
    }
}
