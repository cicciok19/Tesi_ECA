using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class MedicationTable : MonoBehaviour
{
    private MedicineSpot[] medicineSpots;
    private IVTube ivTube;

    void Start()
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

        return medicineSpot;
    }

    public IVTube GetVeinTube()
    {
        return ivTube;
    }
}
