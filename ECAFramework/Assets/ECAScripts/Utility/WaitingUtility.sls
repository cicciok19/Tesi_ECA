:ArrayOb.273{6:Dictionary.4369{16 7:SLSProtectMethod.286331408{:String.17{9 10 "104492128"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "waitStaging"}
 1.3 0.88 4.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{544 545 "\[\n
    if (delay != 0f)\n
        yield return new WaitForSeconds(delay);\n
\n
    //Action currentAction = act;\n
    while (true)\n
    \[\n
        Utility.Log(\"new cycle of waiting with interval = \" + act.StagingUpdateTime + \" For action: \" + act.GetType().ToString());\n
        yield return new WaitForSeconds(act.StagingUpdateTime);\n
        if (!act.IsStagingActive)\n
        \[\n
            Utility.Log(\"STOP update staging For action: \" + act.GetType().ToString());\n
            break;\n
        \]\n
        act.UpdateStaging();\n
    \]\n
    yield return null;\n
\]"}
#4{11 12 "waitStaging"}
#4{11 12 "IEnumerator"}
#4{28 29 "SmartAction act, float delay"}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "104496832"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "startWaitingStaging"}
 0.3 0.88 7.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{87 88 "\[\n
    IEnumerator coroutine = waitStaging(act, delay);\n
    StartCoroutine(coroutine);\n
\]"}
#4{19 20 "startWaitingStaging"}
#4{4 5 "void"}
#4{28 29 "SmartAction act, float delay"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86309360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{9 10 "104490952"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{177 178 "\[\n
    if (Instance != null && Instance != this)\n
    \[\n
        Utility.LogError(\"NO MORE THAN ONE WAITING UTILITY CAN BE INSTANTIATED\");\n
    \]\n
    else\n
        Instance = this;\n
\]"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86312176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{946 947 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
/// <summary>\n
/// Since a <see cref=\"SmartAction\"/> is not a MonoBehaviour class, this class acts as an utility for coroutines (rather than threads) for waiting functions \n
/// without interrupting the mainthread.\n
/// </summary>\n
/*\n
    public void StartWaitingLookAtTime(LookAtAction lookAtAction, int numberOfSec)\n
    \[\n
        StartCoroutine(countLookAtTime(lookAtAction, numberOfSec));\n
    \]\n
    IEnumerator countLookAtTime(LookAtAction lookAtAction, int numberOfSec)\n
    \[\n
        while (lookAtAction.IsWatchingMe)\n
        \[\n
            double d = DateTime.Now.Subtract(lookAtAction.FirstInteraction).TotalSeconds;\n
            if (d >= lookAtAction.TimeAmount)\n
                lookAtAction.TimeElapsed();\n
                //LookAtMachine.makeTransition(LookAtMachine.LookAtMachineState.Watched);\n
\n
            yield return null;\n
        \]\n
    \]\n
    */\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "85940472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{37 38 "public WaitingUtility : MonoBehaviour"}
 16.2343 2.2 23.68 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{21 22 "public WaitingUtility"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#10{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "104490560"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{21 22 "\[ get; private set; \]"}
#4{8 9 "Instance"}
#4{21 22 "static WaitingUtility"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @55 @47 @27 @0 #10{16 0}
#10{16 0}
#10{16 1@35 }
#10{16 1@3 }
#10{16 0}
#10{16 0}
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@15 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @69 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#10{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
