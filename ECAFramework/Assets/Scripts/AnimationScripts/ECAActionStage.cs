using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAActionStage : MonoBehaviour
{
    protected ECAAction EcaAction;
    protected ECAAnimator EcaAnimator;

    public EventHandler StageFinished;

    public ECAActionStage(ECAAction ecaAction, ECAAnimator ecaAnimator)
    {
        EcaAction = ecaAction;
        EcaAnimator = EcaAnimator;
    }

    protected ECAActionStage(ECAAction ecaAction)
    {
        EcaAction = ecaAction;
    }

    public virtual void startStage() { }
    public virtual void endStage() { }

    public virtual void reactToActionStart() { }
    public virtual void reactToStateUpdate() { }
    public virtual void reactToLabelUpdate() { }
    public virtual void reactToActionFinished() { }

}
