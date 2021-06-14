using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class MedicationTable : MonoBehaviour
{
    private Medicine[] medicines;
    private IVTube ivTube;

    void Start()
    {
        medicines = GetComponentsInChildren<Medicine>();
        ivTube = GetComponentInChildren<IVTube>();
    }

    public Medicine GetMedicine(MedicineName name)
    {
        Medicine medicine = null;
        foreach(var m in medicines)
        {
            if (m.medicineName == name && !m.Taken)
            {
                medicine = m;
                break;
            }
        }

        return medicine;
    }

    public IVTube GetVeinTube()
    {
        return ivTube;
    }
}
