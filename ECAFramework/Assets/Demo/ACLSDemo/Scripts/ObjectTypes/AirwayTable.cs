using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayTable : MonoBehaviour
{
    Oxygen oxygen;
    CapnographyTube capnographyTube;
    DestinationMask destinationMask;
    DestinationPump destinationPump;

    // Start is called before the first frame update
    void Start()
    {
        oxygen = GetComponentInChildren<Oxygen>();
        capnographyTube = GetComponentInChildren<CapnographyTube>();
        destinationMask = GetComponentInChildren<DestinationMask>();
        destinationPump = GetComponentInChildren<DestinationPump>();
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
}
