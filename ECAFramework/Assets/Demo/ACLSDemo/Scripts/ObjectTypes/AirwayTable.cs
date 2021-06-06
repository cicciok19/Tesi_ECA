using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayTable : MonoBehaviour
{
    Oxygen oxygen;

    // Start is called before the first frame update
    void Start()
    {
        oxygen = GetComponentInChildren<Oxygen>();
    }

    public Oxygen GetOxygen()
    {
        return oxygen;
    }
}
