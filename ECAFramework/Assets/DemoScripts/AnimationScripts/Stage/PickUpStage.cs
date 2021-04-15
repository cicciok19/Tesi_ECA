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

        EcaAnimator.EventContact += OnEventContact;
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();
        EcaAnimator.MXM_BeginEventWithContact("PickUp", ObjToPick);
        EcaAnimator.MxM_waitForEventContact();
    }

    public void OnEventContact(object sender, EventArgs e)
    {
        ObjToPick.SetParent(HandEmpty);
        ObjToPick.localPosition = new Vector3(0, 0, 0);
        EndStage();
    }
}
