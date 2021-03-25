:ArrayOb.273{6:Dictionary.4369{16 10:SLSThisIcon.286331409{:String.17{8 9 "85941576"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{21 22 "public static Utility"}
 19.16 2.2 13.44 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{21 22 "public static Utility"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#5{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{9 10 "104492912"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "GetChildRecursive"}
 1.3 0.88 6.8 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{365 366 "\[\n
    int numChildren = t.childCount;\n
    for (int i = 0; i < numChildren; ++i)\n
    \[\n
        Transform child = t.GetChild(i);\n
        if (child.name == name)\n
        \[\n
            return child;\n
        \]\n
        Transform foundIt = child.GetChildRecursive(name);\n
        if (foundIt != null)\n
        \[\n
            return foundIt;\n
        \]\n
    \]\n
    return null;\n
\]"}
#4{17 18 "GetChildRecursive"}
#4{16 17 "static Transform"}
#4{29 30 "this Transform t, string name"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86310640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{175 176 "/* File Utility C# implementation of class Utility */\n
\n
\n
\n
// global declaration start\n
\n
\n
using System;\n
using System.Diagnostics;\n
using UnityEngine;\n
\n
// global declaration end\n
\n
\n
"}
}
#6{#4{9 10 "104497616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "EnableAllRenderers"}
 1.3 0.88 7.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{285 286 "\[\n
    if (mb.gameObject == null)\n
        return mb;\n
\n
    Renderer[] renderers = mb.gameObject.GetComponentsInChildren<Renderer>(true);\n
    if (renderers == null)\n
        return mb;\n
\n
    for (int i = 0; i < renderers.Length; i++)\n
        renderers[i].enabled = enable;\n
\n
    return mb;\n
\]"}
#4{18 19 "EnableAllRenderers"}
#4{20 21 "static MonoBehaviour"}
#4{34 35 "this MonoBehaviour mb, bool enable"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86314992"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#6{#4{8 9 "86341688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{3 4 "Log"}
 1.3 0.88 1.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{609 610 "\[\n
    //if(UnityEngine.Debug.isDebugBuild)\n
    \[\n
#if UNITY_EDITOR || !UNITY_WSA\n
\n
        StackFrame frame = new StackFrame(1);\n
\n
        var method = frame.GetMethod();\n
        var type = method.DeclaringType;\n
        var name = method.Name;\n
\n
        UnityEngine.Debug.Log(type + \"::\" + name + \" \" + arg);\n
\n
#else\n
/*\n
\tStackTrace st = new StackTrace(new Exception(), true);\n
\n
\tStackFrame frame = st.GetFrames()[1];\n
\n
 \tvar method = frame.GetMethod();\n
\tvar type = method.DeclaringType;\n
\tvar name = method.Name;\n
\n
\tUnityEngine.Debug.Log(type + \"::\" + name + \" \" + arg);\n
*/\n
\tUnityEngine.Debug.Log(arg);\n
\n
#endif\n
    \]\n
\]"}
#4{3 4 "Log"}
#4{11 12 "static void"}
#4{10 11 "string arg"}
#4{0 1 ""}
}
#6{#4{9 10 "104496440"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "EnableAllRenderers"}
 1.3 0.88 7.2 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{223 224 "\[\n
    Renderer[] renderers = go.GetComponentsInChildren<Renderer>(true);\n
    if (renderers == null)\n
        return go;\n
\n
    for (int i = 0; i < renderers.Length; i++)\n
        renderers[i].enabled = enable;\n
\n
    return go;\n
\]"}
#4{18 19 "EnableAllRenderers"}
#4{17 18 "static GameObject"}
#4{31 32 "this GameObject go, bool enable"}
#4{0 1 ""}
}
#6{#4{8 9 "86342080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "LogWarning"}
 1.3 0.88 4 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{372 373 "\[\n
    //if(UnityEngine.Debug.isDebugBuild)\n
    \[\n
#if UNITY_EDITOR || !UNITY_WSA\n
\n
        StackFrame frame = new StackFrame(1);\n
\n
        var method = frame.GetMethod();\n
        var type = method.DeclaringType;\n
        var name = method.Name;\n
\n
        UnityEngine.Debug.LogWarning(type + \"::\" + name + \" \" + arg);\n
\n
#else\n
\t\n
\tUnityEngine.Debug.LogWarning(arg);\n
\n
#endif\n
    \]\n
\]"}
#4{10 11 "LogWarning"}
#4{11 12 "static void"}
#4{10 11 "string arg"}
#4{0 1 ""}
}
#6{#4{9 10 "104494088"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "LogError"}
 1.3 0.88 3.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{368 369 "\[\n
    //if(UnityEngine.Debug.isDebugBuild)\n
    \[\n
#if UNITY_EDITOR || !UNITY_WSA\n
\n
        StackFrame frame = new StackFrame(1);\n
\n
        var method = frame.GetMethod();\n
        var type = method.DeclaringType;\n
        var name = method.Name;\n
\n
        UnityEngine.Debug.LogError(type + \"::\" + name + \" \" + arg);\n
\n
#else\n
\t\n
\tUnityEngine.Debug.LogError(arg);\n
\n
#endif\n
    \]\n
\]"}
#4{8 9 "LogError"}
#4{11 12 "static void"}
#4{10 11 "string arg"}
#4{0 1 ""}
}
#6{#4{9 10 "104498008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Remap"}
 1.3 0.88 2 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{81 82 "\[\n
    return (value - fromMin) / (fromMax - fromMin) * (toMax - toMin) + toMin;\n
\]"}
#4{5 6 "Remap"}
#4{12 13 "static float"}
#4{72 73 "this float value, float fromMin, float fromMax, float toMin, float toMax"}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @3 @29 @49 @0 #5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#5{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@57 @81 @93 @69 @37 @17 @105 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#5{16 0}
 0}
:Float.17{0 }
#10{1 }
#10{0 }
#10{1 }
}
