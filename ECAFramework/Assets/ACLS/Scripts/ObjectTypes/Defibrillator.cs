using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;
using UnityEngine.Assertions;

public class Defibrillator : MonoBehaviour
{
    private GrabbableObject leftPaddle;
    private GrabbableObject rightPaddle;

    private void Awake()
    {
        InteractionTarget[] targets = GetComponentsInChildren<InteractionTarget>();
        foreach(var t in targets)
        {
            if (t.effectorType == FullBodyBipedEffector.RightHand)
            {
                rightPaddle = t.GetComponentInParent<GrabbableObject>();
            }
                
            else
                leftPaddle = t.GetComponentInParent<GrabbableObject>();
        }
    }

    public GrabbableObject GetRightPaddle()
    {
        return rightPaddle;
    }

    public GrabbableObject GetLeftPaddle()
    {
        return leftPaddle;
    }
}
