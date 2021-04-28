using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.Demos;

public class PickStage : ECAActionStage
{
    Transform target;


    public PickStage(Transform target) : base()
    {
        this.target = target;
    }

    public override void StartStage()
    {
        base.StartStage();
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void Update()
    {
        base.Update();
    }
}
