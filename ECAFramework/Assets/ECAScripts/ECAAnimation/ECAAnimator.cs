/* File ECAAnimator C# implementation of class ECAAnimator */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using CrazyMinnow.SALSA;
using UnityEngine.AI;
using DG.Tweening;
using MxM;


//define all body parts of ECA
			public enum BodyParts
{
    Head,
    ArmL,
    ArmR
}


// global declaration end

public class ECAAnimator : MonoBehaviour
{
    public event EventHandler AudioEnded;
    public event EventHandler AudioStart;
    public event EventHandler EventContact;
    public event EventHandler TriggeredAnimationComplete;
    public event EventHandler TriggeredAnimationContact;

    internal NavMeshAgent navMeshAgent;
    internal ECAAction actualAction;
    public string currentStageName; //for debugging

    public string actualActionName;

    public GameObject player;
    public Animator mecanimAnimator;
    public Text ECAText;
    public GameObject TextPanel;
    public AudioSource audioSource;

    protected virtual void CreateAudioSource()
    {
        if (this.GetComponent<AudioSource>() != null)
        {
            //Utility.LogWarning("GameObject already has an AudioSource assigned");
            audioSource = GetComponent<AudioSource>();
        }
        else
            audioSource = gameObject.AddComponent<AudioSource>();
    }


    protected virtual void ConfigureAudioSource()
    {
        if(audioSource == null)
        {
            Utility.LogError("You must create ad AudioSource first");
            return;
        }
    
        audioSource.playOnAwake = false;
        audioSource.loop = false;
        audioSource.spatialBlend = 0;
        audioSource.minDistance = 5;
        audioSource.maxDistance = 1000;
        audioSource.rolloffMode = AudioRolloffMode.Logarithmic;
    }


    protected virtual void SetAnimator()
    {
        mecanimAnimator = GetComponent<Animator>();
        if (mecanimAnimator == null)
            Utility.LogWarning("No animator found for ECA: " + Eca.Name);
    }


