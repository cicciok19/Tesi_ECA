using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UseMedicine : ECAAction
{
    private IVPole pole;
    private Medicine medicine;
    private MedicationProvider medicationProvider;

    public UseMedicine(ECA eca, Medicine m) : base(eca)
    {
        medicine = m;
        medicationProvider = (MedicationProvider)eca; 
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
        GoToStage goToPole = new GoToStage(pole.GetDestination(), pole.transform);
        DropStage startInjection = new DropStage(pickMedicine, pole.GetInjectionPosition());
        GoToStage returnNearTable = new GoToStage(medicationProvider.GetDestinationNearTable());
        stages.Add(goToMedicine);
        stages.Add(pickMedicine);
        stages.Add(goToPole);
        stages.Add(startInjection);
        stages.Add(returnNearTable);

        SetStages(stages);
    }


}
