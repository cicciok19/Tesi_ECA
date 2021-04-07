using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpStage : ECAActionStage
{
    Transform ObjToPick;
    Transform HandEmpty;

    public PickUpStage(ECAAction ecaAction, ECAAnimator ecaAnimator, Transform obj, Transform handEmpty) : base(ecaAction, ecaAnimator)
    {
        ObjToPick = obj;
        HandEmpty = handEmpty;

        EcaAnimator.EventContact += onEventContact;
    }

    public override void endStage()
    {
        base.endStage();
    }

    public override void reactToActionFinished(object sender, EventArgs e)
    {
        base.reactToActionFinished(sender, e);
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

    public override void startStage()
    {
        base.startStage();
        EcaAnimator.MXM_BeginEventWithContact("PickUp", ObjToPick);
    }

    public void onEventContact(object sender, EventArgs e)
    {
        ObjToPick.SetParent(HandEmpty);
        ObjToPick.localPosition = new Vector3(0, 0, 0);
        endStage();
    }
}
