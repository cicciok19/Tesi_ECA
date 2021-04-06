using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAActionStage
{
    protected ECAAction EcaAction;
    protected ECAAnimator EcaAnimator;

    public event EventHandler StageFinished;

    public ECAActionStage(ECAAction ecaAction, ECAAnimator ecaAnimator)
    {
        EcaAction = ecaAction;
        EcaAnimator = ecaAnimator;
    }

    protected ECAActionStage(ECAAction ecaAction)
    {
        EcaAction = ecaAction;
    }

    public virtual void startStage() { }
    public virtual void endStage() {
        if (StageFinished != null)
        {
            StageFinished(this, EventArgs.Empty);
        }
    }

    public virtual void reactToActionStart() { }
    public virtual void reactToStateUpdate() { }
    public virtual void reactToLabelUpdate() { }
    public virtual void reactToActionFinished() { }

}
