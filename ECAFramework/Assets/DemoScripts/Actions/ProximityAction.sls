:ArrayOb.273{6:Dictionary.4369{16 7:SLSPublicMethod.286331408{:String.17{8 9 "96178232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Start"}
 1.3 0.88 2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{61 62 "\[\n
    base.Start();\n
    Proximity.OnProximity += OnEntered;\n
\]"}
#4{5 6 "Start"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{9 10 "129169584"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "int smartActionI"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{82 83 ": base(smartActionID)\n
\[\n
        ProximityTriggerID = triggerID;\n
        Start();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{35 36 "int smartActionID, string triggerID"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "130158928"}
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
:SLSProtectMember.286331409{#4{9 10 "129170904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{18 19 "ProximityTriggerID"}
 0.4 1.88 7.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{18 19 "ProximityTriggerID"}
#4{6 7 "string"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "18461144"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{36 37 "public ProximityAction : SmartAction"}
 16.4171 2.2 23.04 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.92497 3.94584 0
 0  0 #4{22 23 "public ProximityAction"}
#4{11 12 "SmartAction"}
#4{0 13 ""}
#8{16 1#4{34 35 "public event EventHandler Entered;"}
}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "130157904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "96185680"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "OnEntered"}
 1.3 0.88 3.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{361 362 "\[\n
    Proximity Proximity = (Proximity)sender;\n
    if (String.Equals(Proximity.ID, this.ProximityTriggerID))\n
    \[\n
        Proximity.OnProximity -= OnEntered;\n
        Proximity.enabled = false;\n
        EventArgs ev = new EventArgs();\n
        Proximity.gameObject.SetActive(false);\n
        if (Entered != null)\n
            Entered(this, EventArgs.Empty);\n
    \]\n
\]"}
#4{9 10 "OnEntered"}
#4{4 5 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @50 @27 @65 @0 #8{16 0}
#8{16 1@35 }
#8{16 1@73 }
#8{16 0}
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@15 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
