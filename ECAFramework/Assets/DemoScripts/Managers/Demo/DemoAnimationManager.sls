:ArrayOb.273{6:Dictionary.4369{16 4:JLSFriendDeclare.286331408{:String.17{9 10 "155694808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "155854824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "createAnimationGraph"}
 1.3 0.88 8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1183 1184 "\[\n
    //SIT DOWN ANIMATION SETUP\n
    Transform Destination_2 = GameObject.FindGameObjectWithTag(\"Destination_2\").transform;\n
    Transform SitPoint = GameObject.FindGameObjectWithTag(\"Sit\").transform;\n
    ECA_sitAction SitAction = new ECA_sitAction(ecaAnimator, Destination_2, SitPoint);\n
    allECAActions.Add(ECAActions.SitAction, SitAction);\n
    print(\"ANIMAZIONE AGGIUNTA\");\n
    //AnimationGraph.Add(1, sitAction);\n
\n
    //PICK UP ANIMATION SETUP\n
    Transform ObjToPick = GameObject.FindGameObjectWithTag(\"Pickable\").transform;\n
    Transform DestinationObject = GameObject.FindGameObjectWithTag(\"DestinationObject\").transform;\n
    ECA_pickUpAction PickUpAction = new ECA_pickUpAction(ecaAnimator, DestinationObject, ObjToPick);\n
    allECAActions.Add(ECAActions.PickUpAction, PickUpAction);\n
    //AnimationGraph.Add(1, pickUpAction);\n
\n
    //GO TO ACTION SETUP\n
    Transform Destination = GameObject.FindGameObjectWithTag(\"Destination\").transform;\n
    Transform LookAtObejct = GameObject.FindGameObjectWithTag(\"Paint_1\").transform;\n
    ECA_goToAction GoToAction = new ECA_goToAction(ecaAnimator, Destination, LookAtObejct);\n
    allECAActions.Add(ECAActions.GoToAction, GoToAction);\n
\]"}
#4{20 21 "createAnimationGraph"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "156136352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{49 50 "public DemoAnimationManager : ECAAnimationManager"}
 14.04 2.2 31.36 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{27 28 "public DemoAnimationManager"}
#4{19 20 "ECAAnimationManager"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155695064"}
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
}
:CLSCSSem.1118481{ 56  51 @23 @37 @3 @0 #7{16 0}
#7{16 0}
#7{16 0}
#7{16 1@11 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#10{1 }
#10{0 }
#10{1 }
}
