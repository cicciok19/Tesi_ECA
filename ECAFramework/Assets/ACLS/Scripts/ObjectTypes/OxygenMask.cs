using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OxygenMask : GrabbableObject
{
    private void Start()
    {
        SetPick(true);
        SetPause(false);
    }
}
