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


    public override void GoTo(Vector3 target, float arrivalDeltaDistance)
    {
        Assert.IsNotNull(navMeshAgent);
        navMeshAgent.SetDestination(target);
        StartCoroutine(WaitArrival(target, arrivalDeltaDistance + 0.5f));
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


    public override void LookAt(Transform target = null, bool turnToSit = false)
    {
        //If the target is not specified, the ECA will look to the player
        if (target == null)
            target = Player.transform;
        if (turnToSit)
        {
            Vector3 dir = target.forward;
    
            m_trajectory.FaceDirectiononIdle = true;
            m_trajectory.StrafeDirection = dir;
    
            StartCoroutine(WaitLookAt(dir));
        }
    
        Debug.DrawRay(target.position, target.forward * 50, Color.red, 10);
    }


    public override IEnumerator WaitLookAt(Vector3 dir)
    {
        //DOVREI FARLO CON GLI ANGOLI E NON CON IL TEMPO
        yield return new WaitForSeconds(.7f);
        m_trajectory.FaceDirectiononIdle = false;
        EndLookingAt();
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

    public void MxM_BlendController(float value)
    {
        if (value == 1f)
            m_animator.BlendInController(value);
        else
            m_animator.BlendOutController(value);
    }

    public void MxM_SetMaskBodyPart(AvatarMaskBodyPart bodyPart, bool active, bool firstTime)
    {
        m_animator.AnimatorControllerMask.SetHumanoidBodyPartActive(bodyPart, active);
        m_animator.UpdateAvatarMask();
    }

    public void SetWeightLayerMecanicAnimator(int idLayer, float weightLayer)
    {
        StartCoroutine(LayerAnimator(idLayer, weightLayer));
    }

    IEnumerator LayerAnimator(int idLayer, float weightLayer)
    {
        
        float var = mecanimAnimator.GetLayerWeight(idLayer);

        if(var < weightLayer)
        {
            while (var < weightLayer)
            {
                mecanimAnimator.SetLayerWeight(idLayer, var);
                var += .01f;
                yield return new WaitForSeconds(.005f);
            }
        }
        else if(var > weightLayer)
        {
            while (var > weightLayer)
            {
                mecanimAnimator.SetLayerWeight(idLayer, var);
                var -= .01f;
                yield return new WaitForSeconds(.005f);
            }
        }
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
