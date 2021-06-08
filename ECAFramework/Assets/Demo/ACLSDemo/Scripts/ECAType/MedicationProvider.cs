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
    private IVPole pole;

    protected override void Awake()
    {
        base.Awake();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        destination = FindObjectOfType<DestinationMedicationProvider>();
    }

    protected override void Start()
    {
        base.Start();
        medicationTable = medicalRoom.GetMedicationTable();
        pole = medicalRoom.GetPole();
        //just for debug
        HandleUseMedicine(MedicineName.Epinephrine);
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
                HandleIVAccess();
                break;
        }
    }

    private void HandleUseMedicine(MedicineName medicineName)
    {
        Medicine m = medicationTable.GetMedicine(medicineName);
        Assert.IsNotNull(m);
        //send message
        useMedicine = new UseMedicine(this, m);
        useMedicine.InjectionDone += OnInjectionDone;
        useMedicine.StartAction();
    }

    private void HandleIVAccess()
    {

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
    }
}
