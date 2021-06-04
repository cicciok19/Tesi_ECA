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
        capnographyPosition = patient.GetCapnographyPosition();
        giveOxygenPosition = patient.GetGiveOxygenPosition();
        airwayTable = FindObjectOfType<AirwayTable>();

        //just for debug
        HandleGiveOxygen(airwayTable.OxygenMask.transform, giveOxygenPosition);
    }
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleGiveOxygen(Transform oxygenMask, Transform giveOxygenPosition)
    {
        giveOxygen = new GiveOxygen(this, oxygenMask, giveOxygenPosition);
        giveOxygen.StartAction();
    }
}
