/* File LandingArea C# implementation of class LandingArea */



// global declaration start


using System;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;


// global declaration end

public class LandingArea : MonoBehaviour
{
    protected int ecaIn;
    public int maxOccupancy;
    public bool full;

    public event EventHandler SpaceCompleted;

    protected virtual void Awake()
    {
        ecaIn = 0;
        full = false;
        maxOccupancy = 3;
      // computing object bounds
    }

    protected virtual void Start()
    {
    }

    public int EcaIn
    {
        get => ecaIn;
        set {
            ecaIn = value;
            if (ecaIn >= maxOccupancy && !full)
                full = true;
            else if (full && ecaIn < maxOccupancy)
                full = false;
        }
    }

    public virtual Vector3 GetRandomPosition()
    {
        return Randomize.GetRandomPosition(this);
    }
}
