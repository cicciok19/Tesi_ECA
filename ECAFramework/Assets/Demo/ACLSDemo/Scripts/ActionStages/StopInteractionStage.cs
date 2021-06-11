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

    public override void StartStage()
    {
        base.StartStage();

        foreach(FullBodyBipedEffector effector in effectors)
            ikManager.interactionSystem.ResumeInteraction(effector);

        EndStage();
    }
}
