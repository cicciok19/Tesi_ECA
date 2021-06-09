using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using RootMotion.FinalIK;
using Random = UnityEngine.Random;

public enum PatientState
{
    VF,
    Asystole,
    Shocked
}

public class Patient : ECA
{
    private bool rythimShockable;
    private InjectionPosition injectionPosition;
    private CPRPosition cprPosition;
    private AdvancedCapnographyPosition capnographyPosition;
    private GiveOxygenPosition giveOxygenPosition;
    private DefLeftPosition defLeftPosition;
    private DefRightPosition defRightPosition;
    private HitReaction hitReaction;
    private Collider spineCollider;
    private Stomach stomach;
    private PumpPosition pumpPosition;
    private SystemManager systemManager;

    public PatientState state;

    private const float RHYTM_SHOCKABLE = .4f;
    private int counterCPR;
    private readonly object start = new object();

    public EventHandler CheckRythm;

    private void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        cprPosition = GetComponentInChildren<CPRPosition>();
        capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();
        giveOxygenPosition = GetComponentInChildren<GiveOxygenPosition>();
        defLeftPosition = GetComponentInChildren<DefLeftPosition>();
        defRightPosition = GetComponentInChildren<DefRightPosition>();
        hitReaction = GetComponent<HitReaction>();
        spineCollider = GetComponentInChildren<SpineCollider>().GetComponent<Collider>();
        stomach = GetComponentInChildren<Stomach>();
        pumpPosition = GetComponentInChildren<PumpPosition>();

        systemManager = FindObjectOfType<SystemManager>();

        counterCPR = 0;
    }

    //medical status managemente
    //status should be updated at every task completed by the team
    public void OnShockReceived()
    {
        Debug.Log("Sono shockato");
        hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);
        //hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);
        state = PatientState.Shocked;
    }
    public void OnCPREnded()
    {      
        CheckPatientState();      
    }
    public void OnAmiodaroneDone()
    {

    }

    public void OnEpinephrineDone()
    {

    }

    public void OnIvAccessDone()
    {

    }

    public void OnOxygenGiven()
    {

    }

    public void OnCapnographyDone()
    {

    }

    private void CheckPatientState()
    {
        float rythmShock = Random.Range(0, 1);

        if (rythmShock < RHYTM_SHOCKABLE)
            state = PatientState.Asystole;
        else
            state = PatientState.VF;

        if (CheckRythm != null)
            CheckRythm(this, EventArgs.Empty);
    }

    public CPRPosition GetCPRPosition()
    {
        return cprPosition;
    }

    public Transform GetCapnographyPosition()
    {
        return capnographyPosition.transform;
    }

    public Transform GetInjectionPosition()
    {
        return injectionPosition.transform;
    }

    public Transform GetGiveOxygenPosition()
    {
        return giveOxygenPosition.transform;
    }

    public Transform GetDefRightPosition()
    {
        return defRightPosition.transform;
    }

    public Transform GetDefLeftPosition()
    {
        return defLeftPosition.transform;
    }

    public Transform GetPumpPosition() 
    {
        return pumpPosition.transform;
    }
}
