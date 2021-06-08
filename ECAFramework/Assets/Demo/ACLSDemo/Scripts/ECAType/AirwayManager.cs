using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "StopOxygen", "AdvancedAirwayCapnography" };

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
        airwayTable = medicalRoom.GetAirwayTable();

        //just for debug
        HandleGiveOxygen(airwayTable.GetOxygen(), patient);
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
}
