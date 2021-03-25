:ArrayOb.273{6:Dictionary.4369{16 14:SLSThisIcon.286331409{:String.17{9 10 "103672104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public AudioManager : MonoBehaviour"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{19 20 "public AudioManager"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86363144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{95 96 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
\n
\n
"}
}
:SLSPublicMethod.286331408{#4{9 10 "103756216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "GoodEvent"}
 0.3 0.88 3.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 82 "\[\n
    utilityAudioSource.clip = GoodActionSound;\n
    utilityAudioSource.Play();\n
\]"}
#4{9 10 "GoodEvent"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "86343008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "TrafficSound"}
 1.3 1.88 4.8 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "TrafficSound"}
#4{9 10 "AudioClip"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "103755824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.879999 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{8 9 "Instance"}
#4{19 20 "static AudioManager"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "103756608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "OnError"}
 0.3 0.88 2.8 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{76 77 "\[\n
    utilityAudioSource.clip = ErrorSound;\n
    utilityAudioSource.Play();\n
\]"}
#4{7 8 "OnError"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "103758176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{418 419 "\[\n
    utilityAudioSource = gameObject.AddComponent<AudioSource>();\n
    trafficAudioSource = gameObject.AddComponent<AudioSource>();\n
    trafficAudioSource.volume = 0.5f;\n
    trafficAudioSource.loop = true;\n
\n
    //IntentManager.Instance.UserCanNotSpeak += OnError;\n
\n
    GameManager gameManager = GameObject.FindObjectOfType<GameManager>();\n
\n
    if(gameManager != null)\n
    \tgameManager.OnGameStarted += OnGameStarted;\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "86363400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#8{#4{8 9 "86344768"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "ErrorSound"}
 1.3 1.88 4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "ErrorSound"}
#4{9 10 "AudioClip"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "86341688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "trafficAudioSource"}
 0.4 1.88 7.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "trafficAudioSource"}
#4{11 12 "AudioSource"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "103759352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{420 421 "\[\n
    if (Instance != null && Instance != this)\n
    \[\n
        //Destroy(this.gameObject);\n
        #if UNITY_EDITOR\n
            Utility.LogError(\"ERROR!!!! you can not use more than one AudioManager\");\n
            UnityEditor.EditorApplication.isPlaying = false;\n
        #else\n
            Application.Quit();\n
        #endif\n
    \]\n
    else\n
    \[\n
        Instance = this;\n
        DontDestroyOnLoad(this.gameObject);\n
    \]\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#13{#4{9 10 "103758568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnGameStarted"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{78 79 "\[\n
    trafficAudioSource.clip = TrafficSound;\n
    trafficAudioSource.Play();\n
\]"}
#4{13 14 "OnGameStarted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#8{#4{8 9 "86342568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "GoodActionSound"}
 1.3 1.88 6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "GoodActionSound"}
#4{9 10 "AudioClip"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#12{#4{8 9 "86345208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "utilityAudioSource"}
 0.4 1.88 7.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "utilityAudioSource"}
#4{11 12 "AudioSource"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @17 @88 @0 #5{16 2@165 @111 }
#5{16 0}
#5{16 2@126 @138 }
#5{16 1@76 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @37 @0 @150 @0 @96 @0 @0 @0 }
#1{30@64 @25 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @52 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
