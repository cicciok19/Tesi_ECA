using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public abstract class ECAActionStage
{
    protected ECAAction EcaAction;
    protected ECAAnimatorDemo EcaAnimator;

    public event EventHandler StageFinished;

    public ECAActionStage(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator)
    {
        EcaAction = ecaAction;
        EcaAnimator = ecaAnimator;
    }

    /// <summary>
    /// In questo metodo devo specificare cosa succede non appena inizializzo lo stage
    /// </summary>
    public virtual void StartStage() { }

    /// <summary>
    /// Serve per definire cosa succede quando uno stage finisce. Di base genera l'evento StageFinished che segnala
    /// all'azione che quello stage è terminato e può andare avanti
    /// </summary>
    public virtual void EndStage() {
        if (StageFinished != null)
            StageFinished(this, EventArgs.Empty);
    }

    public virtual void ReactToActionStart(object sender, EventArgs e) { }
    public virtual void ReactToStateUpdate(object sender, EventArgs e) { }
    public virtual void ReactToLabelUpdate(object sender, EventArgs e) { }
    public virtual void ReactToActionFinished(object sender, EventArgs e) { }
}