    protected virtual void SetNavMeshAgent()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();
        if (navMeshAgent == null)
            Utility.LogError("No navMesh attached for ECA: " + Eca.Name + ". CREATE ONE");
    }


    public virtual void OnEmotionChanged(ECAEmotion emotion)
    {
        actualAction.OnEmotionChanged(emotion);
    }

    public virtual void OnEmotionUpdated(ECAEmotion emotion)
    {
        actualAction.OnEmotionUpdated(emotion);
    }


    protected void RaiseEvent(string handlerName, EventArgs args)
    {
        EventHandler handler = null;
        if (handlerName == "TriggeredAnimationComplete")
            handler = TriggeredAnimationComplete;
        else
        if (handlerName == "TriggeredAnimationContact")
            handler = TriggeredAnimationContact;
    
        if (handler != null)
    	    handler(this, args);
    }


    protected void Update()
    {
        if (currentStage != null)
        {
            currentStageName = currentStage.ToString();
            if (currentStage.GetType().ToString() == "ECAParallelActionStage")
            {
                ECAParallelActionStage parallelStage = (ECAParallelActionStage)currentStage;
                foreach (var s in parallelStage.parallelStages)
                    s.Update();
            }
            else
            {
                currentStage.Update();
            }
        }
    }

    protected void LateUpdate()
    {
        if (currentStage != null)
        {
            if (currentStage.GetType().ToString() == "ECAParallelActionStage")
            {
                ECAParallelActionStage parallelStage = (ECAParallelActionStage)currentStage;
                foreach (var s in parallelStage.parallelStages)
                    s.LateUpdate();
            }
            else
            {
                currentStage.LateUpdate();
            }
        }
    }




    public virtual void Init()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        Eca = GetComponent<ECA>();
        CreateAudioSource();
        ConfigureAudioSource();
        ActivateTextPanel();
        SetAnimator();
        SetNavMeshAgent();
        //UpdateEmotionAnimation(null, null);
    }


    public IEnumerator Play(float[] audioData, string messageContent, Func<bool> condition = null)
    {
        //if condition for play audio not satisfied not play audio
        if (condition != null && !condition())
            yield return null;
    
        else if (audioSource != null)
        {
            Salsa3D salsa = this.GetComponent<Salsa3D>();
    
            var audioClip = AudioClip.Create("SynthesizedAudio", audioData.Length, 1, 16000, false);
            audioClip.SetData(audioData, 0);
            Utility.Log("Playing the Audio!!!");

            if (AudioStart != null)
                AudioStart(this, EventArgs.Empty);

            ShowText(messageContent);
            if (salsa != null)
            {
                //use SALSA -> pipsync
                salsa.SetAudioClip(audioClip);
                salsa.Play();
                yield return new WaitWhile(() => salsa.audioSrc.isPlaying);
            }
            else
            {
                //use Unity audioSource
                AudioSource audioSource = GetComponent<AudioSource>();
                audioSource.clip = audioClip;
                audioSource.Play();
                yield return new WaitWhile(() => audioSource.isPlaying);
            }
            Debug.Log("Audio ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            HideText();
        }
        else
            Utility.LogError("GameObject has not an AudioSource assigned");
    
        if (AudioEnded != null)
            AudioEnded(this, EventArgs.Empty);
    }


    public virtual bool IsWatchingSomewhere(Camera camera, Collider Traget)
    {
        Plane[] planes = GeometryUtility.CalculateFrustumPlanes(camera);
        if (GeometryUtility.TestPlanesAABB(planes, Traget.bounds))
            return true;
        else
            return false;
    }


    public virtual bool IsWatchingMe(Camera camera, float minDistance = 4f, Collider specificPartOfTheBody = null)
    {
          if (specificPartOfTheBody == null)
            specificPartOfTheBody = GetComponent<Collider>();
    
        if(specificPartOfTheBody == null)
        {
            Utility.LogError("No collider defined! provide it by -SpecificPartOfTheBody- parameters or attach a collider to this GameObject (" +this.gameObject.name+")");
            return false;
        }
    
        Plane[] planes = GeometryUtility.CalculateFrustumPlanes(camera);
        if (GeometryUtility.TestPlanesAABB(planes, specificPartOfTheBody.bounds) && 
            Vector3.Distance(camera.transform.position, specificPartOfTheBody.transform.position) < minDistance
            )
            return true;
        else
            return false;
    }


    public void ActivateTextPanel()
    {
        if (TextPanel == null || ECAText == null)
            Utility.LogWarning("TextPanel or ECAText not setted");
        else
            TextPanel.SetActive(false);
    }


    public void ShowText(string text)
    {
        if (TextPanel != null && ECAText != null)
        {
            TextPanel.SetActive(true);
            ECAText.text = text;
        }
    }


    public void HideText()
    {
        if (TextPanel != null && ECAText != null)
        {
            ECAText.text = "";
            TextPanel.SetActive(false);
        }
    }


    public ECA Eca
    {
      set; get;
    }


    public ECAActionStage currentStage
    {
        set;
        get;
    } = null;

    public void ToggleNavMesh(bool enable)
    {
        navMeshAgent.enabled = enable;
    }

    public void SetWeightLayerMecanicAnimator(int idLayer, float weightLayer)
    {
        StartCoroutine(LayerAnimator(idLayer, weightLayer));
    }

    IEnumerator LayerAnimator(int idLayer, float weightLayer)
    {

        float var = mecanimAnimator.GetLayerWeight(idLayer);

        if (var < weightLayer)
        {
            while (var < weightLayer)
            {
                mecanimAnimator.SetLayerWeight(idLayer, var);
                var += .01f;
                yield return new WaitForSeconds(.005f);
            }
        }
        else if (var > weightLayer)
        {
            while (var > weightLayer)
            {
                mecanimAnimator.SetLayerWeight(idLayer, var);
                var -= .01f;
                yield return new WaitForSeconds(.005f);
            }
        }
    }


    public void DestroyObj(GameObject obj)
    {
        Destroy(obj);
    }


    public virtual void WaitForTriggeredAnimationComplete()
    {
      // to be redefined in derived classes
    }


    public virtual void WaitForTriggeredAnimationContact()
    {
      // to be redefined in derived classes
    }


    public virtual void SetAnimationGroup(string tag)
    {
      // to be redefined in derived classes
    }


    public virtual void TriggerAnimation(string id, Transform contact = null, string tag = null)
    {
      // to be redefined in derived classes
    }


    public virtual void ClearAnimationGroup()
    {
      // to be redefined in derived classes
    }


}
