:ArrayOb.273{6:Dictionary.4369{64 51:SLSPublicMethod.286331408{:String.17{9 10 "125742456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "MxM_startStrafing"}
 1.3 0.88 6.8 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{269 270 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.SetRequiredTag(\"Strafe\");\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Strafe;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.TrajectoryHeading;\n
    m_animator.AngularErrorWarpRate = 360f;\n
\]"}
#4{17 18 "MxM_startStrafing"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86133912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "126676376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "m_trajectory"}
 1.3 1.88 4.8 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{12 13 "m_trajectory"}
#4{30 31 "MxMTrajectoryGenerator_BasicAI"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125744024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "MxM_SetTag"}
 1.3 0.88 4 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{75 76 "\[\n
    m_animator.ClearRequiredTags();\n
    m_animator.AddRequiredTag(tag);\n
\]"}
#4{10 11 "MxM_SetTag"}
#4{12 13 "virtual void"}
#4{10 11 "string tag"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "86243960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "CreateAudioSource"}
 1.3 0.88 6.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{265 266 "\[\n
    if (this.GetComponent<AudioSource>() != null)\n
    \[\n
        Utility.LogWarning(\"GameObject already has an AudioSource assigned\");\n
        audioSource = GetComponent<AudioSource>();\n
    \]\n
    else\n
        audioSource = gameObject.AddComponent<AudioSource>();\n
\]"}
#4{17 18 "CreateAudioSource"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "125741280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "WaitEventContact"}
 0.3 0.88 6.4 1  31 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{168 169 "\[\n
    while (m_animator.CurrentEventState != EEventState.Action)\n
        yield return null;\n
    if (EventContact != null)\n
        EventContact(this, EventArgs.Empty);\n
\]"}
#4{16 17 "WaitEventContact"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125106840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "EndLookAt"}
 1.3 0.88 3.6 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{196 197 "\[\n
    //DOVREI FARLO CON GLI ANGOLO E NON CON IL TEMPO\n
    yield return new WaitForSeconds(0.8f);\n
    MxM_stopStrafing();\n
    if (IsLookingAt != null)\n
        IsLookingAt(this, EventArgs.Empty);\n
\]"}
#4{9 10 "EndLookAt"}
#4{19 20 "virtual IEnumerator"}
#4{11 12 "Vector3 dir"}
#4{0 1 ""}
}
#6{#4{8 9 "85942912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "audioSource"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "audioSource"}
#4{11 12 "AudioSource"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "85615464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SetNavMeshAgent"}
 1.3 0.88 6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{52 53 "\[\n
    navMeshAgent = GetComponent<NavMeshAgent>();\n
\]"}
#4{15 16 "SetNavMeshAgent"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "125105664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "LookAt"}
 1.3 0.88 2.4 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{395 396 "\[\n
    //If the target is not specified, the ECA will look to the player\n
    if (target == null)\n
        target = Player.transform;\n
\n
    Vector3 dir = (target.position - this.transform.position).normalized;\n
\n
    MxM_startStrafing();\n
    if (!oppositeDirection)\n
        m_trajectory.StrafeDirection = dir;\n
    else\n
        m_trajectory.StrafeDirection = -dir;\n
    StartCoroutine(EndLookAt(dir));\n
\]"}
#4{6 7 "LookAt"}
#4{12 13 "virtual void"}
#4{55 56 "Transform target = null, bool oppositeDirection = false"}
#4{0 1 ""}
}
#3{#4{8 9 "86258648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "WaitArrival"}
 1.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{225 235 "\[\n
    if (deltaDistance > 0)\n
    \[\n
        while (Vector3.Distance(target, transform.position) >= deltaDistance)\n
            yield return null;\n
    \]\n
    else\n
        Utility.LogError(\"delta Distance <= 0\");\n
\n
    Arrived();\n
\]"}
#4{11 12 "WaitArrival"}
#4{19 20 "virtual IEnumerator"}
#4{35 38 "Vector3 target, float deltaDistance"}
#4{0 1 ""}
}
#3{#4{9 10 "125104488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "HideText"}
 1.3 0.88 3.2 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{124 125 "\[\n
    if (TextPanel != null && ECAText != null)\n
    \[\n
        ECAText.text = \"\";\n
        TextPanel.SetActive(false);\n
    \]\n
\]"}
#4{8 9 "HideText"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86248456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetAnimator"}
 1.3 0.88 4.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{139 140 "\[\n
    Animator = GetComponent<Animator>();\n
    if (Animator == null)\n
        Utility.LogWarning(\"No animator foud for ECA: \" + Eca.Name);\n
\]"}
#4{11 12 "SetAnimator"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "125738144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{25 26 "MXM_BeginEventWithContact"}
 1.3 0.88 10 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{192 193 "\[\n
    var eventDef = MxM_EventDefinitions[id];\n
\n
    eventDef.ClearContacts();\n
    eventDef.AddEventContact(contact.position, this.transform.rotation.y);\n
\n
    m_animator.BeginEvent(eventDef);\n
\]"}
#4{25 26 "MXM_BeginEventWithContact"}
#4{12 13 "virtual void"}
#4{28 29 "string id, Transform contact"}
#4{0 1 ""}
}
#8{#4{8 9 "86248904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "ConfigureAudioSource"}
 1.3 0.88 8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{356 357 "\[\n
    if(audioSource == null)\n
    \[\n
        Utility.LogError(\"You must create ad AudioSource first\");\n
        return;\n
    \]\n
\n
    audioSource.playOnAwake = false;\n
    audioSource.loop = false;\n
    audioSource.spatialBlend = 0;\n
    audioSource.minDistance = 5;\n
    audioSource.maxDistance = 1000;\n
    audioSource.rolloffMode = AudioRolloffMode.Logarithmic;\n
\]"}
#4{20 21 "ConfigureAudioSource"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "126675056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "m_animator"}
 1.3 1.88 4 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{10 11 "m_animator"}
#4{11 12 "MxMAnimator"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "125745200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{27 28 "SetMxMAnimatorAndTrajectory"}
 1.3 0.88 10.8 37  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{333 334 "\[\n
    m_animator = GetComponent<MxMAnimator>();\n
    if (m_animator == null)\n
        Utility.LogWarning(\"No MxM animator found for ECA: \" + Eca.Name);\n
\n
    m_trajectory = GetComponent<MxMTrajectoryGenerator_BasicAI>();\n
    if (m_animator == null)\n
        Utility.LogWarning(\"No MxM trajectory generator found for ECA: \" + Eca.Name);\n
\]"}
#4{27 28 "SetMxMAnimatorAndTrajectory"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "126676816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "ECAText"}
 1.3 1.88 2.8 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{7 8 "ECAText"}
#4{4 5 "Text"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86132376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{351 352 "/* File ECAAnimator C# implementation of class ECAAnimator */\n
\n
\n
\n
\n
\n
\n
using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
using CrazyMinnow.SALSA;\n
using UnityEngine.AI;\n
using DG.Tweening;\n
using MxM;\n
\n
\n
\n
//define all body parts of ECA\n
\tpublic enum BodyParts\n
\[\n
    Head,\n
    ArmL,\n
    ArmR\n
\]\n
\n
"}
}
#6{#4{9 10 "118241984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "Player"}
 1.3 1.88 2.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{6 7 "Player"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125744416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "MxM_waitForEventContact"}
 1.3 0.88 9.2 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 44 "\[\n
    StartCoroutine(WaitEventContact());\n
\]"}
#4{23 24 "MxM_waitForEventContact"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125111152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "PointAt"}
 1.3 0.88 2.8 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{173 174 "\[\n
    if (PartsOfTheBody.ContainsKey(BodyParts.ArmL))\n
        PartsOfTheBody[BodyParts.ArmL].transform.LookAt(target);\n
    else\n
        Utility.LogWarning(\"NO ARM FOUND\");\n
\]"}
#4{7 8 "PointAt"}
#4{12 13 "virtual void"}
#4{16 17 "Transform target"}
#4{0 1 ""}
}
#3{#4{8 9 "86238880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Play"}
 1.3 0.88 1.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1206 1207 "\[\n
    //if condition for play audio not satisfied not play audio\n
    if (condition != null && !condition())\n
        yield return null;\n
\n
    else if (audioSource != null)\n
    \[\n
        Salsa3D salsa = this.GetComponent<Salsa3D>();\n
\n
        var audioClip = AudioClip.Create(\"SynthesizedAudio\", audioData.Length, 1, 16000, false);\n
        audioClip.SetData(audioData, 0);\n
        Utility.Log(\"Playing the Audio!!!\");\n
        ShowText(messageContent);\n
        if (salsa != null)\n
        \[\n
            //use SALSA -> pipsync\n
            salsa.SetAudioClip(audioClip);\n
            salsa.Play();\n
            yield return new WaitWhile(() => salsa.audioSrc.isPlaying);\n
        \]\n
        else\n
        \[\n
            //use Unity audioSource\n
            AudioSource audioSource = GetComponent<AudioSource>();\n
            audioSource.clip = audioClip;\n
            audioSource.Play();\n
            yield return new WaitWhile(() => audioSource.isPlaying);\n
        \]\n
        Debug.Log(\"Audio ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\");\n
        HideText();\n
    \]\n
    else\n
        Utility.LogError(\"GameObject has not an AudioSource assigned\");\n
\n
    if (AudioEnded != null)\n
        AudioEnded(this, EventArgs.Empty);\n
\]"}
#4{4 5 "Play"}
#4{19 20 "virtual IEnumerator"}
#4{69 70 "float[] audioData, string messageContent, Func<bool> condition = null"}
#4{0 1 ""}
}
#3{#4{8 9 "86238488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 0.3 0.88 1.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{469 470 "\[\n
    Player = GameObject.FindGameObjectWithTag(\"Player\");\n
    Eca = GetComponent<ECA>();\n
    Eca.EmotionManager.GlobalEmotionUpdated += UpdateEmotionAnimation;\n
    CreateAudioSource();\n
    ConfigureAudioSource();\n
    ActivateTextPanel();\n
    SetAnimator();\n
    SetBodyElements();\n
    SetNavMeshAgent();\n
    UpdateEmotionAnimation(null, null);\n
\n
    //MxM setup\n
    SetMxMAnimatorAndTrajectory();\n
    SetEventDefinitions();\n
\n
    IK_manager = GetComponent<IKManager>();\n
\]"}
#4{4 5 "Init"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "86260456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Arrived"}
 1.3 0.88 2.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{368 369 "\[\n
    Utility.Log(Eca.name + \" Arrived to destination!\");\n
    if (navMeshAgent == null || navMeshAgent.enabled == false)\n
        Utility.LogWarning(\"No navMeshAgent found. Add NamMeshAgent or override this method if you wont to use your policy\");\n
    else\n
        navMeshAgent.isStopped = true;\n
\n
    if (HasArrived != null)\n
        HasArrived(this, EventArgs.Empty);\n
\]"}
#4{7 8 "Arrived"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125740104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "WaitEventComplete"}
 0.3 0.88 6.8 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{147 148 "\[\n
    while (!m_animator.IsEventComplete)\n
        yield return null;\n
    if (EventComplete != null)\n
        EventComplete(this, EventArgs.Empty);\n
\]"}
#4{17 18 "WaitEventComplete"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125744808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "MXM_BeginEventWithContactAndTag"}
 1.3 0.88 12.4 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{265 266 "\[\n
    var eventDef = MxM_EventDefinitions[id];\n
\n
    eventDef.ClearContacts();\n
    eventDef.AddEventContact(contact.position, this.transform.rotation.y);\n
\n
    m_animator.BeginEvent(eventDef);\n
\n
    m_animator.ClearRequiredTags();\n
    m_animator.AddRequiredTag(tag);\n
\]"}
#4{31 32 "MXM_BeginEventWithContactAndTag"}
#4{12 13 "virtual void"}
#4{41 42 "string id , Transform contact, string tag"}
#4{0 1 ""}
}
#3{#4{8 9 "86262616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "IsWatchingMe"}
 1.3 0.88 4.8 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{663 664 "\[\n
      if (specificPartOfTheBody == null)\n
        specificPartOfTheBody = GetComponent<Collider>();\n
\n
    if(specificPartOfTheBody == null)\n
    \[\n
        Utility.LogError(\"No collider defined! provide it by -SpecificPartOfTheBody- parameters or attach a collider to this GameObject (\" +this.gameObject.name+\")\");\n
        return false;\n
    \]\n
\n
    Plane[] planes = GeometryUtility.CalculateFrustumPlanes(camera);\n
    if (GeometryUtility.TestPlanesAABB(planes, specificPartOfTheBody.bounds) && \n
        Vector3.Distance(camera.transform.position, specificPartOfTheBody.transform.position) < minDistance\n
        )\n
        return true;\n
    else\n
        return false;\n
\]"}
#4{12 13 "IsWatchingMe"}
#4{12 13 "virtual bool"}
#4{76 77 "Camera camera, float minDistance = 4f, Collider specificPartOfTheBody = null"}
#4{0 1 ""}
}
#6{#4{9 10 "118242424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{20 21 "MxM_EventDefinitions"}
 1.3 1.88 8 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{20 21 "MxM_EventDefinitions"}
#4{38 39 "Dictionary<String, MxMEventDefinition>"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{45 46 " new Dictionary<String, MxMEventDefinition>()"}
#4{0 1 ""}
}
#3{#4{9 10 "125106448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ActivateTextPanel"}
 1.3 0.88 6.8 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{157 158 "\[\n
    if (TextPanel == null || ECAText == null)\n
        Utility.LogWarning(\"TextPanel or ECAText not setted\");\n
    else\n
        TextPanel.SetActive(false);\n
\]"}
#4{17 18 "ActivateTextPanel"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "118243744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "PartsOfTheBody"}
 1.3 1.88 5.6 1  24 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "PartsOfTheBody"}
#4{33 34 "Dictionary<BodyParts, GameObject>"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{40 41 " new Dictionary<BodyParts, GameObject>()"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86007528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public ECAAnimator : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  4.40362 -100 0
 0  0 #4{18 19 "public ECAAnimator"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#7{16 5#4{37 38 "public event EventHandler AudioEnded;"}
#4{37 38 "public event EventHandler HasArrived;"}
#4{38 39 "public event EventHandler IsLookingAt;"}
#4{40 41 "public event EventHandler EventComplete;"}
#4{39 40 "public event EventHandler EventContact;"}
}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#6{#4{9 10 "126677256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "IK_manager"}
 1.3 1.88 4 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{10 11 "IK_manager"}
#4{9 10 "IKManager"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86239272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "UpdateEmotionAnimation"}
 1.3 0.88 8.8 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{143 144 "\[\n
    //Manage here emotion updating!!\n
    //GameObject.FindObjectOfType<GuiDebug>().ShowEmotion(Eca.Name, Eca.EmotionManager.ActualEmotion);\n
\]"}
#4{22 23 "UpdateEmotionAnimation"}
#4{12 13 "virtual void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
#3{#4{9 10 "125743632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "MxM_stopStrafing"}
 1.3 0.88 6.4 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{224 225 "\[\n
    m_animator.ClearRequiredTags();\n
    m_trajectory.TrajectoryMode = ETrajectoryMoveMode.Normal;\n
    m_animator.AngularErrorWarpMethod = EAngularErrorWarpMethod.CurrentHeading;\n
    m_animator.AngularErrorWarpRate = 45f;\n
\]"}
#4{16 17 "MxM_stopStrafing"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "86218744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "navMeshAgent"}
 1.6 1.88 4.8 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "navMeshAgent"}
#4{12 13 "NavMeshAgent"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125110368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ShowText"}
 1.3 0.88 3.2 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{125 126 "\[\n
    if (TextPanel != null && ECAText != null)\n
    \[\n
        TextPanel.SetActive(true);\n
        ECAText.text = text;\n
    \]\n
\]"}
#4{8 9 "ShowText"}
#4{12 13 "virtual void"}
#4{11 12 "string text"}
#4{0 1 ""}
}
#11{#4{8 9 "86215664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "Eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "Eca"}
#4{3 4 "ECA"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125739320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MXM_BeginEventWithTag"}
 1.3 0.88 8.4 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{158 159 "\[\n
    var eventDef = MxM_EventDefinitions[id];\n
    m_animator.BeginEvent(eventDef);\n
\n
    m_animator.ClearRequiredTags();\n
    m_animator.AddRequiredTag(tag);\n
\]"}
#4{21 22 "MXM_BeginEventWithTag"}
#4{12 13 "virtual void"}
#4{21 22 "string id, string tag"}
#4{0 1 ""}
}
#3{#4{8 9 "86259040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "IsWatchingSomewhere"}
 1.3 0.88 7.6 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{187 188 "\[\n
    Plane[] planes = GeometryUtility.CalculateFrustumPlanes(camera);\n
    if (GeometryUtility.TestPlanesAABB(planes, Traget.bounds))\n
        return true;\n
    else\n
        return false;\n
\]"}
#4{19 20 "IsWatchingSomewhere"}
#4{12 13 "virtual bool"}
#4{30 31 "Camera camera, Collider Traget"}
#4{0 1 ""}
}
#3{#4{8 9 "86258256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{487 488 "\[\n
    if (navMeshAgent == null || navMeshAgent.enabled == false)\n
    \[\n
        Utility.LogWarning(\"No nav mash agent found for ECA: \" + Eca.name + \". Teleportation applied.\");\n
        transform.DOMove(target, 3f);\n
        //this.transform.position = new Vector3(target.position.x, transform.position.y, target.position.z);\n
        Arrived();\n
    \]\n
    else\n
    \[\n
        navMeshAgent.SetDestination(target);\n
        StartCoroutine(WaitArrival(target, arrivalDeltaDistance+0.5f));\n
    \]\n
\]"}
#4{4 5 "GoTo"}
#4{12 13 "virtual void"}
#4{42 45 "Vector3 target, float arrivalDeltaDistance"}
#4{0 1 ""}
}
#3{#4{9 10 "125740888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "MxM_BeginEvent"}
 1.3 0.88 5.6 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{85 86 "\[\n
    var eventDef = MxM_EventDefinitions[id];\n
    m_animator.BeginEvent(eventDef);\n
\]"}
#4{14 15 "MxM_BeginEvent"}
#4{12 13 "virtual void"}
#4{9 10 "string id"}
#4{0 1 ""}
}
#8{#4{9 10 "125107232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "SetEventDefinitions"}
 1.3 0.88 7.6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{310 311 "\[\n
    foreach (EventDefinitions eventDef in (EventDefinitions[])Enum.GetValues(typeof(EventDefinitions)))\n
    \[\n
        string s = eventDef.ToString();\n
        MxMEventDefinition ed = Resources.Load<MxMEventDefinition>(\"EventsDefinitions/EventDef_\" + eventDef);\n
        MxM_EventDefinitions.Add(s, ed);\n
    \]\n
\]"}
#4{19 20 "SetEventDefinitions"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "125109584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SetBodyElements"}
 1.3 0.88 6 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{151 152 "\[\n
    PartsOfTheBody.Add(BodyParts.Head, transform.GetChild(0).gameObject);\n
    PartsOfTheBody.Add(BodyParts.ArmL, transform.GetChild(1).gameObject);\n
\]"}
#4{15 16 "SetBodyElements"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "125738536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_removeRequiredTag"}
 1.3 0.88 8.4 1  27 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{42 43 "\[\n
    m_animator.RemoveRequiredTag(tag);\n
\]"}
#4{21 22 "MxM_removeRequiredTag"}
#4{12 13 "virtual void"}
#4{10 11 "String tag"}
#4{0 1 ""}
}
#3{#4{9 10 "125738928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "MxM_waitForEventComplete"}
 1.3 0.88 9.6 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 45 "\[\n
    StartCoroutine(WaitEventComplete());\n
