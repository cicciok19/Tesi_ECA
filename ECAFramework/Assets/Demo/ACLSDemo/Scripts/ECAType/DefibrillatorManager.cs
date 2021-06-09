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
        patient.CheckRythm += OnRythm;
        //HandleShock();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);

        switch (intent.IntentName)
        {
            case "AttachMonitor":
                HandleAttachMonitor();
                break;
            case "Shock":
                HandleShock();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        IntentName = new List<string> { "AttachMonitor", "Shock"};
        IntentManager.Instance.AddIntentHandler(IntentName[0], this);
        IntentManager.Instance.AddIntentHandler(IntentName[1], this);
    }

    private void HandleShock()
    {
        if (patient.state == PatientState.Asystole)
            Debug.Log("You have to inject Epinephrine, NOT Shock!");

        shock = new Shock(this, defibrillatorTable, patient);
        shock.CompletedAction += OnShockCompleted;
        shock.StartAction();
    }

    private void HandleAttachMonitor()
    {

    }

    private void OnShockCompleted(object sender, EventArgs e)
    {
        patient.OnShockReceived();
    }

    private void OnMonitorAttached(object sender, EventArgs e)
    {
        //send message
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
