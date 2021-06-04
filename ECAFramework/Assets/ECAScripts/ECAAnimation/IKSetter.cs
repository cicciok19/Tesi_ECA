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

    private Transform hips;
    private Transform root;
    private Transform headBone;
    private Transform leftForeArm;
    private Transform leftShoulder;
    private Transform rightHandBone;
    private Transform rightShoulder;
    private Transform leftHandBone;
    private Transform rightForeArm;
    private Transform leftArm;
    private Transform neckBone;
    private Transform rightArm;
    private Transform leftFoot;
    private Transform rightFoot;

    protected Animator animator;
    protected Dictionary<HumanBodyBones, AimIK> aimDictionary =   new Dictionary<HumanBodyBones, AimIK>();

    public FullBodyBipedIK fullBodyBipedIK;
    public AimIK leftHandIK;
    public AimIK rightHandIK;
    public AimIK headIK;

    public InteractionSystem interactionSystem;

    protected virtual void Awake()
    {
        animator = this.GetComponent<Animator>();

        // Get the bones

        hips = GetBone(HumanBodyBones.Hips);
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
        leftFoot = GetBone(HumanBodyBones.LeftFoot);

        //create the IKs
        headIK = SetIKHead(headBone, neckBone);
        aimDictionary.Add(HumanBodyBones.Head, headIK);

        rightHandIK = SetIKRightHand(rightHandBone, rightForeArm, rightArm, rightShoulder);
        aimDictionary.Add(HumanBodyBones.RightHand, rightHandIK);

        leftHandIK = SetIKLeftHand(leftHandBone, leftForeArm, leftArm, leftShoulder);
        aimDictionary.Add(HumanBodyBones.LeftHand, leftHandIK);

        fullBodyBipedIK = SetFullBodyIK();

        interactionSystem = GetComponent<InteractionSystem>();
        if (interactionSystem == null)
           interactionSystem = gameObject.AddComponent<InteractionSystem>();

        interactionSystem.ik = fullBodyBipedIK;
    }

    protected AimIK SetIKHead(Transform headBone, Transform neckBone)
    {
        AimIK HeadIK = this.gameObject.AddComponent<AimIK>();
        HeadIK.GetIKSolver().Initiate(root);
        HeadIK.solver.transform = headBone;
        HeadIK.solver.AddBone(neckBone);
        HeadIK.solver.IKPositionWeight = 0;
    
        //aimStopDictionary.Add(HeadIK, false);
    
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
    
        //aimStopDictionary.Add(RightIK, false);
    
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
    
        //aimStopDictionary.Add(LeftIK, false);
    
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


    protected IEnumerator ChangeTarget(AimIK aimIK, Transform target, float weight, float speed)
    {
        float varOld = aimIK.solver.IKPositionWeight;
        GameObject targetOld = aimIK.solver.target.gameObject;
        float varNew = 0;
        HumanBodyBones key;
        bool sameTarget = false;

        AimIK newAimIK;
        if (aimIK == aimDictionary[HumanBodyBones.Head])
        {
            newAimIK = SetIKHead(headBone, neckBone);
            key = HumanBodyBones.Head;
        }
        else if(aimIK == aimDictionary[HumanBodyBones.RightHand])
        {
            newAimIK = SetIKRightHand(rightHandBone, rightForeArm, rightArm, rightShoulder);
            key = HumanBodyBones.RightHand;
        }
        else
        {
            newAimIK = SetIKLeftHand(leftHandBone, leftForeArm, leftArm, leftShoulder);
            key = HumanBodyBones.LeftHand;
        }


        SetTargetAimIK(newAimIK, target, 0);
    
        while (varOld > 0 || varNew < weight)
        {
            aimIK.solver.SetIKPositionWeight(varOld);
            newAimIK.solver.SetIKPositionWeight(varNew);
            yield return new WaitForSeconds(speed);
            if(varOld > 0)
                varOld -= .01f;
            if(varNew < weight)
                varNew += .01f;
        }

        //controllo che nessun altro abbia lo stesso target, altrimenti lo distruggo
        foreach(var k in aimDictionary.Keys)
        {
            if (k != key && aimDictionary[k].solver.target == targetOld)
            {
                sameTarget = true;
            }
        }
        if (!sameTarget)
            Destroy(targetOld);

        if (aimIK == aimDictionary[HumanBodyBones.Head])
        {
            headIK = newAimIK;
            aimDictionary[key] = newAimIK;
        }

        else if (aimIK == aimDictionary[HumanBodyBones.RightHand])
        {
            rightHandIK = newAimIK;
            aimDictionary[key] = newAimIK;
        }
        else
        {
            leftHandIK = newAimIK;
            aimDictionary[key] = newAimIK;
        }

        Destroy(aimIK);

        if (AimCompleted != null)
            AimCompleted(this, EventArgs.Empty);
    }

    /*
    IEnumerator ChangeTargetFullIK(IKEffector effector, Transform target, float weight, float speed)
    {
        yield return new WaitForSeconds(.1f);

        float varOld = effector.positionWeight;
        GameObject targetOld = effector.target.gameObject;
        float varNew = 0;
        bool sameTarget = false;

        FullBodyBipedIK newFullIK = SetFullBodyIK();

        if (effector.bone == hips)
            SetTargetFullBodyIK(newFullIK, target);
        else if (effector.bone == leftHandBone)
            SetTargetFullBodyIK(newFullIK, null, target);
        else if (effector.bone == rightHandBone)
            SetTargetFullBodyIK(newFullIK, null, null, target);
        else if (effector.bone == lef)

        //SetTargetAimIK(newAimIK, target, 0);

        while (varOld > 0 || varNew < weight)
        {
            aimIK.solver.SetIKPositionWeight(varOld);
            newAimIK.solver.SetIKPositionWeight(varNew);
            yield return new WaitForSeconds(speed);
            if (varOld > 0)
                varOld -= .01f;
            if (varNew < weight)
                varNew += .01f;
        }
    }*/

    public virtual void SetTargetAimIK(AimIK aimIK, Transform target, float weight = 1f, float duration = 1f)
    {


        if (aimIK.solver.target == null)
        {
            float coroutineSpeed;
            float weightOperation = aimIK.solver.IKPositionWeight;

            if (weightOperation < weight)
                weightOperation = weight - weightOperation;
            else
                weightOperation -= weight;

            coroutineSpeed = (duration * .01f) / weightOperation;

            aimIK.solver.target = target;
    
            if (aimIK.solver.target != null && weightOperation != 0)
            {
                StartCoroutine(SetWeightAimIK(aimIK, weight, coroutineSpeed));
            }
            else if (aimIK.solver.target == null)
            {
                Debug.LogError("The target is null, first set the target.");
            }
        }
        else
        {
            float coroutineSpeed;
            float weightOperation = 0;

            if (weightOperation < weight)
                weightOperation = weight - weightOperation;
            else
                weightOperation -= weight;

            coroutineSpeed = (duration * .01f) / weightOperation;

            StartCoroutine(ChangeTarget(aimIK, target, weight, coroutineSpeed));

            Debug.Log("Change target");
        }
    }


    public virtual void SetTargetFullBodyIK(FullBodyBipedIK fullBody, Transform bodyEffector, Transform leftHandEffector = null, Transform rightHandEffector = null, Transform leftFootEffector = null, Transform rightFootEffector = null)
    {
        if(bodyEffector != null)
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


    public virtual void SetWeightsFullBodyIK(IKEffector effector, float weight, float duration = 1f)
    {
        float coroutineSpeed;
        float weightOperation = effector.positionWeight;

        if (weightOperation < weight)
            weightOperation = weight - weightOperation;
        else
            weightOperation -= weight;
        if (weightOperation != 0)
        {
            coroutineSpeed = (duration * .01f) / weightOperation;

            if (effector != null)
                StartCoroutine(SetWeightFullIK(effector, weight, coroutineSpeed));
            else
                Debug.LogError("The effector is null, first set the target.");
        }
        else
            Debug.LogError("The weight is alredy " + weight);
    }


    public virtual void SetWeightTargetAimIK(AimIK aimIK, float weight, float duration = 1f)
    {
        float coroutineSpeed;
        float weightOperation = aimIK.solver.IKPositionWeight;

        if (weightOperation < weight)
            weightOperation = weight - weightOperation;
        else
            weightOperation -= weight;


        if (weightOperation != 0)
        {
            coroutineSpeed = (duration * .01f) / weightOperation;

            if (aimIK.solver.target != null)
                StartCoroutine(SetWeightAimIK(aimIK, weight, coroutineSpeed));
            else
                Debug.LogError("The target is null, first set the target.");
        }
        else
            Debug.LogError("The weight is alredy " + weight);
    }


    public void RemoveTarget(AimIK aimIK)
    {
        SetWeightTargetAimIK(aimIK, 0);
        Destroy(aimIK.solver.target.gameObject);
    }


    public ECA eca
    {
      set; get;
    }

    public void ResetInteractionSystem()
    {
        interactionSystem.StopAll();
        Destroy(interactionSystem);
        interactionSystem = gameObject.AddComponent<InteractionSystem>();
        interactionSystem.ik = fullBodyBipedIK;
    }

    public void ChangeFadeInTime(float time)
    {
        interactionSystem.fadeInTime = time;
    }

}
