/* File GrabbableObject C# implementation of class GrabbableObject */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.AI;
using RootMotion.Demos;
using RootMotion.FinalIK;


// global declaration end

public class GrabbableObject : ECAInteractableObject
{

    protected InteractionObject interactionObj;
    protected AnimationCurve curveOne;
    protected AnimationCurve curveTwo;
    protected Rigidbody rb;

    protected void Awake()
    {
        occupied = false;
        interactionObj = this.gameObject.GetComponent<InteractionObject>();

        if (interactionObj == null)
        {
            interactionObj = this.gameObject.AddComponent<InteractionObject>();
            curveOne = SetGaussianCurve(0, 1f);
            curveTwo = SetGaussianCurve(0, .23f);

            //creating the weight curves
            interactionObj.weightCurves = new InteractionObject.WeightCurve[2];

            interactionObj.weightCurves[0] = new InteractionObject.WeightCurve();
            interactionObj.weightCurves[0].type = InteractionObject.WeightCurve.Type.PositionWeight;
            interactionObj.weightCurves[0].curve = curveOne;

            interactionObj.weightCurves[1] = new InteractionObject.WeightCurve();
            interactionObj.weightCurves[1].type = InteractionObject.WeightCurve.Type.Reach;
            interactionObj.weightCurves[1].curve = curveTwo;

            //creating multipliers
            interactionObj.multipliers = new InteractionObject.Multiplier[2];

            interactionObj.multipliers[0] = new InteractionObject.Multiplier();
            interactionObj.multipliers[0].curve = InteractionObject.WeightCurve.Type.PositionWeight;
            interactionObj.multipliers[0].multiplier = 1f;
            interactionObj.multipliers[0].result = InteractionObject.WeightCurve.Type.RotateBoneWeight;

            interactionObj.multipliers[1] = new InteractionObject.Multiplier();
            interactionObj.multipliers[1].curve = InteractionObject.WeightCurve.Type.PositionWeight;
            interactionObj.multipliers[1].multiplier = 1f;
            interactionObj.multipliers[1].result = InteractionObject.WeightCurve.Type.PoserWeight;

            //creating event
            
            interactionObj.events = new InteractionObject.InteractionEvent[1];

            interactionObj.events[0] = new InteractionObject.InteractionEvent();
            interactionObj.events[0].unityEvent = new UnityEngine.Events.UnityEvent();
            interactionObj.events[0].animations = new InteractionObject.AnimatorEvent[0];
            interactionObj.events[0].messages = new InteractionObject.Message[0];
            interactionObj.events[0].time = .5f;
            interactionObj.events[0].pause = true;
        }

        if(GetComponent<Rigidbody>() == null)
        {
            rb = this.gameObject.AddComponent<Rigidbody>();
            rb.useGravity = false;
            rb.isKinematic = true;
        }
    }

    private AnimationCurve SetGaussianCurve(float minValue, float maxValue)
    {
        AnimationCurve curve;

        Keyframe[] kS = new Keyframe[3];

        kS[0] = new Keyframe(0, minValue, 0, 0);
        kS[1] = new Keyframe(.5f, maxValue, 0, 0);
        kS[2] = new Keyframe(1, minValue, 0, 0);

        curve = new AnimationCurve(kS);

        return curve;
    }

    protected void SetPick(bool pick)
    {
        if (interactionObj != null)
            interactionObj.events[0].pickUp = pick;
        else
            Debug.LogError("There isn't an interaction object attached");
    }

    protected void SetPause(bool pause)
    {
        if (interactionObj != null)
            interactionObj.events[0].pause = pause;
        else
            Debug.LogError("There isn't an interaction object attached");
    }




}
