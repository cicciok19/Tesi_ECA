:ArrayOb.273{6:Dictionary.4369{16 11:SLSPublicMethod.286331408{:String.17{8 9 "85948336"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{504 505 "\[\n
    string s = \"\";\n
\n
    foreach (KeyValuePair<AvailableEmotions, ECAEmotion> emotion in Emotions)\n
        s += emotion.Value.ToString() + \"\\n\";\n
\n
    s += \"\\n\\nRULES: \\n\";\n
\n
    foreach (KeyValuePair<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>> rule in Rules)\n
    \[\n
        for (int i = 0; i < rule.Value.Count; i++)\n
        \[\n
            s += rule.Key.ToString() + \": \" + rule.Value[i].Key.ToString() + \" = \" + rule.Value[i].Value.ToString() + \"\\n\";\n
        \]\n
    \]\n
\n
    return s;\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
#3{#4{9 10 "103680376"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "updateEmotion"}
 1.3 0.88 5.2 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{777 778 "\[\n
    if (Rules == null || Rules.Count == 0)\n
    \[\n
        Utility.LogError(\"No rules defined\");\n
        return;\n
    \]\n
    if (Rules.ContainsKey(appraisalVariable))\n
    \[\n
        for (int i = 0; i < Rules[appraisalVariable].Count; i++)\n
        \[\n
            ECAEmotion EmotionToUpdate = Emotions[Rules[appraisalVariable][i].Key];\n
            EmotionToUpdate.updateValue(Rules[appraisalVariable][i].Value * scaleFactor);\n
            if (EmotionToUpdate.Value > ActualEmotion.Value)\n
                ActualEmotion = EmotionToUpdate;\n
        \]\n
    \]\n
    else\n
    \[\n
        Utility.LogError(\"there is no rule that controls this Appraisal Variable: \" + appraisalVariable.ToString());\n
    \]\n
\n
    if (GlobalEmotionUpdated != null)\n
        GlobalEmotionUpdated(this, EventArgs.Empty);\n
\]"}
#4{13 14 "updateEmotion"}
#4{12 13 "virtual void"}
#4{62 63 "AppraisalVariables appraisalVariable, float scaleFactor = 1.0f"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86128536"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:JLSGlobalDeclare.286331408{#4{8 9 "86129304"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1183 1184 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
/// <summary>\n
/// Aprraisal variables are used from external events, actions ecc to specify how it must be perceived by an ECA\n
/// these will then be used to update the agent's emotional state\n
/// </summary>\n
\tpublic enum AppraisalVariables\n
\[\n
    Good,\n
    Bad,\n
    UnexpectedPositive,\n
    UnexpectedNegative,\n
    Nice,\n
    Nasty\n
\]\n
/// <summary>\n
/// possible emotions that the echo can feel\n
/// </summary>\n
\tpublic enum AvailableEmotions\n
\[\n
    Joy,\n
    Trust,\n
    Fear,\n
    Surprise,\n
    Sadness,\n
    Disgust,\n
    Anger,\n
    Anticipation,\n
    None\n
\]\n
/// <summary>\n
/// Given one of the emotions specified in  <see cref=\"AvailableEmotions\"/>, this can be in one of the following intensity levels\n
/// </summary>\n
\tpublic enum EmotionLevel\n
\[\n
    Low,\n
    Medium,\n
    High\n
\]\n
/// <summary>\n
/// Create a set of emotions and create rules that define how each <see cref=\"AppraisalVariables\"/> affect different emotions.\n
/// It also keeps track of the current emotion, that is the one with a higher intensity value\n
/// and launches an event to notify when the emotional state is updated\n
/// </summary>\n
\n
"}
}
:SLSProperty.286331392{#4{8 9 "85948728"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "ActualEmotion"}
 1.3 0.88 5.2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{13 14 "ActualEmotion"}
#4{10 11 "ECAEmotion"}
#4{0 1 ""}
#4{0 1 ""}
}
#7{#4{8 9 "85947944"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "Emotions"}
 1.3 0.879999 3.2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{8 9 "Emotions"}
#4{41 42 "Dictionary<AvailableEmotions, ECAEmotion>"}
#4{0 1 ""}
#4{0 1 ""}
}
:JLSExternObject.286331409{#4{8 9 "85833360"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{0 1 ""}
 4 1.88 0 2  45 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{0 1 ""}
#4{10 11 "ECAEmotion"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#9{16 0}
#4{1 2 "S"}
@0 }
#3{#4{9 10 "104310008"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "InitActualEmotion"}
 0.3 0.88 6.8 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{77 78 "\[\n
   ActualEmotion = Emotions[emotion];\n
   ActualEmotion.Value = strength;\n
\]\n
"}
#4{17 18 "InitActualEmotion"}
#4{4 5 "void"}
#4{40 41 "AvailableEmotions emotion,float strength"}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "86217864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "string xmlDocume"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1066 1067 "\[\n
\n
    ECAEmotion Joy = new ECAEmotion(AvailableEmotions.Joy);\n
    ECAEmotion Trust = new ECAEmotion(AvailableEmotions.Trust);\n
    ECAEmotion Fear = new ECAEmotion(AvailableEmotions.Fear);\n
    ECAEmotion Surprise = new ECAEmotion(AvailableEmotions.Surprise);\n
    ECAEmotion Sadness = new ECAEmotion(AvailableEmotions.Sadness);\n
    ECAEmotion Disgust = new ECAEmotion(AvailableEmotions.Disgust);\n
    ECAEmotion Anger = new ECAEmotion(AvailableEmotions.Anger);\n
    ECAEmotion Anticipation = new ECAEmotion(AvailableEmotions.Anticipation);\n
\n
    Emotions = new Dictionary<AvailableEmotions, ECAEmotion>\[\n
        \[Joy.EmotionType, Joy \],\n
        \[Trust.EmotionType, Trust\],\n
        \[Fear.EmotionType, Fear\],\n
        \[Surprise.EmotionType, Surprise\],\n
        \[Sadness.EmotionType, Sadness\],\n
        \[Disgust.EmotionType, Disgust\],\n
        \[Anger.EmotionType, Anger \],\n
        \[Anticipation.EmotionType, Anticipation \]\n
    \];\n
\n
    ActualEmotion = Joy;\n
    //defineRules();\n
    if (xmlDocumentForModel != \"\")\n
        Rules = XmlParser.GetEmotionModel(xmlDocumentForModel);\n
\]"}
#4{17 18 "ECAEmotionManager"}
#4{0 1 ""}
#4{26 27 "string xmlDocumentForModel"}
#4{0 1 ""}
}
:SLSPublicMember.286331409{#4{8 9 "86217424"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{5 6 "Rules"}
 1.3 1.88 2 1  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{5 6 "Rules"}
#4{76 77 "Dictionary<AppraisalVariables, List<KeyValuePair<AvailableEmotions, float>>>"}
#4{0 1 ""}
#9{16 0}
#9{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86319616"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{24 25 "public ECAEmotionManager"}
 18.6114 2.2 15.36 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  2.37516 4.14313 0
 0  0 #4{24 25 "public ECAEmotionManager"}
#4{0 7 ""}
#4{0 13 ""}
#9{16 1#4{47 48 "public event EventHandler GlobalEmotionUpdated;"}
}
#9{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @119 @35 @27 @0 #9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#9{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#9{16 1@67 }
#1{38@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @104 @0 @0 @0 }
#1{30@15 @43 @3 @80 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @55 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@92 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#9{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
