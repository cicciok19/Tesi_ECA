﻿// ================================================================================================
// File: MxMAnimator_Tags.cs
// 
// Authors:  Kenneth Claassen
// Date:     2019-10-10: Created this file.
// 
//     Contains a part of the 'MxM' namespace for 'Unity Engine'.
// ================================================================================================
using UnityEngine;

namespace MxM
{
    //============================================================================================
    /**
    *  @brief This is partial implementation of the MxMAnimator. This particular partial class 
    *  handles all tag system logic for the MxMAnimator.
    *         
    *********************************************************************************************/
    public partial class MxMAnimator : MonoBehaviour
    {
        //Tags
        private ETags m_requiredTags = ETags.None; //The current required tags. The MxMAniamtor will only ever choose poses with these tags
        private ETags m_favourTags = ETags.None; //The current favour tags. Poses with these tags will have their cost multiplied by m_favourMultiplier
        private float m_favourMultiplier = 1f; //The favour multiplier for favour tagging. Numbers < 1f make the pose more favourable while numbers > 1f make them less favourable.

        private ETags m_desireRequiredTags = ETags.None;

        public EUserTags UserTags { get { return m_curInterpolatedPose.UserTags; } } //The user tags for the current pose.

        //============================================================================================
        /**
        *  @brief Updates the required tags based on any desired required tags the user has set since
        *  the last update. This exists because it is important to only "FetchNativeAnimData" once all
        *  tags change requests have been processed for a frame. Otherwise the NativeAnimData might 
        *  not exists
        *         
        *********************************************************************************************/
        private void UpdateRequireTags()
        {
            if(m_requiredTags != m_desireRequiredTags)
            {
                m_requiredTags = m_desireRequiredTags;
                FetchNativeAnimData();
                CheckIdleSuitability();
            }
        }

        //============================================================================================
        /**
        *  @brief Updates the footsteps for the MxMAnimator. This searches the footstep tags and 
        *  triggers callbacks if a footstep was triggered, passing appropriate footstep data.
        *         
        *********************************************************************************************/
        private void UpdateFootSteps()
        {
            int trackId = m_dominantPose.TracksId;

            if (trackId < 0)
                return;

            if (CurrentAnimData.LeftFootSteps.Length <= trackId || CurrentAnimData.RightFootSteps.Length <= trackId)
                return;

            var leftFootStepTrack = CurrentAnimData.LeftFootSteps[trackId];
            var rightFootStepTrack = CurrentAnimData.RightFootSteps[trackId];

            ref MxMPlayableState dominantPlayableState = ref m_animationStates[m_dominantBlendChannel];

            float animTime = m_dominantPose.Time + dominantPlayableState.Age;
            AnimationClip clip = CurrentAnimData.Clips[m_dominantPose.PrimaryClipId];

            if(clip.isLooping)
                animTime = animTime % clip.length;

            Vector2 range = new Vector2(animTime - (p_currentDeltaTime * m_playbackSpeed), animTime);

            int stepId = leftFootStepTrack.GetStepStart(range);

            if (stepId > -1)
            {
                m_onLeftFootStepStart.Invoke(leftFootStepTrack.FootSteps[stepId]);
            }

            stepId = rightFootStepTrack.GetStepStart(range);

            if (stepId > -1)
            {
                m_onRightFootStepStart.Invoke(rightFootStepTrack.FootSteps[stepId]);
            }
        }

        //============================================================================================
        /**
        *  @brief Sets the currently required tags.
        *  
        *  @param [ETags] a_tags - the tags to set as required (previous tags will be cleared).
        *         
        *********************************************************************************************/
        public void SetRequiredTags(ETags a_tags)
        {
            m_desireRequiredTags = a_tags;
        }

        //============================================================================================
        /**
        *  @brief Sets the required tag via an integer Id
        *  
        *  @param [int] a_tagId - the id of the tag to set as required (previous tags will be cleared).
        *         
        *********************************************************************************************/
        public void SetRequiredTag(int a_tagId)
        {
            a_tagId = Mathf.Clamp(a_tagId, 0, 32);

            if (a_tagId == 0)
            {
                m_desireRequiredTags = 0;
            }
            else
            {
                m_desireRequiredTags = (ETags)(1 << (a_tagId - 1));
            }
        }

