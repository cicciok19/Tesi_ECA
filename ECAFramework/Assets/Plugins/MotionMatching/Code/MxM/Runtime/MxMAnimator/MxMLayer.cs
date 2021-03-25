﻿// ================================================================================================
// File: MxMLayer.cs
// 
// Authors:  Kenneth Claassen
// Date:     2019-07-29: Created this file.
// 
//     Contains a part of the 'MxM' namespace for 'Unity Engine'.
// ================================================================================================
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Animations;
using UnityEngine.Assertions;

namespace MxM
{
    //============================================================================================
    /**
    *  @brief Class used to track and manage layers used with motion matching
    *         
    *********************************************************************************************/
    public class MxMLayer
    {
        public Coroutine FadeCoroutine;

        private AvatarMask m_mask;

        private PlayableGraph m_playableGraph;
        private AnimationLayerMixerPlayable m_layerMixer;

        public int Id { get; private set; }
        public AnimationClip PrimaryClip { get; private set; }
        public int MaxClips { get; private set; }
        public AnimationMixerPlayable Mixer { get; private set; }
        public int PrimaryInputId { get; private set; }
        public float TransitionRate { get; set; }
        public float[] SubLayerWeights { get; private set; }
        
        public bool IsDone
        {
            get
            {
                if (PrimaryClip == null)
                    return true;

                if (PrimaryClip.isLooping)
                    return false;

                var clipPlayable = (AnimationClipPlayable)Mixer.GetInput(PrimaryInputId);

                if(clipPlayable.IsValid())
                {
                    if(PrimaryClip.length < clipPlayable.GetTime())
                        return false;
                }

                return true;
            }
        }
        public float TimeRemaining
        {
            get
            {
                if (PrimaryClip == null)
                    return -1f;

                if (PrimaryClip.isLooping)
                    return float.MaxValue;

                var clipPlayable = (AnimationClipPlayable)Mixer.GetInput(PrimaryInputId);
                
                if(clipPlayable.IsValid())
                {
                    return Mathf.Clamp(PrimaryClip.length - (float)clipPlayable.GetTime(), 0, PrimaryClip.length);
                }

                return -1f;
            }
        }

        public float Duration
        {
            get
            {
                if (PrimaryClip == null)
                    return 0f;

                return PrimaryClip.length;
            }
        }
        
        public float Weight
        {
            get { return m_layerMixer.GetInputWeight(Id); }
            set { m_layerMixer.SetInputWeight(Id, value); }
        }

        public AvatarMask Mask
        {
            get { return m_mask; }
            set
            {
                m_mask = value;

                if (m_mask != null)
                {
                    m_layerMixer.SetLayerMaskFromAvatarMask((uint)Id, m_mask);
                }
            }
        }
        public bool Additive
        {
            get { return m_layerMixer.IsLayerAdditive((uint)Id); }
            set { m_layerMixer.SetLayerAdditive((uint)Id, value); }
        }

        public float PrimaryClipTime
        {
            get
            {
                Playable primaryPlayable = m_layerMixer.GetInput(PrimaryInputId);
                return (float)primaryPlayable.GetTime();
            }
            set
            {
                Playable primaryPlayable = m_layerMixer.GetInput(PrimaryInputId);
                primaryPlayable.SetTime(value);
                primaryPlayable.SetTime(value);
            }
        }

