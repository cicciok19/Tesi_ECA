using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Capnography : ECAAction
{
    private Transform capnographyPosition;
    private Transform capnographyTube;
    

    public Capnography(ECA eca, Transform capnographyTube, Patient patient) : base(eca)
    {
        capnographyPosition = patient.GetCapnographyPosition();
        this.capnographyTube = capnographyTube;
        actionName = ActionName.Capnography;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        TurnStage turnToTube = new TurnStage(capnographyTube);
        PickStage pickTube = new PickStage(capnographyTube, 1, false, HandSide.RightHand);
        TurnStage turnToPatient = new TurnStage(capnographyPosition);
        LookStableStage lookPatient = new LookStableStage(capnographyPosition);
        WaitStage wait = new WaitStage(1f);
        DropStage dropTube = new DropStage(pickTube, capnographyPosition);

        stages.Add(turnToTube);
        stages.Add(pickTube);
        stages.Add(turnToPatient);
        stages.Add(lookPatient);
        stages.Add(wait);
        stages.Add(dropTube);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }

}
