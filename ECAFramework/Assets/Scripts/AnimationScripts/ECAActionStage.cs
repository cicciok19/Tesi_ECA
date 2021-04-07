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

    public virtual void startStage() { }

    public virtual void endStage() {
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
    }

    public virtual void reactToActionStart(object sender, EventArgs e) { }
    public virtual void reactToStateUpdate(object sender, EventArgs e) { }
    public virtual void reactToLabelUpdate(object sender, EventArgs e) { }
    public virtual void reactToActionFinished(object sender, EventArgs e) { }
}
