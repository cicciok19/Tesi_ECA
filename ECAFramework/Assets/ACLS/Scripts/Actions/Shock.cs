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
        defManager = (DefibrillatorManager)eca;
        this.defibrillator = defibrillator;
        this.defibrillatorTarget = defibrillatorTarget;
    }

    private void PickPaddles()
    {
        List<ECAActionStage> pickStages = new List<ECAActionStage>()
        {
            new PickStage(defibrillator.GetLeftPaddle().transform, 1, false, HandSide.LeftHand),
            new PickStage(defibrillator.GetRightPaddle().transform, 1, false, HandSide.RightHand)
        };

        ECAParallelActionStage pick = new ECAParallelActionStage(pickStages.ToArray());
        TurnStage turn = new TurnStage(defibrillatorTarget);

        List<ECAActionStage> list = new List<ECAActionStage>();
        list.Add(pick);
        list.Add(turn);

        takePaddles = new ECAAction(defManager, list);
        actions.Add(takePaddles);
    }

    public override void StartAction()
    {
        PickPaddles();
        base.StartAction();
    }



}
