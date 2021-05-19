:ArrayOb.273{6:Dictionary.4369{16 9:SLSProtectMethod.286331408{:String.17{9 10 "129307713"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "OnArrivedToMachine"}
 1.3 0.879999 7.2 16  18 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{26 206 "\[\n
  OnCompletedAction();\n
\]"}
#4{18 24 "OnArrivedToMachine"}
#4{4 13 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{9 10 "132254096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{44 45 "public ManageVendingMachineQueue : ECAAction"}
 14.9543 2.2 28.16 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{32 33 "public ManageVendingMachineQueue"}
#4{9 10 "ECAAction"}
#4{34 35 ".\\..\\..\\..\\ECAScripts\\ECAAnimation"}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "75281552"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{122 123 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
using System;"}
}
:SLSConstructor.286331408{#4{9 10 "131389920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "Passenger eca,Ve"}
 0.299999 0.88 6.4 47  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{64 65 ":base(eca)\n
\[\n
    this.vendingMachine = vm;\n
    this.eca = eca;\n
\]"}
#4{25 26 "ManageVendingMachineQueue"}
#4{0 1 ""}
#4{31 32 "Passenger eca,VendingMachine vm"}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "129303400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "StartAction"}
 1.3 0.88 4.4 1  14 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{109 418 "\[\n
   if(eca.ecaTurn == 0)\n
   \[\n
\tOnCompletedAction();\n
\treturn;\n
   \]\n
\n
   vendingMachine.GoAhead += OnGoAhead;\n
\]"}
#4{11 12 "StartAction"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "75281296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#3{#4{9 10 "129307712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 24 "OnGoAhead"}
 1.3 0.879999 3.6 16  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{223 224 "\[\n
  GoToStage advance = new GoToStage(vendingMachine.GetNextPassengerPosition(eca));\n
\n
  if(eca.ecaTurn == 1)\n
  \[\n
\tadvance.StageFinished += OnArrivedToMachine;\n
   \tvendingMachine.GoAhead -= OnGoAhead;\n
  \]\n
\n
  eca.ecaTurn--;\n
\]"}
#4{9 24 "OnGoAhead"}
#4{4 13 "void"}
#4{26 27 "object sender, EventArgs e"}
#4{0 1 ""}
 0}
:SLSProtectMember.286331409{#4{9 10 "131124752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{3 4 "eca"}
 3.4 1.88 1.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{3 4 "eca"}
#4{9 10 "Passenger"}
#4{0 1 ""}
#6{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
#11{#4{9 10 "103357424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "vendingMachine"}
 1.2 1.88 5.6 10  39 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "vendingMachine"}
#4{14 15 "VendingMachine"}
#4{16 17 ".\\..\\ObjectTypes"}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{4 5 "null"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @15 @29 @61 @0 #6{16 0}
#6{16 2@96 @81 }
#6{16 0}
#6{16 2@69 @3 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @49 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @37 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
