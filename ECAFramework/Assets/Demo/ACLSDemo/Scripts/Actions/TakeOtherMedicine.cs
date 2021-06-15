using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TakeOtherMedicine : ECACompositeAction
{
    private RandomDoctor randomDoctor;
    private OtherRoom otherRoom;
    private Syringe syringe;

    public TakeOtherMedicine(ECA eca, MedicineName medicineName, OtherRoom otherRoom) : base(eca)
    {
        randomDoctor = (RandomDoctor)eca;
        this.otherRoom = otherRoom;

        //need to instantiate medicine
        syringe = otherRoom.GetNewMedicine(medicineName);
    }

    private void TakeMedicine()
    {
        GoToStage goOutside = new GoToStage(randomDoctor.outsideDestination);
        PickStage pickMedicine = new PickStage(syringe.transform, 1, false, HandSide.RightHand);

        List<ECAActionStage> stages = new List<ECAActionStage>();
        stages.Add(goOutside);
        stages.Add(pickMedicine);

        ECAAction action = new ECAAction(eca, stages);
        actions.Add(action);
    }

    private void ReturnWithMedicine()
    {

    }

    protected override void CreateActionList()
    {
        TakeMedicine();
        ReturnWithMedicine();
        base.CreateActionList();
    }

    public override void StartAction()
    {

        base.StartAction();
    }

}
