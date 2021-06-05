using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefibrillatorTable : MonoBehaviour
{
    private Defibrillator defibrillator;

    private void Start()
    {
        defibrillator = GetComponentInChildren<Defibrillator>();
    }

    public Defibrillator GetDefibrillator()
    {
        return defibrillator;
    }
}
