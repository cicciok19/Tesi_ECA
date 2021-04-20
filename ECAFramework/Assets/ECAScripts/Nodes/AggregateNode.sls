:ArrayOb.273{6:Dictionary.4369{16 9:SLSPublicMethod.286331408{:String.17{8 9 "96083520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "GetChild<T>"}
 0.3 0.88 4.4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{287 288 "\[\n
  for(int i=0;i < childrenNodes.Length; i++)\n
  \[\n
\tif(childrenNodes[i] is AggregateNode)\n
\t\[\n
\t\tGameGraphNode found = ((AggregateNode)childrenNodes[i]).GetChild<T>();\n
\t\tif(found != null)\n
\t\t\treturn found;\n
\t\]\n
\telse\n
\tif(childrenNodes[i] is T)\n
\t\treturn childrenNodes[i];\n
  \]\n
\n
  return null;\n
\]"}
#4{11 12 "GetChild<T>"}
#4{13 14 "GameGraphNode"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "96009720"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "childrenNodes"}
 1.4 1.88 5.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "childrenNodes"}
#4{15 16 "GameGraphNode[]"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#6{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95449776"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{30 31 "using UnityEngine.Assertions;\n
"}
}
#3{#4{8 9 "96084696"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "GetChildren"}
 0.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
  return childrenNodes;\n
\]"}
#4{11 12 "GetChildren"}
#4{15 16 "GameGraphNode[]"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96009280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{39 40 ":base(readableName, isTrainingMode)\n
\[\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{61 62 "string readableName, string instructions, bool isTrainingMode"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "96180992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "abstract AggregateNode : GameGraphNode"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{22 23 "abstract AggregateNode"}
#4{13 14 "GameGraphNode"}
#4{0 13 ""}
#6{16 0}
#6{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95453360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#8{#4{8 9 "96007960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{73 74 ":base(readableName, isTrainingMode)\n
\[\n
      SetChildren(childrenNodes);\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{92 93 "string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "96088616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetChildren"}
 1.3 0.88 4.4 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{161 162 "\[\n
   Assert.IsNotNull(childrenNodes);\n
\n
   this.childrenNodes = childrenNodes; \n
   for(int i=0;i<childrenNodes.Length;i++)\n
\tchildrenNodes[i].IsChildNode = true;\n
\]"}
#4{11 12 "SetChildren"}
#4{4 5 "void"}
#4{29 30 "GameGraphNode[] childrenNodes"}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @62 @30 @76 @0 #6{16 0}
#6{16 1@15 }
#6{16 0}
#6{16 1@96 }
#6{16 0}
#6{16 0}
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#6{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@38 @3 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@84 @50 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#6{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
