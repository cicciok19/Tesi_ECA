:ArrayOb.273{6:Dictionary.4369{32 23:SLSPrivateMember.286331409{:String.17{9 10 "103982032"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "ticketReady"}
 1.8 1.88 4.4 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "ticketReady"}
#4{11 12 "TicketReady"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103977632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "destinations"}
 1.6 1.88 4.8 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "destinations"}
#4{13 14 "Destination[]"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104346120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "GetExitPoint"}
 0.3 0.88 4.8 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{35 36 "\[\n
    return exitPoint.transform;\n
\]"}
#4{12 13 "GetExitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103981152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "button"}
 2.8 1.88 2.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "button"}
#4{15 16 "PressableObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103981592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "screen"}
 2.8 1.88 2.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "screen"}
#4{15 16 "PressableObject"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "13894240"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "isQueued"}
 0.3 0.879999 3.2 1  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{91 95 "\[\n
  return Vector3.Distance(eca.transform.position, FrontPosition) <= PROXIMITY_DISTANCE;\n
\]"}
#4{8 17 "isQueued"}
#4{4 5 "bool"}
#4{7 8 "ECA eca"}
#4{0 1 ""}
}
#3{#4{9 10 "103982912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "idx"}
 3.4 1.88 1.2 28  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "idx"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{3 4 "  0"}
#4{0 1 ""}
}
#6{#4{9 10 "104350432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "GetButton"}
 0.3 0.88 3.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{22 23 "\[\n
    return button;\n
\]"}
#4{9 10 "GetButton"}
#4{15 16 "PressableObject"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "103570976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "GetTicket"}
 0.3 0.88 3.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{196 197 "\[\n
    GameObject ticket = (GameObject)Instantiate(Resources.Load(\"Prefab/Ticket\"), ticketReady.transform);\n
    ticket.transform.localPosition = new Vector3(0, 0, 0);\n
    return ticket.transform;\n
\]"}
#4{9 10 "GetTicket"}
#4{9 10 "Transform"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104345728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "GetDestinations"}
 0.3 0.88 6 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{233 234 "\[\n
    Destination[] tempDestinations = destinations;\n
    foreach(var d in tempDestinations)\n
    \[\n
        int number = Int32.Parse(Regex.Match(d.name, @\"\\d+\").Value);\n
        destinations[number] = d;\n
    \]\n
    return destinations;\n
\]"}
#4{15 16 "GetDestinations"}
#4{13 14 "Destination[]"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103978512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "exitPoint"}
 2.2 1.88 3.6 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "exitPoint"}
#4{15 16 "DestinationExit"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104346512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "PassengerArrived"}
 0.3 0.88 6.4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{78 79 "\[\n
    if (QueueUpdated != null)\n
        QueueUpdated(this, EventArgs.Empty);\n
\]"}
#4{16 17 "PassengerArrived"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "131021960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{131 132 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
using System.Text.RegularExpressions;\n
"}
}
#6{#4{9 10 "103569800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "GetScreen"}
 0.3 0.88 3.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{22 23 "\[\n
    return screen;\n
\]"}
#4{9 10 "GetScreen"}
#4{15 16 "PressableObject"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "131018888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 49 ""}
}
:SLSProperty.286331392{#4{8 9 "75276592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "EcasQueue"}
 1.3 0.879999 3.6 1  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{536 537 "\[ \n
    get => ecasQueue;\n
    set\n
    \[\n
        int prevQueueValue = ecasQueue;\n
        ecasQueue = value;\n
\n
        if (ecasQueue != 0)\n
            Occupied = true;\n
        else\n
            Occupied = false;\n
\n
        if(value!=0 && value < prevQueueValue)\n
        \[\n
            if (GoAhead != null)\n
                GoAhead(this, EventArgs.Empty);\n
        \]\n
        else if(value == 0)\n
        \[\n
            if (FreeMachine != null)\n
                FreeMachine(this, EventArgs.Empty);\n
\n
            lastPassenger = null;\n
        \]\n
\n
    \]\n
\]"}
#4{9 10 "EcasQueue"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103979392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "ecasQueue"}
 2.2 1.88 3.6 19  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "ecasQueue"}
#4{3 4 "int"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103978952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "lastPassenger"}
 1.4 1.88 5.2 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "lastPassenger"}
#4{9 10 "Passenger"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "103568624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "GetNextPassengerPosition"}
 0.3 0.88 9.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{415 416 "\[\n
    if(eca.ecaTurn == -1)\n
    \[\n
        eca.ecaTurn = EcasQueue;\n
        EcasQueue++;\n
        Utility.Log(eca.name + \" TO \" + destinations[ecasQueue - 1].name);\n
        return destinations[ecasQueue-1].transform.position;\n
    \]\n
    else\n
    \[\n
        if (eca.ecaTurn == 0)\n
            return destinations[0].transform.position;\n
        else\n
            return destinations[eca.ecaTurn].transform.position;\n
    \]\n
\]"}
#4{24 25 "GetNextPassengerPosition"}
#4{7 8 "Vector3"}
#4{13 14 "Passenger eca"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "131538328"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{45 46 "public VendingMachine : ECAInteractableObject"}
 14.7714 2.2 28.8 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.70763 4.04449 0
 0  0 #4{21 22 "public VendingMachine"}
#4{21 22 "ECAInteractableObject"}
#4{0 13 ""}
#5{16 3#4{39 40 "public event EventHandler QueueUpdated;"}
#4{34 35 "public event EventHandler GoAhead;"}
#4{38 39 "public event EventHandler FreeMachine;"}
}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "74616064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "PROXIMITY_DISTANCE"}
 0.400002 1.88 7.2 37  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "PROXIMITY_DISTANCE"}
#4{11 12 "const float"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " 0.2f"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "103567840"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{278 279 "\[\n
    button = GetComponentInChildren<ECAButton>();\n
    screen = GetComponentInChildren<ECAScreen>();\n
    ticketReady = GetComponentInChildren<TicketReady>();\n
    destinations = GetComponentsInChildren<Destination>();\n
    exitPoint = GetComponentInChildren<DestinationExit>();\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#9{#4{9 10 "131372296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "FrontPosition"}
 1.3 0.879999 5.2 1  21 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{48 49 "\[\n
  get => destinations[0].transform.position;\n
\]"}
#4{13 14 "FrontPosition"}
#4{7 8 "Vector3"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @248 @165 @185 @0 #5{16 8@45 @60 @3 @18 @138 @221 @206 @87 }
#5{16 1@265 }
#5{16 1@280 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{33@236 @173 @114 @102 @126 @153 @33 @0 @0 @0 @0 @0 @75 @0 @0 @292 @0 @0 @0 @0 @0 @0 @0 @193 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
