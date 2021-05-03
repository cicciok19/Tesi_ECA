using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Destination : MonoBehaviour
{
    private bool chosen;

    public bool Chosen {
        get { return chosen; }
        set { chosen = value; }
    }

    void Start()
    {
        chosen = false;
    }

}
