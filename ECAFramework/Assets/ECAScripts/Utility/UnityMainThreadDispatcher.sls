:ArrayOb.273{6:Dictionary.4369{16 11:SLSProtectMethod.286331408{:String.17{8 9 "86344040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ActionWrapper"}
 1.3 0.88 5.2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{35 36 "\[\n
    a();\n
    yield return null;\n
\]"}
#4{13 14 "ActionWrapper"}
#4{11 12 "IEnumerator"}
#4{8 9 "Action a"}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "86315504"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{135 136 "private static readonly Queue<Action> _executionQueue = new Queue<Action>();\n
private static UnityMainThreadDispatcher _instance = null;"}
}
:SLSPublicMethod.286331408{#4{8 9 "86343256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Enqueue"}
 0.3 0.88 2.8 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{36 37 "\[\n
\tEnqueue(ActionWrapper(action));\n
\]"}
#4{7 8 "Enqueue"}
#4{4 5 "void"}
#4{13 14 "Action action"}
#4{0 1 ""}
}
#6{#4{8 9 "86345216"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{228 229 "\[\n
\t\tif (!Exists ()) \[\n
\t\t\tthrow new Exception (\"UnityMainThreadDispatcher could not find the UnityMainThreadDispatcher object. Please ensure you have added the MainThreadExecutor Prefab to your scene.\");\n
\t\t\]\n
\t\treturn _instance;\n
\]"}
#4{8 9 "Instance"}
#4{32 33 "static UnityMainThreadDispatcher"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "86348744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "OnDestroy"}
 1.3 0.88 3.6 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{24 25 "\[\n
\t\t\t_instance = null;\n
\]"}
#4{9 10 "OnDestroy"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{8 9 "85944888"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{48 49 "public UnityMainThreadDispatcher : MonoBehaviour"}
 14.2229 2.2 30.72 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{32 33 "public UnityMainThreadDispatcher"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{8 9 "86348352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{94 95 "\[\n
\t\tif (_instance == null) \[\n
\t\t\t_instance = this;\n
\t\t\tDontDestroyOnLoad(this.gameObject);\n
\t\t\]\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#6{#4{8 9 "86342472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "Enqueue"}
 0.3 0.88 2.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{106 107 "\[\n
\t\tlock (_executionQueue) \[\n
\t\t\t_executionQueue.Enqueue (() => \[\n
\t\t\t\tStartCoroutine (action);\n
\t\t\t\]);\n
\t\t\]\n
\]"}
#4{7 8 "Enqueue"}
#4{4 5 "void"}
#4{18 19 "IEnumerator action"}
#4{0 1 ""}
}
#6{#4{8 9 "86346000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Update"}
 0.3 0.88 2.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{117 118 "\[\n
\t\tlock(_executionQueue) \[\n
\t\t\twhile (_executionQueue.Count > 0) \[\n
\t\t\t\t_executionQueue.Dequeue().Invoke();\n
\t\t\t\]\n
\t\t\]\n
\]"}
#4{6 7 "Update"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{8 9 "86344432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{6 7 "Exists"}
 1.3 0.88 2.4 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{31 32 "\[\n
\t\treturn _instance != null;\n
\]"}
#4{6 7 "Exists"}
#4{11 12 "static bool"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86311664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1447 1448 "/*\n
Copyright 2015 Pim de Witte All Rights Reserved.\n
\n
Licensed under the Apache License, Version 2.0 (the \"License\");\n
you may not use this file except in compliance with the License.\n
You may obtain a copy of the License at\n
\n
    http://www.apache.org/licenses/LICENSE-2.0\n
\n
Unless required by applicable law or agreed to in writing, software\n
distributed under the License is distributed on an \"AS IS\" BASIS,\n
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n
See the License for the specific language governing permissions and\n
limitations under the License.\n
*/\n
\n
using UnityEngine;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System;\n
using IntentRecognitionResults;\n
\n
/// Author: Pim de Witte (pimdewitte.com) and contributors, https://github.com/PimDeWitte/UnityMainThreadDispatcher\n
/// <summary>\n
/// A thread-safe class which holds a queue with actions to execute on the next Update() method. It can be used to make calls to the main thread for\n
/// things such as UI Manipulation in Unity. It was developed for use in combination with the Firebase Unity plugin, which uses separate threads for event handling\n
/// </summary>\n
/*\n
    public void Enqueue(Action<IntentResult> action, IntentResult intent)\n
    \[\n
        Enqueue(ActionWrapper(action, intent));\n
    \]\n
    \n
    IEnumerator ActionWrapper(Action<IntentResult> a, IntentResult intent)\n
    \[\n
        a(intent);\n
        yield return null;\n
    \]\n
    */\n
"}
}
}
:CLSCSSem.1118481{ 56  51 @59 @121 @15 @0 #8{16 0}
#8{16 0}
#8{16 0}
#8{16 3@3 @73 @47 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@97 @85 @23 @109 @35 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
