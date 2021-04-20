:ArrayOb.273{6:Dictionary.4369{16 13:SLSThisIcon.286331409{:String.17{8 9 "94018440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{49 50 "public IntentRecognitionBehaviour : MonoBehaviour"}
 14.04 2.2 31.36 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{33 34 "public IntentRecognitionBehaviour"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "95219800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "hideTextDelay"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{100 101 "\[\n
    yield return new WaitForSeconds(2);\n
    isRecognizing = false;\n
    RecognizedText.text = \"\";\n
\]"}
#4{13 14 "hideTextDelay"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "119135048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "MicrophoneIcon"}
 1.3 1.88 5.6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "MicrophoneIcon"}
#4{5 6 "Image"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "129751136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{58 59 "private static IntentRecognitionBehaviour instance = null;"}
}
#6{#4{8 9 "94865136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{293 294 "\[\n
    if(MicrophoneIcon!=null)\n
        MicrophoneIcon.enabled = false;\n
\n
    if (instance != null && instance != this)\n
    \[\n
        Utility.LogError(\"You can not use multiple StartIntentRecognition script\");\n
        Application.Quit();\n
        return;\n
    \]\n
    else\n
        Instance = this;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "94864744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "RecognizingStopped"}
 0.3 0.88 7.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{40 41 "\[\n
    StartCoroutine(hideTextDelay());\n
\]"}
#4{18 19 "RecognizingStopped"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "129172224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "isRecognizing"}
 1.4 1.88 5.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "isRecognizing"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "94301336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{8 9 "Instance"}
#4{33 34 "static IntentRecognitionBehaviour"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "129750624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{101 102 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
"}
}
#9{#4{8 9 "94863960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "ShowRecognizedText"}
 0.3 0.88 7.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{142 143 "\[\n
    if (RecognizedText != null)\n
        RecognizedText.text = text;\n
    else\n
        Utility.LogWarning(\"no recognizing Text GUI setted\");\n
\]"}
#4{18 19 "ShowRecognizedText"}
#4{4 5 "void"}
#4{11 12 "string text"}
#4{0 1 ""}
}
#7{#4{9 10 "119132848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "RecognizedText"}
 1.3 1.88 5.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "RecognizedText"}
#4{4 5 "Text"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "95215488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "IconAnimation"}
 1.3 0.88 5.2 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{580 581 "\[\n
    MicrophoneIcon.enabled = true;\n
    Vector3 scale = MicrophoneIcon.transform.localScale;\n
    while (isRecognizing)\n
    \[\n
        float scaleValue = Mathf.Lerp(0.8f, 1.1f, Mathf.PingPong(Time.time*2.2f, scale.x));\n
        MicrophoneIcon.transform.localScale = new Vector3(scaleValue, scaleValue, scaleValue);\n
        MicrophoneIcon.color = Color.Lerp(Color.white, Color.green, Mathf.PingPong(Time.time * 2.2f, 1));\n
        yield return null;\n
    \]\n
    //MicrophoneIcon.color = Color.white;\n
    MicrophoneIcon.transform.localScale = scale;\n
    MicrophoneIcon.enabled = false;\n
\]"}
#4{13 14 "IconAnimation"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "94863568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{397 398 "\[\n
    if (Input.GetKeyDown(KeyCode.R))\n
    \[\n
        if (!TtsManager.IsSpeaking)\n
        \[\n
            isRecognizing = true;\n
            if (MicrophoneIcon != null)\n
                StartCoroutine(IconAnimation());\n
            ShowRecognizedText(\"...\");\n
            IntentManager.Instance.StartSingleSentenceRecognition();\n
        \]\n
        else\n
            AudioManager.Instance.OnError();\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @3 @104 @44 @0 #5{16 1@76 }
#5{16 0}
#5{16 3@52 @17 @139 }
#5{16 1@151 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @29 @0 @124 @0 @0 @0 }
#1{30@112 @64 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @91 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
