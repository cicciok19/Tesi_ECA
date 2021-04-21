using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class SitStageWithIK : ECAActionStage
{
    private Transform sitPoint;
    private Transform leftFootEffector;
    private Transform rightFootEffector;

    private IKECA ikManager;
    private ECAAnimatorMxM animatorMxM;

    public EventHandler StageFinished;

    public SitStageWithIK(Transform[] empties)
    {
        sitPoint = empties[0];
        rightFootEffector = empties[1];
        leftFootEffector = empties[2];

        ///IK MANAGEMENT
        ///
        ///IkManager = EcaAnimator.gameObject.GetComponent<IKECA>();
        /////prova senza handIK
        /////IkManager.SetTargetFullBodyIK(IkManager.FullBodyBipedIK, SitPoint, null, null, L_FootEffector, R_FootEffector);
        
        //////prova con handIK con lo stesso effector dei piedi
        ///IkManager.SetTargetFullBodyIK(IkManager.FullBodyBipedIK, SitPoint, L_FootEffector, R_FootEffector, L_FootEffector, R_FootEffector);

    }

    public override void StartStage()
    {
        animatorMxM = (ECAAnimatorMxM)animator;
        base.StartStage();
        animatorMxM.MxM_BeginEvent("SitDown", sitPoint);
        //IkManager.SetWeightsForSitting();
        EndStage();
    }

    public override void EndStage()
    {
        animatorMxM.MxM_WaitForEventComplete();
        animatorMxM.MxM_SetTag("Sitting");
        base.EndStage();
    }

}
