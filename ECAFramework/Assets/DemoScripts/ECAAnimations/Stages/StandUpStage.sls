:ArrayOb.273{6:Dictionary.4369{16 8:SLSThisIcon.286331409{:String.17{9 10 "156135800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{36 37 "public StandUpStage : ECAActionStage"}
 16.4171 2.2 23.04 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{19 20 "public StandUpStage"}
#4{14 15 "ECAActionStage"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "155860312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "StartStage"}
 1.3 0.88 4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 27 "\[\n
    base.StartStage();\n
\]"}
#4{10 11 "StartStage"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155698136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "156130224"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "SitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "155855608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "ReactToActionFinished"}
 1.3 0.88 8.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{136 137 "\[\n
    EcaAnimator.MxM_clearRequiredTags();\n
    EcaAnimator.MxM_BeginEvent(\"StandUp\", SitPoint);\n
    //EcaAnimator.IK_setWeight(false);\n
\]"}
#4{21 22 "ReactToActionFinished"}
#4{13 14 "override void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155691480"}
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
:SLSConstructor.286331408{#4{9 10 "156128904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ECAAction ecaAct"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{276 277 ": base(ecaAction, ecaAnimator)\n
\[\n
        SitPoint = sitPoint;\n
        //in questo caso l'ECA si deve alzare solo quando l'utente entra nel trigger, quindi startStage()\n
        //verr\195\\160\ chiamato solo in quel momento\n
        EcaAction.CompletedAction += ReactToActionFinished;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{68 69 "ECAAction ecaAction, ECAAnimatorDemo ecaAnimator, Transform sitPoint"}
#4{0 1 ""}
}
#6{#4{9 10 "155852864"}
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
}
:CLSCSSem.1118481{ 56  51 @3 @64 @29 @0 #5{16 0}
#5{16 1@37 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@17 @84 @52 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@72 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