\]"}
#4{24 25 "MxM_waitForEventComplete"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125739712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "MxM_clearRequiredTags"}
 1.3 0.88 8.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 40 "\[\n
    m_animator.ClearRequiredTags();\n
\]"}
#4{21 22 "MxM_clearRequiredTags"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "86219184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "Animator"}
 1.3 1.88 3.2 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "Animator"}
#4{8 9 "Animator"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "126678136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "TextPanel"}
 1.3 1.88 3.6 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{9 10 "TextPanel"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "125743240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "IK_setWeight"}
 0.3 0.88 4.8 1  33 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 42 "\[\n
    IK_manager.SetChairWeight(OnOff);\n
\]"}
#4{12 13 "IK_setWeight"}
#4{4 5 "void"}
#4{10 11 "bool OnOff"}
#4{0 1 ""}
}
#3{#4{9 10 "125745592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "IK_setEffectors"}
 0.3 0.88 6 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{59 60 "\[\n
    IK_manager.setChairEffectors(hips, l_foot, r_foot);\n
\]"}
#4{15 16 "IK_setEffectors"}
#4{4 5 "void"}
#4{50 51 "Transform hips, Transform l_foot, Transform r_foot"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @388 @227 @15 @0 #7{16 2@473 @446 }
#7{16 0}
#7{16 0}
#7{16 8@50 @173 @149 @101 @422 @548 @536 @200 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @346 @0 @373 @0 @235 @0 @407 @0 @23 @0 @185 @0 @212 @0 @611 @0 @596 @0 @86 @0 @0 @0 }
#1{36@286 @274 @512 @125 @298 @500 @334 @361 @461 @137 @113 @74 @262 @524 @161 @322 @488 @38 @3 @434 @584 @560 @572 @310 @250 @62 @638 @626 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
