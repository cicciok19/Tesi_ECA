using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class SitStageWithIK : ECAActionStage
{
    private Transform SitPoint;
    private Transform L_FootEffector;
    private Transform R_FootEffector;

    private IKECA IkManager;

    public EventHandler StageFinished;

    public SitStageWithIK(ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint) : base(ecaAction, ecaAnimator)
    {
        SitPoint = sitPoint;
        R_FootEffector = SitPoint.GetChild(0);
        L_FootEffector = SitPoint.GetChild(1);

        IkManager = EcaAnimator.gameObject.GetComponent<IKECA>();
        //prova senza handIK
        //IkManager.SetTargetFullBodyIK(IkManager.FullBodyBipedIK, SitPoint, null, null, L_FootEffector, R_FootEffector);
        //prova con handIK con lo stesso effector dei piedi
        IkManager.SetTargetFullBodyIK(IkManager.FullBodyBipedIK, SitPoint, L_FootEffector, R_FootEffector, L_FootEffector, R_FootEffector);

    }

    public override void StartStage()
    {
        base.StartStage();
        EcaAnimator.MxM_BeginEvent("SitDown", SitPoint);
        IkManager.SetWeightsForSitting();
        EndStage();
    }

    public override void EndStage()
    {
        EcaAnimator.MxM_SetTag("Sitting");
        base.EndStage();
    }

}
