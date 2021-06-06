:ArrayOb.273{6:Dictionary.4369{64 42:SLSProperty.286331392{:String.17{9 10 "131134360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "currentStage"}
 1.3 0.879999 4.8 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{12 13 "currentStage"}
#4{14 15 "ECAActionStage"}
#4{0 1 ""}
#4{0 1 ""}
#4{4 5 "null"}
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
:SLSInternalMember.286331409{#4{9 10 "119132408"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "navMeshAgent"}
 1.6 1.88 4.8 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "navMeshAgent"}
#4{12 13 "NavMeshAgent"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "155398201"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{32 33 "WaitForTriggeredAnimationContact"}
 1.3 0.879999 12.8 1  27 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 169 "\[\n
  // to be redefined in derived classes\n
\]"}
#4{32 34 "WaitForTriggeredAnimationContact"}
#4{12 21 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "86243960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "CreateAudioSource"}
 1.3 0.879999 6.8 28  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{267 268 "\[\n
    if (this.GetComponent<AudioSource>() != null)\n
    \[\n
        //Utility.LogWarning(\"GameObject already has an AudioSource assigned\");\n
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
#8{#4{9 10 "163856488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ToggleNavMesh"}
 0.3 0.879999 5.2 1  22 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{38 43 "\[\n
    navMeshAgent.enabled = enable;\n
\]"}
#4{13 14 "ToggleNavMesh"}
#4{4 5 "void"}
#4{11 12 "bool enable"}
#4{0 1 ""}
}
#3{#4{9 10 "164789480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{3 4 "Eca"}
 1.3 0.879999 1.2 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{3 4 "Eca"}
#4{3 4 "ECA"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "164808920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 11  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{76 77 "\[\n
    if (currentStage != null)\n
    \[\n
        currentStage.Update();\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMember.286331409{#4{8 9 "85942912"}
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
#9{#4{8 9 "85615464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "SetNavMeshAgent"}
 1.3 0.88 6 37  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{169 170 "\[\n
    navMeshAgent = GetComponent<NavMeshAgent>();\n
    if (navMeshAgent == null)\n
        Utility.LogError(\"No navMesh attached for ECA: \" + Eca.Name + \". CREATE ONE\");\n
\]"}
#4{15 16 "SetNavMeshAgent"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "155398200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{33 34 "WaitForTriggeredAnimationComplete"}
 1.3 0.879999 13.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 169 "\[\n
  // to be redefined in derived classes\n
\]"}
#4{33 34 "WaitForTriggeredAnimationComplete"}
#4{12 21 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86258648"}
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
#8{#4{9 10 "125104488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "HideText"}
 0.3 0.88 3.2 1  15 #4{0 1 ""}
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
#4{4 13 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{8 9 "86248456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetAnimator"}
 1.3 0.88 4.4 28  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{154 155 "\[\n
    mecanimAnimator = GetComponent<Animator>();\n
    if (mecanimAnimator == null)\n
        Utility.LogWarning(\"No animator found for ECA: \" + Eca.Name);\n
\]"}
#4{11 12 "SetAnimator"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#9{#4{8 9 "86248904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "ConfigureAudioSource"}
 1.3 0.879999 8 37  18 #4{0 1 ""}
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
#10{#4{9 10 "126676816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "ECAText"}
 1.3 1.88 2.8 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "ECAText"}
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
 0  0 #4{283 352 "using System;\n
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
//define all body parts of ECA\n
\t\t\tpublic enum BodyParts\n
\[\n
    Head,\n
    ArmL,\n
    ArmR\n
\]\n
"}
}
#10{#4{9 10 "118241984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "Player"}
 1.3 1.88 2.4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "Player"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86238488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 1.3 0.88 1.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{322 470 "\[\n
    Player = GameObject.FindGameObjectWithTag(\"Player\");\n
    Eca = GetComponent<ECA>();\n
    Eca.EmotionManager.GlobalEmotionUpdated += UpdateEmotionAnimation;\n
    CreateAudioSource();\n
    ConfigureAudioSource();\n
    ActivateTextPanel();\n
    SetAnimator();\n
    SetNavMeshAgent();\n
    UpdateEmotionAnimation(null, null);\n
\]"}
#4{4 5 "Init"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86238880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Play"}
 0.3 0.88 1.6 1  7 #4{0 1 ""}
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
#4{11 20 "IEnumerator"}
#4{69 70 "float[] audioData, string messageContent, Func<bool> condition = null"}
#4{0 1 ""}
}
#8{#4{9 10 "125111152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "PointAt"}
 1.3 0.879999 2.8 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 174 "\[\n
\]"}
#4{7 8 "PointAt"}
#4{12 13 "virtual void"}
#4{16 17 "Transform target"}
#4{0 1 ""}
}
#8{#4{8 9 "86260456"}
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
#8{#4{9 10 "164809312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ClearAnimationGroup"}
 1.3 0.879999 7.6 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 45 "\[\n
  // to be redefined in derived classes\n
\]"}
#4{19 20 "ClearAnimationGroup"}
#4{12 14 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "130421376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "RaiseEvent"}
 1.3 0.879999 4 15  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{293 294 "\[\n
    EventHandler handler = null;\n
    if (handlerName == \"TriggeredAnimationComplete\")\n
        handler = TriggeredAnimationComplete;\n
    else\n
    if (handlerName == \"TriggeredAnimationContact\")\n
        handler = TriggeredAnimationContact;\n
\n
    if (handler != null)\n
\t    handler(this, args);\n
\]"}
#4{10 11 "RaiseEvent"}
#4{4 5 "void"}
#4{34 35 "string handlerName, EventArgs args"}
#4{0 1 ""}
 0}
#8{#4{9 10 "155399768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "SetAnimationGroup"}
 1.3 0.879999 6.8 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 76 "\[\n
  // to be redefined in derived classes\n
\]"}
#4{17 18 "SetAnimationGroup"}
#4{12 14 "virtual void"}
#4{10 11 "string tag"}
#4{0 1 ""}
}
#8{#4{8 9 "86262616"}
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
#8{#4{9 10 "155399376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "TriggerAnimation"}
 1.3 0.879999 6.4 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{43 314 "\[\n
  // to be redefined in derived classes\n
\]"}
#4{16 24 "TriggerAnimation"}
#4{12 13 "virtual void"}
#4{54 55 "string id, Transform contact = null, string tag = null"}
#4{0 1 ""}
}
#8{#4{9 10 "125106448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ActivateTextPanel"}
 0.3 0.88 6.8 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{157 158 "\[\n
    if (TextPanel == null || ECAText == null)\n
        Utility.LogWarning(\"TextPanel or ECAText not setted\");\n
    else\n
        TextPanel.SetActive(false);\n
\]"}
#4{17 18 "ActivateTextPanel"}
#4{4 13 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86007528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public ECAAnimator : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  6.50453 4.14313 0
 0  0 #4{18 19 "public ECAAnimator"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#7{16 7#4{37 38 "public event EventHandler AudioEnded;"}
#4{37 38 "public event EventHandler HasArrived;"}
#4{38 39 "public event EventHandler IsLookingAt;"}
#4{39 40 "public event EventHandler EventContact;"}
#4{39 40 "public event EventHandler WaitComplete;"}
#4{53 54 "public event EventHandler TriggeredAnimationComplete;"}
#4{52 53 "public event EventHandler TriggeredAnimationContact;"}
}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#9{#4{8 9 "86239272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "UpdateEmotionAnimation"}
 1.3 0.879999 8.8 28  20 #4{0 1 ""}
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
#6{#4{9 10 "119129328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "CurrentAction"}
 1.4 1.88 5.2 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "CurrentAction"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "75582416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "DestroyObj"}
 0.3 0.879999 4 1  23 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[\n
    Destroy(obj);\n
\]"}
#4{10 11 "DestroyObj"}
#4{4 5 "void"}
#4{14 15 "GameObject obj"}
#4{0 1 ""}
}
#8{#4{9 10 "125110368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ShowText"}
 0.3 0.88 3.2 1  14 #4{0 1 ""}
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
#4{4 13 "void"}
#4{11 12 "string text"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "162267640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "WaitFor"}
 1.3 0.88 2.8 28  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{121 122 "\[\n
    yield return new WaitForSeconds(time);\n
    if (WaitComplete != null)\n
        WaitComplete(this, EventArgs.Empty);\n
\]"}
#4{7 8 "WaitFor"}
#4{11 12 "IEnumerator"}
#4{10 11 "float time"}
#4{0 1 ""}
}
#8{#4{9 10 "162274304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Wait"}
 1.3 0.879999 1.6 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{38 39 "\[\n
    StartCoroutine(WaitFor(time));\n
\]"}
#4{4 5 "Wait"}
#4{12 13 "virtual void"}
#4{10 11 "float time"}
#4{0 1 ""}
}
#8{#4{9 10 "162269992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "WaitLookAt"}
 1.3 0.879999 4 1  20 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 47 "\[\n
    yield return new WaitForSeconds(0.1f);\n
