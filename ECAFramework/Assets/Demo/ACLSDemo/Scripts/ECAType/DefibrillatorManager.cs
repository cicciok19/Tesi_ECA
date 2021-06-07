using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DefibrillatorManager : ECA
{
    public string[] intentNames = { "AttachMonitor", "Shock" };
    public event EventHandler ShockCompleted;

    private Shock shock;
    private AttachMonitor attachMonitor;
    private MedicalRoom room;
    private DefibrillatorTable defibrillatorTable;
    private Patient patient;
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    protected override void Start()
    {
        base.Start();
        room = FindObjectOfType<MedicalRoom>();
        patient = FindObjectOfType<Patient>();
        defibrillatorTable = room.GetDefibrillatorTable();
        HandleShock();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleShock()
    {
        shock = new Shock(this, defibrillatorTable.GetDefibrillator(), patient);
        shock.CompletedAction += OnShockCompleted;
        shock.StartAction();
    }

    private void OnShockCompleted(object sender, EventArgs e)
    {
        patient.OnShockReceived();
    }
}
