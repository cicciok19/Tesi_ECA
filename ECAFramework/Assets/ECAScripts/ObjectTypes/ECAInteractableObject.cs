using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECAInteractableObject : MonoBehaviour
{
    protected bool occupied;
    protected float distance;
    public virtual bool Occupied
    {
        get { return occupied; }
        set { occupied = value; }
    }

    public float Distance
    {
        get => distance;
        set => distance = value;
    }
}
