using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECA_pickUpAction : ECAAction
{
    Transform Destination;
    Transform ObjToPick;
    Transform HandEmpty;

    public ECA_pickUpAction(ECAAnimator ecaAnimator, Transform destination, Transform obj) : base(ecaAnimator)
    {
        Destination = destination;
        ObjToPick = obj;

        HandEmpty = GameObject.FindGameObjectWithTag("HandEmpty").transform;

        allStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new PickUpStage(this, EcaAnimator, ObjToPick, HandEmpty),
            new PickDownStage(this, EcaAnimator, ObjToPick, HandEmpty)
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

    public override void startAction()
    {
        base.startAction();
    }

}
