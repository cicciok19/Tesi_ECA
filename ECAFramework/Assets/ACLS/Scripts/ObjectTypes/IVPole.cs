using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IVPole : MonoBehaviour
{
    private InjectionPosition injectionPosition;
    void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
    }
    
    public Transform GetInjectionPosition()
    {
        return injectionPosition.transform;
    }
}
