﻿using System.Collections;
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
	internal GrabbableObject target;
	internal HandSide typePick = HandSide.Nothing;
	internal FullBodyBipedEffector effector;

	private ECAAnimatorMxM animatorMxM;
	internal Animator mecanimAnimator;

	internal InteractionSystem interactionSystem; // The InteractionSystem of the character
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
		this.grab = grab;
		this.typePick = typePick;
	}

    public override void StartStage()
	{
		base.StartStage();

		animatorMxM = (ECAAnimatorMxM)animator;
		mecanimAnimator = animatorMxM.mecanimAnimator;

		if (animatorMxM.Eca.GetComponentInChildren<HoldPoint>() == null && !grab)
		{
			Debug.LogError("The target does not have the hold point.");
			return;
		}
		else if (!grab)
			holdPoint = animatorMxM.Eca.GetComponentInChildren<HoldPoint>().transform;

		if (target.GetComponent<InteractionObject>() == null)
		{
			Debug.LogError("Target is not a grabbable object.");
			return;
		}
		else
			obj = target.GetComponent<InteractionObject>();



		if (animatorMxM.Eca.GetComponent<InteractionSystem>() == null)
			interactionSystem = animatorMxM.Eca.gameObject.AddComponent<InteractionSystem>();
		else
			interactionSystem = animatorMxM.Eca.GetComponent<InteractionSystem>();

		interactionSystem.ik = animatorMxM.Eca.GetComponent<FullBodyBipedIK>();
		Assert.IsNotNull(interactionSystem.ik);

		interactionSystem.Start();

		if (target.GetComponentInChildren<PivotObject>() == null)
		{
			Debug.LogError("The target does not have a pivot object.");
			return;
		}
		else
			pivot = target.GetComponentInChildren<PivotObject>().transform;


		interactionSystem.OnInteractionStart += OnStart;
		interactionSystem.OnInteractionPause += OnPause;

		interactionSystem.speed = .5f;

		if(typePick == HandSide.Nothing)
        {
			Transform rightHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.RightHand);
			Transform leftHand = animatorMxM.mecanimAnimator.GetBoneTransform(HumanBodyBones.LeftHand);

			if (Vector3.Distance(rightHand.position, obj.transform.position) < Vector3.Distance(leftHand.position, obj.transform.position))
				typePick = HandSide.RightHand;
			else
				typePick = HandSide.LeftHand;

			Debug.Log(animatorMxM.Eca.name + " ha scelto " + typePick);
		}

		if (typePick == HandSide.LeftHand)
		{
			effector = FullBodyBipedEffector.LeftHand;
			interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, obj, false);
		}
		else if (typePick == HandSide.RightHand)
		{
			effector = FullBodyBipedEffector.RightHand;
			interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, obj, false);
		}
		else if (typePick == HandSide.BothHands)
		{
			effector = FullBodyBipedEffector.LeftHand;
			interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, obj, false);
			interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, obj, false);
		}
        else if(typePick == HandSide.Nothing)
        {
            Debug.LogError("Select a TypePick!");
        }
	}

	// Called by the InteractionSystem when an interaction is paused (on trigger)
	private void OnPause(FullBodyBipedEffector effectorType, InteractionObject interactionObject)
	{
		if (effectorType != effector) return;
		if (interactionObject != obj) return;

		// Make the object inherit the character's movement
		if (!grab)
			obj.transform.parent = interactionSystem.transform;

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

		// Rotate the pivot of the hand targets
		RotatePivot();

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

			if (holdPoint.position.magnitude - obj.transform.position.magnitude <= .05f && !grab)
				EndStage();
		}

	}

    protected override void ActivateBodyParts()
    {
		if (typePick == HandSide.LeftHand)
		{
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
		}
		else if (typePick == HandSide.RightHand)
		{
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightArm, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightHandIK, true);
		}
		else if (typePick == HandSide.BothHands)
		{
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftFingers, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightFingers, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftArm, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.LeftHandIK, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightArm, true);
			animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.RightHandIK, true);	 
		}

		animatorMxM.MxM_SetMaskBodyPart(AvatarMaskBodyPart.Root, true);
	}

    protected override void ActivateLayer(int layerIndex)
    {
		base.ActivateLayer(layerIndex);
    }

    protected override void DeactivateLayer(int layerIndex)
    {
		base.DeactivateLayer(layerIndex);
    }

    // Are we currently holding the object?
    private bool holding
	{
		get
		{
			return interactionSystem.IsPaused(effector);
		}
	}

	// Rotate the pivot of the hand targets by 90 degrees so we could grab the object from any direction
	private void RotatePivot()
	{
		// Get the flat direction towards the character
		Vector3 characterDirection = (pivot.position - interactionSystem.transform.position).normalized;
		characterDirection.y = 0f;

		// Convert the direction to local space of the object
		Vector3 characterDirectionLocal = obj.transform.InverseTransformDirection(characterDirection);

		// QuaTools.GetAxis returns a 90 degree ortographic axis for any direction
		Vector3 axis = QuaTools.GetAxis(characterDirectionLocal);
		Vector3 upAxis = QuaTools.GetAxis(obj.transform.InverseTransformDirection(interactionSystem.transform.up));

		// Rotate towards axis and upAxis
		pivot.localRotation = Quaternion.LookRotation(axis, upAxis);
	}

    public override void EndStage()
    {
        base.EndStage();

		interactionSystem.OnInteractionStart -= OnStart;
		interactionSystem.OnInteractionPause -= OnPause;
	}
}
