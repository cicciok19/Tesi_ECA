using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECA_pointingActionIK : ECAAction
{

    public ECA_pointingActionIK(ECAAnimator ecaAnimator, Transform destination, Transform target) : base(ecaAnimator)
    {
        AllStages = new ECAActionStage[]
        {
            new GoToStage(this, (ECAAnimatorDemo)ecaAnimator, destination),
            new PointingStage(this, (ECAAnimatorDemo)ecaAnimator, target)
        };
        SetupAction();
    }

    public override void NextStage()
    {
        base.NextStage();
    }

    public override void SetupAction()
    {
        base.SetupAction();
    }

    public override void StartAction()
    {
        base.StartAction();
    }
}
