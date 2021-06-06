:ArrayOb.273{6:Dictionary.4369{16 14:SLSProperty.286331392{:String.17{9 10 "132247344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "chair"}
 1.3 0.88 2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{5 6 "chair"}
#4{14 15 "SittableObject"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "93965016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{24 25 "Painting : MonoBehaviour"}
 18.6114 2.2 15.36 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{8 17 "Painting"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "163251968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetLookableObject"}
 0.3 0.88 6.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{24 35 "\[\n
    return lookable;\n
\]"}
#4{17 18 "GetLookableObject"}
#4{14 15 "LookableObject"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "164519048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "occupied"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "occupied"}
#4{4 5 "bool"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "94856000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{33 34 "using System;\n
using UnityEngine;\n
"}
}
:SLSProtectMethod.286331408{#4{8 9 "85662088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 877 "\[\n
    lookable = GetComponentInChildren<LookableObject>();\n
    chair = GetComponentInChildren<SittableObject>();\n
\]"}
#4{5 6 "Awake"}
#4{4 14 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "164794992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Occupied"}
 1.3 0.879999 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{54 55 "\[ get \[ return occupied; \] set \[ occupied = value; \] \]"}
#4{8 9 "Occupied"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSExternObject.286331409{#4{8 10 "94308088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 19  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 6 ""}
#4{14 15 "SittableObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 }
#7{#4{9 10 "163250400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "GetChairSitPoint"}
 0.3 0.88 6.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{35 36 "\[\n
    return chair.GetSitPoint();\n
\]"}
#4{16 17 "GetChairSitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "130397352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "GetChairDestination"}
 0.3 0.88 7.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{38 45 "\[\n
    return chair.GetDestination();\n
\]"}
#4{19 20 "GetChairDestination"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "94310728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "lookable"}
 2.4 1.88 3.2 10  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "lookable"}
#4{14 15 "LookableObject"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "94857792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "164518168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{2 3 "id"}
 1.3 1.88 0.8 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2 3 "id"}
#4{3 4 "int"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "163253536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetChairEmpties"}
 0.3 0.88 6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{192 193 "\[\n
    var sitPoint = chair.GetSitPoint();\n
    var rFoot = chair.GetRightFootTransform();\n
    var lFoot = chair.GetLeftFootTransform();\n
\n
    return new Transform[] \[ sitPoint, rFoot, lFoot \];\n
\]"}
#4{15 16 "GetChairEmpties"}
#4{11 12 "Transform[]"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @16 @57 @142 @0 #6{16 1@42 }
#6{16 1@127 }
#6{16 0}
#6{16 1@65 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 1@90 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @150 @0 @0 @0 }
#1{30@103 @115 @165 @30 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @77 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{366 367 "/*      CG&VG group @ Politecnico di Torino               */\n
/*              All Rights Reserved\t                      */\n
/*                                                        */\n
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */\n
/*  The copyright notice above does not evidence any      */\n
/*  actual or intended publication of such source code.   */\n
"}
#6{16 0}
 0}
:Float.17{0 }
#16{1 }
#16{0 }
#16{1 }
}
