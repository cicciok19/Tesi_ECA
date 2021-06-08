using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "StopOxygen", "AdvancedAirwayCapnography" };

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

        HandleCapnography(airwayTable.GetCapnographyTube(), patient);
    }
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleGiveOxygen(Oxygen oxygen, Patient patient)
    {
        giveOxygen = new GiveOxygen(this, oxygen, patient);
        giveOxygen.StartAction();
    }

    private void HandleCapnography(Transform capnographyTube, Patient patient)
    {
        capnography = new Capnography(this, capnographyTube, patient);
        capnography.StartAction();
    }
}
