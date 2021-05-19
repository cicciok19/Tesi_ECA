:ArrayOb.273{6:Dictionary.4369{32 17:SLSProtectMember.286331409{:String.17{9 10 "131124752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "eca"}
#4{9 10 "Passenger"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "131028304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CreateActionList"}
 1.3 0.88 6.4 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{67 69 "\[\n
  GoToVendingMachine();\n
  CompleteQueueing();\n
  SelectTicket();\n
\]"}
#4{16 17 "CreateActionList"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPrivateMethod.286331408{#4{9 10 "132375008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetNewDestination"}
 1.3 0.88 6.8 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{862 863 "\[\n
    if(queuedECA)\n
\treturn;\n
\n
    Utility.Log(eca.name + \" going in queue\");\n
    goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(eca));\n
    \n
\n
/*\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    GoToStage goToVendingMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));\n
    Utility.Log(eca.name + \" advance at \" + vendingMachine.GetNextPassengerPosition(eca));\n
    TurnStage turn = new TurnStage(vendingMachine.transform);\n
    stages.Add(goToVendingMachine);\n
    stages.Add(turn);\n
\n
    if(goingToMachine != null)\n
\tgoingToMachine.CompletedAction -= EvaluateQueue;\n
\n
    oldGoing = goingToMachine;\n
\n
\n
    goingToMachine = new ECAAction(eca, stages);\n
    action.Add(goingToMachine);    \n
\n
\n
    //newAction.CompletedAction += vendingMachine.PassengerArrived;\n
    newAction.CompletedAction += EvaluateQueue;\n
*/\n
\]"}
#4{17 18 "GetNewDestination"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#3{#4{9 10 "131130912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "vendingMachine"}
 1.2 1.88 5.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "vendingMachine"}
#4{14 15 "VendingMachine"}
#4{16 17 ".\\..\\ObjectTypes"}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "131125192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "Passenger eca"}
 0.299999 0.88 5.2 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{104 105 ":base(eca)\n
\[\n
        this.eca = eca;\n
        vendingMachine = this.eca.station.GetVendingMachine(eca);\n
\]"}
#4{9 12 "BuyTicket"}
#4{0 1 ""}
#4{13 14 "Passenger eca"}
#4{0 1 ""}
}
#6{#4{9 10 "129307713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "OnVendingMachineReached"}
 1.3 0.88 9.2 19  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{187 206 "\[\n
   Utility.Log(\" arrived \" + eca.name);\n
\n
    ECAAction goToVendingMachine = (ECAAction)sender;\n
    goToVendingMachine.CompletedAction -= OnVendingMachineReached;\n
    queuedECA = true;\n
\]"}
#4{23 24 "OnVendingMachineReached"}
#4{4 13 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:JLSGlobalDeclare.286331408{#4{9 10 "131020936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{123 124 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using System;\n
"}
}
#6{#4{9 10 "131029088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CompleteQueueing"}
 1.3 0.879999 6.4 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{70 72 "\[\n
  actions.Add(new ManageVendingMachineQueue(eca, vendingMachine));\n
\]"}
#4{16 17 "CompleteQueueing"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{49 418 "\[\n
   CreateActionList();\n
   base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "132377752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GoToVendingMachine"}
 1.3 0.88 7.2 10  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{501 561 "\[\n
    GoToStage goingToMachine  = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));\n
    TurnStage turn = new TurnStage(vendingMachine.transform);\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
\n
    stages.Add(goingToMachine);\n
    stages.Add(turn);\n
\n
\n
    ECAAction goToVendingMachine = new ECAAction(eca, stages);\n
    actions.Add(goToVendingMachine);\n
\n
    goToVendingMachine.CompletedAction += OnVendingMachineReached;\n
\n
    vendingMachine.QueueUpdated += GetNewDestination;\n
\]"}
#4{18 19 "GoToVendingMachine"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{9 10 "131019656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{9 10 "132376184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "SelectTicket"}
 1.3 0.879999 4.8 10  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{762 824 "\[\n
    //Utility.Log(eca.name + \" selecting ticket\");\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
    PressStage useScreen = new PressStage(vendingMachine.GetScreen(), HandSide.RightHand);\n
    PressStage pressButton = new PressStage(vendingMachine.GetButton(), HandSide.RightHand);\n
    PickStage takeTicket = new PickStage(vendingMachine.GetTicket(), 10, false, HandSide.RightHand);\n
    DropStage dropTicket = new DropStage(takeTicket);\n
    stages.Add(useScreen);\n
    stages.Add(pressButton);\n
    stages.Add(takeTicket);\n
    stages.Add(dropTicket);\n
    stages.Add(new GoToStage(vendingMachine.GetExitPoint()));\n
\n
\n
    ECAAction newAction = new ECAAction(eca, stages);\n
    newAction.CompletedAction += TicketTaken;\n
\n
\n
    actions.Add(newAction);\n
\]"}
#4{12 13 "SelectTicket"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "132376576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "TicketTaken"}
 1.3 0.88 4.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{142 143 "\[\n
    vendingMachine.EcasQueue--;     //questo chiama il GoAhead\n
\n
    if (TicketBought != null)\n
        TicketBought(this, EventArgs.Empty);\n
\]"}
#4{11 12 "TicketTaken"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSExternObject.286331409{#4{9 10 "131374416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 6  46 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{25 26 "ManageVendingMachineQueue"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 }
#3{#4{8 9 "75051160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "queuedECA"}
 2.2 1.88 3.6 10  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "queuedECA"}
#4{4 5 "bool"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{6 7 " false"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131629752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public BuyTicket : ECACompositeAction"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  6.06986 4.34043 0
 0  0 #4{16 17 "public BuyTicket"}
#4{18 19 "ECACompositeAction"}
#4{34 35 ".\\..\\..\\..\\ECAScripts\\ECAAnimation"}
#5{16 2#4{39 40 "public event EventHandler TicketBought;"}
#4{34 35 "public event EventHandler Arrived;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "103354784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "goingToMachine"}
 1.2 1.88 5.6 29  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "goingToMachine"}
#4{9 15 "GoToStage"}
#4{43 44 ".\\..\\..\\..\\DemoScripts\\ECAAnimations\\Stages"}
#5{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @185 @81 @125 @0 #5{16 0}
#5{16 4@3 @42 @170 @201 }
#5{16 3@133 @145 @30 }
#5{16 4@113 @18 @89 @69 }
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 1@157 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @101 @0 @0 @0 @0 @0 @0 @0 }
#1{16@57 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#15{1 }
#15{0 }
#15{1 }
}
