:ArrayOb.273{6:Dictionary.4369{16 8:SLSProtectMember.286331409{:String.17{9 10 "166058856"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "lookAtObject"}
 1.6 1.88 4.8 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "lookAtObject"}
#4{9 10 "Transform"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "162543952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{35 36 "public LookAtStage : ECAActionStage"}
 16.6 2.2 22.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{18 19 "public LookAtStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "96510032"}
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
:SLSPrivateMethod.286331408{#4{9 10 "131541456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnWaitComplete"}
 1.3 0.88 5.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "\[\n
    EndStage();\n
\]"}
#4{14 15 "OnWaitComplete"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "96510800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "166061056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Transform lookAt"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 74 "\[\n
    this.lookAtObject = lookAtObject;\n
\]"}
#4{11 12 "LookAtStage"}
#4{0 1 ""}
#4{22 40 "Transform lookAtObject"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "131537928"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "EndStage"}
 1.3 0.88 3.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 82 "\[\n
    ikManager.SetWeightTargetAimIK(ikManager.headIK, 0);\n
    base.EndStage();\n
\]"}
#4{8 9 "EndStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "131540672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{157 158 "\[\n
    base.StartStage();\n
\n
    animator.WaitComplete += OnWaitComplete;\n
    ikManager.SetTargetAimIK(ikManager.headIK, lookAtObject);\n
    animator.Wait(6f);\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @18 @32 @52 @0 #5{16 0}
#5{16 1@3 }
#5{16 1@40 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@72 @84 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@60 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
