:ArrayOb.273{6:Dictionary.4369{16 9:SLSProtectMethod.286331408{:String.17{9 10 "142109216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{254 255 "\[\n
  platform = GetComponentInChildren<LandingArea>();\n
    Assert.IsNotNull(platform);\n
  train = GameObject.FindObjectOfType<Train>();\n
    Assert.IsNotNull(train);\n
    binary = GameObject.FindObjectOfType<Binary>();\n
\n
  train.Arriving += OnTrainArriving;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSInternalMember.286331409{#4{8 10 "75634552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "train"}
 3 1.88 2 19  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "train"}
#4{5 6 "Train"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "144629600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "platform"}
 2.4 1.88 3.2 10  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 12 "platform"}
#4{11 12 "LandingArea"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 10 "75632792"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "binary"}
 2.8 1.88 2.4 28  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "binary"}
#4{6 7 "Binary"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "176136392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "GetPositionOnPlatform"}
 0.3 0.88 8.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{44 49 "\[\n
    return platform.GetRandomPosition();\n
\]"}
#4{21 22 "GetPositionOnPlatform"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "142106864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnTrainArriving"}
 1.3 0.88 6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{110 148 "\[\n
    Utility.Log(\"Train is arriving\");\n
    if(TrainArriving != null)\n
\tTrainArriving(this, EventArgs.Empty);\n
\]"}
#4{15 16 "OnTrainArriving"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141978264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public Station : MonoBehaviour"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  4.25873 4.63636 0
 0  0 #4{14 15 "public Station"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#6{16 1#4{40 41 "public event EventHandler TrainArriving;"}
}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "74751160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{63 64 "using System;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "74751416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @84 @99 @107 @0 #6{16 0}
#6{16 1@30 }
#6{16 1@72 }
#6{16 1@3 }
#6{16 2@15 @45 }
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@60 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
