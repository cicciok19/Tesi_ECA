using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TakeOtherMedicine : ECACompositeAction
{
    private RandomDoctor randomDoctor;
    private OtherRoom otherRoom;
    private MedicalRoom medicalRoom;
    private MedicineName medicineName;
    private Medicine syringe;
    private MedicineSpot medicineSpot;

    private PickStage pickMedicine;
    private Drawer drawer = null;

    public TakeOtherMedicine(ECA eca, MedicineName medicineName, OtherRoom otherRoom, MedicalRoom medicalRoom) : base(eca)
    {
        randomDoctor = (RandomDoctor)eca;
        this.otherRoom = otherRoom;
        this.medicalRoom = medicalRoom;

        //need to instantiate medicine
        syringe = otherRoom.GetNewMedicine(medicineName);
    }

    private void TakeMedicine()
    {
        GoToStage goOutside = new GoToStage(randomDoctor.outsideDestination);
        pickMedicine = new PickStage(syringe.transform, 1, false, HandSide.RightHand);

        List<ECAActionStage> stages = new List<ECAActionStage>();
        stages.Add(goOutside);
        stages.Add(pickMedicine);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void ReturnWithMedicine()
    {
        medicineSpot = medicalRoom.GetMedicationTable().GetEmptySpot();
        List<ECAActionStage> stages = new List<ECAActionStage>();

        if (medicineSpot == null)
        {
            drawer = medicalRoom.GetLocker().GetMedicineDrawer(medicineName);
            GoToStage goToDrawer = new GoToStage(drawer.GetDestination());

            PickStage grabHandle = new PickStage(drawer.GetHandle().transform, 1, true, HandSide.LeftHand);
            grabHandle.StageFinished += OnGrabHandle;

            DropStage dropMedicine = new DropStage(pickMedicine, drawer.GetMedicineSpot().transform);
            dropMedicine.StageFinished += OnMedicineDropped;

            DropStage releaseHandle = new DropStage(grabHandle);

            GoToStage goToInitialPosition = new GoToStage(randomDoctor.initialPosition);

            stages.Add(goToDrawer);
            stages.Add(grabHandle);
            stages.Add(dropMedicine);
            stages.Add(releaseHandle);
            stages.Add(goToInitialPosition);
        }
        else
        {
            GoToStage goToTable = new GoToStage(medicineSpot.GetDestination());

            DropStage dropMedicine = new DropStage(pickMedicine, medicineSpot.transform);
            dropMedicine.StageFinished += OnMedicineDropped;

            GoToStage goToInitialPosition = new GoToStage(randomDoctor.initialPosition);

            stages.Add(goToTable); 
            stages.Add(dropMedicine);
            stages.Add(goToInitialPosition);
        }

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    protected override void CreateActionList()
    {
        TakeMedicine();
        ReturnWithMedicine();
        base.CreateActionList();
    }

    private void OnGrabHandle(object sender, EventArgs e)
    {
        drawer.StartOpening();
    }

    protected void OnMedicineDropped(object sender, EventArgs args)
    {
        //hasMedicine = true;
        syringe.transform.SetParent(medicineSpot.transform);

        if (drawer != null)
            drawer.StartClosing();
    }

}
