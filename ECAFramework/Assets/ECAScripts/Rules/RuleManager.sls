:ArrayOb.273{6:Dictionary.4369{32 18:SLSPublicMethod.286331408{:String.17{8 9 "96528688"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "OnActivityCompleted"}
 0.3 0.88 7.6 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{40 41 "\[\n
  CheckActivity(sender, args, true);\n
\]"}
#4{19 20 "OnActivityCompleted"}
#4{4 5 "void"}
#4{28 29 "object sender,EventArgs args"}
#4{0 1 ""}
}
:SLSProtectMethod.286331408{#4{8 9 "96533000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{12 13 "ReadXMLRules"}
 1.3 0.88 4.8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{487 488 "\[\n
  string xmlFile = \"EvaluationRules.xml\";    \n
  \n
  XmlDocument doc = new XmlDocument();\n
  xmlFile = xmlFile.Replace(System.IO.Path.GetExtension(xmlFile),\"\");\n
\n
  if(rulesPath != \"\")\n
\txmlFile = rulesPath + \"/\" + xmlFile;\n
\n
  TextAsset xmlAsset = (TextAsset) Resources.Load(xmlFile);\n
  try \[\n
\tdoc.LoadXml(xmlAsset.text);\n
  \]\n
  catch(Exception e)\n
  \[\n
\tUtility.LogError(\"error in loading file \" + xmlFile + \" :: \" + e);\n
\treturn;\n
  \]\n
  \n
  //Debug.Log(\"Loading \" + xmlFile);\n
  ParseXML(doc);\n
\]"}
#4{12 13 "ReadXMLRules"}
#4{4 5 "void"}
#4{0 1 ""}
#4{0 1 ""}
 0}
:JLSFriendDeclare.286331408{#4{8 9 "95453616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
#5{#4{8 9 "96527904"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ParseXML"}
 1.3 0.88 3.2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1609 1610 "\[\n
    XmlNodeList nodeList = doc.SelectNodes(\"/nodes/node\");\n
    int ruleId = 0;\n
\n
    foreach (XmlNode node in nodeList)\n
    \[\n
        if (node.Attributes[\"name\"] != null)\n
        \[\n
            string activityName = node.Attributes[\"name\"].InnerText;\n
            SimpleRule rule = new SimpleRule(activityName);\n
\n
            Utility.Log(\"constraints for \" + activityName);\n
\n
            XmlNodeList constraintList = node.SelectNodes(\"constraint\");\n
\n
            foreach (XmlNode constraint in constraintList)\n
            \[\n
                Assert.IsNotNull(constraint.Attributes[\"action\"]);\n
                Assert.IsNotNull(constraint.Attributes[\"level\"]);\n
\n
                string actionName = constraint.Attributes[\"action\"].InnerText;\n
                Constraint.Type type;\n
\n
                if (constraint.Attributes[\"level\"].InnerText == \"error\")\n
                    type = Constraint.Type.Error;\n
                else\n
                if (constraint.Attributes[\"level\"].InnerText == \"warning\")\n
                    type = Constraint.Type.Warning;\n
                else\n
                \[\n
                    Utility.LogError(\"unrecognized constraint level type \" + constraint.Attributes[\"level\"].InnerText);\n
                    type = Constraint.Type.None;\n
                \]\n
\n
                rule.AddConstraint(actionName, type, ruleId);\n
                ruleId++;\n
\n
                Utility.Log(\"Added constraints for \" + actionName + \" level \" + type);\n
            \]\n
\n
            rule.TimeLimit = Int32.Parse(node.Attributes.GetNamedItem(\"time\").InnerText);\n
            AddRule(activityName, rule);\n
        \]\n
    \]\n
\]"}
#4{8 9 "ParseXML"}
#4{4 5 "void"}
#4{15 16 "XmlDocument doc"}
#4{0 1 ""}
 0}
#3{#4{8 9 "96531432"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "OnGameCompleted"}
 0.3 0.88 6 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{62 63 "\[\n
  // placeholder for possible activities (e.g. logging...)\n
\]"}
#4{15 16 "OnGameCompleted"}
#4{4 5 "void"}
#4{28 29 "object sender,EventArgs args"}
#4{0 1 ""}
}
#3{#4{8 9 "96529080"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "OnActivityStarted"}
 0.3 0.88 6.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{317 318 "\[\n
  GameGraphNode node = (GameGraphNode)sender;\n
  string activityName = node.GetType().ToString();\n
\n
  //Utility.Log(activityName + \" started\");\n
\n
  SimpleRule rule = GetRule(activityName);\n
  if(rule == null)\n
  \[\n
\tUtility.LogError(\"no rules defined for activity \" + activityName);\n
\treturn;\n
  \]\n
\n
  rule.Started = true;\n
\]"}
#4{17 18 "OnActivityStarted"}
#4{4 5 "void"}
#4{28 29 "object sender,EventArgs args"}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "97486496"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string rulesPath"}
 0.299999 0.88 6.4 47  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{79 80 "\[\n
  //this.Session = session;\n
  this.rulesPath = rulesPath;\n
  ReadXMLRules();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{16 17 "string rulesPath"}
#4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "95446960"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{738 739 "using UnityEngine;\n
using UnityEngine.Assertions;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System;\n
using System.Linq;\n
using System.Xml;\n
\n
\n
\n
\n
 class RuleCheckingArgs : EventArgs \[\n
\n
\tpublic enum Type \[Ok, Warning, Error\];\n
\n
\tpublic string activityName;\n
\tpublic GameGraphNode node;\n
\tpublic RuleCheckingArgs.Type level;\n
\tpublic string causedBy;\n
\tpublic string msg;\n
\n
\tpublic RuleCheckingArgs(string activityName, GameGraphNode node, RuleCheckingArgs.Type level, string causedBy = \"\", string msg = \"\") \[\n
\t\tthis.activityName = activityName;\n
\t\tthis.node = node;\n
\t\tthis.level = level;\n
\t\tthis.causedBy = causedBy;\n
\t\tthis.msg = msg;\n
\t\]\n
\]\n
\n
\n
\n
/*\n
    public SessionType Session\n
    \[\n
      protected set; \n
      get;\n
    \]\n
    */\n
"}
}
:SLSProtectMember.286331409{#4{8 9 "97487376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "rules"}
 3 1.88 2 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "rules"}
#4{30 31 "Dictionary<string, SimpleRule>"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#10{16 0}
#4{0 2 ""}
@0 #4{37 38 " new Dictionary<string, SimpleRule>()"}
#4{0 1 ""}
}
#9{#4{8 9 "97486936"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{9 10 "rulesPath"}
 2.2 1.88 3.6 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{9 10 "rulesPath"}
#4{6 7 "string"}
#4{0 1 ""}
#10{16 0}
#10{16 0}
#4{0 2 ""}
@0 #4{3 4 " \"\""}
#4{0 1 ""}
}
#3{#4{8 9 "96530256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{9 10 "CleanRule"}
 0.3 0.88 3.6 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{92 93 "\[\n
  SimpleRule rule = GetRule(action);\n
  if(rule != null)\n
  \[\n
\trule.Completed = false;\n
  \]\n
\]"}
#4{9 10 "CleanRule"}
#4{4 5 "void"}
#4{13 14 "string action"}
#4{0 1 ""}
}
#5{#4{8 9 "96528296"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{21 22 "CheckRuleOnCompletion"}
 1.3 0.88 8.4 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1878 1879 "\[ \n
  List<Constraint> constraints = rule.GetConstraints();\n
  bool satisfied = true;\n
\n
  Constraint errorConstraint = null;\n
  Constraint warningConstraint = null;\n
\n
  for(int i=0;i < constraints.Count; i++)\n
  \[\n
\tSimpleRule previous = GetRule(constraints[i].activityName);\n
\n
\t//Assert.IsNotNull(previous);\n
\tif(previous == null)\n
\t\[\n
\t\tUtility.LogWarning(\"Rule manager: missing activity \" + constraints[i].activityName + \" in xml rules\");\n
\t\tcontinue;\n
\t\]\n
\n
\tif(!previous.Completed)\n
\t\[\n
\t\tsatisfied = false;\n
\n
\t\tif(constraints[i].level == Constraint.Type.Error)\n
\t\t\[\n
\t\t\tUtility.LogError(rule.Activity + \" unsatisfed constraint: activity \" + previous.Activity + \" not completed (ERROR)\");\n
\t\t\tif(errorConstraint == null || constraints[i].CompareTo(errorConstraint) < 0)\n
\t\t\t\terrorConstraint = constraints[i];\n
\t\t\]\n
\t\telse\n
\t\tif(constraints[i].level == Constraint.Type.Warning)\n
\t\t\[\n
\t\t\tUtility.LogError(rule.Activity + \" unsatisfed constraint: activity \" + previous.Activity + \" not completed (WARNING)\");\n
\t\t\tif(warningConstraint == null || constraints[i].CompareTo(warningConstraint) < 0)\n
\t\t\t\twarningConstraint = constraints[i];\n
\t\t\]\n
\t\telse\n
\t\t\tUtility.Log(rule.Activity + \" unsatisfed constraint: activity \" + previous.Activity + \" not completed (NO SIGNAL)\");\n
\t\]\n
  \]\n
\n
  if(satisfied)\n
  \[\n
\tif(OnSuccesfullActivity != null)\n
\t\tOnSuccesfullActivity(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Ok));\n
  \]\n
  else\n
  \[\n
\tif(errorConstraint != null && OnError != null)\n
\t\[\n
\t\tOnError(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Error, errorConstraint.activityName, errorConstraint.msg));\t\t\n
\t\]\n
\telse\n
\tif(errorConstraint == null && warningConstraint != null && OnWarning != null)\n
\t\[\n
\t\tOnWarning(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Warning, warningConstraint.activityName, warningConstraint.msg));\t\t\n
\t\]\n
  \]\n
\n
  return satisfied;\n
\]"}
#4{21 22 "CheckRuleOnCompletion"}
#4{4 5 "bool"}
#4{34 35 "SimpleRule rule,GameGraphNode node"}
#4{0 1 ""}
 0}
#3{#4{8 9 "96533392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "OnActivityTriggered"}
 0.3 0.88 7.6 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{41 42 "\[\n
  CheckActivity(sender, args, false);\n
\]"}
#4{19 20 "OnActivityTriggered"}
#4{4 5 "void"}
#4{28 29 "object sender,EventArgs args"}
#4{0 1 ""}
}
#5{#4{8 9 "96534568"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "AddRule"}
 1.3 0.88 2.8 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{259 260 "\[\n
    if (rules.ContainsKey(action))\n
    \[\n
        var oldRule = rules[action];\n
\n
        if (oldRule != null)\n
            Utility.LogWarning(\"adding rule to action that already had a rule\");\n
\n
        rules[action] = rule;\n
    \]\n
\n
    rules.Add(action, rule);\n
\]"}
#4{7 8 "AddRule"}
#4{4 5 "void"}
#4{30 31 "string action, SimpleRule rule"}
#4{0 1 ""}
 0}
#7{#4{8 9 "97482976"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "creator"}
 0.299999 0.88 2.8 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{49 50 "\[\n
  //this.Session = session;\n
  ReadXMLRules();\n
\]"}
#4{11 12 "Constructor"}
#4{0 1 ""}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{8 9 "96531040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{7 8 "GetRule"}
 0.3 0.88 2.8 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{88 89 "\[\n
  if(rules.ContainsKey(activityName))\n
  \treturn rules[activityName];\n
\n
  return null;\n
\]"}
#4{7 8 "GetRule"}
#4{10 11 "SimpleRule"}
#4{19 20 "string activityName"}
#4{0 1 ""}
}
#5{#4{8 9 "96531824"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "CheckActivity"}
 1.3 0.88 5.2 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{432 433 "\[\n
  GameGraphNode node = (GameGraphNode)sender;\n
  string activityName = node.GetType().ToString();\n
\n
  SimpleRule rule = GetRule(activityName);\n
  if(rule == null)\n
  \[\n
\tUtility.LogError(\"no rules defined for activity \" + activityName);\n
\treturn;\n
  \]\n
\n
  rule.Completed = fromCompletion;\n
\n
  if(fromCompletion && rule.CheckedOnTrigger)\n
\treturn;\n
\n
  if(!fromCompletion)\n
\trule.CheckedOnTrigger = true;\n
\n
  CheckRuleOnCompletion(rule, node);\n
\]"}
#4{13 14 "CheckActivity"}
#4{4 5 "void"}
#4{49 50 "object sender,EventArgs args, bool fromCompletion"}
#4{0 1 ""}
 0}
:SLSThisIcon.286331409{#4{8 9 "94865712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{11 12 "RuleManager"}
 20.9886 2.2 7.04 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  5.92497 3.94584 0
 0  0 #4{11 12 "RuleManager"}
#4{0 7 ""}
#4{0 13 ""}
#10{16 3#4{65 66 "public event EventHandler<RuleCheckingArgs> OnSuccesfullActivity;"}
#4{54 55 "public event EventHandler<RuleCheckingArgs> OnWarning;"}
#4{52 53 "public event EventHandler<RuleCheckingArgs> OnError;"}
}
#10{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @205 @83 @27 @0 #10{16 0}
#10{16 2@91 @106 }
#10{16 0}
#10{16 5@15 @35 @157 @133 @193 }
#10{16 0}
#10{16 0}
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#10{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@121 @181 @145 @59 @3 @47 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@169 @71 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#10{16 0}
 0}
:Float.17{0 }
#13{1 }
#13{0 }
#13{1 }
}
