/* File IKSetter C# implementation of class IKSetter */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;
using RootMotion;
using RootMotion.Demos;
using System;


//principal class for setting the Final IK


// global declaration end

public class IKSetter : MonoBehaviour
{
    public event EventHandler AimCompleted;

    private Transform root;
    private Transform headBone;
    [SerializeField]
    private Transform NeckBone;
    private Transform leftForeArm;
    private Transform leftShoulder;
    private Transform rightHandBone;
    private Transform rightShoulder;
    private Transform leftHandBone;
    private Transform rightForeArm;
    private Transform leftArm;
    private Transform neckBone;
    private Transform rightArm;

    protected Animator animator;
    protected Dictionary<AimIK, bool> aimStopDictionary =   new Dictionary<AimIK, bool>();
    protected PickUp pickUp;

    public FullBodyBipedIK fullBodyBipedIK;
    public AimIK leftHandIK;
    public AimIK rightHandIK;
    public AimIK headIK;


    protected AimIK SetIKHead(Transform headBone, Transform neckBone)
    {
        AimIK HeadIK = this.gameObject.AddComponent<AimIK>();
        HeadIK.GetIKSolver().Initiate(root);
        HeadIK.solver.transform = headBone;
        HeadIK.solver.AddBone(neckBone);
        HeadIK.solver.IKPositionWeight = 0;
    
        aimStopDictionary.Add(HeadIK, false);
    
        return HeadIK;
    }


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
    
        aimStopDictionary.Add(RightIK, false);
    
        return RightIK;
    }


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
    
        aimStopDictionary.Add(LeftIK, false);
    
        return LeftIK;
    }


    protected IEnumerator SetWeightFullIK(IKEffector effector, float weight, float speed)
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


    protected virtual void Start()
    {
        animator = this.GetComponent<Animator>();
    
        // Get the bones
    
        //root = GetBone(HumanBodyBones.Hips);
        root = this.transform;
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
    
        //create the IKs
        headIK = SetIKHead(headBone, neckBone);
        rightHandIK = SetIKRightHand(rightHandBone, rightForeArm, rightArm, rightShoulder);
        leftHandIK = SetIKLeftHand(leftHandBone, leftForeArm, leftArm, leftShoulder);
        fullBodyBipedIK = SetFullBodyIK();
    
        //pickUp = SetPickUp();
    }


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


    protected FullBodyBipedIK SetFullBodyIK()
    {
        //this.gameObject.AddComponent<FullBodyBipedIK>().solver.effectors = new IKEffector[9];
        FullBodyBipedIK BodyIK = this.gameObject.AddComponent<FullBodyBipedIK>();
        BipedReferences.AutoDetectReferences(ref BodyIK.references, root, BipedReferences.AutoDetectParams.Default );
        BodyIK.solver.SetToReferences(BodyIK.references, null);
        //BodyIK.GetIKSolver().Initiate(root);
        return BodyIK;
    }


    protected IEnumerator SetWeightAimIK(AimIK aimIK, float weight, float speed)
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
    
        if(AimCompleted != null)
    	    AimCompleted(this, EventArgs.Empty);
    }


    protected PickUp SetPickUp()
    {
        InteractionSystem intSys = this.gameObject.AddComponent<InteractionSystem>();
        PickUp pickUp = this.gameObject.AddComponent<PickUp>();
    
        pickUp.interactionSystem = intSys;
    
        return pickUp;
    }


    protected IEnumerator ChangeTarget(AimIK aimIK, Transform target, float weight, float speed)
    {
        float varOld = aimIK.solver.IKPositionWeight;
        float varNew = 0;
    
        AimIK newHeadIk = SetIKHead(headBone, neckBone);
    
        SetTargetAimIK(newHeadIk, target, 0);
    
        while (varOld > 0 || varNew < 1)
        {
            aimIK.solver.SetIKPositionWeight(varOld);
            newHeadIk.solver.SetIKPositionWeight(varNew);
            yield return new WaitForSeconds(speed);
            varOld -= .01f;
            varNew += .01f;
        }
    
        Destroy(aimIK);
        headIK = newHeadIk;
    }




    public virtual void SetTargetAimIK(AimIK aimIK, Transform target, float weight = 1f, float speed = .01f)
    {
        if (aimIK.solver.target == null)
        {
            aimIK.solver.target = target;
    
            if (aimIK.solver.target != null)
            {
                StartCoroutine(SetWeightAimIK(aimIK, weight, speed));
            }
            else
            {
                Debug.Log("The target is null, first set the target.");
            }
        }
        else
        {
            StartCoroutine(ChangeTarget(aimIK, target, weight, speed));
        }
    }


    public virtual void SetTargetFullBodyIK(FullBodyBipedIK fullBody, Transform bodyEffector, Transform leftHandEffector = null, Transform rightHandEffector = null, Transform leftFootEffector = null, Transform rightFootEffector = null)
    {
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


    public virtual void SetWeightsFullBodyIK(IKEffector effector, float weight, float speed = .01f)
    {
        if (effector != null)
            StartCoroutine(SetWeightFullIK(effector, weight, speed));
        else
            Debug.Log("The effector is null, first set the target.");
    }


    public virtual void SetWeightTargetAimIK(AimIK aimIK, float weight, float speed = .01f)
    {
        if (aimIK.solver.target != null)
            StartCoroutine(SetWeightAimIK(aimIK, weight, speed));
        else
            Debug.Log("The target is null, first set the target.");
    }


    public void RemoveTarget(AimIK aimIK)
    {
       SetWeightTargetAimIK(aimIK, 0);
       aimIK.solver.target = null;
    }


    public ECA eca
    {
      set; get;
    }


}
