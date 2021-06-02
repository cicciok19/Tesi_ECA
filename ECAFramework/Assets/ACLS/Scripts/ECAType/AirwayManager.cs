using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirwayManager : ECA
{
    public string[] intentNames = { "GiveOxygen", "StopOxygen", "AdvancedAirwayCapnography" };

    private GiveOxygen giveOxygen;
    private Patient patient;
    private Capnography capnography;
    private Transform capnographyPosition;
    private MedicalRoom medicalRoom;

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        capnographyPosition = patient.GetCapnographyPosition();

    }
    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleGiveOxygen()
    {

    }
}
