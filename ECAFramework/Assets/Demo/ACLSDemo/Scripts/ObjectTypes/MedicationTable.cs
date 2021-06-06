using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class MedicationTable : MonoBehaviour
{
    private Medicine[] medicines;

    void Start()
    {
        medicines = GetComponentsInChildren<Medicine>();
    }

    public Medicine GetMedicine(MedicineName name)
    {
        foreach(var m in medicines)
        {
            if (m.medicineName == name && !m.Taken)
                return m;
        }

        return null;
    }
}
