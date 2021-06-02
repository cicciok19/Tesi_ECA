using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

public class MedicationProvider : ECA
{
    public string[] intentNames = { "IVAccess", "Epinephrine", "Amiodarone" };

    private MedicalRoom medicalRoom;
    private UseMedicine useMedicine;
    private IVAccess ivAccess;
    private MedicationTable medicationTable;
    private DestinationMedicationProvider destination;
    private IVPole pole;

    protected override void Awake()
    {
        medicalRoom = FindObjectOfType<MedicalRoom>();
        destination = FindObjectOfType<DestinationMedicationProvider>();
        medicationTable = medicalRoom.GetMedicationTable();
        pole = medicalRoom.GetPole();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);
    }

    private void HandleUseMedicine(string medicineName)
    {
        Medicine m = medicationTable.GetMedicine(medicineName);
        Assert.IsNotNull(m);
        //send message
        useMedicine = new UseMedicine(this, m);

    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public Vector3 GetDestinationNearTable()
    {
        return destination.transform.position;
    }
}
