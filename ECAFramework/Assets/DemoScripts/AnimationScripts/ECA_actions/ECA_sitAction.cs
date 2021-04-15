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

        AllStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new TurnStage(this, EcaAnimator, SitPoint, true),
            new SitStage(this, EcaAnimator, SitPoint),
            new StandUpStage(this, EcaAnimator, SitPoint)
        };

        SetupAction();
    }

    //carico gli stage che mi servono e poi mi iscrivo agli eventi
    public void SetEndTriggerAction(SmartAction smartAction)
    {
        SmartActionToStandUp = smartAction;
    }

    /// <summary>
    /// Setta il SitPoint della SitAction nella posizione che passo come parametro
    /// </summary>
    /// <param name="t"></param>
    public void SetSitPoint(Transform t)
    {

        Transform r_footEffector = t.GetChild(0);
        Transform l_footEffector = t.GetChild(1);
        Transform hipsEffector = t.GetChild(2);

        SitPoint = hipsEffector;
        EcaAnimator.IK_setEffectors(hipsEffector, l_footEffector, r_footEffector);

        AllStages = new ECAActionStage[]
        {
            new GoToStage(this, EcaAnimator, Destination),
            new TurnStage(this, EcaAnimator, SitPoint, true),
            new SitStage(this, EcaAnimator, SitPoint),
            new StandUpStage(this, EcaAnimator, SitPoint)
        };
    }
}
