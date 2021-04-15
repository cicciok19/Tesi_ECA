using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class ECA_sitAction : ECAAction
{
    private Transform Destination;
    private Transform SitPoint;
    private SmartAction SmartActionToStandUp;

    public ECA_sitAction(ECAAnimator ecaAnimator, Transform destination, Transform sitPoint) : base(ecaAnimator)
    {
        Destination = destination;
        SitPoint = sitPoint;

        allStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new TurnStage(this, EcaAnimator, SitPoint, true),
            new SitStage(this, EcaAnimator, SitPoint),
            new StandUpStage(this, EcaAnimator, SitPoint)
        };

        SetupAction();
    }

    //carico gli stage che mi servono e poi mi iscrivo agli eventi

    public override void onCompletedAction()
    {
        base.onCompletedAction();
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

    public void setEndTriggerAction(SmartAction smartAction)
    {
        SmartActionToStandUp = smartAction;
    }

    /// <summary>
    /// Setta il SitPoint della SitAction nella posizione che passo come parametro
    /// </summary>
    /// <param name="t"></param>
    public void setSitPoint(Transform t)
    {
        SitPoint = t;
        allStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new TurnStage(this, EcaAnimator, SitPoint, true),
            new SitStage(this, EcaAnimator, SitPoint),
            new StandUpStage(this, EcaAnimator, SitPoint)
        };
    }
}
