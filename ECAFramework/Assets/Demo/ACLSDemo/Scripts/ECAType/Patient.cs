/* File Patient C# implementation of class Patient */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using RootMotion.FinalIK;
using Random = UnityEngine.Random;

	public enum PatientState
{
    None,
    VF,
    Asystole
}


// global declaration end

public class Patient : ECA
{
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
    private DestinationDef destinationDef;

    protected bool ivAccessInserted = false;
    protected bool isOxygened = false;
    protected bool hasCapnography = false;

    public EventHandler Shocked;
    public PatientState state;


    protected override void Awake()
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
        destinationDef = GetComponentInChildren<DestinationDef>();

        state = PatientState.None;
    }

    public void OnShockReceived()
    {
        Debug.Log("Sono shockato");
        hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);
        //hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);
        if (Shocked != null)
            Shocked(this, EventArgs.Empty);

    }


    public void OnCPREnded()
    {      
        
    }


    public void OnAmiodaroneDone()
    {
    }


    public void OnEpinephrineDone()
    {
    }


    public void OnIvAccessDone()
    {
        ivAccessInserted = true;
    }


    public void OnOxygenGiven()
    {
        isOxygened = true;
    }


    public void OnCapnographyDone()
    {
    }

    public Transform GetDestinationDef()
    {
        return destinationDef.transform;
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

    public bool HasCapnography
    {
        get => hasCapnography;
    }

    public bool IsOxygened
    {
        get => isOxygened;
    }

    public bool HasIVAccess
    {
        get => ivAccessInserted;
    }


}
