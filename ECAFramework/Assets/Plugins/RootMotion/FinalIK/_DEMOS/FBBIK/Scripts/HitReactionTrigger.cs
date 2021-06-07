using UnityEngine;
using System.Collections;
using RootMotion.FinalIK;

namespace RootMotion.Demos {

	/// <summary>
	/// Triggering Hit Reactions on mouse button.
	/// </summary>
	public class HitReactionTrigger: MonoBehaviour {

        public HitReaction hitReaction;
        public float hitForce = 1f;

        private string colliderName;

		void Update() {
			// On left mouse button...
			if (Input.GetMouseButtonDown(0)) {
				Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

				// Raycast to find a ragdoll collider
				RaycastHit hit = new RaycastHit();
				if (Physics.Raycast(ray, out hit, 100f)) {

					// Use the HitReaction
					hitReaction.Hit(hit.collider, ray.direction * hitForce, hit.point);
				}
			}
		}
	}
}
