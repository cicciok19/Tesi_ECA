using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class Syringe : GrabbableObject
{
    public bool used;

    void Start()
    {
        used = false;
    }


}
