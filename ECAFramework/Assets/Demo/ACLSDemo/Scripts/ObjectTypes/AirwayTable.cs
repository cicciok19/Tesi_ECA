using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayTable : MonoBehaviour
{
    Oxygen oxygen;
    CapnographyTube capnographyTube;
    DestinationMask destinationMask;
    DestinationPump destinationPump;
    Destination destination;

    // Start is called before the first frame update
    void Awake()
    {
        oxygen = GetComponentInChildren<Oxygen>();
        capnographyTube = GetComponentInChildren<CapnographyTube>();
        destinationMask = GetComponentInChildren<DestinationMask>();
        destinationPump = GetComponentInChildren<DestinationPump>();
        destination = GetComponentInChildren<Destination>();
    }

    public Oxygen GetOxygen()
    {
        return oxygen;
    }

    public Transform GetCapnographyTube()
    {
        return capnographyTube.transform;
    }

    public Transform GetDestinationMask()
    {
        return destinationMask.transform;
    }

    public Transform GetDestinationPump()
    {
        return destinationPump.transform;
    }

    public Transform GetDestination()
    {
        return destination.transform;
    }
}
