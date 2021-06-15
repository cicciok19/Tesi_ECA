using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefibrillatorScreen : MonoBehaviour
{
    private bool isOn;
    private Patient patient;

    // Start is called before the first frame update
    void Start()
    {
        isOn = false;
        patient = FindObjectOfType<Patient>();
    }

    public bool IsOn
    {
        get => isOn;
        set => isOn = value;
    }

    public PatientState GetPatientState()
    {
        return patient.state;
    }

}
