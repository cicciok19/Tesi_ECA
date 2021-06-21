using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using RootMotion.FinalIK;
using RootMotion;

/// <summary>
/// Picking up a box shaped object with both hands.
/// </summary>
public class PickStage : ECAActionStage
{
	internal GrabbableObject target = null;
	internal HandSide typePick = HandSide.Nothing;
	internal FullBodyBipedEffector effector;

	private ECAAnimatorMxM animatorMxM;

	internal InteractionObject obj; // The object to pick up
	private Transform pivot; // The pivot point of the hand targets
	private Transform holdPoint; // The point where the object will lerp to when picked up
	private float pickSpeed; // Maximum lerp speed of the object. Decrease this value to give the object more weight
	private bool grab;

	private float holdWeight, holdWeightVel;
	private Vector3 pickUpPosition;
	private Quaternion pickUpRotation;

	public PickStage(Transform target, float pickSpeed, bool grab = false, HandSide typePick = HandSide.Nothing) : base()
    {
		this.target = target.GetComponent<GrabbableObject>();
		Assert.IsNotNull(this.target);
		this.pickSpeed = pickSpeed;
		this.typePick = typePick;
		this.grab = grab;
	}

	public override void StartStage()
	{
		base.StartStage();
			
		animatorMxM = (ECAAnimatorMxM)animator;
		//ikManager.interactionSystem.Start();

		//set components needed to start the interaction
		SetupComponents();

        //does the start of the interactionSystem, mandatory
        SetupInteractionSystem();

		//choose type pick and starts the interaction
		//SetTypePick(); done in OnWaitComplete
		WaitFor(.2f);

	}

	// Called by the InteractionSystem when an interaction is paused (on trigger)
	private void OnPause(FullBodyBipedEffector effectorType, InteractionObject interactionObject)
	{
		if (effectorType != effector) return;
		if (interactionObject != obj) return;

		// Make the object inherit the character's movement
		if (!grab)
			obj.transform.parent = animator.Eca.transform;

		// Make the object kinematic
		var r = obj.GetComponent<Rigidbody>();
		if (r != null) r.isKinematic = true;

		// Set object pick up position and rotation to current
		pickUpPosition = obj.transform.position;
		pickUpRotation = obj.transform.rotation;
		
		holdWeight = 0f;
		holdWeightVel = 0f;

		if (grab)
			EndStage();
	}

    // Called by the InteractionSystem when an interaction starts
    private void OnStart(FullBodyBipedEffector effectorType, InteractionObject interactionObject)
	{
		if (effectorType != effector) return;
		if (interactionObject != obj) return;

		// Rotate the hold point so it matches the current rotation of the object
		if(!grab)
			holdPoint.rotation = new Quaternion(obj.transform.rotation.x, obj.transform.rotation.y, obj.transform.rotation.z, obj.transform.rotation.w);
	}

    public override void LateUpdate()
	{
		if (holding)
		{
			// Smoothing in the hold weight
			holdWeight = Mathf.SmoothDamp(holdWeight, 1f, ref holdWeightVel, pickSpeed);

			if (!grab)
			{
				// Interpolation
				obj.transform.position = Vector3.Lerp(pickUpPosition, holdPoint.position, holdWeight);
				obj.transform.rotation = Quaternion.Lerp(pickUpRotation, holdPoint.rotation, holdWeight);
			}

			if (Vector3.Distance(holdPoint.position, obj.transform.position) <= .22f && !grab)
				EndStage();
		}
		else if(obj.GetComponentInParent<ECA>())
        {
			//Debug.Log(Vector3.Distance(holdPoint.position, obj.transform.position));
			//if (Vector3.Distance(holdPoint.position, obj.transform.position) <= .3f && !grab)
			if(typePick == HandSide.RightHand)
            {
				if (ikManager.fullBodyBipedIK.solver.rightHandEffector.positionWeight <= 0.02f)
					EndStage();
			}
			else if( typePick == HandSide.LeftHand || typePick == HandSide.BothHands)
            {
				if (ikManager.fullBodyBipedIK.solver.leftHandEffector.positionWeight <= 0.02f)
					EndStage();
			}
			
		}

	}

    // Are we currently holding the object?
    private bool holding
	{
		get
		{
			return ikManager.interactionSystem.IsPaused(effector);
		}
	}

    public override void EndStage()
    {
        base.EndStage();

        ikManager.interactionSystem.OnInteractionStart -= OnStart;
        ikManager. interactionSystem.OnInteractionPause -= OnPause;
	}

    private void SetupInteractionSystem()
    {
		//ikManager.interactionSystem.Start();
        ikManager.interactionSystem.OnInteractionStart += OnStart;
        ikManager.interactionSystem.OnInteractionPause += OnPause;

        ikManager.interactionSystem.speed = .5f;
	}

	private void SetupComponents()
    {
		//INTERACTION OBJECT
		if (target.GetComponent<InteractionObject>() == null)
		{
			Debug.LogError("Target is not a grabbable object.");
			return;
		}
		else
			obj = target.GetComponent<InteractionObject>();

        if (grab)
        {
			var grabbableObject = obj.GetComponent<GrabbableObject>();
			grabbableObject.SetPause(true);
			grabbableObject.SetPick(false);
        }

		//PIVOT OBJECT
		if (target.GetComponentInChildren<PivotObject>() == null)
		{
			Debug.LogError("The target does not have a pivot object.");
			return;
		}
		else
			pivot = target.GetComponentInChildren<PivotObject>().transform;

		//HOLD POINT
		if (animatorMxM.Eca.GetComponentInChildren<HoldPoint>() == null && !grab)
		{
			Debug.LogError("The target does not have the hold point.");
			return;
		}
		else if (!grab)
		{
			if (typePick == HandSide.RightHand)
				holdPoint = animatorMxM.Eca.GetComponentInChildren<HoldPointRight>().transform;
			else
				holdPoint = animatorMxM.Eca.GetComponentInChildren<HoldPointLeft>().transform;
		}
	}

	private void SetTypePick()
    {
		//if handSide is not specified gets the closest hand
		if (typePick == HandSide.Nothing)
		{
			Transform rightHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
			Transform leftHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);

			if (Vector3.Distance(rightHand.position, obj.transform.position) < Vector3.Distance(leftHand.position, obj.transform.position))
				typePick = HandSide.RightHand;
			else
				typePick = HandSide.LeftHand;
		}

		//start the interaction with the correct hand
		if (typePick == HandSide.LeftHand)
		{
			effector = FullBodyBipedEffector.LeftHand;
			ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, obj, false);

			//obj.otherLookAtTarget = obj.transform;
		}
		else if (typePick == HandSide.RightHand)
		{
			effector = FullBodyBipedEffector.RightHand;
			ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, obj, false);
		}
		else if (typePick == HandSide.BothHands)
		{
			effector = FullBodyBipedEffector.LeftHand;
			ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, obj, false);
			ikManager.interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, obj, false);
		}

		
	}

    protected override void OnWaitCompleted()
    {
        base.OnWaitCompleted();
		SetTypePick();
	}

}