\]"}
#4{10 11 "WaitLookAt"}
#4{19 20 "virtual IEnumerator"}
#4{11 12 "Vector3 dir"}
#4{0 1 ""}
}
#8{#4{8 9 "86259040"}
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
#8{#4{9 10 "162273912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "LookAt"}
 1.3 0.879999 2.4 1  19 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 5 "\[\n
\]"}
#4{6 7 "LookAt"}
#4{12 13 "virtual void"}
#4{47 48 "Transform target = null, bool turnToSit = false"}
#4{0 1 ""}
}
#8{#4{8 9 "86258256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 488 "\[\n
    throw new NotImplementedException();\n
\]"}
#4{4 5 "GoTo"}
#4{12 13 "virtual void"}
#4{42 45 "Vector3 target, float arrivalDeltaDistance"}
#4{0 1 ""}
}
#10{#4{8 9 "75442312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "mecanimAnimator"}
 1.3 1.88 6 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "mecanimAnimator"}
#4{8 9 "Animator"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "163858448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "EndLookingAt"}
 1.3 0.88 4.8 37  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{76 77 "\[\n
    if (IsLookingAt != null)\n
        IsLookingAt(this, EventArgs.Empty);\n
\]"}
#4{12 13 "EndLookingAt"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#10{#4{9 10 "126678136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "TextPanel"}
 1.3 1.88 3.6 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "TextPanel"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @345 @202 @16 @0 #7{16 0}
#7{16 0}
#7{16 1@417 }
#7{16 8@51 @175 @163 @115 @366 @504 @285 @88 }
#7{16 2@24 @378 }
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @210 @0 @0 @0 @0 @0 @489 @0 @187 @0 @516 @0 @0 @0 @100 @0 @0 @0 }
#1{36@225 @237 @477 @139 @261 @453 @309 @333 @405 @151 @75 @3 @249 @465 @441 @429 @63 @393 @0 @0 @127 @39 @297 @321 @273 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{366 367 "/*      CG&VG group @ Politecnico di Torino               */\n
/*              All Rights Reserved\t                      */\n
/*                                                        */\n
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */\n
/*  The copyright notice above does not evidence any      */\n
/*  actual or intended publication of such source code.   */\n
"}
#7{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
