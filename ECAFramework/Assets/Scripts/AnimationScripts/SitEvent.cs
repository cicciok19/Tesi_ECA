using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;

public class SitEvent : ECAAnimation
{
    private Transform destination;
    private Transform sitPoint;
    private ECAAnimator ecaAnimator;

    public SitEvent(ECAAnimator ea, Transform sp, Transform d)
    {
        destination = d;
        sitPoint = sp;
        ecaAnimator = ea;
    }

    //setto la destinazione
    protected override void actionBegin()
    {
        base.actionBegin();
        ecaAnimator.GoTo(destination.position, 0.5f);
    }

    protected override void actionFinished()
    {
        base.actionFinished();
        ecaAnimator.MxM_SetTag("Sitting");
    }

    protected override void actionLabelUpdate()
    {
        base.actionLabelUpdate();
    }

    protected override void actionStateUpdate()
    {
        base.actionStateUpdate();
    }
}
