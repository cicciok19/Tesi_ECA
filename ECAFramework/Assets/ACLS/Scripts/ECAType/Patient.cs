using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Patient : ECA
{
    private bool rythimShockable;
    private InjectionPosition injectionPosition;
    private CPRPosition cprPosition;
    private AdvancedCapnographyPosition capnographyPosition;
    private GiveOxygenPosition giveOxygenPosition;
    private DefLeftPosition defLeftPosition;
    private DefRightPosition defRightPosition;

    private void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        cprPosition = GetComponentInChildren<CPRPosition>();
        capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();
        giveOxygenPosition = GetComponentInChildren<GiveOxygenPosition>();
        defLeftPosition = GetComponentInChildren<DefLeftPosition>();
        defRightPosition = GetComponentInChildren<DefRightPosition>();
    }

    //medical status managemente
    //status should be updated at every task completed by the team
    private void OnShockReceived(object sender, EventArgs e)
    {

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

    public Transform GetCPRPosition()
    {
        return cprPosition.transform;
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
