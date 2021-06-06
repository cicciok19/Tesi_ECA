:ArrayOb.273{6:Dictionary.4369{16 9:SLSThisIcon.286331409{:String.17{8 9 "93843392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public ProximityNode : SmartActionNode"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public ProximityNode"}
#4{15 16 "SmartActionNode"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "95560184"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ProximityAction "}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{88 89 ": base(readableName, isTrainingMode)\n
\[\n
        ProximityAction = proximitySmartAction;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{78 79 "ProximityAction proximitySmartAction, string readableName, bool isTrainingMode"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "155683288"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{8 9 "95561064"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "ProximityAction "}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{117 118 ": base(readableName, isTrainingMode)\n
\[\n
        ProximityAction = proximitySmartAction;\n
        SitPoint = sitPoint;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{98 99 "ProximityAction proximitySmartAction, Transform sitPoint, string readableName, bool isTrainingMode"}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "157165584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "OnTriggerEntered"}
 1.3 0.88 6.4 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{146 147 "\[\n
    ProximityAction.Entered -= OnTriggerEntered;\n
    ProximityAction.Finish();\n
\n
    //DEVO GESTIRE LE ANIMAZIONI DELL'ECA\n
\n
    SetCompleted();\n
\]"}
#4{16 17 "OnTriggerEntered"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "156735120"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "SitPoint"}
 2.4 1.88 3.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "SitPoint"}
#4{9 10 "Transform"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{5 6 " null"}
#4{0 1 ""}
}
#9{#4{9 10 "156734680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{15 16 "ProximityAction"}
 1 1.88 6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "ProximityAction"}
#4{15 16 "ProximityAction"}
#4{0 1 ""}
#5{16 0}
#5{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155690456"}
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
:SLSPublicMethod.286331408{#4{9 10 "157166368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "StartNode"}
 1.3 0.88 3.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{429 430 "\[\n
    base.StartNode(speak);\n
    ProximityAction.Entered += OnTriggerEntered;\n
    CurrentSmartAction = this.ProximityAction;\n
    base.StartNode(speak);\n
\n
    //se sono in modalit\195\\160\ training lancia il messaggio di descrizione del task\n
    if (IsTrainingMode)\n
    \[\n
        SmartActionCustomArgs args = new SmartActionCustomArgs(ProximityAction, ProximityAction.Start, \"Description\");\n
        AskExecutionAfterMessage(args);\n
    \]\n
\]"}
#4{9 10 "StartNode"}
#4{13 14 "override void"}
#4{17 18 "bool speak = true"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @91 @29 @0 #5{16 0}
#5{16 2@76 @61 }
#5{16 1@49 }
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@99 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@37 @17 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
