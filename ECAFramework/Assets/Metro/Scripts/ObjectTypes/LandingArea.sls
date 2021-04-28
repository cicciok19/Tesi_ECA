:ArrayOb.273{6:Dictionary.4369{16 7:SLSProtectMember.286331409{:String.17{9 10 "144398144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "bounds"}
 2.8 1.88 2.4 10  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "bounds"}
#4{7 8 "Vector3"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141930296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{34 35 "public LandingArea : MonoBehaviour"}
 16.7829 2.2 21.76 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{18 19 "public LandingArea"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "74753720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{85 86 "using System;\n
using UnityEngine;\n
using UnityEngine.AI;\n
using UnityEngine.Assertions;\n
"}
}
:SLSPublicMethod.286331408{#4{9 10 "176142664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetRandomPosition"}
 0.3 0.88 6.8 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{615 616 "\[\n
    NavMeshHit hit;  \n
    bool found = false;\n
\n
    for(int i = 0; i < 10 ; i++)\n
    \[\n
\t\n
  \tVector3 position = new Vector3(\n
\t\tcenter.x + bounds.x * extent * (float)UnityEngine.Random.Range(-1f, 1f),\n
\t\tcenter.y,\n
\t\tcenter.z + bounds.z * extent * (float)UnityEngine.Random.Range(-1f, 1f)\n
  \t);\n
\n
\tbool found = NavMesh.SamplePosition(position, out hit, 2f, NavMesh.AllAreas);\n
\n
\n
        if (found)\n
        \[\n
            Debug.DrawRay(position, Vector3.up, Color.green, 15f);\n
            return hit.position;\n
        \]\n
        \t\n
    \]\n
\n
    Utility.LogError(\"Cannot find a position in \" + name);\n
    return Vector3.zero;\n
\]"}
#4{17 18 "GetRandomPosition"}
#4{7 8 "Vector3"}
#4{19 20 "float extent = 1.0f"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "74753464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "176140312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{180 437 "\[\n
  // computing object bounds\n
\n
  Renderer renderer = GetComponent<Renderer>();\n
  Assert.IsNotNull(renderer);\n
\n
  bounds = renderer.bounds.size;\n
  center = renderer.bounds.center;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "144397264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "center"}
 2.8 1.88 2.4 19  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "center"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @18 @32 @52 @0 #5{16 0}
#5{16 2@3 @72 }
#5{16 0}
#5{16 1@60 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@40 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
