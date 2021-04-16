/* File ECAAnimator C# implementation of class ECAAnimator */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using CrazyMinnow.SALSA;
using UnityEngine.AI;
using DG.Tweening;
using MxM;

// global declaration end

public class ECAAnimatorDemo : ECAAnimator
{
    public event EventHandler IsLookingAt;
    public event EventHandler EventComplete;
    public event EventHandler EventContact;

    public MxMAnimator m_animator;
    public MxMTrajectoryGenerator_BasicAI m_trajectory;

    public IKManager IK_manager;

    public Dictionary<String, MxMEventDefinition> MxM_EventDefinitions = new Dictionary<String, MxMEventDefinition>();

    /// <summary>
    /// Called in ECAGameManager to init all the variables we neew
    /// </summary>
    public override void Init()
    {
        base.Init();

        //MxM setup
        SetMxMAnimatorAndTrajectory();
        SetEventDefinitions();

        //FinalIK setup
        IK_manager = GetComponent<IKManager>();
    }

    
    //TEXT DISPLAY END

    public virtual void LookAt(Transform target = null, bool oppositeDirection = false)
    {
        //If the target is not specified, the ECA will look to the player
        if (target == null)
            target = Player.transform;

        Vector3 dir = (target.position - this.transform.position).normalized;

        MxM_startStrafing();

        if (!oppositeDirection)
            m_trajectory.StrafeDirection = dir;
        else
            m_trajectory.StrafeDirection = -dir;

        StartCoroutine(EndLookAt(dir));
    }
    /// <summary>
    /// Waits for the ECA to turn in the given direction of the LookAt method, then trows the event IsLookingAt
    /// </summary>
    /// <returns></returns>
    public virtual IEnumerator EndLookAt(Vector3 dir)
    {
        //DOVREI FARLO CON GLI ANGOLO E NON CON IL TEMPO
        yield return new WaitForSeconds(0.8f);
        MxM_stopStrafing();
        if (IsLookingAt != null)
            IsLookingAt(this, EventArgs.Empty);
    }

    //VISION CAPABILITY END

    public override void GoTo(Vector3 target, float arrivalDeltaDistance)
    {
        navMeshAgent.SetDestination(target);
        StartCoroutine(WaitArrival(target, arrivalDeltaDistance + 0.5f));
    }


    //MxM METHODS BEGIN

    protected void SetEventDefinitions()
    {
        foreach (EventDefinitions eventDef in (EventDefinitions[])Enum.GetValues(typeof(EventDefinitions)))
        {
            string s = eventDef.ToString();
            MxMEventDefinition ed = Resources.Load<MxMEventDefinition>("EventsDefinitions/EventDef_" + eventDef);
            MxM_EventDefinitions.Add(s, ed);
        }
    }

    protected void SetMxMAnimatorAndTrajectory()
    {
        m_animator = GetComponent<MxMAnimator>();
        if (m_animator == null)
            Utility.LogWarning("No MxM animator found for ECA: " + Eca.Name);

        m_trajectory = GetComponent<MxMTrajectoryGenerator_BasicAI>();
        if (m_animator == null)
            Utility.LogWarning("No MxM trajectory generator found for ECA: " + Eca.Name);
    }



    public virtual void MxM_BeginEvent(string id, Transform contact = null, string tag = null)
    {
        var eventDef = MxM_EventDefinitions[id];

        if(contact != null)
        {
            eventDef.ClearContacts();
            eventDef.AddEventContact(contact.position, this.transform.rotation.y);
        }

        if (tag != null)
        {
            m_animator.ClearRequiredTags();
            m_animator.AddRequiredTag(tag);
        }
        m_animator.BeginEvent(eventDef);
    }

    public virtual void MxM_SetTag(string tag)
    {
        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public virtual void MxM_startStrafing()
    {
        m_animator.ClearRequiredTags();
        m_animator.SetRequiredTag("Strafe");
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;
        m_animator.AngularErrorWarpRate = 360f;
    }

    public virtual void MxM_stopStrafing()
    {
        m_animator.ClearRequiredTags();
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;
        m_animator.AngularErrorWarpRate = 45f;
    }

    public virtual void MxM_clearRequiredTags()
    {
        m_animator.ClearRequiredTags();
    }

    public virtual void MxM_removeRequiredTag(String tag)
    {
        m_animator.RemoveRequiredTag(tag);
    }

    public virtual void MxM_waitForEventComplete()
    {
        StartCoroutine(WaitEventComplete());
    }

    public IEnumerator WaitEventComplete()
    {
        while (!m_animator.IsEventComplete)
            yield return null;
        if (EventComplete != null)
            EventComplete(this, EventArgs.Empty);
    }

    public virtual void MxM_waitForEventContact()
    {
        StartCoroutine(WaitEventContact());
    }

    public IEnumerator WaitEventContact()
    {
        while (m_animator.CurrentEventState != EEventState.Action)
            yield return null;
        if (EventContact != null)
            EventContact(this, EventArgs.Empty);
    }

    //IK MANAGEMENT
    public void IK_setEffectors(Transform hips, Transform l_foot, Transform r_foot)
    {
        IK_manager.SetChairEffectors(hips, l_foot, r_foot);
    }

    public void IK_setWeight(bool OnOff)
    {
        IK_manager.SetChairWeight(OnOff);
    }


}
