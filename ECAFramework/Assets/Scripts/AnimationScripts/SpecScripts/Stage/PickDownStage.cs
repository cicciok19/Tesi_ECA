using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickDownStage : ECAActionStage
{
    Transform ObjToPick;
    Transform HandEmpty;

    public PickDownStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform obj, Transform handEmpty) : base(ecaAction, ecaAnimator)
    {
        ObjToPick = obj;
        HandEmpty = handEmpty;

        EcaAction.CompletedAction += reactToActionFinished;
        EcaAnimator.EventContact += onEventContact;
    }

    public override void startStage()
    {
        base.startStage();
    }

    public override void endStage()
    {
        base.endStage();
    }

    public override void reactToActionFinished(object sender, EventArgs e)
    {
        base.reactToActionFinished(sender, e);
        EcaAnimator.MxM_BeginEvent("PickDown");
    }

    public override void reactToActionStart(object sender, EventArgs e)
    {
        base.reactToActionStart(sender, e);
    }

    public override void reactToLabelUpdate(object sender, EventArgs e)
    {
        base.reactToLabelUpdate(sender, e);
    }

    public override void reactToStateUpdate(object sender, EventArgs e)
    {
        base.reactToStateUpdate(sender, e);
    }

    public void onEventContact(object sender, EventArgs e)
    {
        HandEmpty.DetachChildren();
        ObjToPick.position = new Vector3(ObjToPick.position.x, 0.05f, ObjToPick.position.z);
        endStage();
    }


}
