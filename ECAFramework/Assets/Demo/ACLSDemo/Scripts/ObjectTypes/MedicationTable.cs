using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;

public class MedicationTable : MonoBehaviour
{
    private MedicineSpot[] medicineSpots;
    private IVTube ivTube;

    public event EventHandler MedicineFinished;

    void Awake()
    {
        medicineSpots = GetComponentsInChildren<MedicineSpot>();
        ivTube = GetComponentInChildren<IVTube>();
    }

    public MedicineSpot GetMedicineSpot(MedicineName name)
    {
        MedicineSpot medicineSpot = null;
        foreach(var spot in medicineSpots)
        {
            if (!spot.empty && spot.GetComponentInChildren<Medicine>().medicineName == name)
            {
                medicineSpot = spot;
                break;
            }
        }

        if (medicineSpot == null)
        {
            //do something
        }

        return medicineSpot;
    }

    public MedicineSpot GetEmptySpot()
    {
        MedicineSpot medicineSpot = null;
        foreach (var spot in medicineSpots)
        {
            if (spot.empty)
            {
                medicineSpot = spot;
                break;
            }
        }

        if(medicineSpot == null)
        {
            //do something
        }

        return medicineSpot;
    }

    public IVTube GetVeinTube()
    {
        return ivTube;
    }

    public List<MedicineSpot> GetMedicineSpots()
    {
        List<MedicineSpot> list = new List<MedicineSpot>();
        foreach (var m in medicineSpots)
            list.Add(m);
        return list;
    }
}
