using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ECA_sitAction : ECAAction
{
    private Transform Destination;
    private Transform SitPoint;

    public ECA_sitAction(ECAAnimator ecaAnimator, Transform destination, Transform sitPoint) : base(ecaAnimator)
    {
        Destination = destination;
        SitPoint = sitPoint;
        allStages = new ECAActionStage[]
        {
            new GoToStage(this, ecaAnimator, destination),
            new TurnStage(this, ecaAnimator, sitPoint),
            new SitStage(this, ecaAnimator, sitPoint)
        };
    }

    //carico gli stage che mi servono e poi mi iscrivo agli eventi

    public override void completedAction()
    {
        base.completedAction();
    }

    public override void onLabelUpdate()
    {
        base.onLabelUpdate();
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
