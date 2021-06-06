:ArrayOb.273{6:Dictionary.4369{32 19:SLSPrivateMember.286331409{:String.17{8 9 "75634552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "train"}
 3 1.88 2 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "train"}
#4{5 6 "Train"}
#4{16 17 "./../ObjectTypes"}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 20 ""}
#4{0 1 ""}
}
#3{#4{8 9 "75635872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "maxRange"}
 2.4 1.88 3.2 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "maxRange"}
#4{5 6 "float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "103941488"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "actionIdx"}
 2.2 1.88 3.6 37  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "actionIdx"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{3 4 "  0"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "131123872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "ticketTaken"}
 1.3 1.88 4.4 1  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "ticketTaken"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "74951561"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "reachPlatform"}
 1.4 1.88 5.2 19  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "reachPlatform"}
#4{13 14 "ReachPlatform"}
#4{19 20 "./../ComplexActions"}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "74951560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 14 "enterTrain"}
 2 1.88 4 28  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 14 "enterTrain"}
#4{10 14 "EnterTrain"}
#4{19 20 "./../ComplexActions"}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "131126072"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "inQueue"}
 1.3 1.88 2.8 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "inQueue"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "131131352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "buyTicket"}
 2.2 1.88 3.6 10  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "buyTicket"}
#4{9 10 "BuyTicket"}
#4{19 20 ".\\..\\ComplexActions"}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "142109217"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{789 790 "\[\n
    base.Start();\n
\n
    ecaTurn = -1;       //non \232\ in coda\n
\n
    station = GameObject.FindObjectOfType<Station>();\n
    //station.TrainArriving += OnTrainArriving;\n
\n
    train = station.train;\n
    inQueue = false;\n
    ticketTaken = false;\n
\n
    float chance = UnityEngine.Random.Range(0f, 1f);\n
\n
    if(chance < TAKE_TICKET_CHANCE)\n
    \[\n
        Utility.Log(name + \" is taking ticket\");\n
    \tbuyTicket = new BuyTicket(this);\n
\n
\tbuyTicket.CompletedAction += OnActionCompleted;\n
\tactionList.Add(buyTicket);\n
\n
\tGoToTakeTrain();\n
    \]\n
    else\n
    \[\n
\tGoToTakeTrain();\n
    \]\n
    \n
\n
\n
    //max distance from the destination (es. door when waiting, binary's empty)\n
    //maxRange = 5f;\n
    maxRange = 10f;\n
\n
    actionList[0].StartAction();\n
\n
    //GoToPlatform();\n
    // buyTicket.GoToVendingMachine();\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSGlobalDeclare.286331408{#4{8 9 "75516960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{145 146 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.AI;\n
using UnityEngine.Assertions;\n
"}
}
#7{#4{9 10 "131126512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "ecaTurn"}
 1.3 1.88 2.8 1  36 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "ecaTurn"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75520032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 39 ""}
}
#6{#4{8 9 "74954200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "TAKE_TICKET_CHANCE"}
 0.4 1.88 7.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "TAKE_TICKET_CHANCE"}
#4{11 12 "const float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{7 8 "   0.2f"}
#4{0 1 ""}
}
#7{#4{9 10 "131124312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "station"}
 1.3 1.88 2.8 1  34 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "station"}
#4{7 8 "Station"}
#4{16 17 "./../ObjectTypes"}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{8 9 "74950784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "CreateAnimator"}
 1.3 0.88 5.6 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{207 208 "\[\n
    ecaAnimator = GetComponent<ECAAnimatorMxM>();\n
    if (ecaAnimator == null)\n
        ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();\n
    Assert.IsNotNull(ecaAnimator);\n
\n
    ecaAnimator.Init();\n
\]"}
#4{14 15 "CreateAnimator"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPrivateMethod.286331408{#4{9 10 "142106865"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnActionCompleted"}
 1.3 0.88 6.8 10  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{91 148 "\[\n
  actionIdx++;\n
  if(actionIdx < actionList.Count)\n
\tactionList[actionIdx].StartAction();\n
\]"}
#4{17 18 "OnActionCompleted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "103937528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "actionList"}
 2 1.88 4 37  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "actionList"}
#4{15 16 "List<ECAAction>"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{23 24 "  new List<ECAAction>()"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "141875256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{22 23 "public Passenger : ECA"}
 18.9771 2.2 14.08 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{16 17 "public Passenger"}
#4{3 7 "ECA"}
#4{0 13 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#8{#4{9 10 "103351953"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "GoToTakeTrain"}
 1.3 0.88 5.2 10  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{283 284 "\[\n
   ReachPlatform reachPlatform = new ReachPlatform(this);\n
   reachPlatform.CompletedAction += OnActionCompleted;\n
   actionList.Add(reachPlatform);\n
\n
   EnterTrain enterTrain = new EnterTrain(this);\n
   actionList.Add(enterTrain);\n
   enterTrain.CompletedAction += OnActionCompleted;\n
\]"}
#4{13 14 "GoToTakeTrain"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @235 @135 @158 @0 #5{16 3@3 @18 @108 }
#5{16 5@166 @78 @63 @220 @33 }
#5{16 1@208 }
#5{16 3@196 @123 @249 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @181 @0 @143 @0 @48 @0 @93 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
