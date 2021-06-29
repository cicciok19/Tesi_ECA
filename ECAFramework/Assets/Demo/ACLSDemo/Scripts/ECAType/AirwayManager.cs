using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class AirwayManager : ECA
{
    private Patient patient;
    private MedicalRoom medicalRoom;
    private AirwayTable airwayTable;

    private SystemManager systemManager;

    private bool capnographyDone;

    private const string GIVE_OXYGEN = "GiveOxygen";
    private const string CAPNOGRAPHY = "Capnography";

    protected override void Start()
    {
        base.Start();
        patient = FindObjectOfType<Patient>();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        airwayTable = medicalRoom.GetAirwayTable();

        systemManager = FindObjectOfType<SystemManager>();

        capnographyDone = false;

        //just for debug
        //HandleGiveOxygen();

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
        GiveOxygen giveOxygen = new GiveOxygen(this, airwayTable.GetOxygen(), patient, airwayTable);
        giveOxygen.CompletedAction += OnOxygenGiven;
        SendDirectMessage("Ora do l'ossigeno.");
        actionsList.Enqueue(giveOxygen);
    }

    private void HandleCapnography()
    {
        if (!capnographyDone)
        {
            Capnography capnography = new Capnography(this, airwayTable, patient);
            capnography.CompletedAction += OnCapnographyCompleted;
            SendDirectMessage("Va bene, allora inizio l'intubazione.");
            actionsList.Enqueue(capnography);
        }
        else
            SendDirectMessage("Ho già fatto l'intubazione, l'hai dimenticato?");
    }
    private void OnCapnographyCompleted(object sender, EventArgs e)
    {
        Capnography capnography = (Capnography)sender;
        capnographyDone = true;
        capnography.CompletedAction -= OnCapnographyCompleted;
        SendDirectMessage("Ho completato l'intubazione");
        systemManager.CheckAction(capnography.ActionName);
        patient.OnCapnographyDone();
    }
    private void OnOxygenGiven(object sender, EventArgs e)
    {
        GiveOxygen giveOxygen = (GiveOxygen)sender;
        giveOxygen.CompletedAction -= OnOxygenGiven;
        systemManager.CheckAction(giveOxygen.ActionName);
        patient.OnOxygenGiven();
    }
}
