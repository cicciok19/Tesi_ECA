using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class MedicationTable : MonoBehaviour
{
    private Medicine[] medicines;
    private VeinTube veinTube;

    void Start()
    {
        medicines = GetComponentsInChildren<Medicine>();
        veinTube = GetComponentInChildren<VeinTube>();
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

    public VeinTube GetVeinTube()
    {
        return veinTube;
    }
}
