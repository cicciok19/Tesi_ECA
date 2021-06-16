using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DropMedicine : ECAAction
{
    private PickStage pickMedicine;
    private MedicineSpot medicineSpot;
    private Transform medicine;

    public DropMedicine(ECA eca, UseMedicine useMedicine, MedicineSpot medicineSpot, bool canAbort = true) : base(eca, canAbort)
    {
        pickMedicine = useMedicine.pickMedicine;
        medicine = useMedicine.medicine;
        this.medicineSpot = medicineSpot;
    }

    public override void SetupAction()
    {
        base.SetupAction();
        List<ECAActionStage> stages = new List<ECAActionStage>();

        GoToStage goToTable = new GoToStage(medicineSpot.GetDestination());

        DropStage dropMedicine = new DropStage(pickMedicine, medicineSpot.transform);
        dropMedicine.StageFinished += OnMedicineDropped;

        stages.Add(goToTable);
        stages.Add(dropMedicine);

        SetStages(stages);
    }

    protected void OnMedicineDropped(object sender, EventArgs args)
    {
        //hasMedicine = true;
        medicine.SetParent(medicineSpot.transform);
    }
}
