/* File ECAAnimatorMxM C# implementation of class ECAAnimatorMxM */



// global declaration start


/* File ECAAnimator C# implementation of class ECAAnimator */





using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;
using CrazyMinnow.SALSA;
using UnityEngine.AI;
using DG.Tweening;
using MxM;


// global declaration end

public class ECAAnimatorMxM : ECAAnimator
{

    public Dictionary<String, MxMEventDefinition> MxM_EventDefinitions =     new Dictionary<String, MxMEventDefinition>();
    public MxMTrajectoryGenerator_BasicAI m_trajectory;
    public MxMAnimator m_animator;


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


    protected IEnumerator WaitEventContact()
    {
        while (m_animator.CurrentEventState != EEventState.Action)
            yield return null;
    
        RaiseEvent("TriggeredAnimationContact", EventArgs.Empty);
    }


    protected IEnumerator WaitEventComplete()
    {
        while (!m_animator.IsEventComplete)
            yield return null;
    
        RaiseEvent("TriggeredAnimationComplete", EventArgs.Empty);
    }




    public override void Init()
    {
        base.Init();
    
        //MxM setup
        SetMxMAnimatorAndTrajectory();
        SetEventDefinitions();
    }


    public override void TriggerAnimation(string id, Transform contact = null, string tag = null)
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


    public override void SetAnimationGroup(string tag)
    {
        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public void MxM_StartStrafing(Transform objToFace = null)
    {
        m_animator.ClearRequiredTags();
        m_animator.SetRequiredTag("Strafe");
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;
        m_animator.AngularErrorWarpRate = 360f;

        if(objToFace != null)
        {
            Debug.DrawRay(objToFace.position, objToFace.forward, Color.blue, 10f);
            //var dir = -objToFace.InverseTransformDirection(objToFace.forward);
            //Debug.DrawRay(objToFace.position, dir, Color.red, 10f);
            m_trajectory.StrafeDirection = -objToFace.forward;
        }
    }


    public void MxM_StopStrafing()
    {
        m_animator.ClearRequiredTags();
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;
        m_animator.AngularErrorWarpRate = 45f;
    }

    public void MxM_BlendController(float value, bool blendIn)
    {
        if (blendIn)
            m_animator.BlendInController(value);
        else
            m_animator.BlendOutController(value);
    }

    public void MxM_SetMaskBodyPart(AvatarMaskBodyPart bodyPart, bool active)
    {
        m_animator.AnimatorControllerMask.SetHumanoidBodyPartActive(bodyPart, active);
        m_animator.UpdateAvatarMask();
    }

    public void MxM_ClearRequiredTags()
    {
        m_animator.ClearRequiredTags();
    }


    public void MxM_RemoveRequiredTag(String tag)
    {
        m_animator.RemoveRequiredTag(tag);
    }


    public override void ClearAnimationGroup()
    {
        m_animator.ClearRequiredTags();
    }


    public override void WaitForTriggeredAnimationContact()
    {
        StartCoroutine(WaitEventContact());
    }


    public override void WaitForTriggeredAnimationComplete()
    {
        StartCoroutine(WaitEventComplete());
    }


}