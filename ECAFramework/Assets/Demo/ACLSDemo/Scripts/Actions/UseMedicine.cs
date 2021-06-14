/* File UseMedicine C# implementation of class UseMedicine */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;



public class UseMedicineEventArgs : EventArgs
{
    public Medicine medicine;
    public UseMedicineEventArgs(Medicine m)
    {
        medicine = m;
    }
    
}


// global declaration end

public class UseMedicine : ECAAction
{
    public event EventHandler InjectionDone;

    internal bool hasMedicine = false;

    private IVPole pole;
    private Medicine medicine;
    private MedicationProvider medicationProvider;
    private Patient patient;
    private Drawer drawer = null;


    public UseMedicine(ECA eca, Medicine m, Patient patient)
    : base(eca)
    {
        medicine = m;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        this.patient = patient;
    }

    public UseMedicine(ECA eca, Drawer d, Patient patient) : base(eca)
    {
        drawer = d;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
    }

    protected void OnMedicinePicked(object sender, EventArgs args)
    {
      hasMedicine = true;
        if (drawer != null)
            drawer.StartClosing();
    }


    protected void OnMedicineReleased(object sender, EventArgs args)
    {
      hasMedicine = false;
    }




    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }


    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        if (drawer == null)
        {
            GoToStage goToMedicine = new GoToStage(medicine.GetDestination());

            PickStage pickMedicine = new PickStage(medicine.GetSyringe(), 1, false, HandSide.RightHand);
            pickMedicine.StageFinished += OnMedicinePicked;

            GoToStage goToPatient = new GoToStage(medicationProvider.GetDestinationNearTable());
            DropStage startInjection = new DropStage(pickMedicine, patient.GetInjectionPosition());
            startInjection.StageFinished += OnMedicineReleased;

            stages.Add(goToMedicine);
            stages.Add(pickMedicine);
            stages.Add(goToPatient);
            stages.Add(startInjection);
        }
        else
        {
            GoToStage goToDrawer = new GoToStage(drawer.GetDestination());

            PickStage grabHandle = new PickStage(drawer.GetHandle().transform, 1, true, HandSide.LeftHand);
            grabHandle.StageFinished += OnGrabHandle;

            //dovrei aspettare, vediamo che succede
            PickStage pickMedicine = new PickStage(drawer.GetMedicine().GetSyringe(), 1, false, HandSide.RightHand);
            pickMedicine.StageFinished += OnMedicinePicked;

            DropStage releaseHandle = new DropStage(grabHandle);

            GoToStage goToPole = new GoToStage(pole.GetDestination());
            DropStage startInjection = new DropStage(pickMedicine, pole.GetInjectionPosition());
            startInjection.StageFinished += OnMedicineReleased;

            GoToStage returnNearTable = new GoToStage(medicationProvider.GetDestinationNearTable());

            stages.Add(goToDrawer);
            stages.Add(grabHandle);
            stages.Add(pickMedicine);
            stages.Add(releaseHandle);
            stages.Add(goToPole);
            stages.Add(startInjection);
            stages.Add(returnNearTable);
        }

        SetStages(stages);

    }


    public override void OnCompletedAction()
    {
        base.OnCompletedAction();
        if (InjectionDone != null)
            InjectionDone(this, new UseMedicineEventArgs(medicine));
    }

    private void OnGrabHandle(object sender, EventArgs e)
    {
        drawer.StartOpening();
    }


}
