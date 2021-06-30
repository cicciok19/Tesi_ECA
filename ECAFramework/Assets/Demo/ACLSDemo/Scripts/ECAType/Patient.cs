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
    FibrillazioneVentricolare,
    Asistole,
    Ok
}


// global declaration end

public class Patient : ECA
{
    private float stateThreshold = 0.8f;

    private IVPosition ivPosition;
    private CPRPosition cprPosition;
    private AdvancedCapnographyPosition capnographyPosition;
    private GiveOxygenPosition giveOxygenPosition;
    private DefLeftPosition defLeftPosition;
    private DefRightPosition defRightPosition;
    private HitReaction hitReaction;
    private Collider spineCollider;
    private Collider secondSpineCollider;
    private Stomach stomach;
    private PumpPosition pumpPosition;
    private DestinationDef destinationDef;
    private DestinationAir destinationAir;
    private InjectionPosition injectionPosition;
    private Sternum sternum;
    private LeftFootCompressor leftFootCompressor;
    private RightFootCompressor rightFootCompressor;
    private HipsCompressor hipsCompressor;


    protected bool ivAccessInserted = false;
    protected bool isOxygened = false;
    protected bool hasCapnography = false;

    public event EventHandler Shocked;
    public PatientState state;
    private PatientState initialState;
    private float stateLevel;

    public float StateLevel
    {
        get { return stateLevel; }
        set
        {
            stateLevel = value;
            if (stateLevel > stateThreshold)
            {
                if(stateLevel > 1)
                    stateLevel = 1;
                state = PatientState.Ok;
            }
            else
            {
                if (stateLevel < 0)
                    stateLevel = 0;
                if (stateLevel >= .2f)
                    state = initialState;
                if (stateLevel < .1f)
                {
                    state = PatientState.FibrillazioneVentricolare;
                    initialState = state;
                }
                
            }

            Debug.Log("ACTUAL PATIENT STATE LEVEL: " + stateLevel);

        }
    }

    protected override void Awake()
    {
        ivPosition = GetComponentInChildren<IVPosition>();
        cprPosition = GetComponentInChildren<CPRPosition>();
        capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();
        giveOxygenPosition = GetComponentInChildren<GiveOxygenPosition>();
        defLeftPosition = GetComponentInChildren<DefLeftPosition>();
        defRightPosition = GetComponentInChildren<DefRightPosition>();
        hitReaction = GetComponent<HitReaction>();
        spineCollider = GetComponentInChildren<SpineCollider>().GetComponent<Collider>();
        secondSpineCollider = GetComponentInChildren<SecondSpineCollider>().GetComponent<Collider>();
        stomach = GetComponentInChildren<Stomach>();
        pumpPosition = GetComponentInChildren<PumpPosition>();
        destinationDef = GetComponentInChildren<DestinationDef>();
        destinationAir = GetComponentInChildren<DestinationAir>();
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        sternum = GetComponentInChildren<Sternum>();
        leftFootCompressor = GetComponentInChildren<LeftFootCompressor>();
        rightFootCompressor = GetComponentInChildren<RightFootCompressor>();
        hipsCompressor = GetComponentInChildren<HipsCompressor>();



        float random = Random.Range(0, 1);
        if(random > 0.5f)
        {
            state = PatientState.FibrillazioneVentricolare;
            stateLevel = .1f;
        }
        else
        {
            state = PatientState.Asistole;
            stateLevel = .2f;
        }

        ivAccessInserted = true;

        initialState = state;
    }

    public void OnShockReceived()
    {
        Debug.Log("Sono shockato");
        hitReaction.Hit(spineCollider, Vector3.up * .5f, stomach.transform.position);
        if (Shocked != null)
            Shocked(this, EventArgs.Empty);
    }

    public void OnCprReceived()
    {
        Debug.Log("Sono hittato");
        hitReaction.Hit(secondSpineCollider, Vector3.down * .05f, sternum.transform.position);
        //hitReaction.Hit(spineCollider, Vector3.up * .2f, stomach.transform.position);
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


    public Transform GetIVPosition()
    {
        return ivPosition.transform;
    }


    public Transform GetGiveOxygenPosition()
    {
        return giveOxygenPosition.transform;
    }

    public Transform GetDestinationAir()
    {
        return destinationAir.transform;
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

    public Transform GetInjectionPosition()
    {
        return injectionPosition.transform;
    }
    public Transform GetLeftFootCompressor()
    {
        return leftFootCompressor.transform;
    }

    public Transform GetRightFootCompressor()
    {
        return rightFootCompressor.transform;
    }

    public Transform GetHipsCompressor()
    {
        return hipsCompressor.transform;
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
