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

        allStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new TurnStage(this, EcaAnimator, LookAtObejct, false)
        };

        SetupAction();
    }

    public override void nextStage()
    {
        base.nextStage();
    }

    public override void onCompletedAction()
    {
        base.onCompletedAction();
    }

    public override void onLabelUpdate()
    {
        base.onLabelUpdate();
    }

    public override void onStageFinished(object sender, EventArgs e)
    {
        base.onStageFinished(sender, e);
    }

    public override void onStateUpdate()
    {
        base.onStateUpdate();
    }

    public void setDestination(Transform d)
    {
        Destination = d;
    }

    public override void SetupAction()
    {
        base.SetupAction();
    }

    public override void startAction()
    {
        base.startAction();
    }
}
