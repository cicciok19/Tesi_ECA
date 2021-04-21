using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class IKECA : IKSetter
{
    public AimIK headIK;
    public AimIK rightHandIK;
    public AimIK leftHandIK;
    public FullBodyBipedIK fullBodyBipedIK;

    private Transform headBone;
    private Transform neckBone;
    private Transform rightHandBone;
    private Transform rightForeArm;
    private Transform rightArm;
    private Transform rightShoulder;
    private Transform leftHandBone;
    private Transform leftForeArm;
    private Transform leftArm;
    private Transform leftShoulder;
    private Transform root;

    // Start is called before the first frame update
    protected override void Start()
    {
        base.Start();

        headBone = GetBone(HumanBodyBones.Head);
        neckBone = GetBone(HumanBodyBones.Neck);
        rightHandBone = GetBone(HumanBodyBones.RightHand);
        rightForeArm = GetBone(HumanBodyBones.RightLowerArm);
        rightArm = GetBone(HumanBodyBones.RightUpperArm);
        rightShoulder = GetBone(HumanBodyBones.RightShoulder);
        leftHandBone = GetBone(HumanBodyBones.LeftHand);
        leftForeArm = GetBone(HumanBodyBones.LeftLowerArm);
        leftArm = GetBone(HumanBodyBones.LeftUpperArm);
        leftShoulder = GetBone(HumanBodyBones.LeftShoulder);
        root = GetBone(HumanBodyBones.Hips);

        //create the IKs
        headIK = SetIKHead(headBone, neckBone);
        rightHandIK = SetIKRightHand(rightHandBone, rightForeArm, rightArm, rightShoulder);
        leftHandIK = SetIKLeftHand(leftHandBone, leftForeArm, leftArm, leftShoulder);
        fullBodyBipedIK = SetFullBodyIK();
    }

 
    public void SetWeightsForSitting()
    {
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.bodyEffector, 0.6f, 0.02f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.rightFootEffector, 0.7f, 0.01f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.leftFootEffector, 0.7f, 0.01f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.leftHandEffector, 0.2f, 0.05f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.rightHandEffector, 0.2f, 0.05f);
    }

    public void SetWeightsToStandUp()
    {
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.bodyEffector, 0, 0.01f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.rightFootEffector, 0, 0.01f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.leftFootEffector, 0, 0.01f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.leftHandEffector, 0, 0.05f);
        SetWeightsFullBodyIK(fullBodyBipedIK.solver.rightHandEffector, 0, 0.05f);
    }
}
