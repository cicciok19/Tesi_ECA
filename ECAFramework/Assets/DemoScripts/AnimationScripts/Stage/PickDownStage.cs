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

        EcaAction.CompletedAction += ReactToActionFinished;
        EcaAnimator.EventContact += OnEventContact;
    }

    public override void StartStage()
    {
        base.StartStage();
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void ReactToActionFinished(object sender, EventArgs e)
    {
        base.ReactToActionFinished(sender, e);
        EcaAnimator.MxM_BeginEvent("PickDown");
        EcaAnimator.MxM_waitForEventContact();
    }

    public void OnEventContact(object sender, EventArgs e)
    {
        HandEmpty.DetachChildren();
        ObjToPick.position = new Vector3(ObjToPick.position.x, 0.05f, ObjToPick.position.z);
        EndStage();
    }


}
