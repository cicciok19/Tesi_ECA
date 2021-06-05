using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Paddle : GrabbableObject
{
    private void Start()
    {
        SetPause(false);
        SetPick(true);
    }
}
