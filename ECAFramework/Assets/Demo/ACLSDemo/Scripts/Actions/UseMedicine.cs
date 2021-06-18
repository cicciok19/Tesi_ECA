/* File UseMedicine C# implementation of class UseMedicine */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class MedicineEventArgs : EventArgs
{
    public MedicineName medicineName;
    public MedicineEventArgs(MedicineName name)
    {
        medicineName = name;
    }
    
}


// global declaration end

public class UseMedicine : ECACompositeAction
{
    public event EventHandler InjectionDone;

    internal bool hasMedicine = false;

    private IVPole pole;
    private MedicineSpot medicineSpot;
    private MedicationProvider medicationProvider;
    private Patient patient;
    private Drawer drawer = null;
    private RubbishTable rubbishTable;
    public Transform medicine { get; protected set; }

    public PickStage pickMedicine { get; protected set; }

    /// <summary>
    /// if there is a medicine on the table
    /// </summary>
    public UseMedicine(ECA eca, MedicineSpot spot, Patient patient, RubbishTable rubbishTable)
    : base(eca)
    {
        medicineSpot = spot;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        this.patient = patient;
        this.rubbishTable = rubbishTable;

        if (spot.GetMedicineName() == MedicineName.Amiodarone)
            actionName = ActionName.UseAmiodarone;
        else if (spot.GetMedicineName() == MedicineName.Epinephrine)
            actionName = ActionName.UseEpinephrine;
    }

    /// <summary>
    /// if there isn't a medicine on the table take it from the locker
    /// </summary>
    public UseMedicine(ECA eca, Drawer d, Patient patient, RubbishTable rubbishTable) : base(eca)
    {
        drawer = d;
        medicineSpot = drawer.GetMedicineSpot();
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        this.patient = patient;
        this.rubbishTable = rubbishTable;
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


   /* public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        
        if (drawer == null)
        {
            medicine = medicineSpot.GetSyringe();

            GoToStage goToMedicine = new GoToStage(medicineSpot.GetDestination());

            pickMedicine = new PickStage(medicine, 1, false, HandSide.RightHand);
            pickMedicine.StageFinished += OnMedicinePicked;

            GoToStage goToPatient = new GoToStage(medicationProvider.GetDestinationNearTable());
            PlaceObjectStage startInjection = new PlaceObjectStage(pickMedicine, patient.GetInjectionPosition(), true); 
            //DropStage startInjection = new DropStage(pickMedicine, patient.GetInjectionPosition());
            startInjection.StageFinished += OnMedicineReleased;
            WaitStage waitFor = new WaitStage(2f);
            ResumeInteractionStage removeSyringe = new ResumeInteractionStage(RootMotion.FinalIK.FullBodyBipedEffector.RightHand);

            stages.Add(goToMedicine);
            stages.Add(pickMedicine);
            stages.Add(goToPatient);
            stages.Add(startInjection);
            stages.Add(waitFor);
            stages.Add(removeSyringe);
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

            GoToStage goToPatient = new GoToStage(medicationProvider.GetDestinationNearTable());
            DropStage startInjection = new DropStage(pickMedicine, patient.GetIVPosition());
            startInjection.StageFinished += OnMedicineReleased;

            GoToStage returnNearTable = new GoToStage(medicationProvider.GetDestinationNearTable());

            stages.Add(goToDrawer);
            stages.Add(grabHandle);
            stages.Add(pickMedicine);
            stages.Add(releaseHandle);
            stages.Add(goToPatient);
            stages.Add(startInjection);
            stages.Add(returnNearTable);
        }

        SetStages(stages);

    }*/


    public override void OnCompletedAction()
    {
        base.OnCompletedAction();
        if (InjectionDone != null)
            InjectionDone(this, new MedicineEventArgs(medicineSpot.GetMedicineName()));
    }

    private void OnGrabHandle(object sender, EventArgs e)
    {
        drawer.StartOpening();
    }

    private void PickMedicine()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        if (drawer == null)
        {
            medicine = medicineSpot.GetSyringe();

            GoToStage goToMedicine = new GoToStage(medicineSpot.GetDestination());

            pickMedicine = new PickStage(medicine, 1, false, HandSide.RightHand);
            pickMedicine.StageFinished += OnMedicinePicked;

            GoToStage goToPatient = new GoToStage(medicationProvider.GetDestinationNearTable());

            stages.Add(goToMedicine);
            stages.Add(pickMedicine);
            stages.Add(goToPatient);
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

            GoToStage goToPatient = new GoToStage(medicationProvider.GetDestinationNearTable());

            stages.Add(goToDrawer);
            stages.Add(grabHandle);
            stages.Add(pickMedicine);
            stages.Add(releaseHandle);
            stages.Add(goToPatient);
        }

        ECAAction action = new ECAAction(medicationProvider, stages);
        actions.Add(action);
    }
    
    private void Inject()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        PlaceObjectStage startInjection = new PlaceObjectStage(pickMedicine, patient.GetInjectionPosition(), true);
        startInjection.StageFinished += OnMedicineReleased;
        WaitStage waitFor = new WaitStage(2f);

        stages.Add(startInjection);
        stages.Add(waitFor);

        ECAAction action = new ECAAction(medicationProvider, stages);
        actions.Add(action);
    }

    private void ThrowMedicine()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();

        ResumeInteractionStage removeSyringe = new ResumeInteractionStage(RootMotion.FinalIK.FullBodyBipedEffector.RightHand);
        GoToStage goToRubbishTable = new GoToStage(rubbishTable.GetDestination());
        DropStage dropMedicine = new DropStage(pickMedicine, rubbishTable.GetDropPosition());
        GoToStage returnToTable = new GoToStage(medicationProvider.GetDestinationNearTable(), patient.transform);

        stages.Add(removeSyringe);
        stages.Add(goToRubbishTable);
        stages.Add(dropMedicine);
        stages.Add(returnToTable);


        ECAAction action = new ECAAction(medicationProvider, stages);
        actions.Add(action);
    }

    protected override void CreateActionList()
    {
        PickMedicine();
        Inject();
        ThrowMedicine();
    }

}
