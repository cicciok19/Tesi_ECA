:ArrayOb.273{6:Dictionary.4369{32 18:SLSPrivateMethod.286331408{:String.17{9 10 "103757784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{321 322 "\[\n
    if (Instance != null && Instance != this)\n
    \[\n
        #if UNITY_EDITOR\n
        Utility.LogError(\"ERROR!!!! you can not use more than one IntentManager\");\n
        UnityEditor.EditorApplication.isPlaying = false;\n
        #else\n
            Application.Quit();\n
        #endif\n
    \]\n
    else\n
        Instance = this;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "86283728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "takenObjPosition"}
 0.799999 1.88 6.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{16 17 "takenObjPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{16 17 "[SerializeField]"}
}
:SLSProtectMethod.286331408{#4{9 10 "103760528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Update "}
 1.3 0.88 2.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{382 383 "\[\n
\n
       //Leaving taken object\n
       //if (TakenObj != null && Input.GetKeyDown(KeyCode.E))\n
       if (TakenObj != null && Input.GetMouseButtonDown(0))\n
       \[\n
           TakenObj.Leave();\n
           return;\n
       \]\n
\n
       if (TakenObj == null)\n
       \[\n
           target.enabled = true;\n
           CheckInteraction();\n
       \]\n
       else\n
           target.enabled = false;\n
\]"}
#4{7 8 "Update "}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSProperty.286331392{#4{9 10 "103760920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "TakenObj"}
 1.3 0.88 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{8 9 "TakenObj"}
#4{12 13 "Interactable"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86344328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{19 20 "interactionDistance"}
 0.299999 1.88 7.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "interactionDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{16 17 "[SerializeField]"}
}
#5{#4{8 9 "86343888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "fpsCameraT"}
 2 1.88 4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "fpsCameraT"}
#4{9 10 "Transform"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{16 17 "[SerializeField]"}
}
#5{#4{8 9 "86284168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "rayOrigin"}
 2.2 1.88 3.6 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "rayOrigin"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86284608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "fpsController"}
 1.4 1.88 5.2 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "fpsController"}
#4{19 20 "CharacterController"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "103759744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{8 9 "Instance"}
#4{28 29 "static FPSInteractionManager"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "103762880"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Start "}
 1.3 0.88 2.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{293 294 "\[\n
       GameObject player = GameObject.FindGameObjectWithTag(\"Player\");\n
       fpsController = player.GetComponent<CharacterController>();\n
       fpsCameraT = player.transform.GetChild(0).GetComponent<Camera>().transform;\n
       StartInteractionManager = true;\n
       target.enabled = true;\n
\]"}
#4{6 7 "Start "}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#8{#4{9 10 "103758960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "StartInteractionManager"}
 1.3 0.88 9.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{23 24 "StartInteractionManager"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86367240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{167 168 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.UI;\n
using UnityStandardAssets.Characters.FirstPerson;\n
\n
\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "86363656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "86285928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "lastHitObj"}
 1.3 1.88 4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{10 11 "lastHitObj"}
#4{12 13 "Interactable"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "103672656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{44 45 "public FPSInteractionManager : MonoBehaviour"}
 14.9543 2.2 28.16 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{28 29 "public FPSInteractionManager"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{8 9 "86342128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "target"}
 2.8 1.88 2.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "target"}
#4{5 6 "Image"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{16 17 "[SerializeField]"}
}
#3{#4{9 10 "103757000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CheckInteraction"}
 1.3 0.88 6.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1652 1653 "\[\n
    rayOrigin = fpsCameraT.position + fpsController.radius * fpsCameraT.forward;\n
    Ray ray = new Ray(rayOrigin, fpsCameraT.forward);\n
    RaycastHit hit;\n
\n
    //hitting nothing but in the previous frame an object was hit\n
    if (!Physics.Raycast(ray, out hit, InteractionDistance) && lastHitObj!=null)\n
    \[\n
        lastHitObj.StopWatching();\n
        lastHitObj = null;\n
        return;\n
    \]\n
    if(Physics.Raycast(ray, out hit, InteractionDistance))\n
    \[\n
        GameObject hittingObj = hit.transform.gameObject;\n
        Interactable currentHitPositionable = hittingObj.GetComponent<Interactable>();\n
\n
        //disabled script\n
        if (currentHitPositionable != null && !currentHitPositionable.enabled)\n
            return;\n
\n
        //stop hitting an Obj hit in the previous frame\n
        if (lastHitObj!=null && lastHitObj != currentHitPositionable)\n
        \[\n
            lastHitObj.StopWatching();\n
            lastHitObj = null;\n
            return;\n
        \]\n
\n
        //continue hitting Obj of last frame. Therefore, check an Interaction\n
        else if(lastHitObj!=null && lastHitObj == currentHitPositionable)\n
        \[\n
            // check if user interact with it\n
            //if (Input.GetKeyDown(KeyCode.E))\n
            if(Input.GetMouseButtonDown(0))\n
            \[\n
                //INTERACT!!!!\n
                currentHitPositionable.Take();\n
                StartInteractionManager = false;\n
                return;\n
            \]\n
        \]\n
\n
        //Start hitting a new obj\n
        else if (currentHitPositionable != null)\n
        \[\n
            lastHitObj = currentHitPositionable;\n
            lastHitObj.Watching();\n
        \]\n
    \]\n
\]"}
#4{16 17 "CheckInteraction"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "103760136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "InteractionDistance"}
 1.3 0.88 7.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{96 97 "\[\n
        get \[ return interactionDistance; \]\n
        set \[ interactionDistance = value; \]\n
    \]"}
#4{19 20 "InteractionDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @181 @150 @158 @0 #6{16 6@69 @54 @195 @15 @84 @99 }
#6{16 0}
#6{16 2@3 @210 }
#6{16 2@126 @30 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @166 @0 @0 @0 }
#1{30@222 @138 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @42 @0 @0 @114 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
