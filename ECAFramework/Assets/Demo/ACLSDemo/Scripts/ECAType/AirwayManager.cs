using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class AirwayManager : ECA
{
    private GiveOxygen giveOxygen;
    private Capnography capnography;
    private Patient patient;
    private MedicalRoom medicalRoom;
    private AirwayTable airwayTable;

    private const string GIVE_OXYGEN = "GiveOxygen";
    private const string CAPNOGRAPHY = "Capnography";

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        airwayTable = medicalRoom.GetAirwayTable();

        //just for debug
        HandleGiveOxygen();

        //HandleCapnography();
    }
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
        switch (intent.IntentName)
        {
            case GIVE_OXYGEN:
                HandleGiveOxygen();
                break;
            case CAPNOGRAPHY:
                HandleCapnography();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentNames = new List<string> {GIVE_OXYGEN, CAPNOGRAPHY};

        foreach(string intent in intentNames)
            IntentManager.Instance.AddIntentHandler(intent, this);

    }

    private void HandleGiveOxygen()
    {
        giveOxygen = new GiveOxygen(this, airwayTable.GetOxygen(), patient, airwayTable);
        giveOxygen.CompletedAction += OnOxygenGiven;
        giveOxygen.StartAction();
    }

    private void HandleCapnography()
    {
        capnography = new Capnography(this, airwayTable.GetCapnographyTube(), patient);
        capnography.CompletedAction += OnCapnographyCompleted;
        capnography.StartAction();

    }
    private void OnCapnographyCompleted(object sender, EventArgs e)
    {
        capnography.CompletedAction -= OnCapnographyCompleted;
        patient.OnCapnographyDone();
    }
    private void OnOxygenGiven(object sender, EventArgs e)
    {
        giveOxygen.CompletedAction -= OnOxygenGiven;
        patient.OnOxygenGiven();
    }
}
