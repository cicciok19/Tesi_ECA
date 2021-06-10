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


    public UseMedicine(ECA eca, Medicine m)
    : base(eca)
    {
            medicine = m;
            medicationProvider = (MedicationProvider)eca;
            pole = medicationProvider.medicalRoom.GetPole();
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
    
        GoToStage goToPole = new GoToStage(pole.GetDestination());
        DropStage startInjection = new DropStage(pickMedicine, pole.GetInjectionPosition());
        startInjection.StageFinished += OnMedicineReleased;
    
        GoToStage returnNearTable = new GoToStage(medicationProvider.GetDestinationNearTable());
        stages.Add(goToMedicine);
        stages.Add(pickMedicine);
        stages.Add(goToPole);
        stages.Add(startInjection);
        stages.Add(returnNearTable);
    
        SetStages(stages);
    }


    public override void OnCompletedAction()
    {
        base.OnCompletedAction();
        if (InjectionDone != null)
            InjectionDone(this, new UseMedicineEventArgs(medicine));
    }


}
