using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum MedicineName
{
    Amiodarone,
    Epinephrine
}

public class Medicine : MonoBehaviour
{
    private Syringe syringe;
    public MedicineName medicineName;
    private Destination destination;
    private bool taken;

    private void Awake()
    {
        syringe = GetComponentInChildren<Syringe>();
        destination = GetComponentInChildren<Destination>();
        taken = false;
    }

    public Transform GetSyringe()
    {
        return syringe.transform;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }

    public bool Taken
    {
        get => taken;
        set => taken = value;
    }
}
