using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECA_goToAction : ECAAction
{
    private Transform Destination;
    private Transform LookAtObejct;

    public ECA_goToAction(ECAAnimator ecaAnimator, Transform destination, Transform lookAtObj) : base(ecaAnimator)
    {
        Destination = destination;
        LookAtObejct = lookAtObj;

        AllStages = new ECAActionStage[]
        {
            new GoToStage(this, (ECAAnimatorDemo)EcaAnimator, Destination),
            new TurnStage(this, (ECAAnimatorDemo)EcaAnimator, LookAtObejct, false)
        };

        SetupAction();
    }

    public void SetDestination(Transform d)
    {
        Destination = d;
    }
}
