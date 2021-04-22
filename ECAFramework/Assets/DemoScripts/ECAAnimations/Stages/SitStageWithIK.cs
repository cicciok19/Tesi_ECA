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

    //if you want to use IK use this constructor
    public SitStageWithIK(Transform[] empties, IKECA ikManager)
    {
        sitPoint = empties[0];
        rightFootEffector = empties[1];
        leftFootEffector = empties[2];

        ///IK MANAGEMENT
        this.ikManager = ikManager;
    }

    public SitStageWithIK(Transform[] empties)
    {
        sitPoint = empties[0];
        rightFootEffector = empties[1];
        leftFootEffector = empties[2];
    }

    public override void StartStage()
    {
        if (ikManager != null)
        {
            //prova con effector delle mani uguale a quello dei piedi
            ikManager.SetTargetFullBodyIK(ikManager.fullBodyBipedIK, sitPoint, leftFootEffector, rightFootEffector, leftFootEffector, rightFootEffector);
        }

        animatorMxM = (ECAAnimatorMxM)animator;
        base.StartStage();
        animatorMxM.MxM_BeginEvent("SitDown", sitPoint);
        ikManager.SetWeightsForSitting();

        animatorMxM.EventComplete += OnEventComplete;
        animatorMxM.MxM_WaitForEventComplete();

    }

    public override void EndStage()
    {
        animatorMxM.MxM_SetTag("Sitting");
        base.EndStage();
    }
}
