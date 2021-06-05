using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OxygenPump : GrabbableObject
{
    // Start is called before the first frame update
    void Start()
    {
        SetPick(true);
        SetPause(false);
    }
}
