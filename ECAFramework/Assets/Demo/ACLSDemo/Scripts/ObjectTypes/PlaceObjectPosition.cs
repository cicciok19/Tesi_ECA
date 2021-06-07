using RootMotion.FinalIK;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlaceObjectPosition : MonoBehaviour
{
    protected InteractionObject interactionObj;
    protected AnimationCurve positionWeight;
    protected AnimationCurve reach;
    protected AnimationCurve poserWeight;
    private void Awake()
    {
        interactionObj = this.gameObject.GetComponent<InteractionObject>();

        if (interactionObj == null)
        {
            interactionObj = this.gameObject.AddComponent<InteractionObject>();
            positionWeight = SetSigmoid(1);
            reach = SetSigmoid(0.3f);
            poserWeight = SetSigmoid(1);

            //creating the weight curves
            interactionObj.weightCurves = new InteractionObject.WeightCurve[3];

            interactionObj.weightCurves[0] = new InteractionObject.WeightCurve();
            interactionObj.weightCurves[0].type = InteractionObject.WeightCurve.Type.PositionWeight;
            interactionObj.weightCurves[0].curve = positionWeight;

            interactionObj.weightCurves[1] = new InteractionObject.WeightCurve();
            interactionObj.weightCurves[1].type = InteractionObject.WeightCurve.Type.Reach;
            interactionObj.weightCurves[1].curve = reach;

            interactionObj.weightCurves[2] = new InteractionObject.WeightCurve();
            interactionObj.weightCurves[2].type = InteractionObject.WeightCurve.Type.PoserWeight;
            interactionObj.weightCurves[2].curve = poserWeight;

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
            interactionObj.events[0].time = Mathf.Infinity; //2008
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

    private AnimationCurve SetSigmoid(float maxValue)
    {
        AnimationCurve curve;

        Keyframe[] kS = new Keyframe[3];

        kS[0] = new Keyframe(0, 0, 0, 0);
        kS[1] = new Keyframe(0.5f, maxValue, 0, 0);
        kS[2] = new Keyframe(1, maxValue, 0, 0);

        curve = new AnimationCurve(kS);

        return curve;
    }



}
