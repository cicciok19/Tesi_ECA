using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum MedicineName
{
    Amiodarone,
    Epinephrine,
    None
}

public class Medicine : GrabbableObject
{
    public bool used;
    public MedicineName medicineName { get; protected set; }

    void Start()
    {
        used = false;
    }
}
