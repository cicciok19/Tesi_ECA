﻿using UnityEngine;
using System.Collections;
using RootMotion;
using RootMotion.FinalIK;

namespace RootMotion.Demos {
	
	/// <summary>
	/// Picking up an arbitrary object with both hands.
	/// </summary>
	public abstract class PickUp2Handed : MonoBehaviour {
		
		// GUI for testing
		public int GUIspace;

        void OnGUI() {
			GUILayout.BeginHorizontal();
			GUILayout.Space(GUIspace);

			if (!holding) {

				if (GUILayout.Button("Pick Up " + obj.name)) {
					interactionSystem.StartInteraction(FullBodyBipedEffector.LeftHand, obj, false);
					interactionSystem.StartInteraction(FullBodyBipedEffector.RightHand, obj, false);
				}
				
			} else {
				
				if (GUILayout.Button("Drop " + obj.name)) {
					interactionSystem.ResumeAll();
				}
			}

			GUILayout.EndHorizontal();
		}

		protected abstract void RotatePivot();
		
		public InteractionSystem interactionSystem; // The InteractionSystem of the character
		public InteractionObject obj; // The object to pick up
		public Transform pivot; // The pivot point of the hand targets
		public Transform holdPoint; // The point where the object will lerp to when picked up
		public float pickUpTime = 0.3f; // Maximum lerp speed of the object. Decrease this value to give the object more weight

		private float holdWeight, holdWeightVel;
		private Vector3 pickUpPosition;
		private Quaternion pickUpRotation;
		
		protected void Start() {
			// Listen to interaction events
			interactionSystem.OnInteractionStart += OnStart;
			interactionSystem.OnInteractionPause += OnPause;
			interactionSystem.OnInteractionResume += OnDrop;
		}
		
		// Called by the InteractionSystem when an interaction is paused (on trigger)
		protected void OnPause(FullBodyBipedEffector effectorType, InteractionObject interactionObject) {
			if (effectorType != FullBodyBipedEffector.LeftHand) return;
			if (interactionObject != obj) return;

			// Make the object inherit the character's movement
			obj.transform.parent = interactionSystem.transform;

			Debug.Log("I'm in pause.");

			// Make the object kinematic
			var r = obj.GetComponent<Rigidbody>();
			if (r != null) r.isKinematic = true;

			// Set object pick up position and rotation to current
			pickUpPosition = obj.transform.position;
			pickUpRotation = obj.transform.rotation;
			holdWeight = 0f;
			holdWeightVel = 0f;
		}
		
		// Called by the InteractionSystem when an interaction starts
		protected void OnStart(FullBodyBipedEffector effectorType, InteractionObject interactionObject) {
			if (effectorType != FullBodyBipedEffector.LeftHand) return;
			if (interactionObject != obj) return;
			
			// Rotate the pivot of the hand targets
			RotatePivot();

			// Rotate the hold point so it matches the current rotation of the object
			holdPoint.rotation = obj.transform.rotation;
		}
		
		// Called by the InteractionSystem when an interaction is resumed from being paused
		protected void OnDrop(FullBodyBipedEffector effectorType, InteractionObject interactionObject) {
			if (effectorType != FullBodyBipedEffector.LeftHand) return;
			if (interactionObject != obj) return;
			
			// Make the object independent of the character
			obj.transform.parent = null;
			
			// Turn on physics for the object
			if (obj.GetComponent<Rigidbody>() != null) obj.GetComponent<Rigidbody>().isKinematic = false;
		}
		
		void LateUpdate() {
			if (holding) {
				// Smoothing in the hold weight
				holdWeight = Mathf.SmoothDamp(holdWeight, 1f, ref holdWeightVel, pickUpTime);

				// Interpolation
				obj.transform.position = Vector3.Lerp(pickUpPosition, holdPoint.position, holdWeight);
				obj.transform.rotation = Quaternion.Lerp(pickUpRotation, holdPoint.rotation, holdWeight);
			}
		}
		
		// Are we currently holding the object?
		protected bool holding {
			get {
				return interactionSystem.IsPaused(FullBodyBipedEffector.LeftHand);
			}
		}

		// Clean up delegates
		protected void OnDestroy() {
			if (interactionSystem == null) return;

			interactionSystem.OnInteractionStart -= OnStart;
			interactionSystem.OnInteractionPause -= OnPause;
			interactionSystem.OnInteractionResume -= OnDrop;
		}
	}
}
