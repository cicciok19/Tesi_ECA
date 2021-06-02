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

    private void Awake()
    {
        injectionPosition = GetComponentInChildren<InjectionPosition>();
        cprPosition = GetComponentInChildren<CPRPosition>();
        capnographyPosition = GetComponentInChildren<AdvancedCapnographyPosition>();
    }

    //medical status managemente
    //status should be updated at every task completed by the team
    private void OnShock(object sender, EventArgs e)
    {

    }
    private void OnCPREnded(object sender, EventArgs e)
    {

    }
    private void OnAmiodarone(object sender, EventArgs e)
    {

    }

    private void OnEpinephrine(object sender, EventArgs e)
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

}
