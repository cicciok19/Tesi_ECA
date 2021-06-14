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


    public UseMedicine(ECA eca, Medicine m, Patient patient)
    : base(eca)
    {
        medicine = m;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        this.patient = patient;
    }




    protected void OnMedicinePicked(object sender, EventArgs args)
    {
      hasMedicine = true;
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
        GoToStage goToMedicine = new GoToStage(medicine.GetDestination());
    
        PickStage pickMedicine = new PickStage(medicine.GetSyringe(), 1, false, HandSide.RightHand);
        pickMedicine.StageFinished += OnMedicinePicked;

        GoToStage goToTable = new GoToStage(medicationProvider.GetDestinationNearTable());
        DropStage startInjection = new DropStage(pickMedicine, patient.GetInjectionPosition());
        startInjection.StageFinished += OnMedicineReleased;
    

        stages.Add(goToMedicine);
        stages.Add(pickMedicine);
        stages.Add(goToTable);
        stages.Add(startInjection);
    
        SetStages(stages);
    }


    public override void OnCompletedAction()
    {
        base.OnCompletedAction();
        if (InjectionDone != null)
            InjectionDone(this, new UseMedicineEventArgs(medicine));
    }


}
