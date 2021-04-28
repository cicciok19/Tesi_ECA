:ArrayOb.273{6:Dictionary.4369{32 18:SLSProtectMember.286331409{:String.17{9 10 "144980552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "areaMask"}
 2.4 1.88 3.2 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "areaMask"}
#4{3 4 "int"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "162894944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "stopDistance"}
 1.6 1.88 4.8 11  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "stopDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{7 9 "   0.5f"}
#4{0 1 ""}
}
#3{#4{9 10 "144983192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "range"}
 3 1.88 2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "range"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{3 4 " 0f"}
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
:SLSPublicMethod.286331408{#4{9 10 "164810488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{229 372 "\[\n
    base.Update();\n
\n
    if (Vector3.Distance(destination, animator.Eca.transform.position) <= stopDistance + 0.5f)\n
    \[\n
        animator.navMeshAgent.SetDestination(animator.Eca.transform.position);\n
        EndStage();\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{13 14 "override void"}
#4{0 1 ""}
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
#3{#4{9 10 "144984072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "randomDestination"}
 0.599998 1.88 6.8 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "randomDestination"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "176149720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "RandomDestination"}
 0.3 0.88 6.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{554 555 "\[\n
    Vector3 center = destination.transform.position;\n
\n
    for (int i = 0; i < 30; i++)\n
    \[\n
        Vector3 randomPoint = center + UnityEngine.Random.insideUnitSphere * range;\n
        NavMeshHit hit;\n
\n
        if (NavMesh.SamplePosition(randomPoint, out hit, 2f, 1 << areaMask))\n
        \[\n
            Debug.DrawRay(hit.position, Vector3.up *20, Color.green, 10f);\n
            Vector3 x = hit.position;\n
            return x;\n
        \]\n
    \]\n
\n
    //if didn't find a valid position returns ECA actual position\n
    return animator.Eca.transform.position;\n
\]"}
#4{17 18 "RandomDestination"}
#4{7 8 "Vector3"}
#4{11 12 "float range"}
#4{0 1 ""}
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
:SLSPrivateMember.286331409{#4{8 9 "96613904"}
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
 1  1 #4{52 70 ": base()\n
\[\n
        this.destination = destination;\n
\]"}
#4{9 12 "GoToStage"}
#4{0 1 ""}
#4{19 72 "Vector3 destination"}
#4{0 1 ""}
}
#12{#4{9 10 "144980992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Transform center"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{118 119 ": base()\n
\[\n
        this.range = range;\n
        this.destination = center.position;\n
        this.areaMask = areaMask;\n
\]"}
#4{9 12 "GoToStage"}
#4{0 1 ""}
#4{47 48 "Transform center, float range, int areaMask = 1"}
#4{0 1 ""}
}
#12{#4{8 9 "96612584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Transform destin"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{61 70 ": base()\n
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
 1  1 #4{24 25 "\[\n
    base.EndStage();\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
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
 1  1 #4{246 256 "\[\n
    base.StartStage();\n
\n
    //use this in order to not modify the destination transform\n
    Vector3 x;\n
\n
    if (range != 0f)\n
        x = RandomDestination(range);\n
    else\n
        x = destination;\n
\n
    animator.navMeshAgent.SetDestination(x);\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @76 @68 @48 @0 #5{16 1@130 }
#5{16 4@18 @33 @3 @90 }
#5{16 1@205 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@217 @193 @117 @105 @145 @0 @0 @56 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@181 @169 @157 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
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
