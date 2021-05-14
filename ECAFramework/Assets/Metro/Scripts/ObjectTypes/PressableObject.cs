using RootMotion.FinalIK;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PressableObject : MonoBehaviour
{
    private GameObject pressPosition = null;
    private GameObject pivot = null;
    private InteractionObject interactionObj;
    private AnimationCurve positionWeight;
    private AnimationCurve reach;
    private AnimationCurve rotateBoneWeight;
    private AnimationCurve positionOffsetY;

    private void Awake()
    {
        pressPosition = GameObject.Instantiate((GameObject)Resources.Load("Prefab/PressPosition_R"), this.transform);
    }

    private void SetupInteractionObject()
    {
        pressPosition = new GameObject(name + "_PressPosition");
        pivot = new GameObject("Pivot");
        pressPosition.transform.parent = transform;

        pressPosition.transform.position = Vector3.zero;
        pressPosition.transform.rotation = Quaternion.identity;
        pressPosition.transform.localScale = Vector3.one;

        interactionObj = pressPosition.gameObject.AddComponent<InteractionObject>();

        positionWeight = SetPositionWeightCurve(0, 1f);
        reach = SetReachCurve(0.8f, 0, 0.65f);
        rotateBoneWeight = SetRotateBoneWeightCurve(0, 1f);
        positionOffsetY = SetPositionOffsetYCurve(0, 0.05f, 0.03f);

        //creating the weight curves
        interactionObj.weightCurves = new InteractionObject.WeightCurve[4];

        interactionObj.weightCurves[0] = new InteractionObject.WeightCurve();
        interactionObj.weightCurves[0].type = InteractionObject.WeightCurve.Type.PositionWeight;
        interactionObj.weightCurves[0].curve = positionWeight;

        interactionObj.weightCurves[1] = new InteractionObject.WeightCurve();
        interactionObj.weightCurves[1].type = InteractionObject.WeightCurve.Type.Reach;
        interactionObj.weightCurves[1].curve = reach;

        interactionObj.weightCurves[2] = new InteractionObject.WeightCurve();
        interactionObj.weightCurves[2].type = InteractionObject.WeightCurve.Type.RotateBoneWeight;
        interactionObj.weightCurves[2].curve = rotateBoneWeight;

        interactionObj.weightCurves[3] = new InteractionObject.WeightCurve();
        interactionObj.weightCurves[3].type = InteractionObject.WeightCurve.Type.PositionOffsetY;
        interactionObj.weightCurves[3].curve = positionOffsetY;

        //creating multipliers
        interactionObj.multipliers = new InteractionObject.Multiplier[2];

        interactionObj.multipliers[0] = new InteractionObject.Multiplier();
        interactionObj.multipliers[0].curve = InteractionObject.WeightCurve.Type.RotateBoneWeight;
        interactionObj.multipliers[0].multiplier = 1f;
        interactionObj.multipliers[0].result = InteractionObject.WeightCurve.Type.PoserWeight;

        //creating event

        interactionObj.events = new InteractionObject.InteractionEvent[1];

        interactionObj.events[0] = new InteractionObject.InteractionEvent();
        interactionObj.events[0].unityEvent = new UnityEngine.Events.UnityEvent();
        interactionObj.events[0].animations = new InteractionObject.AnimatorEvent[0];
        interactionObj.events[0].messages = new InteractionObject.Message[0];
        interactionObj.events[0].time = .5f;
        interactionObj.events[0].pause = false;
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

    private AnimationCurve SetPositionWeightCurve(float minValue, float maxValue)
    {
        AnimationCurve curve;

        Keyframe[] ks = new Keyframe[4];

        ks[0] = new Keyframe(0, minValue, 0, 0);
        ks[1] = new Keyframe(0.5f, maxValue, 0, 0);
        ks[2] = new Keyframe(1, maxValue, 0, 0);
        ks[3] = new Keyframe(2, minValue, 0, 0);

        curve = new AnimationCurve(ks);

        return curve;
    }

    private AnimationCurve SetReachCurve(float v1, float v2, float v3)
    {
        AnimationCurve curve;

        Keyframe[] ks = new Keyframe[4];

        ks[0] = new Keyframe(0, v1, 0, 0);
        ks[1] = new Keyframe(0.6f, v2, 0, 0);
        ks[2] = new Keyframe(1.2f, v2, 0, 0);
        ks[3] = new Keyframe(1.6f, v3, 0, 0);

        curve = new AnimationCurve(ks);

        return curve;
    }

    private AnimationCurve SetRotateBoneWeightCurve(float v1, float v2)
    {
        AnimationCurve curve;

        Keyframe[] ks = new Keyframe[4];

        ks[0] = new Keyframe(0, v1, 0, 0);
        ks[1] = new Keyframe(0.5f, v2, 0, 0);
        ks[2] = new Keyframe(1, v2, 0, 0);
        ks[3] = new Keyframe(1.5f, v1, 0, 0);

        curve = new AnimationCurve(ks);

        return curve;
    }

    private AnimationCurve SetPositionOffsetYCurve(float v1, float v2, float v3)
    {
        AnimationCurve curve;

        Keyframe[] ks = new Keyframe[6];

        ks[0] = new Keyframe(0, v1, 0, 0);
        ks[1] = new Keyframe(0.5f, v2, 0, 0);
        ks[2] = new Keyframe(0.55f, v1, 0, 0);
        ks[3] = new Keyframe(0.95f, v1, 0, 0);
        ks[4] = new Keyframe(1, v3, 0, 0);
        ks[5] = new Keyframe(1.5f, v1, 0, 0);


        curve = new AnimationCurve(ks);

        return curve;
    }

    public GameObject GetPressPosition()
    {
        GameObject gop = Instantiate(pressPosition);
        //gop.GetComponent<Renderer>().enabled = false;
        gop.transform.parent = transform;
        gop.transform.localPosition = Vector3.zero;
        return gop;
    }
}
