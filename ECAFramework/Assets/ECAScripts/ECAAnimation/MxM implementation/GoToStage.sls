:ArrayOb.273{6:Dictionary.4369{32 22:SLSPrivateMember.286331409{:String.17{9 10 "103357424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "startWarpSpeed"}
 1.2 1.88 5.6 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "startWarpSpeed"}
#4{5 6 "float"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{2 3 " 0"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "144980552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "areaMask"}
 2.4 1.88 3.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "areaMask"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "162894944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "stopDistance"}
 1.6 1.88 4.8 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "stopDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{5 9 " 0.5f"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "13895808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "PauseStage"}
 1.3 0.88 4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{101 102 "\[\n
    base.PauseStage();\n
    animator.navMeshAgent.SetDestination(animator.Eca.transform.position);\n
\]"}
#4{10 11 "PauseStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130155600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{9 10 "103357864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "finalWarpSpeed"}
 1.2 1.88 5.6 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "finalWarpSpeed"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " 0.3f"}
#4{0 1 ""}
}
#3{#4{9 10 "103356104"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "warpDirection"}
 1.4 1.88 5.2 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "warpDirection"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{14 15 " new Vector3()"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "129304192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{33 34 "public GoToStage : ECAActionStage"}
 16.9657 2.2 21.12 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{16 17 "public GoToStage"}
#4{14 15 "ECAActionStage"}
#4{31 33 ".\\..\\..\\ECAScripts\\ECAAnimation"}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "103353024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "actualWarpSpeed"}
 1 1.88 6 46  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "actualWarpSpeed"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{2 3 " 0"}
#4{0 1 ""}
}
#7{#4{9 10 "164810488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{876 877 "\[\n
    base.Update();\n
\n
    if (Vector3.Distance(destination, animator.Eca.transform.position) <= stopDistance + 0.5f && !warping)\n
    \[\n
        animator.navMeshAgent.SetDestination(animator.Eca.transform.position);\n
        Debug.DrawRay(animator.Eca.transform.position, animator.Eca.transform.forward * 20, Color.red, 20f);\n
        warpDirection = animator.Eca.transform.forward;\n
\n
        warping = true;\n
    \]\n
\n
    if (warping)\n
    \[\n
        if(Vector3.Distance(destination, animator.Eca.transform.position) >= 0.35f)\n
        \[\n
            actualWarpSpeed = Mathf.SmoothDamp(actualWarpSpeed, 1f, ref startWarpSpeed, 3);\n
            animator.Eca.transform.position = Vector3.Lerp(animator.Eca.transform.position, destination,actualWarpSpeed);\n
        \]\n
            //animator.Eca.transform.Translate(warpDirection * Time.deltaTime);\n
        else\n
            EndStage();\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103353904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "warping"}
 2.6 1.88 2.8 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "warping"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{6 7 " false"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130155344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{115 116 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
using UnityEngine.AI;\n
"}
}
:SLSProperty.286331392{#4{9 10 "132243528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "StopDistance"}
 1.3 0.88 4.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{70 180 "\[\n
    set \[ stopDistance = value; \]\n
    get \[ return stopDistance; \]\n
\]"}
#4{12 13 "StopDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 6 ""}
}
#3{#4{8 9 "96613904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "destination"}
 1.8 1.88 4.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "destination"}
#4{7 10 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "176150896"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "AbortStage"}
 1.3 0.88 4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{101 102 "\[\n
    base.AbortStage();\n
    animator.navMeshAgent.SetDestination(animator.Eca.transform.position);\n
\]"}
#4{10 11 "AbortStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96612585"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Vector3 destinat"}
 0.299999 0.88 6.4 47  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{56 70 ": base()\n
\[\n
            this.destination = destination;\n
\]"}
#4{9 12 "GoToStage"}
#4{0 1 ""}
#4{19 72 "Vector3 destination"}
#4{0 1 ""}
}
#12{#4{8 9 "96612584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Transform destin"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{65 70 ": base()\n
\[\n
            this.destination = destination.position;\n
\]"}
#4{9 12 "GoToStage"}
#4{0 1 ""}
#4{21 72 "Transform destination"}
#4{0 1 ""}
}
#7{#4{9 10 "155401336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{57 58 "\[\n
    base.EndStage();\n
    animator.Eca.stopped = true;\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "104804208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "ResumeStage"}
 1.3 0.88 4.4 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{45 46 "\[\n
    base.ResumeStage();\n
    StartStage();\n
\]"}
#4{11 12 "ResumeStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "104804600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "ChangeDestination"}
 0.3 0.88 6.8 1  25 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{96 97 "\[\n
    destination = newDestination;\n
    animator.navMeshAgent.SetDestination(newDestination);\n
\]\n
"}
#4{17 18 "ChangeDestination"}
#4{4 5 "void"}
#4{22 23 "Vector3 newDestination"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "155402120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "OnArrivedECA"}
 1.3 0.88 4.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "\[\n
    EndStage();\n
\]"}
#4{12 13 "OnArrivedECA"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#7{#4{9 10 "155400552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{200 256 "\[\n
    base.StartStage();\n
    //use this in order to not modify the destination transform\n
    Vector3 x = destination;\n
\n
    animator.navMeshAgent.SetDestination(x);\n
    animator.Eca.ecaInTrigger = 0;\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @98 @154 @60 @0 #5{16 6@175 @139 @83 @3 @68 @112 }
#5{16 2@33 @18 }
#5{16 1@262 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{31@274 @226 @162 @0 @190 @48 @238 @127 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @250 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@214 @0 @202 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{366 367 "/*      CG&VG group @ Politecnico di Torino               */\n
/*              All Rights Reserved\t                      */\n
/*                                                        */\n
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */\n
/*  The copyright notice above does not evidence any      */\n
/*  actual or intended publication of such source code.   */\n
"}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
