using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VeinTube : GrabbableObject
{
    private Destination destination;

    // Start is called before the first frame update
    void Start()
    {
        destination = GetComponentInChildren<Destination>();
    }

    public Transform GetDestination()
    {
        return destination.transform;
    }
}
