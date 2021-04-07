/* File ECAAnimator C# implementation of class ECAAnimator */



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

// global declaration end

//define all body parts of ECA
public enum BodyParts
{
    Head,
    ArmL,
    ArmR
}

public class ECAAnimator : MonoBehaviour
{
    public event EventHandler AudioEnded;
    public event EventHandler HasArrived;
    public event EventHandler IsLookingAt;
    public event EventHandler EventComplete;
    public event EventHandler EventContact;

    public GameObject TextPanel;
    public Text ECAText;

    private ECA Eca;
    private NavMeshAgent navMeshAgent;

    public Animator Animator;
    public AudioSource audioSource;

    public MxMAnimator m_animator;
    public MxMTrajectoryGenerator_BasicAI m_trajectory;

    public GameObject Player;

    public Dictionary<BodyParts, GameObject> PartsOfTheBody = new Dictionary<BodyParts, GameObject>();
    public Dictionary<String, MxMEventDefinition> MxM_EventDefinitions = new Dictionary<String, MxMEventDefinition>();

    //Settings
    /// <summary>
    /// Create an AudioSource in order to speech. If an audio source has already been applied to the object, this is used
    /// </summary>
    protected virtual void CreateAudioSource()
    {
        if (this.GetComponent<AudioSource>() != null)
        {
            Utility.LogWarning("GameObject already has an AudioSource assigned");
            audioSource = GetComponent<AudioSource>();
        }
        else
            audioSource = gameObject.AddComponent<AudioSource>();
    }
    /// <summary>
    /// Override this methond if you want customize audioSource parameters
    /// </summary>
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
        Animator = GetComponent<Animator>();
        if (Animator == null)
            Utility.LogWarning("No animator foud for ECA: " + Eca.Name);
    }
    /// <summary>
    /// Override this method to define the body parts of the agent. Associate an enum in <see cref="BodyParts"/> with related gameObject
    /// in oreder to init <see cref="PartsOfTheBody"/>. Usefull for example in order to implement: <see cref="LookAt(Transform)"/>, <see cref="PointAt(Transform)"/>
    /// </summary>
    protected virtual void SetBodyElements()
    {
        PartsOfTheBody.Add(BodyParts.Head, transform.GetChild(0).gameObject);
        PartsOfTheBody.Add(BodyParts.ArmL, transform.GetChild(1).gameObject);
    }
    protected virtual void SetNavMeshAgent()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();
    }

    /// <summary>
    /// Called whenever an event causes the emotional state of the ECA to be updated
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected virtual void UpdateEmotionAnimation(object sender, EventArgs e)
    {
        //Manage here emotion updating!!
        //GameObject.FindObjectOfType<GuiDebug>().ShowEmotion(Eca.Name, Eca.EmotionManager.ActualEmotion);
    }

    /// <summary>
    /// Called in ECAGameManager to init all the variables we neew
    /// </summary>
    public void Init()
    {
        Player = GameObject.FindGameObjectWithTag("Player");
        Eca = GetComponent<ECA>();
        Eca.EmotionManager.GlobalEmotionUpdated += UpdateEmotionAnimation;
        CreateAudioSource();
        ConfigureAudioSource();
        ActivateTextPanel();
        SetAnimator();
        SetBodyElements();
        SetNavMeshAgent();
        UpdateEmotionAnimation(null, null);

        //MxM setup
        SetMxMAnimatorAndTrajectory();
        SetEventDefinitions();
    }

    // TEXT DISPLAY:

    /// <summary>
    /// Active (-> show) optional text panel used to contain text to speech.
    /// </summary>
    public virtual void ActivateTextPanel()
    {
        if (TextPanel == null || ECAText == null)
            Utility.LogWarning("TextPanel or ECAText not setted");
        else
            TextPanel.SetActive(false);
    }
    /// <summary>
    /// Show text to speech in ECA related text panel.
    /// </summary>
    /// <param name="text">text pronounced by ECA</param>
    public virtual void ShowText(string text)
    {
        if (TextPanel != null && ECAText != null)
        {
            TextPanel.SetActive(true);
            ECAText.text = text;
        }
    }
    /// <summary>
    /// Hide textPanel and reset text value.
    /// </summary>
    public virtual void HideText()
    {
        if (TextPanel != null && ECAText != null)
        {
            ECAText.text = "";
            TextPanel.SetActive(false);
        }
    }
    
    //TEXT DISPLAY END

    //AUDIO PLAY:

    /// <summary>
    /// 
    /// </summary>
    /// <param name="audioData">audio version of the message</param>
    /// <param name="messageContent">string version of the message</param>
    /// <returns></returns>
    public virtual IEnumerator Play(float[] audioData, string messageContent, Func<bool> condition = null)
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
    
    //AUDIO PLAY END:

    //MOVEMENTS:
    /// <summary>
    /// With NavMeshAgent: send the eca to the specified target until it reaches a distance of <paramref name="arrivalDeltaDistance"/>
    /// Without NavMesh: teleportation is applied
    /// In both cases, the method <see cref="Arrived"/> is launched when the agent arrives at the destination
    /// </summary>
    /// <param name="target"></param>
    /// <param name="arrivalDeltaDistance"></param>
    public virtual void GoTo(Vector3 target, float arrivalDeltaDistance)
    {
        if (navMeshAgent == null || navMeshAgent.enabled == false)
        {
            Utility.LogWarning("No nav mash agent found for ECA: " + Eca.name + ". Teleportation applied.");
            transform.DOMove(target, 3f);
            //this.transform.position = new Vector3(target.position.x, transform.position.y, target.position.z);
            Arrived();
        }
        else
        {
            navMeshAgent.SetDestination(target);
            StartCoroutine(WaitArrival(target, arrivalDeltaDistance+0.5f));
        }
    }
    /// <summary>
    /// Waits until the ECA has arrived to the destination target
    /// </summary>
    /// <param name="target"></param>
    /// <param name="deltaDistance"></param>
    /// <returns></returns>
    public virtual IEnumerator WaitArrival(Vector3 target, float deltaDistance)
    {
        if (deltaDistance > 0)
        {
            while (Vector3.Distance(target, transform.position) >= deltaDistance)
                yield return null;
        }
        else
            Utility.LogError("delta Distance <= 0");

        Arrived();
    }
    /// <summary>
    /// Called when eca arrive to the target specified by <see cref="GoTo(Transform, float)"/>
    /// </summary>
    public virtual void Arrived()
    {
        Utility.Log(Eca.name + " Arrived to destination!");
        if (navMeshAgent == null || navMeshAgent.enabled == false)
            Utility.LogWarning("No navMeshAgent found. Add NamMeshAgent or override this method if you wont to use your policy");
        else
            navMeshAgent.isStopped = true;

        if (HasArrived != null)
            HasArrived(this, EventArgs.Empty);
    }
    //MOVEMENTS END


    //VISION CAPABILITY:

    public virtual bool IsWatchingSomewhere(Camera camera, Collider Traget)
    {
        Plane[] planes = GeometryUtility.CalculateFrustumPlanes(camera);
        if (GeometryUtility.TestPlanesAABB(planes, Traget.bounds))
            return true;
        else
            return false;
    }
    /// <summary>
    /// To check if the ECA is observed by someone
    /// </summary>
    /// <param name="camera">defines the point of view from which one could be observed</param>
    /// <param name="minDistance">minimum distance at which the camera must be so that it can be assumed that you are being watched</param>
    /// <param name="specificPartOfTheBody">if you want to specify a particular area of the body that needs to be looked at</param>
    /// <returns></returns>
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
    /// <summary>
    /// Look at target position. If target==null, ECA will look to the player, otherwise the ECA will look to the specified target.
    /// If <paramref name="oppositeDirection"/> = true, then i will look at the opposite direction of the target
    /// </summary>
    /// <param name="target"></param>
    public virtual void LookAt(Transform target = null, bool oppositeDirection = false)
    {
        /* if (PartsOfTheBody.ContainsKey(BodyParts.Head))
             PartsOfTheBody[BodyParts.Head].transform.DOLookAt(target.position, 1f);
         else
             Utility.LogWarning("NO HEAD FOUND");*/

        //If the target is not specified, the ECA will look to the player
        if (target == null)
            target = Player.transform;

        Vector3 dir = (target.position - this.transform.position).normalized;

        MxM_startStrafing();
        if (!oppositeDirection)
            m_trajectory.StrafeDirection = dir;
        else
            m_trajectory.StrafeDirection = -dir;
        StartCoroutine(EndLookAt());
    }
    /// <summary>
    /// Waits for the ECA to turn in the given direction of the LookAt method, then trows the event IsLookingAt
    /// </summary>
    /// <returns></returns>
    public virtual IEnumerator EndLookAt()
    {
        //DOVREI FARLO CON GLI ANGOLO E NON CON IL TEMPO
        yield return new WaitForSeconds(2.5f);
        MxM_stopStrafing();
        if (IsLookingAt != null)
            IsLookingAt(this, EventArgs.Empty);
    }

    //VISION CAPABILITY END


    //BODY GESTURES:

    /// <summary>
    /// Default <see cref="BodyParts"/> used = ArmL
    /// </summary>
    /// <param name="target"></param>
    public virtual void PointAt(Transform target)
    {
        if (PartsOfTheBody.ContainsKey(BodyParts.ArmL))
            PartsOfTheBody[BodyParts.ArmL].transform.LookAt(target);
        else
            Utility.LogWarning("NO ARM FOUND");
    }

    //BODY GESTURES END

    //MxM METHODS BEGIN

    protected void SetEventDefinitions()
    {
        foreach (EventDefinitions eventDef in (EventDefinitions[])Enum.GetValues(typeof(EventDefinitions)))
        {
            string s = eventDef.ToString();
            MxMEventDefinition ed = Resources.Load<MxMEventDefinition>("EventsDefinitions/EventDef_" + eventDef);
            MxM_EventDefinitions.Add(s, ed);
        }
    }

    protected void SetMxMAnimatorAndTrajectory()
    {
        m_animator = GetComponent<MxMAnimator>();
        if (m_animator == null)
            Utility.LogWarning("No MxM animator found for ECA: " + Eca.Name);

        m_trajectory = GetComponent<MxMTrajectoryGenerator_BasicAI>();
        if (m_animator == null)
            Utility.LogWarning("No MxM trajectory generator found for ECA: " + Eca.Name);
    }

    public virtual void MxM_BeginEvent(string id)
    {
        var eventDef = MxM_EventDefinitions[id];
        m_animator.BeginEvent(eventDef);
    }

    public virtual void MXM_BeginEventWithContact(string id, Transform contact)
    {
        var eventDef = MxM_EventDefinitions[id];

        eventDef.ClearContacts();
        eventDef.AddEventContact(contact.position, this.transform.rotation.y);

        m_animator.BeginEvent(eventDef);
    }

    public virtual void MXM_BeginEventWithContactAndTag(string id , Transform contact, string tag)
    {
        var eventDef = MxM_EventDefinitions[id];

        eventDef.ClearContacts();
        eventDef.AddEventContact(contact.position, this.transform.rotation.y);

        m_animator.BeginEvent(eventDef);

        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public virtual void MXM_BeginEventWithTag(string id, string tag)
    {
        var eventDef = MxM_EventDefinitions[id];
        m_animator.BeginEvent(eventDef);

        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public virtual void MxM_SetTag(string tag)
    {
        m_animator.ClearRequiredTags();
        m_animator.AddRequiredTag(tag);
    }

    public virtual void MxM_startStrafing()
    {
        m_animator.ClearRequiredTags();
        m_animator.SetRequiredTag("Strafe");
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;
        m_animator.AngularErrorWarpRate = 360f;
    }

    public virtual void MxM_stopStrafing()
    {
        m_animator.ClearRequiredTags();
        m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;
        m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;
        m_animator.AngularErrorWarpRate = 45f;
    }

    public virtual void MxM_clearRequiredTags()
    {
        m_animator.ClearRequiredTags();
    }

    public virtual void MxM_removeRequiredTag(String tag)
    {
        m_animator.RemoveRequiredTag(tag);
    }

    public virtual void MxM_waitForEventComplete()
    {
        StartCoroutine(WaitEventComplete());
    }

    public virtual void MxM_waitForEventContact()
    {
        StartCoroutine(WaitEventContact());
    }

    public IEnumerator WaitEventComplete()
    {
        while(!m_animator.IsEventComplete)
            yield return null;
        if (EventComplete != null)
            EventComplete(this, EventArgs.Empty);
    }

    public IEnumerator WaitEventContact()
    {
        while (m_animator.CurrentEventState != EEventState.Action)
            yield return null;
        if (EventContact != null)
            EventContact(this, EventArgs.Empty);
    }
}
