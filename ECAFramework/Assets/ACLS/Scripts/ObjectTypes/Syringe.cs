using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class Syringe : GrabbableObject
{
    [SerializeField]
    public string medicalName;
    public bool used;

    void Start()
    {
        Assert.IsNotNull(medicalName);
        used = false;
    }
}
