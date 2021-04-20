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

    }

    
    //TEXT DISPLAY END

    public virtual void LookAt(Transform target = null, bool oppositeDirection = false)
    {
        //If the target is not specified, the ECA will look to the player
        if (target == null)
            target = Player.transform;

        Vector3 dir = (target.position - this.transform.position).normalized;

        //MxM_startStrafing();
        m_trajectory.FaceDirectiononIdle = true;

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
        //DOVREI FARLO CON GLI ANGOLI E NON CON IL TEMPO
        yield return new WaitForSeconds(1f);
        //MxM_stopStrafing();
        m_trajectory.FaceDirectiononIdle = false;
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


    /// <summary>
    /// Triggera un evento di MxM (deve essere pre-caricato nelle EventDefinitions)
    /// </summary>
    /// <param name="id">Nome dell'evento come definito in MxM</param>
    /// <param name="contact">Punto di contatto che deve essere raggiunto durante l'evento</param>
    /// <param name="tag">Tag delle pose che devono essere riprodotte successivamente all'evento</param>
    public void MxM_BeginEvent(string id, Transform contact = null, string tag = null)
    {
        var eventDef = MxM_EventDefinitions[id];

        if(contact != null)
        {
            eventDef.ClearContacts();
            eventDef.AddEventContact(contact);
        }

        if (tag != null)
        {
            m_animator.ClearRequiredTags();
            m_animator.AddRequiredTag(tag);
        }
        m_animator.BeginEvent(eventDef);
    }

    public void MxM_SetTag(string tag)
    {
        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public void MxM_StartStrafing()
    {
        m_animator.ClearRequiredTags();
        m_animator.SetRequiredTag("Strafe");
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;
        m_animator.AngularErrorWarpRate = 360f;
    }

    public void MxM_StopStrafing()
    {
        m_animator.ClearRequiredTags();
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;
        m_animator.AngularErrorWarpRate = 45f;
    }

    public void MxM_ClearRequiredTags()
    {
        m_animator.ClearRequiredTags();
    }

    public void MxM_RemoveRequiredTag(String tag)
    {
        m_animator.RemoveRequiredTag(tag);
    }

    public void MxM_WaitForEventComplete()
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

    public void MxM_WaitForEventContact()
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

    public void MxM_BlendInController(float weight)
    {
        m_animator.BlendInController(weight);
    }

    /// <summary>
    /// Set body parts directly to the AvatarMask of the MxM animator
    /// </summary>
    /// <param name="bodyPart"></param>
    /// <param name="active"></param>
    public void MxM_SetMaskBodyPart(AvatarMaskBodyPart bodyPart, bool active)
    {
        m_animator.AnimatorControllerMask.SetHumanoidBodyPartActive(bodyPart, active);
        m_animator.UpdateAvatarMask();
    }
}
