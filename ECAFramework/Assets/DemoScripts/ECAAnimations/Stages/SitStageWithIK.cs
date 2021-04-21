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

    public SitStageWithIK(Transform[] empties, IKECA ikManager)
    {
        sitPoint = empties[0];
        rightFootEffector = empties[1];
        leftFootEffector = empties[2];

        ///IK MANAGEMENT
        this.ikManager = ikManager;
        //prova con handIK con lo stesso effector dei piedi
        //ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);
    }

    public SitStageWithIK(Transform[] empties)
    {
        sitPoint = empties[0];
        rightFootEffector = empties[1];
        leftFootEffector = empties[2];
    }

    public override void StartStage()
    {
        ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);

        animatorMxM = (ECAAnimatorMxM)animator;
        base.StartStage();
        animatorMxM.MxM_BeginEvent("SitDown", sitPoint);
        ikManager.SetWeightsForSitting();
        EndStage();
    }

    public override void EndStage()
    {
        animatorMxM.MxM_WaitForEventComplete();
        animatorMxM.MxM_SetTag("Sitting");
        base.EndStage();
    }

}
