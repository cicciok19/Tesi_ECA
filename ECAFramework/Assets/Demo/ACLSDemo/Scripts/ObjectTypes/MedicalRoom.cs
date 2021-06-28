using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class MedicalRoom : MonoBehaviour
{
    private IVPole pole;
    private MedicationTable medicationTable;
    private DefibrillatorTable defibrillatorTable;
    private AirwayTable airwayTable;
    private Locker locker;
    private RubbishTable rubbishTable;
    private Patient patient;

    public event EventHandler MedicineFinished;

    private void Awake()
    {
        patient = FindObjectOfType<Patient>();
        pole = GetComponentInChildren<IVPole>();
        medicationTable = GetComponentInChildren<MedicationTable>();
        defibrillatorTable = GetComponentInChildren<DefibrillatorTable>();
        airwayTable = GetComponentInChildren<AirwayTable>();
        locker = GetComponentInChildren<Locker>();
        rubbishTable = GetComponentInChildren<RubbishTable>();
    }

    public MedicationTable GetMedicationTable()
    {
        return medicationTable;
    }

    public DefibrillatorTable GetDefibrillatorTable()
    {
        return defibrillatorTable;
    }

    public IVPole GetPole()
    {
        return pole;
    }

    public AirwayTable GetAirwayTable()
    {
        return airwayTable;
    }

    public Locker GetLocker()
    {
        return locker;
    }

    public RubbishTable GetRubbishTable()
    {
        return rubbishTable;
    }

    public Patient GetPatient()
    {
        return patient;
    }

    public void CheckAllSpot()
    {
        bool availEpinephrine = false;
        bool availAmiodarone = false;

        List<MedicineSpot> medicineSpots = medicationTable.GetMedicineSpots();
        MedicineSpot[] lockerSpots = locker.medicineSpots;

        foreach (var s in lockerSpots)
            medicineSpots.Add(s);
        

        foreach (MedicineSpot m in medicineSpots)
        {
            if (!m.empty)
            {
                if (m.GetMedicineName() == MedicineName.Epinephrine)
                    availEpinephrine = true;
                else if (m.GetMedicineName() == MedicineName.Amiodarone)
                    availAmiodarone = true;
            }
        }

        if (!availEpinephrine)
        {
            if (MedicineFinished != null)
                MedicineFinished(this, new MedicineEventArgs(MedicineName.Epinephrine));
        }
        else if (!availAmiodarone)
        {
            if (MedicineFinished != null)
                MedicineFinished(this, new MedicineEventArgs(MedicineName.Amiodarone));
        }
    }
}