        //============================================================================================
        /**
        *  @brief Constructor for the MxMLayer class. Sets up all initial values and creates the layer's
        *  mixer 
        *  
        *  @param [int] a_id - the layer id (lowest layer value is 2 for MxMLayers)
        *  @param [int] a_maxClips - the maximum number of clips that can be blended on this layer
        *  @param [ref PlayableGraph] a_playableGraph - the playable graph that this layer lives on
        *  @param [AnimationClip] a_clip - the starting animation clip to use for this layer.
        *  @param [AvatarMask] a_mask - the mask to use with this player (Default null)
        *  @param [float] a_weight - the starting weight of this layer (Default 0)
        *  @param [bool] a_additive - whether the layer is additive or not (Default false)
        *         
        *********************************************************************************************/
        public MxMLayer(int a_id, int a_maxClips, ref AnimationLayerMixerPlayable a_layerMixer, 
            AnimationClip a_clip, AvatarMask a_mask = null, float a_weight = 0f, bool a_additive = false)
        {
            Assert.IsNotNull(a_clip, "Error: Attempting to create an MxMLayer with null AnimationClip");

            if (!a_layerMixer.IsValid())
                Debug.LogError("Error: Attempting to create an MxMLayer with an invalid layerMixer.");

            m_playableGraph = a_layerMixer.GetGraph();
            m_layerMixer = a_layerMixer;
            PrimaryClip = a_clip;

            Id = a_id;
            MaxClips = a_maxClips;

            PrimaryInputId = 0;

            Mixer = AnimationMixerPlayable.Create(m_playableGraph, a_maxClips, true);
            var clipPlayable = AnimationClipPlayable.Create(m_playableGraph, PrimaryClip);

            m_layerMixer.ConnectInput(Id, Mixer, 0);

            Mixer.ConnectInput(0, clipPlayable, 0);
            Mixer.SetInputWeight(0, 1f);

            Mask = a_mask;

            m_layerMixer.SetLayerAdditive((uint)Id, a_additive);
            m_layerMixer.SetInputWeight(Id, Mathf.Clamp01(a_weight));

            SubLayerWeights = new float[MaxClips];
            SubLayerWeights[0] = 1f;
        }

        //============================================================================================
        /**
        *  @brief Constructor for the MxMLayer class which takes a playable instead of an animation clip. 
        *  Sets up all initial values and creates the layer's mixer.
        *  
        *  @param [int] a_id - the layer id (lowest layer value is 2 for MxMLayers)
        *  @param [int] a_maxClips - the maximum number of clips that can be blended on this layer
        *  @param [ref PlayableGraph] a_playableGraph - the playable graph that this layer lives on
        *  @param [Playable] a_playable - the playable to use for this layer
        *  @param [AvatarMask] a_mask - the mask to use with this player (Default null)
        *  @param [float] a_weight - the starting weight of this layer (Default 0)
        *  @param [bool] a_additive - whether the layer is additive or not (Default false)
        *         
        *********************************************************************************************/
        public MxMLayer(int a_id, int a_maxClips, ref AnimationLayerMixerPlayable a_layerMixer,
           Playable a_playable, AvatarMask a_mask = null, float a_weight = 0f, bool a_additive = false)
        {
            if(!a_playable.IsValid())
                Debug.LogError("Error: Attempting to create an MxMLayer with an invalid playable");

            if (!a_layerMixer.IsValid())
                Debug.LogError("Error: Attempting to create an MxMLayer with an invalid layerMixer.");

            m_layerMixer = a_layerMixer;
            m_playableGraph = m_layerMixer.GetGraph();
            

            Id = a_id;
            MaxClips = a_maxClips;

            PrimaryInputId = 0;

            Mixer = AnimationMixerPlayable.Create(m_playableGraph, a_maxClips, true);

            m_layerMixer.ConnectInput(Id, Mixer, 0);

            Mixer.ConnectInput(0, a_playable, 0);
            Mixer.SetInputWeight(0, 1f);

            Mask = a_mask;

            m_layerMixer.SetLayerAdditive((uint)Id, a_additive);
            m_layerMixer.SetInputWeight(Id, Mathf.Clamp01(a_weight));

            SubLayerWeights = new float[a_maxClips];
            SubLayerWeights[0] = 1f;
        }

