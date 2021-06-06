using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectBottle : ECAAction
{
    private Distributor distributor;
    public SelectBottle(ECA eca, Distributor distributor) : base(eca)
    {
        this.distributor = distributor;
    }

    public override void SetupAction()
    {
        base.SetupAction();

        List<ECAActionStage> stages = new List<ECAActionStage>();
        /*PickStage pickMoney = new PickStage(distributor, 10, false, HandSide.RightHand);
        DropStage enterMoney = new DropStage(pickMoney, distributor.GetEnterMoney());*/
        PressStage pressButton = new PressStage(distributor.GetRandomButton(), HandSide.RightHand);
        PickStage pickBottle = new PickStage(distributor.GetGrabbableGameObject(), 10, false, HandSide.RightHand);
        DropStage dropBottle = new DropStage(pickBottle);
        GoToStage exitQueue = new GoToStage(distributor.GetExitPoint());

        /*stages.Add(pickMoney);
        stages.Add(enterMoney);*/
        stages.Add(pressButton);
        stages.Add(pickBottle);
        stages.Add(dropBottle);
        stages.Add(exitQueue);

        SetStages(stages);
    }

    public void ChangeDistributor(Distributor d)
    {
        distributor = d;
    }
}
