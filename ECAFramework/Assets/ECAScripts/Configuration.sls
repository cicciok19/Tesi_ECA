:ArrayOb.273{6:Dictionary.4369{16 14:SLSPrivateMethod.286331408{:String.17{9 10 "104878568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "InitNluAndTts"}
 1.3 0.88 5.2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{56 57 "\[\n
    XmlParser.InitAzureConfiguration(configuration);\n
\]"}
#4{13 14 "InitNluAndTts"}
#4{4 5 "void"}
#4{20 21 "string configuration"}
#4{0 1 ""}
}
#3{#4{9 10 "104880136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetScenario"}
 1.3 0.88 4.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{47 48 "\[\n
    ActualScenario = ScenarioType.Training;\n
\]"}
#4{11 12 "SetScenario"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{9 10 "104881312"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Awake"}
 1.3 0.88 2 10  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{60 61 "\[\n
  Assert.IsNull(Instance);\n
  Instance = this;\n
  Init();\n
\]\n
"}
#4{5 6 "Awake"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
#3{#4{9 10 "104880920"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "InitMessages"}
 1.3 0.88 4.8 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{461 462 "\[\n
    //retreive info from XML files\n
    ECAParameters.SmartActionMessages = XmlParser.GetSmartActionMessages(listOfMessages);\n
    //ECAParameters.GeneralMessages = XmlParser.GetGeneralMessages(listOfMessages);\n
    ECAParameters.GeneralMessagesCltn = XmlParser.GetGeneralMessagesCltn(listOfMessages);\n
\n
    if (activeMessagesPerScenario != \"\")\n
        ECAParameters.ActiveMessagesPerScenario = XmlParser.GetActiveMessagesPerScenario(activeMessagesPerScenario);\n
\]"}
#4{12 13 "InitMessages"}
#4{4 5 "void"}
#4{55 56 "string listOfMessages, string activeMessagesPerScenario"}
#4{0 1 ""}
}
:SLSProperty.286331392{#4{9 10 "104881704"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Instance"}
 1.3 0.88 3.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{103 179 "\[\n
        get\n
        \[\n
            return instance;\n
        \]\n
\n
\tprivate set \[\n
\t\tinstance = value;\n
\t\]\n
\]"}
#4{8 9 "Instance"}
#4{20 21 "static Configuration"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104878176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{4 5 "Init"}
 1.3 0.88 1.6 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{383 384 "\[\n
    SetLanguage();\n
    InitDocumentsNames();\n
    if (XmlDocumentNames == null)\n
    \[\n
        Utility.LogError(\"You must define XML document names in order to init all configuration\");\n
        return;\n
    \]\n
    SetScenario();\n
    InitNluAndTts(XmlDocumentNames.NluAndTtsConfiguration);\n
    InitMessages(XmlDocumentNames.ListOfMessages, XmlDocumentNames.ActiveMessagesPerScenario);\n
\]"}
#4{4 5 "Init"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104879744"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "SetLanguage"}
 1.3 0.88 4.4 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{35 36 "\[\n
    XmlParser.InfoPath = \"Ita\";\n
\]"}
#4{11 12 "SetLanguage"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "104879352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "InitDocumentsNames"}
 1.3 0.88 7.2 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{136 137 "\[\n
    XmlDocumentNames = new XmlDocumentNames(\"ListOfMessages.xml\", \"Configuration.xml\", \"ECAs.xml\", \"ActiveMessagesPerScenario.xml\");\n
\]"}
#4{18 19 "InitDocumentsNames"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86341688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSProtectMember.286331409{#4{9 10 "103703136"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{8 9 "instance"}
 2.4 1.88 3.2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{8 9 "instance"}
#4{20 21 "static Configuration"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86349368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1043 1044 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
using UnityEngine.Assertions;\n
\n
\n
\n
\tpublic enum ScenarioType\n
\[\n
    Training,\n
    Rehearsal,\n
    Examination\n
\]\n
\tpublic enum Nodes\n
\[\n
    \n
\]\n
\tpublic enum SmartActions\n
\[\n
    \n
\]\n
/// <summary>\n
/// Class used to define the name of the xml files that contain the necessary configurations\n
/// </summary>\n
\n
\n
public class XmlDocumentNames\n
\[\n
    public XmlDocumentNames(string listOfMessages, string nluAndTtsConfiguration, string ecaList, string activeMessagesPerScenario = \"\")\n
    \[\n
        ListOfMessages = listOfMessages;\n
        NluAndTtsConfiguration = nluAndTtsConfiguration;\n
        EcaList = ecaList;\n
        ActiveMessagesPerScenario = activeMessagesPerScenario;\n
    \]\n
\n
    public string ListOfMessages \[ get; set; \]\n
    public string NluAndTtsConfiguration \[ get; set; \]\n
    public string EcaList \[ get; set; \]\n
    public string ActiveMessagesPerScenario \[ get; set; \]   \n
\]\n
\n
\n
/// <summary>\n
/// Fill provided methods with your parameters.\n
/// </summary>\n
\n
"}
}
#6{#4{9 10 "104878960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{14 15 "ActualScenario"}
 1.3 0.88 5.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{14 15 "ActualScenario"}
#4{12 13 "ScenarioType"}
#4{0 1 ""}
#4{0 1 ""}
}
#6{#4{9 10 "104880528"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "XmlDocumentNames"}
 1.3 0.879999 6.4 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{16 17 "XmlDocumentNames"}
#4{16 17 "XmlDocumentNames"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "85870008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{36 37 "public Configuration : MonoBehaviour"}
 16.4171 2.2 23.04 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{20 21 "public Configuration"}
#4{13 14 "MonoBehaviour"}
#4{0 13 ""}
#9{16 0}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @154 @122 @99 @0 #9{16 0}
#9{16 1@107 }
#9{16 6@63 @75 @87 @15 @3 @39 }
#9{16 1@27 }
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@130 @51 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @142 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
