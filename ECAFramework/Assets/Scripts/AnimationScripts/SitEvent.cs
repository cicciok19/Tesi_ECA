using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;

public class SitEvent : MonoBehaviour
{
    private MxMAnimator m_animator;
    private Transform sitPoint;
    private bool sit;
    private bool tagSetted;

    [SerializeField] private MxMEventDefinition sitEvent;
    [SerializeField] private MxMEventDefinition standEvent;

    public SitEvent(MxMAnimator anim, Transform sp, MxMEventDefinition se)
    {
        m_animator = anim;
        sitPoint = sp;
        sitEvent = se;
    }

    private void Start()
    {
        sit = false;
        tagSetted = false;
    }

    public void SitOrStand()
    {
        if (!sit)
        {
            sitEvent.ClearContacts();
            sitEvent.AddEventContact(sitPoint);
            m_animator.BeginEvent("SitDown");
            setTag();

            sit = true;
        }
        else
        {
            standEvent.ClearContacts();
            m_animator.BeginEvent("StandUp");

            m_animator.ClearRequiredTags();

            sit = false;
        }
    }

    private void setTag()
    {
        while (!m_animator.IsEventComplete)
        {
            print("DENTRO IL WHILE");
            continue;
        }
        print("     USCITO DAL WHILE");
        m_animator.ClearRequiredTags();
        m_animator.SetRequiredTag("Sitting");
    }
}
