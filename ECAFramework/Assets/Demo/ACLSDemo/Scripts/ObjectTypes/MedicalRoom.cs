using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MedicalRoom : MonoBehaviour
{
    private IVPole pole;
    private MedicationTable medicationTable;
    private DefibrillatorTable defibrillatorTable;
    private AirwayTable airwayTable;

    private void Awake()
    {
        pole = GetComponentInChildren<IVPole>();
        medicationTable = GetComponentInChildren<MedicationTable>();
        defibrillatorTable = GetComponentInChildren<DefibrillatorTable>();
        airwayTable = GetComponentInChildren<AirwayTable>();

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
}
