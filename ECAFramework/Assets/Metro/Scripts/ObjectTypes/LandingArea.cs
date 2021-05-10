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
    internal bool full;

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
        if(transform.childCount != 0)
        {
            for(int i = 0; i < transform.childCount; i++)
            {
                maxOccupancy += transform.GetChild(i).GetComponent<LandingArea>().maxOccupancy;
            }
        }
    }

    public void OnTriggerEnter(Collider other)
    {
        ECA eca;

        if(other.TryGetComponent<ECA>(out eca))
        {
            if (ecaIn < maxOccupancy)
            {
                ecaIn++;
                if(ecaIn == maxOccupancy)
                {
                    full = true;
                }
            }
            else
            {
                if (SpaceCompleted != null)
                    SpaceCompleted(this, EventArgs.Empty);
            }
        }
    }

    public void OnTriggerExit(Collider other)
    {
        ECA eca;

        if (other.TryGetComponent<ECA>(out eca))
        {
            ecaIn--;
        }
    }
}
