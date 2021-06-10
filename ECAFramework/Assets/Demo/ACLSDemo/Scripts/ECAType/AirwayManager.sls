:ArrayOb.273{6:Dictionary.4369{32 18:JLSFriendDeclare.286331408{:String.17{8 9 "22850176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "108273520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "AddECAAnimator"}
 1.3 0.88 5.6 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{57 58 "\[\n
    return gameObject.AddComponent<ECAAnimatorMxM>();\n
\]"}
#4{14 15 "AddECAAnimator"}
#4{20 21 "override ECAAnimator"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSPrivateMember.286331409{#4{9 10 "139202952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "airwayTable"}
 1.8 1.88 4.4 46  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "airwayTable"}
#4{11 12 "AirwayTable"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "108274304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "HandleGiveOxygen"}
 1.3 0.88 6.4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{138 139 "\[\n
    giveOxygen = new GiveOxygen(this, oxygen, patient);\n
    giveOxygen.CompletedAction += OnOxygenGiven;\n
    giveOxygen.StartAction();\n
\]"}
#4{16 17 "HandleGiveOxygen"}
#4{4 5 "void"}
#4{30 31 "Oxygen oxygen, Patient patient"}
#4{0 1 ""}
}
#6{#4{9 10 "139204272"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{10 11 "giveOxygen"}
 2 1.88 4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{10 11 "giveOxygen"}
#4{10 11 "GiveOxygen"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{9 10 "140118592"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{26 27 "public AirwayManager : ECA"}
 18.2457 2.2 16.64 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public AirwayManager"}
#4{3 7 "ECA"}
#4{0 13 ""}
#7{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "22853760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{93 94 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using System;\n
"}
}
#6{#4{9 10 "139203392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "patient"}
 2.6 1.88 2.8 28  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "patient"}
#4{7 8 "Patient"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "108274696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "HandleCapnography"}
 1.3 0.88 6.8 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{160 161 "\[\n
    capnography = new Capnography(this, capnographyTube, patient);\n
    capnography.CompletedAction += OnCapnographyCompleted;\n
    capnography.StartAction();\n
\]"}
#4{17 18 "HandleCapnography"}
#4{4 5 "void"}
#4{42 43 "Transform capnographyTube, Patient patient"}
#4{0 1 ""}
}
#6{#4{9 10 "139201192"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "capnography"}
 1.8 1.88 4.4 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "capnography"}
#4{11 12 "Capnography"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "108269208"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Handle"}
 1.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{302 303 "\[\n
    base.Handle(intent);\n
    switch (intent.IntentName)\n
    \[\n
        case \"GiveOxygen\":\n
            HandleGiveOxygen(airwayTable.GetOxygen(), patient);\n
            break;\n
        case \"Capnography\":\n
            HandleCapnography(airwayTable.GetCapnographyTube(), patient);\n
            break;\n
    \]\n
\]"}
#4{6 7 "Handle"}
#4{13 14 "override void"}
#4{13 14 "Intent intent"}
#4{0 1 ""}
}
#5{#4{9 10 "108270776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{312 313 "\[\n
    base.Start();\n
    patient = FindObjectOfType<Patient>();\n
    medicalRoom = FindObjectOfType<MedicalRoom>();\n
    airwayTable = medicalRoom.GetAirwayTable();\n
\n
    //just for debug\n
    //HandleGiveOxygen(airwayTable.GetOxygen(), patient);\n
\n
    //HandleCapnography(airwayTable.GetCapnographyTube(), patient);\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{9 10 "139203832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{7 8 "turnObj"}
 2.6 1.88 2.8 10  29 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{7 8 "turnObj"}
#4{9 10 "Transform"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "108273912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{31 32 "SubscribeHandlerToIntentManager"}
 1.3 0.88 12.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{202 203 "\[\n
    IntentName = new List<string> \[ \"GiveOxygen\", \"Capnography\" \];\n
    IntentManager.Instance.AddIntentHandler(IntentName[0], this);\n
    IntentManager.Instance.AddIntentHandler(IntentName[1], this);\n
\]"}
#4{31 32 "SubscribeHandlerToIntentManager"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
#8{#4{9 10 "108275088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{22 23 "OnCapnographyCompleted"}
 1.3 0.88 8.8 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{95 96 "\[\n
    capnography.CompletedAction -= OnCapnographyCompleted;\n
    patient.OnCapnographyDone();\n
\]"}
#4{22 23 "OnCapnographyCompleted"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#8{#4{9 10 "108275480"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "OnOxygenGiven"}
 1.3 0.88 5.2 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 82 "\[\n
    giveOxygen.CompletedAction -= OnOxygenGiven;\n
    patient.OnOxygenGiven();\n
\]"}
#4{13 14 "OnOxygenGiven"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
#6{#4{9 10 "139201632"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "medicalRoom"}
 1.8 1.88 4.4 37  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "medicalRoom"}
#4{11 12 "MedicalRoom"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{9 10 "139202512"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "intentNames"}
 1.3 1.88 4.4 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  0 #4{11 12 "intentNames"}
#4{8 9 "string[]"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{32 33 " \[ \"GiveOxygen\", \"Capnography\" \]"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @65 @79 @3 @0 #7{16 6@50 @114 @87 @204 @23 @153 }
#7{16 0}
#7{16 4@38 @102 @180 @192 }
#7{16 2@141 @11 }
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @219 @0 @0 @0 }
#1{16@129 @168 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
