using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class RandomDoctor : ECA
{
    protected const string TALK_TO_RELATIVE = "TalkToRelative";
    protected const string TAKE_OTHER_MEDICINE = "TakeOtherMedicine";

    public bool inside;

    private OtherRoom otherRoom;
    private MedicalRoom medicalRoom;
    public Vector3 initialPosition { get; protected set; }
    public Vector3 outsideDestination { get; protected set; }

    protected override void Start()
    {
        base.Start();
        otherRoom = FindObjectOfType<OtherRoom>();
        medicalRoom = FindObjectOfType<MedicalRoom>();

        medicalRoom.MedicineFinished += OnMedicineFinished;

        initialPosition = this.transform.position;
        outsideDestination = otherRoom.GetDestination();

        inside = true;

        //just for debug
        //HandleTalkToRelative();
        //HandleTakeOtherMedicine(MedicineName.Amiodarone);
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
            case TALK_TO_RELATIVE:
                HandleTalkToRelative();
                break;
            case TAKE_OTHER_MEDICINE:
                HandleTakeOtherMedicine(MedicineName.Epinephrine);      //should take the finished medicine, not only epinephrine
                break;
        }
    }

    private void HandleTalkToRelative()
    {
        TalkToRelative talkToRelative = new TalkToRelative(this, outsideDestination, medicalRoom.GetPatient());
        talkToRelative.TalkFinished += OnTalkFinished;
        actionsList.Enqueue(talkToRelative);
    }

    private void HandleTakeOtherMedicine(MedicineName medicineName)
    {
        SendDirectMessage("Ok vado!");
        TakeOtherMedicine takeOtherMedicine = new TakeOtherMedicine(this, medicineName, otherRoom, medicalRoom);
        //iscrizione alla fine dell'azione per dare il messaggio
        actionsList.Enqueue(takeOtherMedicine);
    }

    private void OnTalkFinished(object sender, EventArgs e)
    {
        TalkToRelative action = (TalkToRelative)sender;
        action.TalkFinished -= OnTalkFinished;
        PatientRelativeEventArgs args = (PatientRelativeEventArgs)e;
        if (args.infoType == InfoObtained.HasAlreadyHappened)
            SendDirectMessage("Il paziente ha già avuto un problema simile");
        else
            SendDirectMessage("Il paziente non ha mai avuto problemi simili");
    }

    private void OnMedicineFinished(object sender, EventArgs e)
    {
        MedicineEventArgs args = e as MedicineEventArgs;
        HandleTakeOtherMedicine(args.medicineName);
    }
}
