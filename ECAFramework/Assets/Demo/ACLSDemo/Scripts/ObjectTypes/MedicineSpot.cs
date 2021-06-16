using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedicineSpot : MonoBehaviour
{
    private Medicine syringe;
    private Destination destination;
    public bool empty { 
        get 
        {
            if (GetComponentInChildren<Medicine>() == null)
                return true;
            else
                return false;
        }
    }

    private void Awake()
    {
        syringe = GetComponentInChildren<Medicine>();
        destination = GetComponentInChildren<Destination>();
    }

    public virtual Transform GetSyringe()
    {
        if (syringe == null)
            return GetComponentInChildren<Medicine>().transform;
        return syringe.transform;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }

    public MedicineName GetMedicineName()
    {
        if (syringe != null)
            return syringe.medicineName;
        else
            return MedicineName.None;
    }
}
