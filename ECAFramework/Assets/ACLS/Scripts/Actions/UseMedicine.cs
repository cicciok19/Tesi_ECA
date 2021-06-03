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

public class UseMedicine : ECAAction
{
    private IVPole pole;
    private Medicine medicine;
    private MedicationProvider medicationProvider;

    public event EventHandler InjectionDone;

    public UseMedicine(ECA eca, Medicine m) : base(eca)
    {
        medicine = m;
        medicationProvider = (MedicationProvider)eca;
        pole = medicationProvider.medicalRoom.GetPole();
        
    }

    public override void StartAction()
    {
        DoTask();
        base.StartAction();
    }

    private void DoTask()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToMedicine = new GoToStage(medicine.GetDestination());
        PickStage pickMedicine = new PickStage(medicine.GetSyringe(), 1, false, HandSide.RightHand);
        GoToStage goToPole = new GoToStage(pole.GetDestination());
        DropStage startInjection = new DropStage(pickMedicine, pole.GetInjectionPosition());
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
