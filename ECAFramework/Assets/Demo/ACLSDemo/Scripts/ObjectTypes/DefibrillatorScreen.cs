using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefibrillatorScreen : MonoBehaviour
{
    private bool isOn;

    // Start is called before the first frame update
    void Start()
    {
        isOn = false;
    }

    public bool IsOn
    {
        get => isOn;
        set => isOn = value;
    }
}
