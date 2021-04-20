:ArrayOb.273{6:Dictionary.4369{16 13:SLSProperty.286331392{:String.17{8 9 "97700528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "Completed"}
 1.3 0.88 3.6 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{9 10 "Completed"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96615808"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Activity"}
 1.3 0.88 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
    protected set; get;\n
\]"}
#4{8 9 "Activity"}
#4{6 7 "string"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "97551416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "AddConstraint"}
 0.3 0.88 5.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{70 71 "\[\n
    constraints.Add(new Constraint(activityName, level, id, msg));\n
\]"}
#4{13 14 "AddConstraint"}
#4{4 5 "void"}
#4{67 68 "string activityName, Constraint.Type level, int id, string msg = \"\""}
#4{0 1 ""}
}
#3{#4{8 9 "97698832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "TimeLimit"}
 1.3 0.88 3.6 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{9 10 "TimeLimit"}
#4{3 4 "int"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96616232"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Started"}
 1.3 0.88 2.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{7 8 "Started"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "97695864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "WarningIssued"}
 1.3 0.88 5.2 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{13 14 "WarningIssued"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "97548280"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "GetConstraints"}
 0.3 0.88 5.6 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{27 28 "\[\n
    return constraints;\n
\]"}
#4{14 15 "GetConstraints"}
#4{16 17 "List<Constraint>"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "94867920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{10 11 "SimpleRule"}
 21.1714 2.2 6.4 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{10 11 "SimpleRule"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95447984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{703 704 "using UnityEngine;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System;\n
using System.Linq;\n
\n
\n
\n
\n
 class Constraint : IComparable \[\n
\n
\tpublic enum Type \[None, Warning, Error\];\n
\tpublic string activityName;\n
\tpublic Type level;\n
\tprotected int id;\n
\tpublic string msg;\n
\n
\tpublic Constraint(string activityName,Type level,int id,string msg = \"\") \[\n
\t\tthis.activityName = activityName;\n
\t\tthis.level = level;\n
\t\tthis.id = id;\n
\t\tthis.msg = msg;\n
\t\]\n
\n
\tpublic int CompareTo(object obj) \[\n
\t\tif(!(obj is Constraint))\n
\t\t\treturn 0;\n
\n
\t\tConstraint other = (Constraint)obj;\n
\t\tif(level == other.level)\n
\t\t\[\n
\t\t\treturn level.CompareTo(other.level);\n
\t\t\]\n
\n
\t\tif(level > other.level)\n
\t\t\treturn -1;\n
\n
\t\treturn 1;\n
\t\]\n
\]\n
"}
}
:JLSFriendDeclare.286331408{#4{8 9 "95448752"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{80 81 "public enum CheckResult \[\n
\t    DontCare,\n
\t    OK,\n
\t    Warning,\n
\t    Error\n
    \]"}
}
:SLSProtectMember.286331409{#4{8 9 "97487816"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{11 12 "constraints"}
 1.8 1.88 4.4 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{11 12 "constraints"}
#4{16 17 "List<Constraint>"}
#4{0 1 ""}
#7{16 0}
#7{16 0}
#4{0 2 ""}
@0 #4{23 24 " new List<Constraint>()"}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "97483416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "string activity"}
 0.299999 0.88 6 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{155 156 "\[\n
    this.Activity = activity;\n
\n
    Started = false;\n
    Completed = false;\n
    CheckedOnTrigger = false;\n
    TimeLimit = -1;\n
    WarningIssued = false;\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{15 16 "string activity"}
#4{0 1 ""}
}
#3{#4{8 9 "97700952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "CheckedOnTrigger"}
 1.3 0.88 6.4 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "\[\n
    set; get;\n
\]"}
#4{16 17 "CheckedOnTrigger"}
#4{4 5 "bool"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @92 @106 @114 @0 #7{16 0}
#7{16 1@122 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@29 @80 @54 @3 @149 @41 @67 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @16 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@137 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