        //============================================================================================
        /**
        *  @brief Constructor for the MxMLayer class which takes a playable instead of an animation clip. 
        *  Sets up all initial values and creates the layer's mixer.
        *  
        *  @param [int] a_id - the layer id (lowest layer value is 2 for MxMLayers)
        *  @param [int] a_maxClips - the maximum number of clips that can be blended on this layer
        *  @param [ref PlayableGraph] a_playableGraph - the playable graph that this layer lives on
        *  @param [Playable] a_playable - the playable to use for this layer
        *  @param [AvatarMask] a_mask - the mask to use with this player (Default null)
        *  @param [float] a_weight - the starting weight of this layer (Default 0)
        *  @param [bool] a_additive - whether the layer is additive or not (Default false)
        *         
        *********************************************************************************************/
        public MxMLayer(int a_id, ref AnimationLayerMixerPlayable a_layerMixer,
           Playable a_playable, AvatarMask a_mask = null, float a_weight = 0f, bool a_additive = false)
        {
            if (!a_playable.IsValid())
                Debug.LogError("Error: Attempting to create an MxMLayer with an invalid playable");

            if (!a_layerMixer.IsValid())
                Debug.LogError("Error: Attempting to create an MxMLayer with an invalid layerMixer.");

            m_layerMixer = a_layerMixer;
            m_playableGraph = m_layerMixer.GetGraph();

            Id = a_id;

            PrimaryInputId = 0;
            MaxClips = 1;

            m_layerMixer.ConnectInput(Id, a_playable, 0);

            Mask = a_mask;

            m_layerMixer.SetLayerAdditive((uint)Id, a_additive);
            m_layerMixer.SetInputWeight(Id, Mathf.Clamp01(a_weight));

            SubLayerWeights = new float[1];
            SubLayerWeights[0] = 1f;
        }

        //============================================================================================
        /**
        *  @brief Updates the transition fading for the layer. This is only called when IsTransitioning
        *  is set to true.
        *         
        *********************************************************************************************/
        public bool UpdateTransition()
        {
            float cumulativeWeight = 0f;
            int clipCount = 0;
            for (int i = 0; i < SubLayerWeights.Length; ++i)
            {
                float weight = SubLayerWeights[i];

                if (i == PrimaryInputId)
                {
                    weight += TransitionRate * Time.deltaTime;
                    ++clipCount;
                }
                else
                {
                    if (weight > Mathf.Epsilon)
                    {
                        ++clipCount;

                        weight -= TransitionRate * Time.deltaTime;

                        if (weight < Mathf.Epsilon)
                        {
                            //The playable at this point can be removed
                            var playable = Mixer.GetInput(i);
                            if (playable.IsValid())
                            {
                                Mixer.DisconnectInput(i);
                                ClearPlayable(ref playable);
                            }

                            weight = 0f;
                        }
                    }
                }

                SubLayerWeights[i] = weight;

                cumulativeWeight += weight;
            }

            //normalize weights and apply them
            for (int i = 0; i < SubLayerWeights.Length; ++i)
                Mixer.SetInputWeight(i, SubLayerWeights[i] / cumulativeWeight);

            if (clipCount == 1)
                return true; //Complete

            return false; //Not complete
        }

        //============================================================================================
        /**
        *  @brief Clears the layer including any playables before the MxMLayer is destroyed
        *         
        *********************************************************************************************/
        public void ClearLayer()
        {
            ClearLayerPlayables();
            Mixer.Destroy();
        }

        //============================================================================================
        /**
        *  @brief Clears all clips from the layer but does not destroy the mixer for the layer
        *         
        *********************************************************************************************/
        private void ClearLayerPlayables()
        {
            if (!Mixer.IsValid())
                return;

            for (int i = 0; i < MaxClips; ++i)
            {
                var playable = Mixer.GetInput(i);

                if (playable.IsValid())
                    ClearPlayable(ref playable);
            }

            PrimaryInputId = 0;
            PrimaryClip = null;
        }

        //============================================================================================
        /**
        *  @brief Recursive function which destroys a playable and any child playables
        *         
        *********************************************************************************************/
        private void ClearPlayable(ref Playable a_playable)
        {
            if (!a_playable.IsValid())
                return;

            int inputCount = a_playable.GetInputCount();

            for(int i=0; i < inputCount; ++i)
            {
                var playable = a_playable.GetInput(i);

                ClearPlayable(ref playable);

                playable.Destroy();
            }

            a_playable.Destroy();
        }

