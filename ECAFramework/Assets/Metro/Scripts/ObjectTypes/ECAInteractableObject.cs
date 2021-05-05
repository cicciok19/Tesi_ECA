using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAInteractableObject : MonoBehaviour
{
    protected bool occupied;
    public virtual bool Occupied
    {
        get { return occupied; }
        set { occupied = value; }
    }
}
