using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class ResumeInteractionStage : ECAActionStage
{
    List<FullBodyBipedEffector> effectors;

    public ResumeInteractionStage(List<FullBodyBipedEffector> effectors) : base()
    {
        this.effectors = effectors;
    }

    public ResumeInteractionStage(FullBodyBipedEffector effector) : base()
    {
        effectors = new List<FullBodyBipedEffector>();
        effectors.Add(effector);
    }

    public override void StartStage()
    {
        base.StartStage();

        ikManager.interactionSystem.speed = 1f;

        foreach(FullBodyBipedEffector effector in effectors)
            ikManager.interactionSystem.ResumeInteraction(effector);

        EndStage();
    }
}
