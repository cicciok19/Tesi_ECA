using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckScreenStage : ECAActionStage
{
    PatientState patientState;
    ECA eca;

    public CheckScreenStage(ECA eca, PatientState patientState) : base()
    {
        this.patientState = patientState;
        this.eca = eca;
    }

    public override void StartStage()
    {
        base.StartStage();
        if (patientState == PatientState.Ok)
            eca.SendDirectMessage("Il paziente sta bene, lo abbiamo salvato!");
        else
            eca.SendDirectMessage("Lo stato del paziente è di: " + patientState);
        EndStage();
    }
}
