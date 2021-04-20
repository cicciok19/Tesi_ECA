:ArrayOb.273{6:Dictionary.4369{16 6:JLSGlobalDeclare.286331408{:String.17{8 9 "95445936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{479 480 "using System;\n
\n
\n
\n
public class SmartActionCustomArgs : EventArgs \[\n
    public SmartAction SmartAction;\n
    public Action FunctionToExecute;\n
    public string MessageType;\n
    public bool AnyTime;\n
\n
    public SmartActionCustomArgs(SmartAction smartAction, Action functionToExecute, string messageType, bool anyTime = true)\n
    \[\n
        SmartAction = smartAction;\n
        FunctionToExecute = functionToExecute;\n
        MessageType = messageType;\n
        AnyTime = anyTime;\n
    \]\n
\]\n
"}
}
:SLSProperty.286331392{#4{8 9 "96612416"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "CurrentSmartAction"}
 1.3 0.88 7.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{18 19 "CurrentSmartAction"}
#4{19 20 "virtual SmartAction"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "95449520"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "96006640"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string readableN"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{40 41 ": base(readableName, isTrainingMode)\n
\[\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{40 41 "string readableName, bool isTrainingMode"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "96529472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{24 25 "AskExecutionAfterMessage"}
 1.3 0.88 9.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{145 146 "\[\n
    if (OnAskingExecutionAfterMessage != null)\n
        OnAskingExecutionAfterMessage(this, args);\n
\n
    //ECAAnimationManager.NextECAAction();\n
\]"}
#4{24 25 "AskExecutionAfterMessage"}
#4{12 13 "virtual void"}
#4{26 27 "SmartActionCustomArgs args"}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{8 9 "94869024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{38 39 "public SmartActionNode : GameGraphNode"}
 16.0514 2.2 24.32 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  1.07115 3.94584 0
 0  0 #4{22 23 "public SmartActionNode"}
#4{13 14 "GameGraphNode"}
#4{0 13 ""}
:OrderedCltn.4369{16 1#4{79 80 "public event EventHandler<SmartActionCustomArgs> OnAskingExecutionAfterMessage;"}
}
#10{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @56 @3 @24 @0 #10{16 0}
#10{16 0}
#10{16 0}
#10{16 1@44 }
#10{16 0}
#10{16 0}
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @11 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@32 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#10{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
