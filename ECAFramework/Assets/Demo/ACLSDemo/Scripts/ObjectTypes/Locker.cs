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
            MedicineSpot spot = d.GetMedicineSpot();
            if(spot.GetMedicineName() == medicineName && !spot.empty)
            {
                d.SetDestination(destination);
                return d;
            }
        }

        return null;
    }
}
