using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayTable : MonoBehaviour
{
    OxygenMask oxygenMask;

    // Start is called before the first frame update
    void Start()
    {
        oxygenMask = GetComponentInChildren<OxygenMask>();
    }

    public OxygenMask OxygenMask{
        get => oxygenMask;
    }
}
