:ArrayOb.273{6:Dictionary.4369{64 31:JLSFriendDeclare.286331408{:String.17{8 9 "86133912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "119132408"}
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
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "86243960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "CreateAudioSource"}
 1.3 0.88 6.8 10  11 #4{0 1 ""}
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
:SLSPublicMethod.286331408{#4{9 10 "125106840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "EndLookAt"}
 1.3 0.879999 3.6 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{46 197 "\[\n
    yield return new WaitForSeconds(0.1f);\n
\]"}
#4{9 10 "EndLookAt"}
#4{19 20 "virtual IEnumerator"}
#4{11 12 "Vector3 dir"}
#4{0 1 ""}
}
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
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "85615464"}
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
#8{#4{9 10 "125104488"}
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
#4{4 13 "void"}
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
#8{#4{9 10 "125105664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "LookAt"}
 1.3 0.879999 2.4 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 396 "\[\n
\]"}
#4{6 7 "LookAt"}
#4{12 13 "virtual void"}
#4{55 56 "Transform target = null, bool oppositeDirection = false"}
#4{0 1 ""}
}
#7{#4{8 9 "86248456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetAnimator"}
 1.3 0.88 4.4 28  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{140 141 "\[\n
    Animator = GetComponent<Animator>();\n
    if (Animator == null)\n
        Utility.LogWarning(\"No animator found for ECA: \" + Eca.Name);\n
\]"}
#4{11 12 "SetAnimator"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{8 9 "86248904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "ConfigureAudioSource"}
 1.3 0.88 8 19  11 #4{0 1 ""}
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
#9{#4{9 10 "126676816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "ECAText"}
 1.3 1.88 2.8 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "ECAText"}
#4{4 5 "Text"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
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
 0  0 #4{281 352 "using System;\n
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
\tpublic enum BodyParts\n
\[\n
    Head,\n
    ArmL,\n
    ArmR\n
\]\n
"}
}
#5{#4{9 10 "119131968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "Eca"}
 3.4 1.88 1.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "Eca"}
#4{3 4 "ECA"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "118241984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "Player"}
 1.3 1.88 2.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "Player"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "86238488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 0.3 0.88 1.6 1  6 #4{0 1 ""}
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
#8{#4{9 10 "125106448"}
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
@0  5.63519 3.6499 0
 0  0 #4{18 19 "public ECAAnimator"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 5#4{37 38 "public event EventHandler AudioEnded;"}
#4{37 38 "public event EventHandler HasArrived;"}
#4{38 39 "public event EventHandler IsLookingAt;"}
#4{40 41 "public event EventHandler EventComplete;"}
#4{39 40 "public event EventHandler EventContact;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#7{#4{8 9 "86239272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "UpdateEmotionAnimation"}
 1.3 0.88 8.8 10  13 #4{0 1 ""}
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
#5{#4{9 10 "119129328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "CurrentAction"}
 1.4 1.88 5.2 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "CurrentAction"}
#4{9 10 "ECAAction"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
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
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "125110368"}
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
#4{4 13 "void"}
#4{11 12 "string text"}
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
#8{#4{8 9 "86258256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 488 "\[\n
\]"}
#4{4 5 "GoTo"}
#4{12 13 "virtual void"}
#4{42 45 "Vector3 target, float arrivalDeltaDistance"}
#4{0 1 ""}
}
#7{#4{9 10 "125107232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "SetEventDefinitions"}
 1.3 0.88 7.6 28  13 #4{0 1 ""}
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
#9{#4{8 9 "86219184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "Animator"}
 1.3 1.88 3.2 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "Animator"}
#4{8 9 "Animator"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "126678136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "TextPanel"}
 1.3 1.88 3.6 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "TextPanel"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @262 @152 @3 @0 #6{16 1@308 }
#6{16 3@160 @11 @293 }
#6{16 0}
#6{16 6@26 @125 @113 @65 @281 @359 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @175 @0 @0 @0 @0 @0 @0 @0 @137 @0 @386 @0 @371 @0 @50 @0 @0 @0 }
#1{36@190 @202 @347 @89 @226 @335 @238 @250 @323 @77 @101 @38 @214 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
