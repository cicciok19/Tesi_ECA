using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IVAccess : ECACompositeAction
{
    private VeinTube veinTube;
    private Transform injectionPosition;

    public IVAccess(ECA eca, VeinTube veinTube, Patient patient) : base(eca)
    {
        this.veinTube = veinTube;
        injectionPosition = patient.GetInjectionPosition();
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToTable = new GoToStage(veinTube.GetDestination());
        PickStage pickTube = new PickStage(veinTube.transform, 1f, false, HandSide.RightHand);
    }
}
