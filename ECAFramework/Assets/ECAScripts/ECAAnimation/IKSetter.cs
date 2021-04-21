﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;


//principal class for setting the Final IK
public class IKSetter : MonoBehaviour
{
    protected Animator animator;
    private Transform root;

    protected virtual void Start()
    {
        animator = this.GetComponent<Animator>();
        root = GetBone(HumanBodyBones.Hips);
    }

    /// <summary>
    /// Get the transform of the selected bone.
    /// </summary>
    /// <param name="bone">Select the specified bone in enum HumanBodyBones.</param>
    /// <returns></returns>
    protected virtual Transform GetBone(HumanBodyBones bone)
    {
        if (animator != null)
        {
            Avatar avatar = animator.avatar;
            if (avatar.isValid)
            {
                return animator.GetBoneTransform(bone);
            }
            else
            {
                Debug.LogError("The avatar is not valid because it is not humanoid.");
                return null;
            }
        }
        else
        {
            Debug.LogError("The animator is null, set the animator.");
            return null;
        }


    }

    /// <summary>
    /// creating the HeadIK of the gameObject, it may be specified the bones of the head and the neck
    /// </summary>
    /// <param name="headBone"></param>
    /// <returns></returns>
    protected AimIK SetIKHead(Transform headBone, Transform neckBone)
    {       
        AimIK HeadIK = this.gameObject.AddComponent<AimIK>();
        HeadIK.GetIKSolver().Initiate(root);
        HeadIK.solver.transform = headBone;
        HeadIK.solver.AddBone(neckBone);
        HeadIK.solver.IKPositionWeight = 0;
        return HeadIK;
    }

    /// <summary>
    /// creating the IK for the right hand
    /// </summary>
    /// <param name="rightHandBone"></param>
    /// <param name="rightForeArm"></param>
    /// <param name="rightArm"></param>
    /// <param name="rightShoulder"></param>
    /// <returns></returns>
    protected AimIK SetIKRightHand(Transform rightHandBone, Transform rightForeArm, Transform rightArm, Transform rightShoulder)
    {
        AimIK RightIK = this.gameObject.AddComponent<AimIK>();
        RightIK.GetIKSolver().Initiate(root);
        RightIK.solver.axis = new Vector3(0, 1, 0);
        RightIK.solver.transform = rightHandBone;
        RightIK.solver.AddBone(rightShoulder);
        RightIK.solver.AddBone(rightArm);
        RightIK.solver.AddBone(rightForeArm);
        RightIK.solver.IKPositionWeight = 0;

        return RightIK;
    }

    /// <summary>
    /// Creating the IK for the left hand.
    /// </summary>
    /// <param name="leftHandBone"></param>
    /// <param name="leftForeArm"></param>
    /// <param name="leftArm"></param>
    /// <param name="leftShoulder"></param>
    /// <returns></returns>
    protected AimIK SetIKLeftHand(Transform leftHandBone, Transform leftForeArm, Transform leftArm, Transform leftShoulder)
    {
        AimIK LeftIK = this.gameObject.AddComponent<AimIK>();
        LeftIK.GetIKSolver().Initiate(root);
        LeftIK.solver.axis = new Vector3(0, 1, 0);
        LeftIK.solver.transform = leftHandBone;
        LeftIK.solver.AddBone(leftShoulder);
        LeftIK.solver.AddBone(leftArm);
        LeftIK.solver.AddBone(leftForeArm);
        LeftIK.solver.IKPositionWeight = 0;

        return LeftIK;
    }

    /// <summary>
    /// Creating the IK for the body.
    /// </summary>
    /// <param name="rootNode"></param>
    /// <returns></returns>
    protected FullBodyBipedIK SetFullBodyIK()
    {
        //this.gameObject.AddComponent<FullBodyBipedIK>().solver.effectors = new IKEffector[9];
        FullBodyBipedIK BodyIK = this.gameObject.AddComponent<FullBodyBipedIK>();
        //BodyIK.GetIKSolver().Initiate(root);
        BodyIK.solver.rootNode = root;
        return BodyIK;
    }

