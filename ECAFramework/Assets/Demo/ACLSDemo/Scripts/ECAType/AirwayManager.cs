using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "Capnography" };

    private GiveOxygen giveOxygen;
    private Capnography capnography;
    private Patient patient;
    private MedicalRoom medicalRoom;
    private AirwayTable airwayTable;
    private Transform turnObj;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        airwayTable = medicalRoom.GetAirwayTable();

        //just for debug
        //HandleGiveOxygen(airwayTable.GetOxygen(), patient);

        //HandleCapnography(airwayTable.GetCapnographyTube(), patient);
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
            case "GiveOxygen":
                HandleGiveOxygen(airwayTable.GetOxygen(), patient);
                break;
            case "Capnography":
                HandleCapnography(airwayTable.GetCapnographyTube(), patient);
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        IntentName = new List<string> { "GiveOxygen", "Capnography" };
        IntentManager.Instance.AddIntentHandler(IntentName[0], this);
        IntentManager.Instance.AddIntentHandler(IntentName[1], this);

    }

    private void HandleGiveOxygen(Oxygen oxygen, Patient patient)
    {
        giveOxygen = new GiveOxygen(this, oxygen, patient);
        giveOxygen.CompletedAction += OnOxygenGiven;
        giveOxygen.StartAction();
    }

    private void HandleCapnography(Transform capnographyTube, Patient patient)
    {
        capnography = new Capnography(this, capnographyTube, patient);
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
