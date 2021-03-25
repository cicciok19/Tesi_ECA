﻿// ================================================================================================
// File: MxMRootMotionApplicator.cs
// 
// Authors:  Kenneth Claassen
// Date:     2019-08-10: Created this file.
// 
//     Contains a part of the 'MxM' namespace for 'Unity Engine'.
// ================================================================================================
using UnityEngine;
using MxMGameplay;

namespace MxM
{
    //===========================================================================================
    /**
    *  @brief A root motion applicator used to apply root motion to a generic controller or transformo
    *  through the MxMAnimator. The root motion output from this root motion applicator takes into
    *  consideration animation warping passed from the MxMAnimator.
    *         
    *********************************************************************************************/
    public class MxMRootMotionApplicator : MonoBehaviour, IMxMRootMotion
    {
        [SerializeField]
        private GenericControllerWrapper m_charController;

        [SerializeField]
        private bool m_enableGravity = false;

        [SerializeField]
        private bool m_rotationOnly = false;

        [SerializeField] private Vector3 m_axisLock = Vector3.one;

        private Transform m_rootTransform;

        public bool EnableGravity { get { return m_enableGravity; } set { m_enableGravity = value; } }
        public bool RotationOnly { get { return m_rotationOnly; } set { m_rotationOnly = value; } }

        //===========================================================================================
        /**
        *  @brief Monobehaviour awak function. Ensures all references are setup before updating
        *         
        *********************************************************************************************/
        public virtual void Awake()
        {
            if(m_charController == null)
                m_charController = GetComponentInChildren<GenericControllerWrapper>();

            MxMAnimator mxmAnimator = GetComponent<MxMAnimator>();

            if(mxmAnimator.AnimationRoot != null)
            {
                m_rootTransform = mxmAnimator.AnimationRoot;

                if(m_charController == null)
                {
                    m_charController = m_rootTransform.GetComponent<GenericControllerWrapper>();
                }
            }
            else
            {
                m_rootTransform = transform;
            }

            if(m_charController == null)
            {
                Debug.LogWarning("Attached Generic Controller Wrapper is null. " +
                    "Root motion will be applied directly to transform");
            }
        }

        //===========================================================================================
        /**
        *  @brief Applies root motion + warping to the character
        *  
        *  @param [Vector3] a_rootPosition - the root position provided by the animator
        *  @param [Quaternion] a_rootRotation - the root rotation provided by the animator
        *  @param [Vector3] a_warp - the positional warping provided by the MxMAnimator (should be added to a_rootPosition)
        *  @param [Quaternion] a_warpRot - the rotation warping provided by the MxMAnimator (should be multiplied with a_rootRotation)
        *         
        *********************************************************************************************/
        public void HandleRootMotion(Vector3 a_rootDelta, Quaternion a_rootRotDelta,
            Vector3 a_warp, Quaternion a_warpRot, float a_deltaTime)
        {
            if (m_rotationOnly)
            {
                if (m_charController == null || !m_charController.enabled)
                {
                    m_rootTransform.rotation *= a_rootRotDelta * a_warpRot;
                }
                else
                {
                    m_charController.Rotate(a_rootRotDelta * a_warpRot);
                }
            }
            else
            {
                Vector3 moveDelta = a_rootDelta + a_warp;
                moveDelta = new Vector3(moveDelta.x * m_axisLock.x, moveDelta.y * m_axisLock.y, moveDelta.z * m_axisLock.z);

                if (m_charController == null || !m_charController.enabled)
                {
                    if (EnableGravity)
                    {
                        moveDelta.y = Physics.gravity.y * a_deltaTime * a_deltaTime;
                    }

                    m_rootTransform.Translate(moveDelta, Space.World);
                    m_rootTransform.rotation *= a_rootRotDelta * a_warpRot;

                }
                else
                {
                    if (EnableGravity)
                    {
                        moveDelta.y = (m_charController.Velocity.y +
                            Physics.gravity.y * a_deltaTime) * a_deltaTime;
                    }

                    m_charController.MoveAndRotate(moveDelta, a_rootRotDelta * a_warpRot);
                }
            }
        }

        //===========================================================================================
        /**
        *  @brief Applies angular error warping to the animated character transform.
        *  
        *  @param [Quaternion] a_warpRot - the rotation warping to apply to the character transform.
        *         
        *********************************************************************************************/
        public void HandleAngularErrorWarping(Quaternion a_warpRot)
        {
            if (m_charController != null)
            {
                m_charController.Rotate(transform.rotation * a_warpRot);
            }
            else
            {
                m_rootTransform.Rotate(a_warpRot.normalized.eulerAngles);
            }
        }

        //===========================================================================================
        /**
        *  @brief Update function used to update the controller movement. This update is dependent on 
        *  the Update mode of the Animator component
        *  
        *  @param [float] a_deltaTime - the delta time to use dependent on the update mode.
        *         
        *********************************************************************************************/
        //public void AnimatorDependentUpdate(float a_deltaTime)
        //{
        //    if (m_charController == null)
        //    {
        //        if (EnableGravity)
        //        {
        //            m_moveDelta.y = Physics.gravity.y * a_deltaTime * a_deltaTime;
        //        }

        //        m_rootTransform.Translate(m_moveDelta, Space.World);
        //    }
        //    else
        //    {
        //        //Apply gravity
        //        if (m_charController.enabled && EnableGravity && !m_charController.IsGrounded)
        //        {
        //            m_moveDelta.y = (m_charController.Velocity.y +
        //                Physics.gravity.y * a_deltaTime) * a_deltaTime;
        //        }

        //        //Apply motion to either the controller or the transform
        //        if (m_charController.enabled)
        //        {
        //            m_charController.Move(m_moveDelta);
        //        }
        //        else
        //        {
        //            m_rootTransform.Translate(m_moveDelta, Space.World);
        //        }
        //    }
        //}

        //===========================================================================================
        /**
        *  @brief Sets the position of the character. 
        *  
        *  @param [Vector3] a_position - the new position for the character
        *         
        *********************************************************************************************/
        public void SetPosition(Vector3 a_position)
        {
            if (m_charController.enabled)
            {
                m_charController.Move(a_position - m_rootTransform.position);
            }
            else
            {
                m_rootTransform.position = a_position;
            }
        }

        //===========================================================================================
        /**
        *  @brief Sets the rotation of the character 
        *  
        *  @param [Quaternion] a_rotation - the new rotation for the character
        *         
        *********************************************************************************************/
        public void SetRotation(Quaternion a_rotation)
        {
            if (m_charController != null && m_charController.enabled)
            {
                m_charController.SetRotation(a_rotation);
            }
            else
            {
                m_rootTransform.rotation = a_rotation;
            }
        }

        //===========================================================================================
        /**
        *  @brief Sets the position and rotation of the character
        *  
        *  @param [Vector3] a_position - the new position of the character
        *  @param [Quaternion] a_rotation - the new rotation of the character
        *         
        *********************************************************************************************/
        public void SetPositionAndRotation(Vector3 a_position, Quaternion a_rotation)
        {
            if (m_charController != null && m_charController.enabled)
            {
                m_charController.Move(a_position - m_rootTransform.position);
                m_charController.SetRotation(a_rotation);
            }
            else
            {
                m_rootTransform.SetPositionAndRotation(a_position, a_rotation);
            }
        }
    }//End of class: MxMRootMotionApplicator
}//End of namespace: MxM