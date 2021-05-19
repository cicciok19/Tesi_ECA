:ArrayOb.273{6:Dictionary.4369{16 7:JLSFriendDeclare.286331408{:String.17{9 10 "131021448"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSInternalMember.286331409{#4{8 9 "75466000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "innerRadius"}
 1.8 1.88 4.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "innerRadius"}
#4{5 6 "float"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "74948432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{170 171 "\[\n
    base.Start();\n
\n
    if (GetComponentsInChildren<LandingAreaCircular>().Length != 1)\n
        innerRadius = GetComponentsInChildren<LandingAreaCircular>()[1].radius;\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#7{#4{8 9 "74954312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{194 195 "\[\n
    base.Awake();\n
\n
    var renderer = gameObject.GetComponent<Renderer>();\n
    radius = renderer.bounds.size.x/2;\n
    innerRadius = 0;\n
    Debug.Log(this.name + \" has radius of: \" + radius);\n
\]"}
#4{5 6 "Awake"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "131634168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{40 41 "public LandingAreaCircular : LandingArea"}
 15.6857 2.2 25.6 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{26 27 "public LandingAreaCircular"}
#4{11 12 "LandingArea"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "131021192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{79 80 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
#5{#4{8 9 "75466440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "radius"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "radius"}
#4{5 6 "float"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @50 @64 @3 @0 #6{16 0}
#6{16 0}
#6{16 0}
#6{16 2@38 @26 }
#6{16 2@72 @11 }
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
