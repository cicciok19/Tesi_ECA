using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shock : ECACompositeAction
{
    private Defibrillator defibrillator;
    private DefibrillatorManager defManager;
    private Transform defibrillatorTarget;

    private ECAAction takePaddles;
    private ECAAction usePaddles;

    public Shock(DefibrillatorManager eca, Defibrillator defibrillator, Transform defibrillatorTarget) : base(eca)
    {
        defManager = eca;
        this.defibrillator = defibrillator;
        this.defibrillatorTarget = defibrillatorTarget;
        PickPaddles();
    }

    private void PickPaddles()
    {
        ECAAction action = new ECAAction(defManager, new PickStage(defibrillator.GetLeftPaddle().transform, 1, false, HandSide.LeftHand));
        actions.Add(action);
    }

}
