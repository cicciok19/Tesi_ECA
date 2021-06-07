using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using RootMotion.FinalIK;

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

    private void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        cprPosition = GetComponentInChildren<CPRPosition>();
        capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();
        giveOxygenPosition = GetComponentInChildren<GiveOxygenPosition>();
        defLeftPosition = GetComponentInChildren<DefLeftPosition>();
        defRightPosition = GetComponentInChildren<DefRightPosition>();
        hitReaction = GetComponent<HitReaction>();
    }

    //medical status managemente
    //status should be updated at every task completed by the team
    public void OnShockReceived()
    {
        Debug.Log("Sono shockato");
        hitReaction.Hit(this.GetComponent<MeshCollider>(), Vector3.down * 1f, defLeftPosition.transform.position);
        hitReaction.Hit(this.GetComponent<MeshCollider>(), Vector3.down * 1f, defRightPosition.transform.position);
    }
    private void OnCPREnded(object sender, EventArgs e)
    {

    }
    private void OnAmiodaroneDone(object sender, EventArgs e)
    {

    }

    private void OnEpinephrineDone(object sender, EventArgs e)
    {

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

}
