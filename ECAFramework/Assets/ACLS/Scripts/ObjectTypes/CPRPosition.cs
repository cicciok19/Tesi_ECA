using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class CPRPosition : PressableObject
{
    private InteractionTarget target_R;
    private InteractionTarget target_L;

    protected override void Awake()
    {
        base.Awake();
        var targets = GetComponentsInChildren<InteractionTarget>();

        foreach(var t in targets)
        {
            if (t.effectorType == FullBodyBipedEffector.RightHand)
                target_R = t;
            else if (t.effectorType == FullBodyBipedEffector.LeftHand)
                target_L = t;
        }
    }

    public InteractionTarget GetInteractionTarget_R()
    {
        return target_R;
    }

    public InteractionTarget GetInteractionTarget_L()
    {
        return target_L;
    }


}
