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
        eca.SendDirectMessage("Lo stato del paziente è di: " + patientState);
        EndStage();
    }
}
