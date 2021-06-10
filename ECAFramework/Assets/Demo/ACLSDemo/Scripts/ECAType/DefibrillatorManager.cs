using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DefibrillatorManager : ECA
{
    public event EventHandler ShockCompleted;

    private MedicalRoom room;
    private DefibrillatorTable defibrillatorTable;
    private Patient patient;
    private DefibrillatorScreen screen;

    protected const string ATTACH_MONITOR = "Attach monitor";
    protected const string SHOCK = "Shock";

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
        screen = defibrillatorTable.GetDefibrillator().GetScreen();

        patient.CheckRythm += OnRythm;
        //HandleShock();
        //HandleAttachMonitor();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);

        switch (intent.IntentName)
        {
            case ATTACH_MONITOR:
                HandleAttachMonitor();
                break;
            case SHOCK:
                HandleShock();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> IntentName = new List<string> {ATTACH_MONITOR, SHOCK};

        foreach (string intent in IntentName)
            IntentManager.Instance.AddIntentHandler(intent, this);
    }

    private void HandleShock()
    {
        if (patient.state == PatientState.Asystole)
            Debug.Log("You have to inject Epinephrine, NOT Shock!");

        Shock shock = new Shock(this, defibrillatorTable, patient);
        shock.CompletedAction += OnShockCompleted;
        shock.StartAction();
    }

    private void HandleAttachMonitor()
    {
        if (screen.IsOn)
        {
            SendDirectMessage("Lo schermo è già accesso!");
            return;
        }

        AttachMonitor attachMonitor = new AttachMonitor(this, defibrillatorTable, patient);
        attachMonitor.CompletedAction += OnMonitorAttached;
        attachMonitor.StartAction();
    }

    private void OnShockCompleted(object sender, EventArgs e)
    {
        Shock shock = (Shock)sender;
        shock.CompletedAction -= OnShockCompleted;
        patient.OnShockReceived();
    }

    private void OnMonitorAttached(object sender, EventArgs e)
    {
        screen.IsOn = true;
    }

    private void OnRythm(object sender, EventArgs e)
    {
        if (patient.state == PatientState.VF)
            Debug.Log("VF");
        else if (patient.state == PatientState.Asystole)
            Debug.Log("Asystole");
        else
            Debug.LogError("Patient State is not setted");
    }
}
