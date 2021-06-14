using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Locker : MonoBehaviour
{
    private Transform destination;
    private Drawer[] drawers;

    void Start()
    {
        destination = GetComponentInChildren<Destination>().transform;
        drawers = GetComponentsInChildren<Drawer>();
    }

    public Transform GetDestination()
    {
        return destination;
    }

    public Drawer GetMedicineDrawer(MedicineName medicineName)
    {
        foreach(var d in drawers)
        {
            Medicine m = d.GetMedicine();
            if(m.medicineName == medicineName && !m.Taken)
            {
                d.SetDestination(destination);
                return d;
            }
        }

        return null;
    }
}
