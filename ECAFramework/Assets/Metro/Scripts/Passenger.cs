using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Passenger : ECA
{
    private ECAAction actualAction = null;

    public override void Init()
    {
        base.Init();
    }

    protected override void Awake()
    {
        base.Awake();
    }

    protected override void Start()
    {
        base.Start();

        GoSomewhere();
    }

    public override void DetachEvent(string handlerName, EventArgs args)
    {
        base.DetachEvent(handlerName, args);
    }

    private void GoSomewhere()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goRandom = new GoToStage(10f);
        WaitStage wait = new WaitStage(3f);
        stages.Add(goRandom);
        stages.Add(wait);

        ECAAction newAction = new ECAAction(this, stages);
        actualAction = newAction;
        actualAction.StartAction();

        actualAction.CompletedAction += OnDestinationArrived;

    }

    private void OnDestinationArrived(object sender, EventArgs e)
    {
        actualAction.CompletedAction -= OnDestinationArrived;
        GoSomewhere();
    }

}
