:ArrayOb.273{6:Dictionary.4369{16 11:SLSProtectMember.286331409{:String.17{9 10 "144398144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "bounds"}
 2.8 1.88 2.4 19  26 #4{0 1 ""}
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
:SLSPublicMethod.286331408{#4{9 10 "142106472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "OnAimCompleted"}
 0.3 0.88 5.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{133 134 "\[\n
    IKSetter ikManager = (IKSetter)sender;\n
    Transform target = ikManager.headIK.solver.target;\n
    Destroy(target.gameObject);\n
\]"}
#4{14 15 "OnAimCompleted"}
#4{4 5 "void"}
#4{29 30 "object sender, EventArgs args"}
#4{0 1 ""}
}
#6{#4{9 10 "142105688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "GetRandomLookPosition"}
 0.3 0.88 8.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{386 428 "\[\n
  Vector3 randomShift = new Vector3(\n
\tcenter.x + bounds.x * extent * (float)Random.Range(-1f, 1f),\n
\tcenter.y + bounds.y * extent * (float)Random.Range(-1f, 1f),\n
\tcenter.z + bounds.z * extent * (float)Random.Range(-1f, 1f)\n
  );\n
\n
  lookPosition.transform.position = randomShift;\n
  GameObject gop = Instantiate(lookPosition);\n
  gop.transform.parent = transform;\n
  return gop.transform;\n
\]"}
#4{21 22 "GetRandomLookPosition"}
#4{9 10 "Transform"}
#4{19 20 "float extent = 1.0f"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75521056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75517984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{63 434 "using System;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
"}
}
#3{#4{9 10 "144396824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "lookPosition"}
 1.6 1.88 4.8 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "lookPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{9 10 "     null"}
#4{0 1 ""}
}
#6{#4{9 10 "142103336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetLookPosition"}
 0.3 0.88 6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{112 113 "\[\n
    GameObject gop = Instantiate(lookPosition); \n
  gop.transform.parent = transform;\n
  return gop.transform;\n
\]"}
#4{15 16 "GetLookPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "142108825"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "operator Transform"}
 1.3 0.88 7.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{25 26 "\[\n
  return d.transform;\n
\]"}
#4{18 19 "operator Transform"}
#4{15 16 "static implicit"}
#4{16 17 "LookableObject d"}
#4{0 1 ""}
}
#3{#4{9 10 "144397264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "center"}
 2.8 1.88 2.4 28  26 #4{0 1 ""}
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
:SLSThisIcon.286331409{#4{9 10 "141876912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public LookableObject : MonoBehaviour"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{21 22 "public LookableObject"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "142108824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{517 518 "\[\n
  // creating look position\n
\n
  lookPosition = new GameObject(name + \"_LookPosition\");\n
  lookPosition.transform.parent = transform;\n
\n
  lookPosition.transform.position = Vector3.zero;\n
  lookPosition.transform.rotation = Quaternion.identity;\n
  lookPosition.transform.localScale = Vector3.one;\n
\n
\n
  // computing object bounds\n
\n
  Renderer renderer = GetComponent<Renderer>();\n
  Assert.IsNotNull(renderer);\n
\n
  bounds = renderer.bounds.size;\n
  center = renderer.bounds.center;\n
\n
  lookPosition.transform.position = center;\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @112 @50 @42 @0 #5{16 0}
#5{16 3@58 @3 @97 }
#5{16 1@126 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@73 @30 @18 @0 @85 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
