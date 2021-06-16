using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedicineSpot : MonoBehaviour
{
    private Medicine syringe;
    private Destination destination;
    public bool empty { get; protected set; }

    private void Awake()
    {
        syringe = GetComponentInChildren<Medicine>();
        destination = GetComponentInChildren<Destination>();
        empty = false;
    }

    public virtual Transform GetSyringe()
    {
        return syringe.transform;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }

    public bool Taken
    {
        get => empty;
        set => empty = value;
    }

    public MedicineName GetMedicineName()
    {
        if (syringe != null)
            return syringe.medicineName;
        else
            return MedicineName.None;
    }
}
