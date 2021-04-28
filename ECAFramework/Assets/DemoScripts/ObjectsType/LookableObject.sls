:ArrayOb.273{6:Dictionary.4369{16 9:SLSThisIcon.286331409{:String.17{8 9 "93965016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public LookableObject : MonoBehaviour"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{21 24 "public LookableObject"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "75515065"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "GetRandomLookPosition"}
 0.3 0.88 8.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{356 357 "\[\n
  System.Random random = new System.Random();\n
\n
  Vector3 randomShift = new Vector3(\n
\tcenter.x + bounds.x * extent * (float)random.NextDouble(),\n
\tcenter.y + bounds.y * extent * (float)random.NextDouble(),\n
\tcenter.z + bounds.z * extent * (float)random.NextDouble()\n
  );\n
\n
  lookPosition.transform.position = randomShift; \n
\n
  return lookPosition.transform;\n
\]"}
#4{21 22 "GetRandomLookPosition"}
#4{9 10 "Transform"}
#4{19 20 "float extent = 1.0f"}
#4{0 1 ""}
}
#6{#4{8 9 "75515064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetLookPosition"}
 0.3 0.88 6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{36 38 "\[\n
  return lookPosition.transform;\n
\]"}
#4{15 16 "GetLookPosition"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "73679576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "lookPosition"}
 1.6 1.88 4.8 10  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "lookPosition"}
#4{10 11 "GameObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{6 7 "  null"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "94856000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{49 50 "using UnityEngine;\n
using UnityEngine.Assertions;\n
"}
}
:SLSPrivateMethod.286331408{#4{8 9 "75514672"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{516 518 "\[\n
  // creating look position\n
\n
  lookPosition = new GameObject(name + \"_LookPosition\");\n
  lookPosition.transform.parent = transform;\n
\n
  lookPosition.transform.position = Vector3.zero;\n
  lookPosition.transform.rotation = Quaternion.identity;\n
  lookPosition.transform.localScale = Vector3.one;\n
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
#7{#4{8 9 "73676057"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "center"}
 2.8 1.88 2.4 28  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "center"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "73676056"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "bounds"}
 2.8 1.88 2.4 19  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "bounds"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
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
 0  0 #4{75 76 "public static implicit operator Transform(LookableObject d) => d.transform;"}
}
}
:CLSCSSem.1118481{ 56  51 @3 @56 @106 @0 #5{16 0}
#5{16 3@41 @91 @76 }
#5{16 1@64 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@29 @17 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
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
#12{1 }
#12{0 }
#12{1 }
}