        //============================================================================================
        /**
        *  @brief Sets the currently required tags via the tags name. 
        *  
        *  Note: This is the slowest method for setting required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to set as required.
        *         
        *********************************************************************************************/
        public void SetRequiredTag(string a_tagName)
        {
            for (int i = 0; i < CurrentAnimData.TagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.TagNames[i])
                {
                    m_desireRequiredTags = (ETags)(1 << i);
                    return;
                }
            }
        }

        //============================================================================================
        /**
        *  @brief Adds required tags to the existing set of required tags
        *  
        *  @param [Etags] a_tags - the tags to add as required
        *         
        *********************************************************************************************/
        public void AddRequiredTags(ETags a_tags)
        {
            m_desireRequiredTags = m_desireRequiredTags | a_tags;
        }

        //============================================================================================
        /**
        *  @brief Adds a required tag to the existing set of required tags
        *  
        *  @param [int] a_tagId - the id of the tag to add
        *         
        *********************************************************************************************/
        public void AddRequiredTag(int a_tagId)
        {
            if (a_tagId > 0 && a_tagId < 33)
            {
                m_desireRequiredTags = m_desireRequiredTags | (ETags)(1 << (a_tagId - 1));
            }
        }

        //============================================================================================
        /**
        *  @brief Adds a required tag to the existing set of required tags
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to add as required.
        *         
        *********************************************************************************************/
        public void AddRequiredTag(string a_tagName)
        {
            for (int i = 0; i < CurrentAnimData.TagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.TagNames[i])
                {
                    m_desireRequiredTags = m_desireRequiredTags | (ETags)(1 << i);
                    return;
                }
            }
        }

        //============================================================================================
        /**
        *  @brief Removes the passed tags from the required tags currently set in the system
        *  
        *  @param [ETags] a_tags - the tags to remove
        *         
        *********************************************************************************************/
        public void RemoveRequiredTags(ETags a_tags)
        {
            m_desireRequiredTags = m_desireRequiredTags & (~a_tags);
        }

        //============================================================================================
        /**
        *  @brief Removes the passed tag id from the required tags currently set in the system
        *  
        *  @param [int] a_tagId - the id of the tag to remove
        *         
        *********************************************************************************************/
        public void RemoveRequiredTag(int a_tagId)
        {
            if (a_tagId > 0 && a_tagId < 33)
            {
                m_desireRequiredTags = m_desireRequiredTags & (ETags)~(1 << (a_tagId - 1));
            }
        }

        //============================================================================================
        /**
        *  @brief REmoves the passed tag name from the required tags currently set in the system
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to remove
        *         
        *********************************************************************************************/
        public void RemoveRequiredTag(string a_tagName)
        {
            for (int i = 0; i < CurrentAnimData.TagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.TagNames[i])
                {
                    m_desireRequiredTags = m_desireRequiredTags & (ETags)~(1 << i);
                    return;
                }
            }
        }

        //============================================================================================
        /**
        *  @brief Adds and removes the passed tags from the required tags currently set in the system
        *  
        *  @param [ETags] a_tagsToAdd - the tags to add
        *  @param [ETags] a_tagsToRemove - the tags to remove
        *         
        *********************************************************************************************/
        public void AddAndRemoveRequiredTags(ETags a_tagsToAdd, ETags a_tagsToRemove)
        {
            m_desireRequiredTags = m_requiredTags & (a_tagsToAdd) & (~a_tagsToRemove);
        }

        //============================================================================================
        /**
        *  @brief Adds and Removes the passed tag ids from the required tags currently set in the system
        *  
        *  @param [int] a_tagIdToAdd - the id of the tag to add
        *  @param [int] a_tagIdToRemove - the id of the tag to remove
        *         
        *********************************************************************************************/
        public void AddAndRemoveRequiredTag(int a_tagIdToAdd, int a_tagIdToRemove)
        {
            if (a_tagIdToRemove > 0 && a_tagIdToRemove < 33)
            {
                m_desireRequiredTags = m_desireRequiredTags & (ETags)~(1 << (a_tagIdToRemove - 1));
            }

            if (a_tagIdToAdd > 0 && a_tagIdToAdd < 33)
            {
                m_desireRequiredTags = m_desireRequiredTags | (ETags)(1 << (a_tagIdToAdd - 1));
            }
        }

        //============================================================================================
        /**
        *  @brief Adds and removes the passed tag names from the required tags currently set in the system
        *  
        *  Note: This is the slowest method for changing required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagNameToAdd - the name of the tag to add
        *  @param [string] a_tagNameToRemove - the name of the tag to remove
        *         
        *********************************************************************************************/
        public void AddAndRemoveRequiredTags(string a_tagNameToAdd, string a_tagNameToRemove)
        {
            int tagsChanged = 0;

            for (int i = 0; i < CurrentAnimData.TagNames.Length; ++i)
            {
                if (a_tagNameToAdd == CurrentAnimData.TagNames[i])
                {
                    m_desireRequiredTags = m_desireRequiredTags | (ETags)(1 << i);

                    if (++tagsChanged == 2)
                        break;
                }

                if (a_tagNameToRemove == CurrentAnimData.TagNames[i])
                {
                    m_desireRequiredTags = m_desireRequiredTags & (ETags)~(1 << i);

                    if (++tagsChanged == 2)
                        break;
                }
            }
        }

        //============================================================================================
        /**
        *  @brief Sets the favour tags and the favour value
        *  
        *  @param [ETags] a_tag - the tags to set as favoured
        *  @param [float] a_favour - the favour value. Values less than 1f make the tags more favourable while 
        *  values > 1 make the tags less favourable.
        *         
        *********************************************************************************************/
        public void SetFavourTags(ETags a_tag, float a_favour)
        {
            m_favourTags = a_tag;
            SetFavourMultiplier(a_favour);
        }

        //============================================================================================
        /**
        *  @brief Sets the favour tags and the favour value by tag Id
        *  
        *  @param [int] a_tagId - the id of the tag to set as favoured
        *  @param [float] a_favour - the favour value. Values less than 1f make the tags more favourable while 
        *  values > 1 make the tags less favourable.
        *         
        *********************************************************************************************/
        public void SetFavourTag(int a_tagId, float a_favour)
        {
            m_favourTags = (ETags)(1 << (a_tagId - 1));
            SetFavourMultiplier(a_favour);
        }

        //============================================================================================
        /**
        *  @brief Sets the favour tags and favour value by name
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to set as favoured
        *  @param [float] a_favour - the favour value. Values less than 1f make the tags more favourable while 
        *  values > 1 make the tags less favourable.
        *         
        *********************************************************************************************/
        public void SetFavourTag(string a_tagName, float a_favour)
        {
            for (int i = 0; i < CurrentAnimData.FavourTagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.FavourTagNames[i])
                {
                    m_favourTags = (ETags)(1 << i);
                    SetFavourMultiplier(a_favour);
                    return;
                }
            }

            m_favourTags = 0;
            SetFavourMultiplier(1f);
        }

        //============================================================================================
        /**
        *  @brief Adds favour tags to the existing set of favour tags
        *  
        *  @param [ETags] a_tags - the tags to add to the favoured set
        *         
        *********************************************************************************************/
        public void AddFavourTags(ETags a_tags)
        {
            m_favourTags = m_favourTags | a_tags;
        }

        //============================================================================================
        /**
        *  @brief Adds a tag to the existing set of favour tags by tagId
        *  
        *  @param [int] a_tagId - the id of the tag to add
        *         
        *********************************************************************************************/
        public void AddFavourTag(int a_tagId)
        {
            if (a_tagId > 0 && a_tagId < 33)
            {
                m_favourTags = m_favourTags | (ETags)(1 << (a_tagId - 1));
            }
        }

        //============================================================================================
        /**
        *  @brief Adds a tag to the existing set of favour tags by name
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to add
        *         
        *********************************************************************************************/
        public void AddFavourTag(string a_tagName)
        {
            for (int i = 0; i < CurrentAnimData.FavourTagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.FavourTagNames[i])
                {
                    m_favourTags = m_favourTags | (ETags)(1 << i);
                    return;
                }
            }
        }

        //============================================================================================
        /**
        *  @brief Removes a set of favour tags from the current favour tag values set in the system
        *  
        *  @param [ETags] a_tags - the tags to remove
        *         
        *********************************************************************************************/
        public void RemoveFavourTags(ETags a_tags)
        {
            m_favourTags = m_favourTags & (~a_tags);
        }

        //============================================================================================
        /**
        *  @brief Removes a favour tag from the current favour tag values set in the system, by Id.
        *  
        *  @param [int] a_tagId - the Id of the tag to remove
        *         
        *********************************************************************************************/
        public void RemoveFavourTag(int a_tagId)
        {
            if (a_tagId > 0 && a_tagId < 33)
            {
                m_favourTags = m_favourTags & (ETags)~(1 << (a_tagId - 1));
            }
        }
        //============================================================================================
        /**
        *  @brief Removes a favour tag from the current favour tag values set in the system, by name.
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_tagName - the name of the tag to remove
        *         
        *********************************************************************************************/
        public void RemoveFavourTag(string a_tagName)
        {
            for (int i = 0; i < CurrentAnimData.FavourTagNames.Length; ++i)
            {
                if (a_tagName == CurrentAnimData.FavourTagNames[i])
                {
                    m_favourTags = m_favourTags & (ETags)~(1 << i);
                    return;
                }
            }

        }

        //============================================================================================
        /**
        *  @brief Sets the favour multiplier for favour tagging
        *  
        *  @param [float] a_favour - the favour value for favoured tags. Values less than 1f are more
        *  favourable while values > 1f are less favourable.
        *         
        *********************************************************************************************/
        public void SetFavourMultiplier(float a_favour)
        {
            m_favourMultiplier = Mathf.Clamp(a_favour, 0f, float.MaxValue);
        }

        //============================================================================================
        /**
        *  @brief Returns an enum flag with all user tags set on the current interpolated pose
        *  
        *  @return EUserTags - the current user tags flag field
        *         
        *********************************************************************************************/
        public EUserTags QueryUserTags()
        {
            return m_curInterpolatedPose.UserTags;
        }

        //============================================================================================
        /**
        *  @brief Queries a set of user tag from the current pose.
        *  
        *  @param [EUserTags] a_queryTags - the user tags to query
        *  
        *  @return bool - true if the current pose has the query tags otherwise false
        *         
        *********************************************************************************************/
        public bool QueryUserTags(EUserTags a_queryTags)
        {
            if ((m_curInterpolatedPose.UserTags & a_queryTags) == a_queryTags)
                return true;

            return false;
        }

        //============================================================================================
        /**
        *  @brief Queries a user tag from the current pose
        *  
        *  @param [int] a_queryTagId - the id of the user tag to query
        *  
        *  return bool - true if the current pose has the query tag otherwise false
        *         
        *********************************************************************************************/
        public bool QueryUserTag(int a_queryTagId)
        {
            EUserTags tag = (EUserTags)(1 << (a_queryTagId - 1));

            if ((m_curInterpolatedPose.UserTags & tag) == tag)
                return true;

            return false;
        }

        //============================================================================================
        /**
        *  @brief Queries a user tag by name from the current pose
        *  
        *  Note: This is the slowest method for adding required tags and will cause garbage allocations
        *  if the string is not cached by the user.
        *  
        *  @param [string] a_queryTagName - the name of the user tag to query
        *  
        *  @return [bool - true if the current pose has the query tag otherwise false
        *         
        *********************************************************************************************/
        public bool QueryUserTag(string a_queryTagName)
        {
            for (int i = 0; i < CurrentAnimData.UserTagNames.Length; ++i)
            {
                if (a_queryTagName == CurrentAnimData.UserTagNames[i])
                {
                    EUserTags tag = (EUserTags)(1 << i);

                    if ((m_curInterpolatedPose.UserTags & tag) == tag)
                        return true;

                    return false;
                }
            }

            return false;
        }

        //============================================================================================
        /**
        *  @brief Clears all required and favoured tags from the system
        *         
        *********************************************************************************************/
        public void ClearAllTags()
        {
            m_desireRequiredTags = ETags.None;
            m_favourTags = ETags.None;

            m_favourMultiplier = 1f;
        }

        //============================================================================================
        /**
        *  @brief Clears all required tags from the system
        *         
        *********************************************************************************************/
        public void ClearRequiredTags()
        {
            m_desireRequiredTags = ETags.None;
        }

        //============================================================================================
        /**
        *  @brief Clears all favour tags from the system and resets the favour multiplier
        *         
        *********************************************************************************************/
        public void ClearFavourTags()
        {
            m_favourTags = ETags.None;
            m_favourMultiplier = 1f;
        }

    }//End of partical class: MxMAnimator
}//End of namespace: MxM
