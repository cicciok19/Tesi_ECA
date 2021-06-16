/* File UseMedicine C# implementation of class UseMedicine */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class UseMedicineEventArgs : EventArgs
{
    public MedicineName medicineName;
    public UseMedicineEventArgs(MedicineName name)
    {
        medicineName = name;
    }
    
}


// global declaration end

public class UseMedicine : ECAAction
{
    public event EventHandler InjectionDone;

    internal bool hasMedicine = false;

    private IVPole pole;
    private MedicineSpot medicineSpot;
    private MedicationProvider medicationProvider;
    private Patient patient;
    private Drawer drawer = null;
    public Transform medicine { get; protected set; }

    public PickStage pickMedicine { get; protected set; }

    /// <summary>
    /// if there is a medicine on the table
    /// </summary>
    /// <param name="eca"></param>
    /// <param name="m"></param>
    /// <param name="patient"></param>
    public UseMedicine(ECA eca, MedicineSpot spot, Patient patient)
    : base(eca)
    {
        medicineSpot = spot;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        this.patient = patient;

        if (spot.GetMedicineName() == MedicineName.Amiodarone)
            actionName = ActionName.UseAmiodarone;
        else if (spot.GetMedicineName() == MedicineName.Epinephrine)
            actionName = ActionName.UseEpinephrine;
    }

    /// <summary>
    /// if there isn't a medicine on the table take it from the locker
    /// </summary>
    /// <param name="eca"></param>
    /// <param name="d"></param>
    /// <param name="patient"></param>
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
            medicine = medicineSpot.GetSyringe();

            GoToStage goToMedicine = new GoToStage(medicineSpot.GetDestination());

            pickMedicine = new PickStage(medicine, 1, false, HandSide.RightHand);
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
            medicine = drawer.GetMedicineSpot().GetSyringe();

            GoToStage goToDrawer = new GoToStage(drawer.GetDestination());

            PickStage grabHandle = new PickStage(drawer.GetHandle().transform, 1, true, HandSide.LeftHand);
            grabHandle.StageFinished += OnGrabHandle;

            //dovrei aspettare, vediamo che succede
            pickMedicine = new PickStage(medicine, 1, false, HandSide.RightHand);
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
            InjectionDone(this, new UseMedicineEventArgs(medicineSpot.GetMedicineName()));
    }

    private void OnGrabHandle(object sender, EventArgs e)
    {
        drawer.StartOpening();
    }

}
