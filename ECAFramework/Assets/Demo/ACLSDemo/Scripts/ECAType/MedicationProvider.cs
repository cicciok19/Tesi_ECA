using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;

public class MedicationProvider : ECA
{
    public string[] intentNames = { "IVAccess", "Epinephrine", "Amiodarone" };

    public MedicalRoom medicalRoom;
    private UseMedicine useMedicine;
    private IVAccess ivAccess;
    private MedicationTable medicationTable;
    private DestinationMedicationProvider destination;
    private Patient patient;
    private IVPole pole;

    protected override void Awake()
    {
        base.Awake();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        destination = FindObjectOfType<DestinationMedicationProvider>();
        patient = FindObjectOfType<Patient>();
    }

    protected override void Start()
    {
        base.Start();
        medicationTable = medicalRoom.GetMedicationTable();
        pole = medicalRoom.GetPole();

        //just for debug
        //HandleUseMedicine(MedicineName.Epinephrine);
        //HandleIVAccess(medicationTable.GetVeinTube(), patient);
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
        switch (intent.IntentName)
        {
            case "Amiodarone":
                HandleUseMedicine(MedicineName.Amiodarone);
                break;
            case "Epinephrine":
                HandleUseMedicine(MedicineName.Epinephrine);
                break;
            case "IVAcces":
                HandleIVAccess(medicationTable.GetVeinTube(), patient);
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        IntentName = new List<string> { "Amiodarone", "Epinephrine", "IVAcces" };
        IntentManager.Instance.AddIntentHandler(IntentName[0], this);
        IntentManager.Instance.AddIntentHandler(IntentName[1], this);
        IntentManager.Instance.AddIntentHandler(IntentName[2], this);
    }

    private void HandleUseMedicine(MedicineName medicineName)
    {
        if(patient.state == PatientState.Asystole)
        {
            if (medicineName == MedicineName.Amiodarone)
                Debug.Log("You have to inject Epinephrine!");
        }

        if(patient.state == PatientState.VF)
        {
            //check dello start, va aggiunto il check dell'amiodarone
            Debug.Log("You have to shock!");
        }

        Medicine m = medicationTable.GetMedicine(medicineName);
        Assert.IsNotNull(m);
        //send message
        useMedicine = new UseMedicine(this, m);
        useMedicine.InjectionDone += OnInjectionDone;
        useMedicine.StartAction();
    }

    private void HandleIVAccess(IVTube ivTube, Patient patient)
    {
        ivAccess = new IVAccess(this, ivTube, patient);
        ivAccess.CompletedAction += OnIvAccessCompleted;
        ivAccess.StartAction();
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public Vector3 GetDestinationNearTable()
    {
        return destination.transform.position;
    }

    private void OnInjectionDone(object sender, EventArgs e)
    {
        useMedicine.InjectionDone -= OnInjectionDone;
        UseMedicineEventArgs args = (UseMedicineEventArgs)e;
        Medicine m = args.medicine;
        //send message of completed action

        if (m.name == "Epinephrine")
            patient.OnEpinephrineDone();
        else
            patient.OnAmiodaroneDone();
    }

    private void OnIvAccessCompleted(object sender, EventArgs e)
    {
        patient.OnIvAccessDone();
    }

}
