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
    public override void actionStart()
    {
        base.actionStart();
        ecaAnimator.GoTo(destination.position, 0.5f);
    }

    public override void actionFinished()
    {
        base.actionFinished();
        ecaAnimator.MXM_BeginEventWithContact("SitDown", sitPoint);
        ecaAnimator.MxM_SetTag("Sitting");
    }

    public override void actionLabelUpdate()
    {
        base.actionLabelUpdate();
    }

    public override void actionStateUpdate()
    {
        base.actionStateUpdate();
    }
}
