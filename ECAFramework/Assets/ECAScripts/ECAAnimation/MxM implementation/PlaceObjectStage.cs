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
    private bool pauseTheEffector;
    private bool ended;

    public PlaceObjectStage(PickStage pickStage, Transform destinationTransform, bool pauseTheEffector) : base()
    {
        destinationObject = destinationTransform.GetComponent<InteractionObject>();
        Assert.IsNotNull(destinationObject);
        handSide = pickStage.typePick;
        this.pickStage = pickStage;
        this.pauseTheEffector = pauseTheEffector;
    }

    public override void StartStage()
    {
        base.StartStage();

        obj = pickStage.obj.transform;

        if (destinationObject.GetComponentInChildren<PivotObject>() == null)
            Debug.LogError("The target does not have a pivot object.");

        ikManager.interactionSystem.speed = .5f;

        if (handSide == HandSide.RightHand)
        {
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, destinationObject, false);
        }
        else if (handSide == HandSide.LeftHand)
        {
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, destinationObject, false);
        }
        else
        {
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, destinationObject, false);
            ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, destinationObject, false);
        }

        //ikManager.SetTargetAimIK(ikManager.headIK, destinationObject.transform);
        ikManager.interactionSystem.lookAt = new InteractionLookAt();
        ikManager.interactionSystem.lookAt.ik = ikManager.lookAtIK;

        destinationObject.otherLookAtTarget = destinationObject.transform;

        ended = false;
    }

    public override void Update()
    {
        base.Update();

        /*
        if (Vector3.Distance(destinationObject.transform.position, obj.position) <= .15f)
            EndStage();
        */

        if (pauseTheEffector && !ended)
        {
            if (handSide == HandSide.RightHand)
            {
                if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight >= .95f)
                {
                    ikManager.interactionSystem.PauseInteraction(FullBodyBipedEffector.RightHand);
                    EndStage();
                }
            }
            if (handSide == HandSide.LeftHand)
            {
                if (ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight >= .95f)
                {
                    ikManager.interactionSystem.PauseInteraction(FullBodyBipedEffector.LeftHand);
                    EndStage();
                }
            }
            else if (handSide == HandSide.BothHands)
            {
                if (ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight >= .95f)
                {
                    ikManager.interactionSystem.PauseInteraction(FullBodyBipedEffector.RightHand);
                    ikManager.interactionSystem.PauseInteraction(FullBodyBipedEffector.LeftHand);
                    EndStage();
                }
            }
        }
        else
        {
            if (Vector3.Distance(destinationObject.transform.position, obj.position) <= .1f && !ended)
            {
                Debug.Log("SONO QUI");
                EndStage();
            }

        }
    }
}
