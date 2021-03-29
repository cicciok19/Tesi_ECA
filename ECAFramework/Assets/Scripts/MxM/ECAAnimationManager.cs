using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;
using UnityEngine.AI;

public class ECAAnimationManager : MonoBehaviour
{
    private MxMAnimator m_animator;
    private MxMTrajectoryGenerator_BasicAI trajectoryGenerator;
    private Transform player;
    private NavMeshAgent navAgent;

    private SitEvent eca_sitEvent;

    private float acceptanceAngle;

    [SerializeField] private Transform destination = null;
    [SerializeField] private MxMEventDefinition sitDefinition = null;

    public bool strafing;
    public Transform sitPoint;

    void Start()
    {
        m_animator = GetComponent<MxMAnimator>();
        trajectoryGenerator = GetComponent<MxMTrajectoryGenerator_BasicAI>();
        navAgent = GetComponent<NavMeshAgent>();

        player = GameObject.FindGameObjectWithTag("Player").transform;

        acceptanceAngle = 0.2f;

        strafing = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            toggleStrafe();
        }
        if (Input.GetKeyDown(KeyCode.P))
        {
            //eca_sitEvent.SitOrStand();
            sitDefinition.ClearContacts();
            sitDefinition.AddEventContact(sitPoint);
            m_animator.BeginEvent("SitDown");
        }

        if (strafing)
        {
            Vector3 dir = (player.position - this.transform.position).normalized;
            trajectoryGenerator.StrafeDirection = dir;
        }

    }

    protected void toggleStrafe()
    {
        if (!strafing)
        {
            //setup strafing
            m_animator.ClearRequiredTags();
            m_animator.SetRequiredTag("Strafe");
            trajectoryGenerator.TrajectoryMode = ETrajectoryMoveMode.Strafe;
            m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;
            m_animator.AngularErrorWarpRate = 360f;

            strafing = true;
        }
        else
        {
            //back to normal locomotion
            m_animator.ClearRequiredTags();
            trajectoryGenerator.TrajectoryMode = ETrajectoryMoveMode.Normal;
            m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;
            m_animator.AngularErrorWarpRate = 45f;

            strafing = false;
        }
    }
}
