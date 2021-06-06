using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Oxygen : MonoBehaviour
{
    OxygenMask oxygenMask;
    OxygenPump oxygenPump;

    // Start is called before the first frame update
    void Awake()
    {
        oxygenMask = GetComponentInChildren<OxygenMask>();
        oxygenPump = GetComponentInChildren<OxygenPump>();
    }

    public Transform GetOxygenMask()
    {
        return oxygenMask.transform;
    }

    public Transform GetOxygenPump()
    {
        return oxygenPump.transform;
    }
}
