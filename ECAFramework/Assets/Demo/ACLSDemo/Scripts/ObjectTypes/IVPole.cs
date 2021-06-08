using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IVPole : MonoBehaviour
{
    private InjectionPosition injectionPosition;
    private Destination destination;
    void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        destination = GetComponentInChildren<Destination>();
    }
    
    public Transform GetInjectionPosition()
    {
        return injectionPosition.transform;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }
}