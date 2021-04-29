using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;

public class CollisionTester : ECA
{
    private ECAAnimatorMxM animatorMxM;
    private Vector3 translateCenter = new Vector3(0, 1, 0);
    private Transform destination;

    protected override ECAAnimator AddECAAnimator()
    {
        animatorMxM = gameObject.AddComponent<ECAAnimatorMxM>();
        return animatorMxM;
    }

    protected override void Awake()
    {
        base.Awake();
    }

    protected override void Start()
    {
        base.Start();

        GoToDestination();
        //Debug.DrawRay(transform.position + translateCenter, this.transform.forward * 10, Color.red, 20f);
    }

    private void GoToDestination()
    {
        destination = GameObject.FindGameObjectWithTag("Destination").transform;
        ECAAction newAction = new ECAAction(this, new GoToStage(destination));
        newAction.StartAction();
    }

    private void OnTriggerEnter(Collider other)
    {
        ECA otherEca = other.GetComponent<ECA>();

        if ( otherEca != null)
        {
            var ecaDir = animatorMxM.m_trajectory.InputVector;
            Vector2 ecaDir2d = new Vector2(ecaDir.x, ecaDir.z);
            var otherDir = otherEca.GetComponent<MxMTrajectoryGenerator_BasicAI>().InputVector;
            Vector2 otherDir2d = new Vector2(otherDir.x, otherDir.z);

            var angleMiddle = Vector3.Angle(ecaDir, otherDir)/2;
            Debug.Log(angleMiddle);
            Vector3 newDir = new Vector3(ecaDir.x * -Mathf.Cos(Mathf.Deg2Rad * angleMiddle), 0, ecaDir.z * Mathf.Sin(Mathf.Deg2Rad * angleMiddle));

            Debug.DrawRay(transform.position + translateCenter, ecaDir * 10, Color.red, 20f);
            Debug.DrawRay(destination.position + translateCenter , newDir * 10, Color.green, 20f);
        }
    }
}
