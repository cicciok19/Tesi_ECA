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
        emptyPosition = GetComponentInChildren<EmptyPosition>().transform;
    }

    public Syringe GetNewMedicine(MedicineName medicineName)
    {
        GameObject s = (GameObject)Instantiate(Resources.Load("Prefab/Syringe"), emptyPosition);
        Syringe syringe = s.GetComponent<Syringe>();
        return syringe;
    }

    public Vector3 GetDestination()
    {
        return destination.transform.position;
    }

}
