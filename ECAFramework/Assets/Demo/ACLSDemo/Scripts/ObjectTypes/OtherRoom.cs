using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OtherRoom : MonoBehaviour
{
    private Destination destination;
    private Transform emptyPosition;

    private void Awake()
    {
        destination = GetComponentInChildren<Destination>();
        emptyPosition = GetComponentInChildren<MedicineSpot>().transform;
    }

    public Medicine GetNewMedicine(MedicineName medicineName)
    {
        GameObject s = (GameObject)Instantiate(Resources.Load("Prefab/Syringe"), emptyPosition);
        s.transform.localPosition = Vector3.zero;
        Medicine syringe = s.GetComponent<Medicine>();
        return syringe;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }

}
