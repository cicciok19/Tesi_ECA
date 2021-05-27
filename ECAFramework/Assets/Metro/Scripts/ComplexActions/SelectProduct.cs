using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectProduct : ECAAction
{
    private VendingMachine vendingMachine;
    private ECA eca;

    public SelectProduct(ECA eca, VendingMachine machine) : base(eca)
    {
        vendingMachine = machine;
        this.eca = eca;
    }

    public override void SetupAction()
    {
        base.SetupAction();

        List<ECAActionStage> stages = new List<ECAActionStage>();
        PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.RightHand);
        PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand);
        PickStage takeTicket = new PickStage(vendingMachine.GetGrabbableGameObject(), 10, false, HandSide.RightHand);
        DropStage dropTicket = new DropStage(takeTicket);
        stages.Add(useScreen);
        stages.Add(pressButton);
        stages.Add(takeTicket);
        stages.Add(dropTicket);
        stages.Add(new GoToStage(vendingMachine.GetExitPoint()));

        SetStages(stages);
    }

    public void ChangeVendingMachine(VendingMachine v)
    {
        vendingMachine = v;
    }
}
