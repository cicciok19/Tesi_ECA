using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayTable : MonoBehaviour
{
    Oxygen oxygen;
    CapnographyTube capnographyTube;

    // Start is called before the first frame update
    void Start()
    {
        oxygen = GetComponentInChildren<Oxygen>();
        capnographyTube = GetComponentInChildren<CapnographyTube>();
    }

    public Oxygen GetOxygen()
    {
        return oxygen;
    }

    public Transform GetCapnographyTube()
    {
        return capnographyTube.transform;
    }
}
