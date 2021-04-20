:ArrayOb.273{6:Dictionary.4369{32 23:SLSPublicMethod.286331408{:String.17{8 9 "95217056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{26 27 "BehaviourOnNoMoreGraspable"}
 1.3 0.88 10.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{52 53 "\[\n
    GameObjMaterial.DisableKeyword(\"_EMISSION\");\n
\]"}
#4{26 27 "BehaviourOnNoMoreGraspable"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "95572776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{16 17 "GameObjRigidBody"}
 1.3 1.88 6.4 1  32 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{16 17 "GameObjRigidBody"}
#4{9 10 "Rigidbody"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#3{#4{8 9 "95221368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Watching"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{127 128 "\[\n
    Utility.Log(\"WATCHING \" + this.gameObject.name);\n
    if (OnWatching != null)\n
        OnWatching(this, EventArgs.Empty);\n
\]"}
#4{8 9 "Watching"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "95572336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "IdealArea"}
 1.3 1.88 3.6 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{9 10 "IdealArea"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95221760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "StopWatching"}
 1.3 0.88 4.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{138 139 "\[\n
    Utility.Log(\"STOP TO WATCH \" + this.gameObject.name);\n
    if (OnStopWatcing != null)\n
        OnStopWatcing(this, EventArgs.Empty);\n
\]"}
#4{12 13 "StopWatching"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "95569696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{22 23 "AcceptableAreaCollider"}
 1.3 1.88 8.8 1  28 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{22 23 "AcceptableAreaCollider"}
#4{8 9 "Collider"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#3{#4{8 9 "95220192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Touch"}
 1.3 0.88 2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{124 125 "\[\n
    Utility.Log(\"TOUCH \" + this.gameObject.name);\n
    if (OnTouching != null)\n
        OnTouching(this, EventArgs.Empty);\n
\]"}
#4{5 6 "Touch"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "95571896"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "InteractableObj"}
 1.3 1.88 6 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{15 16 "InteractableObj"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#3{#4{8 9 "95220584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "OnEnable"}
 1.3 0.88 3.2 1  17 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{187 188 "\[\n
    Utility.Log(this.GetType() + \" Script enabled!!\");\n
    /*\n
    AcceptableArea.GetComponent<Renderer>().enabled = true;\n
    IdealArea.GetComponent<Renderer>().enabled = true;\n
    */\n
\]"}
#4{8 9 "OnEnable"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95450288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#5{#4{8 9 "95568816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "AcceptableArea"}
 1.3 1.88 5.6 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "AcceptableArea"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95216272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{467 468 "\[\n
    InteractableObj = this.gameObject;\n
    GameObjMaterial = GetComponent<Renderer>().material;\n
    GameObjRigidBody = GetComponent<Rigidbody>();\n
    TargetPosition = GameObject.FindGameObjectWithTag(\"TakenTarget\");\n
    AcceptableAreaCollider = AcceptableArea.GetComponent<Collider>();\n
    IdealAreaCollider = IdealArea.GetComponent<Collider>();\n
\n
    AcceptableArea.GetComponent<Renderer>().enabled = false;\n
    IdealArea.GetComponent<Renderer>().enabled = false;\n
\]"}
#4{5 6 "Awake"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95218624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "BehaviourOnLeave"}
 1.3 0.88 6.4 1  15 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{201 202 "\[\n
    FPSInteractionManager.Instance.TakenObj = null;\n
    InteractableObj.GetComponent<Collider>().enabled = true;\n
    InteractableObj.transform.parent = null;\n
    GameObjRigidBody.useGravity = true;\n
\]"}
#4{16 17 "BehaviourOnLeave"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95222152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "BehaviourOnTaken"}
 1.3 0.88 6.4 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{492 493 "\[\n
    GameObjRigidBody.useGravity = false; //disable gravity\n
    InteractableObj.transform.parent = TargetPosition.transform; //make child of target position\n
    InteractableObj.transform.position = TargetPosition.transform.position; //set position\n
    InteractableObj.transform.forward = -GameObject.FindGameObjectWithTag(\"Player\").transform.forward; //align with player forward\n
    GameObjMaterial.DisableKeyword(\"_EMISSION\");\n
    InteractableObj.GetComponent<Collider>().enabled = false;\n
\]"}
#4{16 17 "BehaviourOnTaken"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "95571016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "TargetPosition"}
 1.3 1.88 5.6 1  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{14 15 "TargetPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#3{#4{8 9 "95217448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "OnDisable"}
 1.3 0.88 3.6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{120 121 "\[\n
    AcceptableArea.GetComponent<Renderer>().enabled = false;\n
    IdealArea.GetComponent<Renderer>().enabled = false;\n
\]"}
#4{9 10 "OnDisable"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95216664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Leave"}
 1.3 0.88 2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{130 131 "\[\n
    Utility.Log(\"WANT TO LEAVE \" + this.gameObject.name);\n
    if (OnLeaving != null)\n
        OnLeaving(this, EventArgs.Empty);\n
\]"}
#4{5 6 "Leave"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "95215096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "BehaviourOnGraspable"}
 1.3 0.88 8 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{51 52 "\[\n
    GameObjMaterial.EnableKeyword(\"_EMISSION\");\n
\]"}
#4{20 21 "BehaviourOnGraspable"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "94018992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public Interactable : MonoBehaviour"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.78008 4.04449 0
 0  0 #4{19 20 "public Interactable"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 5#4{37 38 "public event EventHandler OnWatching;"}
#4{40 41 "public event EventHandler OnStopWatcing;"}
#4{35 36 "public event EventHandler OnTaking;"}
#4{36 37 "public event EventHandler OnLeaving;"}
#4{37 38 "public event EventHandler OnTouching;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95451824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
#5{#4{8 9 "95574976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "GameObjMaterial"}
 1.3 1.88 6 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{15 16 "GameObjMaterial"}
#4{8 9 "Material"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#5{#4{8 9 "95570136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "IdealAreaCollider"}
 1.3 1.88 6.8 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{17 18 "IdealAreaCollider"}
#4{8 9 "Collider"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{17 18 "[HideInInspector]"}
}
#3{#4{8 9 "95218232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Take"}
 1.3 0.88 1.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{127 128 "\[\n
    Utility.Log(\"WANT TO TAKE \" + this.gameObject.name);\n
    if (OnTaking != null)\n
        OnTaking(this, EventArgs.Empty);\n
\]"}
#4{4 5 "Take"}
#4{12 13 "virtual void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @233 @252 @123 @0 #6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @275 @0 @69 @0 @182 @0 @15 @0 @260 @0 @96 @0 @42 @0 @131 @0 @0 @0 }
#1{16@146 @30 @57 @290 @209 @84 @170 @3 @221 @158 @197 @111 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
