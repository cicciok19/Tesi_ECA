:ArrayOb.273{6:Dictionary.4369{32 23:SLSProperty.286331392{:String.17{9 10 "185241480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "VendingMachine"}
 1.3 0.88 5.6 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{325 326 "\[\n
    get => vendingMachine;\n
    private set\n
    \[\n
        vendingMachine.QueueUpdated -= GetNewDestination;\n
        vendingMachine = value;\n
        vendingMachine.QueueUpdated += GetNewDestination;\n
\n
        selectTicket.ChangeVendingMachine(vendingMachine);\n
        manageQueue.ChangeQueueableObject(vendingMachine);\n
    \]\n
\]"}
#4{14 15 "VendingMachine"}
#4{14 15 "VendingMachine"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "131028304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CreateActionList"}
 1.3 0.88 6.4 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{73 74 "\[\n
    GoToVendingMachine();\n
    CompleteQueueing();\n
    SelectTicket();\n
\]"}
#4{16 17 "CreateActionList"}
#4{13 14 "override void"}
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
 1  1 #4{494 863 "\[\n
    if(queuedECA)\n
\t    return;\n
\n
    VendingMachine = station.GetVendingMachine();\n
\n
    Utility.Log(passenger.name + \" going in queue\");\n
    if(goingToLastPosition.State == ActionState.Running)\n
    \[\n
        goingToLastPosition.ChangeDestination(vendingMachine.GetLastPosition());\n
        goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(passenger), false);\n
    \] \n
    else\n
        goingToMachine.ChangeDestination(vendingMachine.GetNextPassengerPosition(passenger));\n
\]"}
#4{17 18 "GetNewDestination"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "131130912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "vendingMachine"}
 1.2 1.88 5.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "vendingMachine"}
#4{14 15 "VendingMachine"}
#4{16 17 ".\\..\\ObjectTypes"}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "186109048"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "station"}
 2.6 1.88 2.8 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "station"}
#4{7 8 "Station"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "129307713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{23 24 "OnVendingMachineReached"}
 1.3 0.88 9.2 19  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{332 333 "\[\n
    Utility.Log(\" arrived \" + passenger.name);\n
\n
    ECAAction goToVendingMachine = (ECAAction)sender;\n
    goToVendingMachine.CompletedAction -= OnVendingMachineReached;\n
    vendingMachine.QueueUpdated -= GetNewDestination;\n
\n
    passenger.ecaTurn = vendingMachine.EcasQueue;\n
    vendingMachine.EcasQueue++;\n
\n
    queuedECA = true;\n
\]"}
#4{23 24 "OnVendingMachineReached"}
#4{4 13 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:SLSConstructor.286331408{#4{9 10 "131125192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "Passenger eca"}
 0.299999 0.88 5.2 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{222 223 ":base(eca)\n
\[\n
        this.passenger = eca;\n
        station = eca.station;\n
        vendingMachine = this.passenger.station.GetVendingMachine(eca);\n
        ticket = vendingMachine.GetComponentInChildren<GrabbableObject>();\n
\]"}
#4{9 12 "BuyTicket"}
#4{0 1 ""}
#4{13 14 "Passenger eca"}
#4{0 1 ""}
}
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
#5{#4{9 10 "131029088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CompleteQueueing"}
 1.3 0.879999 6.4 10  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{95 96 "\[\n
    manageQueue = new ManageQueue(passenger, vendingMachine);\n
    actions.Add(manageQueue);\n
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
 1  1 #4{51 418 "\[\n
    CreateActionList();\n
    base.StartAction();\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{9 10 "186112568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{19 20 "goingToLastPosition"}
 0.299999 1.88 7.6 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{19 20 "goingToLastPosition"}
#4{9 10 "GoToStage"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
#7{#4{9 10 "186111688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "ticket"}
 2.8 1.88 2.4 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "ticket"}
#4{15 16 "GrabbableObject"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#5{#4{9 10 "132377752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "GoToVendingMachine"}
 1.3 0.88 7.2 10  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{529 561 "\[\n
    goingToLastPosition = new GoToStage(vendingMachine.GetLastPosition());\n
    goingToMachine = new GoToStage(vendingMachine.GetNextPassengerPosition(passenger));\n
\n
    List<ECAActionStage> stages = new List<ECAActionStage>();\n
\n
    stages.Add(goingToLastPosition);\n
    stages.Add(goingToMachine);\n
\n
    ECAAction goToVendingMachine = new ECAAction(passenger, stages);\n
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
#7{#4{9 10 "186112128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "selectTicket"}
 1.6 1.88 4.8 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "selectTicket"}
#4{12 13 "SelectTicket"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "131019656"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#7{#4{9 10 "186111248"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "manageQueue"}
 1.8 1.88 4.4 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "manageQueue"}
#4{11 12 "ManageQueue"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "132376184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "SelectTicket"}
 1.3 0.879999 4.8 10  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{147 824 "\[\n
    selectTicket = new SelectTicket(passenger, vendingMachine);\n
    selectTicket.CompletedAction += TicketTaken;\n
    actions.Add(selectTicket);\n
\]"}
#4{12 13 "SelectTicket"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "132376576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "TicketTaken"}
 1.3 0.88 4.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{177 178 "\[\n
    vendingMachine.EcasQueue--;     //questo chiama il GoAhead\n
\n
    passenger.ticketTaken = true;\n
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
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 }
#7{#4{8 9 "75051160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "queuedECA"}
 2.2 1.88 3.6 10  37 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "queuedECA"}
#4{4 5 "bool"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{7 8 "  false"}
#4{0 1 ""}
}
#7{#4{9 10 "186110808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "passenger"}
 2.2 1.88 3.6 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "passenger"}
#4{9 10 "Passenger"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131629752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public BuyTicket : ECACompositeAction"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  3.31695 4.14313 0
 0  0 #4{16 17 "public BuyTicket"}
#4{18 19 "ECACompositeAction"}
#4{34 35 ".\\..\\..\\..\\ECAScripts\\ECAAnimation"}
#8{16 1#4{39 40 "public event EventHandler TicketBought;"}
}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#7{#4{9 10 "103354784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "goingToMachine"}
 1.2 1.88 5.6 29  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "goingToMachine"}
#4{9 15 "GoToStage"}
#4{43 44 ".\\..\\..\\..\\DemoScripts\\ECAAnimations\\Stages"}
#8{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{6 7 "  null"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @273 @94 @183 @0 #8{16 0}
#8{16 9@40 @243 @288 @258 @55 @141 @126 @168 @191 }
#8{16 3@206 @218 @28 }
#8{16 4@156 @16 @102 @70 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 1@230 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{33@0 @0 @0 @0 @0 @0 @0 @0 @114 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@82 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#16{1 }
#16{0 }
#16{1 }
}
