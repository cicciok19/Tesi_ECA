using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Capnography : ECAAction
{
    private Transform capnographyPosition;
    private Transform capnographyTube;
    private Transform destinationTable;
    private Patient patient;
    

    public Capnography(ECA eca, AirwayTable airwayTable, Patient patient) : base(eca)
    {
        capnographyPosition = patient.GetCapnographyPosition();
        capnographyTube = airwayTable.GetCapnographyTube();
        destinationTable = airwayTable.GetDestination();
        this.patient = patient;
        actionName = ActionName.Capnography;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage goToTube = new GoToStage(destinationTable);
        PickStage pickTube = new PickStage(capnographyTube, 1, false, HandSide.RightHand);
        GoToStage goToPatient = new GoToStage(patient.GetDestinationAir());
        LookStableStage lookPatient = new LookStableStage(capnographyPosition);
        WaitStage wait = new WaitStage(1f);
        DropStage dropTube = new DropStage(pickTube, capnographyPosition);
        LookStableStage noLook = new LookStableStage(capnographyTube, 0);

        stages.Add(goToTube);
        stages.Add(pickTube);
        stages.Add(goToPatient);
        stages.Add(lookPatient);
        stages.Add(wait);
        stages.Add(dropTube);
        stages.Add(noLook);

        SetStages(stages);
    }

    public override void StartAction()
    {
        SetupAction();
        base.StartAction();
    }

}
