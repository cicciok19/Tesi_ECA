:ArrayOb.273{6:Dictionary.4369{16 10:JLSFriendDeclare.286331408{:String.17{8 9 "86307824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{155 156 "public static EmotionalMessage zero = new EmotionalMessage(\"@@@@@@###ppopopoggvhgkhgt6r\249\\167\\167\\167\\167\\167\\",AvailableEmotions.None,\"@@@@@@###ppopopoggvhgkhgt6r\249\\167\\167\\167\\167\\167\\");"}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86308848"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{556 557 "using System;\n
\n
public struct MessageAction \[\n
\tpublic string actionType;\n
\tpublic string parameter;\n
\tpublic static MessageAction zero = new MessageAction(\"\",\"\");\n
\n
\tpublic MessageAction(string actionType,string parameter) \[\n
\t\tthis.actionType = actionType;\n
\t\tthis.parameter = parameter;\n
     \t\]\n
\n
\tpublic bool IsLookAt() \[\n
\t\treturn actionType == \"LookAt\";\n
\t\]\n
\n
\tpublic bool IsPointAt() \[\n
\t\treturn actionType == \"PointAt\";\n
\t\]\n
\n
\tpublic bool IsMoveTo() \[\n
\t\treturn actionType == \"MoveTo\";\n
\t\]\n
\n
\tpublic bool IsMakeGesture() \[\n
\t\treturn actionType == \"MakeGesture\";\n
\t\]\n
\]"}
}
:SLSConstructor.286331408{#4{9 10 "104343400"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string message, "}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{80 81 "\[\n
  this.message = message;\n
  this.emotion = emotion;\n
  this.action = action;\n
\]\n
"}
#4{16 17 "EmotionalMessage"}
#4{0 1 ""}
#4{55 56 "string message, AvailableEmotions emotion,string action"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{8 9 "86245152"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "parsedAction"}
 1.3 0.88 4.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{226 227 "\[\n
  get \[\n
\tstring[] parts = action.Split(new Char[] \['@'\]);\n
\n
\tif(parts.Length < 2)\n
\t\treturn MessageAction.zero;\n
\n
\tMessageAction ma = new MessageAction();\n
\n
\tma.actionType = parts[0];\n
\tma.parameter = parts[1];\n
\n
\treturn ma;\n
  \]\n
\]"}
#4{12 13 "parsedAction"}
#4{13 15 "MessageAction"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "86348744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "message"}
 1.3 0.88 2.8 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{7 8 "message"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "86348745"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "action"}
 1.3 0.88 2.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{6 8 "action"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "103997936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "operator !="}
 1.3 0.88 4.4 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{108 110 "\[\n
  if(a.message == b.message)\n
\treturn false;\n
\n
  if(a.action == b.action)\n
\treturn false;\n
\n
\n
  return true;\n
\]\n
"}
#4{11 12 "operator !="}
#4{11 12 "static bool"}
#4{37 38 "EmotionalMessage a,EmotionalMessage b"}
#4{0 1 ""}
}
#8{#4{9 10 "103997937"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "operator =="}
 1.3 0.88 4.4 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{108 110 "\[\n
  if(a.message != b.message)\n
\treturn false;\n
\n
  if(a.action != b.action)\n
\treturn false;\n
\n
\n
  return true;\n
\]\n
"}
#4{11 12 "operator =="}
#4{11 12 "static bool"}
#4{37 38 "EmotionalMessage a,EmotionalMessage b"}
#4{0 1 ""}
}
#7{#4{8 9 "86348352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "emotion"}
 1.3 0.88 2.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{15 16 "\[\n
  set; get;\n
\]"}
#4{7 8 "emotion"}
#4{17 18 "AvailableEmotions"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "85941024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{30 31 "public struct EmotionalMessage"}
 17.5143 2.2 19.2 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{30 31 "public struct EmotionalMessage"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#10{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @103 @11 @3 @0 #10{16 0}
#10{16 0}
#10{16 0}
#10{16 0}
#10{16 0}
#10{16 0}
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@43 @91 @55 @31 @0 @67 @79 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@19 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#10{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
