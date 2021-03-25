:ArrayOb.273{6:Dictionary.4369{32 19:SLSProtectMethod.286331408{:String.17{8 9 "86248456"}
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
#3{#4{8 9 "86239272"}
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
#3{#4{8 9 "85615464"}
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
:OrderedCltn.4369{16 0}
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
:SLSPublicMethod.286331408{#4{8 9 "86258256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "GoTo"}
 1.3 0.88 1.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{451 452 "\[\n
    if (navMeshAgent == null || navMeshAgent.enabled == false)\n
    \[\n
        Utility.LogWarning(\"No nav mash agent found for ECA: \" + Eca.name + \". Teleportation applied.\");\n
        this.transform.position = new Vector3(target.position.x, transform.position.y, target.position.z);\n
        Arrived();\n
    \]\n
    else\n
    \[\n
        navMeshAgent.SetDestination(target.position);\n
        StartCoroutine(WaitArrival(target, arrivalDeltaDistance));\n
    \]\n
\]"}
#4{4 5 "GoTo"}
#4{12 13 "virtual void"}
#4{44 45 "Transform target, float arrivalDeltaDistance"}
#4{0 1 ""}
}
#8{#4{8 9 "86260456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Arrived"}
 1.3 0.88 2.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{296 297 "\[\n
    Utility.Log(Eca.name + \" Arrived to destination!\");\n
    if (navMeshAgent == null || navMeshAgent.enabled == false)\n
        Utility.LogWarning(\"No navMeshAgent found. Add NamMeshAgent or override this method if you wont to use your policy\");\n
    else\n
        navMeshAgent.isStopped = true;\n
\]"}
#4{7 8 "Arrived"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86132376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{218 219 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
using CrazyMinnow.SALSA;\n
using UnityEngine.AI;\n
/// <summary>\n
/// The eca animator shol\n
/// </summary>\n
\n
"}
}
#8{#4{8 9 "86238488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 0.3 0.88 1.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{240 241 "\[\n
    Eca = GetComponent<ECA>();\n
    Eca.EmotionManager.GlobalEmotionUpdated += UpdateEmotionAnimation;\n
    CreateAudioSource();\n
    ConfigureAudioSource();\n
    SetAnimator();\n
    SetNavMeshAgent();\n
    UpdateEmotionAnimation(null, null);\n
\]"}
#4{4 5 "Init"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "86248904"}
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
#5{#4{8 9 "86219184"}
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
#8{#4{8 9 "86258648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "WaitArrival"}
 1.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{234 235 "\[\n
    if (deltaDistance > 0)\n
    \[\n
        while (Vector3.Distance(target.position, transform.position) >= deltaDistance)\n
            yield return null;\n
    \]\n
    else\n
        Utility.LogError(\"delta Distance <= 0\");\n
\n
    Arrived();\n
\]"}
#4{11 12 "WaitArrival"}
#4{19 20 "virtual IEnumerator"}
#4{37 38 "Transform target, float deltaDistance"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86007528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public ECAAnimator : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  4.40362 4.24178 0
 0  0 #4{18 19 "public ECAAnimator"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 1#4{37 38 "public event EventHandler AudioEnded;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#7{#4{8 9 "86215664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "Eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
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
:JLSFriendDeclare.286331408{#4{8 9 "86133912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#8{#4{8 9 "86238880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Play"}
 1.3 0.88 1.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{946 947 "\[\n
    if (audioSource != null)\n
    \[\n
        Salsa3D salsa = this.GetComponent<Salsa3D>();\n
\n
        var audioClip = AudioClip.Create(\"SynthesizedAudio\", audioData.Length, 1, 16000, false);\n
        audioClip.SetData(audioData, 0);\n
        Utility.Log(\"Playing the Audio!!!\");\n
        if (salsa != null)\n
        \[\n
            salsa.SetAudioClip(audioClip);\n
            salsa.Play();\n
            yield return new WaitWhile(() => salsa.audioSrc.isPlaying);\n
        \]\n
        else\n
        \[\n
            AudioSource audioSource = GetComponent<AudioSource>();\n
            audioSource.clip = audioClip;\n
            audioSource.Play();\n
            yield return new WaitWhile(() => audioSource.isPlaying);\n
        \]\n
        Debug.Log(\"Audio ended!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\");\n
    \]\n
    else\n
        Utility.LogError(\"GameObject already has an AudioSource assigned\");\n
\n
    if (AudioEnded != null)\n
        AudioEnded(this, EventArgs.Empty);\n
\]"}
#4{4 5 "Play"}
#4{19 20 "virtual IEnumerator"}
#4{17 18 "float[] audioData"}
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
#3{#4{8 9 "86243960"}
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
}
:CLSCSSem.1118481{ 56  51 @152 @93 @182 @0 #6{16 2@167 @54 }
#6{16 0}
#6{16 0}
#6{16 5@226 @113 @3 @27 @15 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @125 @0 @39 @0 @0 @0 }
#1{16@101 @190 @69 @140 @81 @202 @214 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
