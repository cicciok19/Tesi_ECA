using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "Capnography" };

    private GiveOxygen giveOxygen;
    private Transform giveOxygenPosition;
    private Patient patient;
    private Capnography capnography;
    private Transform capnographyPosition;
    private MedicalRoom medicalRoom;
    private AirwayTable airwayTable;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        capnographyPosition = patient.GetCapnographyPosition();
        giveOxygenPosition = patient.GetGiveOxygenPosition();
        airwayTable = medicalRoom.GetAirwayTable();

        //just for debug
        HandleGiveOxygen(airwayTable.GetOxygen(), giveOxygenPosition);
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
                HandleGiveOxygen(airwayTable.GetOxygen(), giveOxygenPosition);
                break;
            case "Capnography":
                HandleCapnography();
                break;
        }
    }

    private void HandleGiveOxygen(Oxygen oxygen, Transform giveOxygenPosition)
    {
        giveOxygen = new GiveOxygen(this, oxygen, giveOxygenPosition);
        giveOxygen.StartAction();
    }

    private void HandleCapnography()
    {

    }
    private void OnCapnographyCompleted(object sender, EventArgs e)
    {
        //send message
    }
    private void OnOxygenGiven(object sender, EventArgs e)
    {
        //send message
    }
}
