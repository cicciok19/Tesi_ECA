using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;
using UnityEngine.Assertions;

public class CPRStage : ECAActionStage
{
    internal CPRPosition target;
    internal InteractionObject interactionObj;
    internal InteractionTarget interactionTarget_L;
    internal InteractionTarget interactionTarget_R;
    float timer, speed;

    private bool startEvaluate = false;

    public CPRStage(CPRPosition target) : base()
    {
        this.target = target;   
    }

    public override void EndStage()
    {
        base.EndStage();
    }

    public override void StartStage()
    {
        base.StartStage();
        interactionObj = target.GetComponent<InteractionObject>();
        Assert.IsNotNull(interactionObj);

        interactionTarget_L = target.GetInteractionTarget_L();
        interactionTarget_R = target.GetInteractionTarget_R();
        Assert.IsNotNull(interactionTarget_L);
        Assert.IsNotNull(interactionTarget_R);

        SetupInteractionSystem();

        ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, interactionObj, true);
        ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, interactionObj, true);

        WaitFor(5f);
    }

    public override void Update()
    {
        base.Update();
        timer += Time.deltaTime * speed * (interactionTarget_L != null ? interactionTarget_L.interactionSpeedMlp : 1f);

        if (startEvaluate)
        {
            if (ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight < 0.01f)
                EndStage();
        }
    }

    private void SetupInteractionSystem()
    {
        ikManager.interactionSystem.Start();
        ikManager.interactionSystem.speed = 0.1f;
        speed = ikManager.interactionSystem.speed;
    }

    protected override void OnWaitCompleted()
    {
        startEvaluate = true;
    }
}