        //============================================================================================
        /**
        *  @brief Instantly sets the layer clip  with a full weight of 1
        *  
        *  @param [AnimationClip] a_clip - the clip to set
        *         
        *********************************************************************************************/
        public void SetLayerClip(AnimationClip a_clip, float a_time = 0f)
        {
            if (a_clip == null)
            {
                Debug.LogWarning("Attempting to set an MxMLayer clip with a null clip... action aborted");
                return;
            }

            ClearLayerPlayables();
            PrimaryClip = a_clip;
 
            var clipPlayable = AnimationClipPlayable.Create(m_playableGraph, PrimaryClip);
            
            Mixer.ConnectInput(0, clipPlayable, 0);
            Mixer.SetInputWeight(0, 1f);
            clipPlayable.SetTime(a_time);
            clipPlayable.SetTime(a_time);
        }

        //============================================================================================
        /**
        *  @brief Instantly sets the layer to a premade and passed playable with a weight of 1
        *         
        *********************************************************************************************/
        public void SetLayerPlayable(ref Playable a_playable)
        {
            if(!a_playable.IsValid())
            {
                Debug.LogWarning("Attempting to set an MxMLayer playable with an invalid playable... action aborded");
                return;
            }

            ClearLayerPlayables();
            PrimaryClip = null;

            Mixer.ConnectInput(0, a_playable, 0);
            Mixer.SetInputWeight(0, 1f);
        }

        //============================================================================================
        /**
        *  @brief Triggers a transition of the layer from one clip to another over time
        *  
        *  @param [AnimationClip] a_clip - the clip to blend in
        *  @param [float] a_fadeRate - the rate at which to blend the clip in
        *         
        *********************************************************************************************/
        public void TransitionToClip(AnimationClip a_clip, float a_fadeRate, float a_time = 0f)
        {
            if(a_clip == null)
            {
                Debug.LogWarning("Trying to transition MxMLayer to a new clip, but the clip is null. Aborting operation.");
                return;
            }

            int slotToUse = FindAvailableSlot();
            
            var clipPlayable = AnimationClipPlayable.Create(m_playableGraph, a_clip);
            Mixer.ConnectInput(slotToUse, clipPlayable, 0);
            Mixer.SetInputWeight(slotToUse, 0f);
            clipPlayable.SetTime(a_time);
            clipPlayable.SetTime(a_time);

            PrimaryInputId = slotToUse;
            TransitionRate = a_fadeRate;
        }

        //============================================================================================
        /**
        *  @brief Triggers a transition of the layer from one playable to another over time
        *  
        *  @param [ref playable] a_playable - a reference to the playable to transition
        *  @param [float] a_fadeRate - the rate at which to blend the clip in
        *         
        *********************************************************************************************/
        public void TransitionToPlayable(ref Playable a_playable, float a_fadeRate, float a_time = 0f)
        {
            if(!a_playable.IsValid())
            {
                Debug.LogWarning("Trying to transition MxMLayer to a new playable, but the playable is invalid. Aborting operation.");
                return;
            }

            int slotToUse = FindAvailableSlot();

            Mixer.ConnectInput(slotToUse, a_playable, 0);
            Mixer.SetInputWeight(slotToUse, 0f);
            a_playable.SetTime(a_time);
            a_playable.SetTime(a_time);

            PrimaryInputId = slotToUse;
            TransitionRate = a_fadeRate;
        }

        //============================================================================================
        /**
        *  @brief Returns the id of the first available slot in the mixer or alternatively the slots
        *  with the least weight. It also clears that slot if it is occupied
        *  
        *  @return - ID of the available slot or the lowest weight slot.
        *         
        *********************************************************************************************/
        private int FindAvailableSlot()
        {
            int slotToUse = -1;
            int lowestWeightSlot = 0;
            float lowestWeight = float.MaxValue;
            for(int i=0; i < MaxClips; ++i)
            {
                var playable = Mixer.GetInput(i);

                if(playable.IsValid())
                {
                    float weight = Mixer.GetInputWeight(i);
                    if(weight < lowestWeight)
                    {
                        lowestWeightSlot = i;
                        lowestWeight = weight;
                    }
                }
                else
                {
                    slotToUse = i;
                    return slotToUse;
                }
            }

            var playableToClear = Mixer.GetInput(lowestWeightSlot);
            Mixer.DisconnectInput(lowestWeightSlot);
            ClearPlayable(ref playableToClear);

            return lowestWeightSlot;
        }

    }//End of class: MxMLayer
}//End of namespace: MxM