:ArrayOb.273{6:Dictionary.4369{16 6:SLSProtectMethod.286331408{:String.17{9 10 "157163624"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "CreateActions"}
 1.3 0.88 5.2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1259 1260 "\[\n
    ProximityAction FirstPaintProximityAction = new ProximityAction((int)SmartActions.firstPaintProximityAction, \"FirstPaint\");\n
    ProximityAction SecondPaintProximityAction = new ProximityAction((int)SmartActions.secondPaintProximityAction, \"SecondPaint\");\n
    ProximityAction ThirdPaintProximityAction = new ProximityAction((int)SmartActions.thirdPaintProximityAction, \"ThirdPaint\");\n
\n
    PaintInteraction FirstPaintInteraction = new PaintInteraction((int)SmartActions.firstPaintInteraction, 1);\n
    PaintInteraction SecondPaintInteraction = new PaintInteraction((int)SmartActions.secondPaintInteraction, 2);\n
    PaintInteraction ThirdPaintInteraction = new PaintInteraction((int)SmartActions.thirdPaintInteraction, 3);\n
\n
    AllSmartActions.Add(SmartActions.firstPaintProximityAction, FirstPaintProximityAction);\n
    AllSmartActions.Add(SmartActions.secondPaintProximityAction, SecondPaintProximityAction);\n
    AllSmartActions.Add(SmartActions.thirdPaintProximityAction, ThirdPaintProximityAction);\n
    AllSmartActions.Add(SmartActions.firstPaintInteraction, FirstPaintInteraction);\n
    AllSmartActions.Add(SmartActions.secondPaintInteraction, SecondPaintInteraction);\n
    AllSmartActions.Add(SmartActions.thirdPaintInteraction, ThirdPaintInteraction);\n
\]"}
#4{13 14 "CreateActions"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{9 10 "155696600"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{9 10 "155695320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{79 80 "using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
"}
}
:SLSThisIcon.286331409{#4{8 9 "93837320"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{36 37 "public DemoScenario : ECAGameManager"}
 16.4171 2.2 23.04 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{19 20 "public DemoScenario"}
#4{14 15 "ECAGameManager"}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#3{#4{9 10 "157166760"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "DefineGraphNodes"}
 1.3 0.88 6.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{2531 2532 "\[\n
    GameObject[] SitPoints = GameObject.FindGameObjectsWithTag(\"Sit\");\n
\n
    ProximityNode ProximityNode_1 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.firstPaintProximityAction], \n
        \"Go near paint#1\", true);\n
    ProximityNode ProximityNode_2 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.secondPaintProximityAction], \n
        SitPoints[0].transform,\"Go near paint#2\", true);\n
    ProximityNode ProximityNode_3 = new ProximityNode((ProximityAction)AllSmartActions[SmartActions.thirdPaintProximityAction], \n
        \"Go near paint#3\", true);\n
\n
    PaintInteractionNode FirstPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.firstPaintInteraction], \n
        \"Interaction Node paint#1\", true);\n
    PaintInteractionNode SecondPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.secondPaintInteraction], \n
        \"Interaction Node paint#2\", true);\n
    PaintInteractionNode ThirdPaintInteractionNode = new PaintInteractionNode((PaintInteraction)AllSmartActions[SmartActions.thirdPaintInteraction], \n
        \"Interaction Node paint#3\", true);\n
\n
    PaintSequentialNode FirstNode = new PaintSequentialNode(\"First paint node\", \"Manage first paint interaction\",\n
        new GameGraphNode[] \[ ProximityNode_1, FirstPaintInteractionNode \], true);\n
    PaintSequentialNode SecondNode = new PaintSequentialNode(\"Second paint node\", \"Manage second paint interaction\",\n
        new GameGraphNode[] \[ ProximityNode_2, SecondPaintInteractionNode \], true);\n
    PaintSequentialNode ThirdNode = new PaintSequentialNode(\"Third paint node\", \"Manage third paint interaction\",\n
        new GameGraphNode[] \[ ProximityNode_3, ThirdPaintInteractionNode \], true);\n
\n
    WaitNode WaitForUserInteractionNode = new WaitNode(\"Wait for interaction node\", \"Enter some trigger to begin new node\",\n
        new GameGraphNode[] \[ FirstNode, SecondNode, ThirdNode \], true);\n
\n
\n
    nodes = new GameGraphNode[]\n
    \[\n
        WaitForUserInteractionNode,\n
    \];\n
\n
    allGameNodes = new GameGraphNode[]\n
    \[\n
        WaitForUserInteractionNode,\n
        FirstNode,\n
        SecondNode,\n
        ThirdNode,\n
        FirstPaintInteractionNode,\n
        SecondPaintInteractionNode,\n
        ThirdPaintInteractionNode,\n
        ProximityNode_1,\n
        ProximityNode_2,\n
        ProximityNode_3\n
    \];\n
\n
\n
    for (int i = 0; i < allGameNodes.Length; i++)\n
        AllSimpleNodes.Add(allGameNodes[i].ID, allGameNodes[i]);\n
\n
    this.NumberOfNodes = nodes.Length;\n
\]"}
#4{16 17 "DefineGraphNodes"}
#4{13 14 "override void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:SLSProtectMember.286331409{#4{9 10 "156731160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{12 13 "allGameNodes"}
 1.6 1.88 4.8 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{12 13 "allGameNodes"}
#4{15 16 "GameGraphNode[]"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @31 @23 @15 @0 #8{16 0}
#8{16 1@57 }
#8{16 0}
#8{16 2@3 @45 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#11{1 }
#11{0 }
#11{1 }
}
