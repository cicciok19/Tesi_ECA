:ArrayOb.273{6:Dictionary.4369{16 11:SLSConstructor.286331408{:String.17{8 9 "96612584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Transform destin"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{52 70 ": base()\n
\[\n
        this.destination = destination;\n
\]"}
#4{9 12 "GoToStage"}
#4{0 1 ""}
#4{21 72 "Transform destination"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "155400552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{90 191 "\[\n
    base.StartStage();\n
    animator.navMeshAgent.SetDestination(destination.position);\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
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
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
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
:JLSFriendDeclare.286331408{#4{9 10 "130155600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "132243528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "StopDistance"}
 1.3 0.88 4.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{66 180 "\[\n
    set \[ stopDistance = value; \] get \[ return stopDistance; \]\n
\]"}
#4{12 13 "StopDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 6 ""}
}
#5{#4{9 10 "155401336"}
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
:SLSProtectMember.286331409{#4{9 10 "162894944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "stopDistance"}
 1.6 1.88 4.8 11  30 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "stopDistance"}
#4{5 6 "float"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{7 9 "   0.5f"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130155344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
"}
}
#5{#4{9 10 "164810488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 1.3 0.88 2.4 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{371 372 "\[\n
    base.Update();\n
    //Debug.Log(Vector3.Distance(destination.position, animator.Eca.transform.position));\n
    if (Vector3.Distance(destination.position, animator.Eca.transform.position) <= stopDistance + 0.5f)\n
    \[\n
        animator.navMeshAgent.isStopped = true;\n
        animator.navMeshAgent.SetDestination(animator.transform.position);\n
        EndStage();\n
    \]\n
\]"}
#4{6 7 "Update"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{8 9 "96613904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "destination"}
 1.8 1.88 4.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "destination"}
#4{9 10 "Transform"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @27 @101 @53 @0 #7{16 1@121 }
#7{16 1@86 }
#7{16 1@41 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@15 @74 @61 @0 @0 @0 @0 @109 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
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
