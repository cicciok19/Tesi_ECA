using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;
using UnityEngine.Assertions;

public class PlaceObjectStage : ECAActionStage
{
    private InteractionObject destinationObject;
    private Transform obj;
    private HandSide handSide;
    private PickStage pickStage;

    public PlaceObjectStage(PickStage pickStage, Transform destinationTransform) : base()
    {
        destinationObject = destinationTransform.GetComponent<InteractionObject>();
        Assert.IsNotNull(destinationObject);
        handSide = pickStage.typePick;
        this.pickStage = pickStage;
    }

    public override void StartStage()
    {
        base.StartStage();

        obj = pickStage.obj.transform;

        if (destinationObject.GetComponentInChildren<PivotObject>() == null)
            Debug.LogError("The target does not have a pivot object.");

        ikManager.interactionSystem.speed = .2f;

        if (handSide == HandSide.RightHand)
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, destinationObject, false);
        else if(handSide == HandSide.LeftHand)
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, destinationObject, false);
        else
        {
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, destinationObject, false);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, destinationObject, false);
        }

        //ikManager.SetTargetAimIK(ikManager.headIK, destinationObject.transform);
        ikManager.interactionSystem.lookAt = new InteractionLookAt();
        ikManager.interactionSystem.lookAt.ik = ikManager.lookAtIK;

        destinationObject.otherLookAtTarget = destinationObject.transform;

    }

    public override void Update()
    {
        base.Update();

        if (Vector3.Distance(destinationObject.transform.position, obj.position) <= .15f)
            EndStage();
    }
}
