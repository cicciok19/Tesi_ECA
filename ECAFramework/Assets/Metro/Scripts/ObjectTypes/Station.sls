:ArrayOb.273{6:Dictionary.4369{16 12:SLSProtectMethod.286331408{:String.17{9 10 "142109216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{395 396 "\[\n
    platform = GetComponentInChildren<LandingArea>();\n
    Assert.IsNotNull(platform);\n
    train = GameObject.FindObjectOfType<Train>();\n
    Assert.IsNotNull(train);\n
    binary = GameObject.FindObjectOfType<Binary>();\n
    Assert.IsNotNull(binary);\n
    vendingMachines = GetComponentsInChildren<VendingMachine>();\n
    Assert.IsNotNull(vendingMachines);\n
\n
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
:SLSPublicMethod.286331408{#4{9 10 "103570193"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetVendingMachine"}
 0.3 0.88 6.8 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{448 449 "\[\n
    VendingMachine vendingMachine = null;\n
    float min = Mathf.Infinity;\n
\n
    foreach(VendingMachine vm in vendingMachines)\n
    \[\n
        float distance = Vector3.Distance(eca.transform.position, vm.transform.position);\n
        if(distance <= min)\n
        \[\n
            vendingMachine = vm;\n
            min = distance;\n
        \]\n
    \]\n
\n
    //vendingMachine = vendingMachines[0];\n
    Assert.IsNotNull(vendingMachine);\n
    return vendingMachine;\n
\]"}
#4{17 18 "GetVendingMachine"}
#4{14 15 "VendingMachine"}
#4{7 8 "ECA eca"}
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
:SLSPrivateMethod.286331408{#4{9 10 "142106864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnTrainArriving"}
 1.3 0.88 6 28  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{114 148 "\[\n
    Utility.Log(\"Train is arriving\");\n
    if(TrainArriving != null)\n
\t    TrainArriving(this, EventArgs.Empty);\n
\]"}
#4{15 16 "OnTrainArriving"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#5{#4{8 9 "75467320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "vendingMachines"}
 1 1.88 6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "vendingMachines"}
#4{16 17 "VendingMachine[]"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "103570192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetVendingMachine"}
 0.3 0.88 6.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{357 358 "\[\n
    VendingMachine vendingMachine = null;\n
    int min = 1000000;\n
\n
    foreach(VendingMachine vm in vendingMachines)\n
    \[\n
        if(vm.EcasQueue <= min)\n
        \[\n
            vendingMachine = vm;\n
            min = vm.EcasQueue;\n
        \]\n
    \]\n
\n
    //vendingMachine = vendingMachines[0];\n
    Assert.IsNotNull(vendingMachine);\n
    return vendingMachine;\n
\]"}
#4{17 18 "GetVendingMachine"}
#4{14 15 "VendingMachine"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "103569016"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "GetPlatform"}
 0.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{24 25 "\[\n
    return platform;\n
\]"}
#4{11 12 "GetPlatform"}
#4{11 12 "LandingArea"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141978264"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public Station : MonoBehaviour"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.70763 4.14313 0
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
:CLSCSSem.1118481{ 56  51 @123 @138 @146 @0 #6{16 0}
#6{16 1@42 }
#6{16 1@72 }
#6{16 1@3 }
#6{16 3@15 @57 @84 }
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @111 @99 @0 @0 @30 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
