using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public enum InfoObtained
{
    HasAlreadyHappened,
    NeverHappened
}

public class PatientRelativeEventArgs : EventArgs
{
    public InfoObtained infoType;
    public PatientRelativeEventArgs(InfoObtained info)
    {
        infoType = info;
    }
}

public class TalkToRelative : ECACompositeAction
{
    private Vector3 destination;
    private InfoObtained infoType;

    public event EventHandler TalkFinished;

    public TalkToRelative(ECA eca, Vector3 destination) : base(eca)
    {
        this.destination = destination;
        infoType = InfoObtained.HasAlreadyHappened;     //just for debug
    }

    protected override void CreateActionList()
    {
        GoOutside();
        GoBackIn();
        base.CreateActionList();
    }

    private void GoOutside()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        GoToStage goOutside = new GoToStage(destination);
        WaitStage talkTo = new WaitStage(5f);

        stages.Add(goOutside);
        stages.Add(talkTo);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void GoBackIn()
    {
        RandomDoctor rd = (RandomDoctor)eca;
        ECAAction action = new ECAAction(eca, new GoToStage(rd.initialPosition));
        actions.Add(action);
    }

    public override void OnCompletedAction()
    {
        if (TalkFinished != null)
            TalkFinished(this, new PatientRelativeEventArgs(InfoObtained.HasAlreadyHappened));

        base.OnCompletedAction();
    }
}
