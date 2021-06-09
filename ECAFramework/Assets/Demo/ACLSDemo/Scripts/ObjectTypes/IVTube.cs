using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IVTube : MonoBehaviour
{
    private VeinTube veinTube;
    private Destination destination;

    // Start is called before the first frame update
    void Awake()
    {
        veinTube = GetComponentInChildren<VeinTube>();
        destination = GetComponentInChildren<Destination>();
    }

    public Transform GetVeinTube()
    {
        return veinTube.transform;
    }

    public Transform GetDestination()
    {
        return destination.transform;
    }

}
