using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class StopInteractionStage : ECAActionStage
{
    List<FullBodyBipedEffector> effectors;

    public StopInteractionStage(List<FullBodyBipedEffector> effectors) : base()
    {
        this.effectors = effectors;
    }

    public override void StartStage()
    {
        base.StartStage();

        ikManager.interactionSystem.speed = .05f;

        foreach (FullBodyBipedEffector effector in effectors)
            ikManager.interactionSystem.StopInteraction(effector);

        EndStage();
    }
}
