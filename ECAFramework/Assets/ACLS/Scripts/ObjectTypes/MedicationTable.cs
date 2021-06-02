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

    public Medicine GetMedicine(string name)
    {
        foreach(var m in medicines)
        {
            if (m.name == name && !m.Taken)
                return m;
        }

        return null;
    }
}