    /// <summary>
    /// Set the target of the specified IK.
    /// </summary>
    /// <param name="aimIK">The specified IK to set</param>
    /// <param name="target">The target of the IK.</param>
    /// <param name="weight">The weight of the IK, must be from 0 to 1. Default = 1f.</param>
    /// <param name="speed">The speed of the animation for setting the target weight. Default = .01f.</param>
    public virtual void SetTargetAimIK(AimIK aimIK, Transform target, float weight = 1f, float speed = .01f)
    {
        aimIK.solver.target = target;
        if (aimIK.solver.IKPosition != null)
        {
            StartCoroutine(SetWeightAimIK(aimIK, weight, speed));
        }
        else
        {
            Debug.Log("The target is null, first set the target.");
        }
    }

    /// <summary>
    /// Setting the effectors of the FullBodyBipedIK. The weights are setted to 0, for setting them use SetWeightsFullBodyIK.
    /// </summary>
    /// <param name="fullBody"></param>
    /// <param name="bodyEffector"></param>
    /// <param name="leftHandEffector">Default = null.</param>
    /// <param name="rightHandEffector">Default = null.</param>
    /// <param name="leftFootEffector">Default = null.</param>
    /// <param name="rightFootEffector">Default = null.</param>
    public virtual void SetTargetFullBodyIK(FullBodyBipedIK fullBody, Transform bodyEffector, Transform leftHandEffector = null, Transform rightHandEffector = null,
        Transform leftFootEffector = null, Transform rightFootEffector = null)
    {
        Debug.Log(fullBody.solver.effectors.Length);
        fullBody.solver.bodyEffector.position = bodyEffector.position;
        if (leftHandEffector != null)
        {
            fullBody.solver.leftHandEffector.position = leftHandEffector.position;
        }
        if (rightHandEffector != null)
        {
            fullBody.solver.rightHandEffector.position = rightHandEffector.position;
        }
        if (leftFootEffector != null)
        {
            fullBody.solver.leftFootEffector.position = leftFootEffector.position;
        }
        if (rightFootEffector != null)
        {
            fullBody.solver.rightFootEffector.position = rightFootEffector.position;
        }
    }

    /// <summary>
    /// Setting the weight of a specified effector of the FullBodyBipedIK.
    /// </summary>
    /// <param name="effector">Access as fullBody.solver.effector</param>
    /// <param name="weight"></param>
    /// <param name="speed">Speed of the coroutine. Default = .01f.</param>
    public virtual void SetWeightsFullBodyIK(IKEffector effector, float weight, float speed = .01f)
    {
        if (effector != null)
            StartCoroutine(SetWeightFullIK(effector, weight, speed));
        else
            Debug.Log("The effector is null, first set the target.");
    }

    /// <summary>
    /// Set the weight of the target of the specified IK. 
    /// Can be a value from 0 to 1.
    /// </summary>
    /// <param name="aimIK">The specified IK to set.</param>
    /// <param name="weight">The weight of the IK, must be from 0 to 1.</param>
    /// <param name="speed">The speed of the coroutine for setting the target weight. Default = .01f</param>
    public virtual void SetWeightTargetAimIK(AimIK aimIK, float weight, float speed = .01f)
    {
        if (aimIK.solver.target != null)
            StartCoroutine(SetWeightAimIK(aimIK, weight, speed));
        else
            Debug.Log("The target is null, first set the target.");
    }

    IEnumerator SetWeightAimIK(AimIK aimIK, float weight, float speed)
    {
        float var = aimIK.solver.IKPositionWeight;

        if (var < weight)
        {
            while (var < weight)
            {
                aimIK.solver.SetIKPositionWeight(var);
                yield return new WaitForSeconds(speed);
                var += .01f;
            }
        }
        else
        {
            while (var > weight)
            {
                aimIK.solver.SetIKPositionWeight(var);
                yield return new WaitForSeconds(speed);
                var -= .01f;
            }
        }
    }

    IEnumerator SetWeightFullIK(IKEffector effector, float weight, float speed)
    {
        float var = effector.positionWeight;

        if (var < weight)
        {
            while (var < weight)
            {
                var += .01f;
                effector.positionWeight = var;
                yield return new WaitForSeconds(speed);
            }
        }
        else
        {
            while (var > weight)
            {
                var -= .01f;
                effector.positionWeight = var;
                yield return new WaitForSeconds(speed);
            }
        }
    }
}
