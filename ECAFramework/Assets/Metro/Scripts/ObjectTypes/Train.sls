:ArrayOb.273{6:Dictionary.4369{16 16:SLSPrivateMethod.286331408{:String.17{9 10 "176146584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "WaitDoorsOpen"}
 1.3 0.88 5.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 115 "\[\n
    yield return new WaitForSeconds(10f);\n
    if (DoorsOpen != null)\n
        DoorsOpen(this, EventArgs.Empty);\n
\]"}
#4{13 14 "WaitDoorsOpen"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "144297360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "passengers"}
 1.3 1.88 4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "passengers"}
#4{3 4 "int"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "75279136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "doorsOpened"}
 1.3 0.879999 4.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{11 12 "doorsOpened"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "176139920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "WaitArriving"}
 1.3 0.88 4.8 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{150 152 "\[\n
    yield return new WaitForSeconds(10f);\n
    if (Arriving != null)\n
        Arriving(this, EventArgs.Empty);\n
\n
    StartCoroutine(WaitDoorsOpen());\n
\]"}
#4{12 13 "WaitArriving"}
#4{11 12 "IEnumerator"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMember.286331409{#4{9 10 "144298240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "doors"}
 3 1.88 2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "doors"}
#4{11 12 "TrainDoor[]"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141873048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{28 29 "public Train : MonoBehaviour"}
 17.88 2.2 17.92 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.20052 3.74855 0
 0  0 #4{12 13 "public Train"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 2#4{35 36 "public event EventHandler Arriving;"}
#4{36 37 "public event EventHandler DoorsOpen;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "176138744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{224 227 "\[\n
    doors = GameObject.FindObjectsOfType<TrainDoor>();\n
    places = GameObject.FindObjectsOfType<ECAInteractableObject>();\n
    landingArea = GameObject.FindObjectOfType<LandingArea>();\n
    StartCoroutine(WaitArriving());\n
\]"}
#4{5 6 "Start"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "176136784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "NearestDoorPosition"}
 0.3 0.88 7.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{77 350 "\[\n
  return Randomize.GetRandomPosition(NearestDoor(ecaPosition).FrontDoor);\n
\]"}
#4{19 20 "NearestDoorPosition"}
#4{7 8 "Vector3"}
#4{19 20 "Vector3 ecaPosition"}
#4{0 1 ""}
}
#11{#4{9 10 "176136785"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "NearestDoor"}
 0.3 0.88 4.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{287 350 "\[\n
  TrainDoor closest = null;\n
  float distance = Mathf.Infinity;\n
\n
  foreach(var door in doors)\n
  \[\n
\tfloat distanceToDoor = Vector3.Distance(ecaPosition, door.transform.position);\n
\tif(distanceToDoor < distance)\n
\t\[\n
\t\tdistance = distanceToDoor;\n
\t\tclosest = door;\n
\t\]\n
  \]\n
\n
  return closest;\n
\]"}
#4{11 20 "NearestDoor"}
#4{9 10 "TrainDoor"}
#4{19 20 "Vector3 ecaPosition"}
#4{0 1 ""}
}
#11{#4{9 10 "176141488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GetPassengerPlaces"}
 0.3 0.88 7.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{22 23 "\[\n
    return places;\n
\]"}
#4{18 19 "GetPassengerPlaces"}
#4{23 24 "ECAInteractableObject[]"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "74750904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "74750648"}
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
#8{#4{9 10 "144296920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "places"}
 2.8 1.88 2.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "places"}
#4{23 24 "ECAInteractableObject[]"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "143083272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "landingArea"}
 1.8 1.88 4.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 13 "landingArea"}
#4{11 14 "LandingArea"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "75276168"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "trainArrived"}
 1.3 0.88 4.8 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{12 13 "trainArrived"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "176144624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "GetTrainDoors"}
 0.3 0.88 5.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[\n
    return doors;\n
\]"}
#4{13 14 "GetTrainDoors"}
#4{11 12 "TrainDoor[]"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @70 @142 @134 @0 #6{16 2@55 @150 }
#6{16 1@165 }
#6{16 2@43 @3 }
#6{16 1@86 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @15 @0 @0 @0 }
#1{30@193 @122 @98 @110 @180 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @30 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#16{1 }
#16{0 }
#16{1 }
}
