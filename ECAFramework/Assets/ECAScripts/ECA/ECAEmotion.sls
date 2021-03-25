:ArrayOb.273{6:Dictionary.4369{32 17:JLSGlobalDeclare.286331408{:String.17{8 9 "86131352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{523 524 "using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using UnityEngine;\n
/// <summary>\n
/// This class represents a specific emotion (eg. joy, sadness, etc).\n
/// - It keeps track of the value of this specific emotion and its level; \n
/// - allows you to specify the parameters that define when to go from one level to another (thrashold values);\n
/// - All parameters (eg. the maximum and minimum values, thrashold ecc) are provided with default values.\n
/// Default parameters are provided\n
/// </summary>\n
\n
"}
}
:SLSProperty.286331392{#4{8 9 "86342040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Value"}
 1.3 0.88 2 1  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{100 104 "\[\n
  get \[\n
\treturn _value;\n
  \]\n
 \n
  set \[\n
\t_value = value;\n
        Level = belongToLevel(value);\n
  \]\n
\]"}
#4{5 6 "Value"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86342041"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{15 16 "NormalizedValue"}
 1.3 0.879999 6 1  16 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{70 104 "\[\n
  get \[\n
\treturn (_value - MinValue) / (MaxValue - MinValue);\n
  \]\n
 \n
\]"}
#4{15 16 "NormalizedValue"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSProtectMember.286331409{#4{8 9 "86214200"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{6 7 "_value"}
 2.8 1.88 2.4 11  40 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{6 7 "_value"}
#4{5 6 "float"}
#4{0 1 ""}
:OrderedCltn.4369{16 0}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{8 9 "86131096"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSPublicMethod.286331408{#4{8 9 "86342456"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "updateValue"}
 0.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{297 298 "\[\n
    float newValue = Clamp(Value + deltaValue, MinValue, MaxValue);\n
    Value = newValue;\n
    if (!belongToLevel(newValue).Equals(Level))\n
    \[\n
        Level = belongToLevel(newValue);\n
        if (switchedLevel != null)\n
            switchedLevel(this, EventArgs.Empty);\n
    \]\n
    return Value;\n
\]"}
#4{11 12 "updateValue"}
#4{5 6 "float"}
#4{16 17 "float deltaValue"}
#4{0 1 ""}
}
#5{#4{8 9 "86341648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Level"}
 1.3 0.879999 2 1  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{5 6 "Level"}
#4{12 13 "EmotionLevel"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86293472"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "EmotionType"}
 1.3 0.88 4.4 1  8 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{11 12 "EmotionType"}
#4{17 18 "AvailableEmotions"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSConstructor.286331408{#4{8 9 "86216984"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{16 17 "AvailableEmotion"}
 0.299999 0.88 6.4 47  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{200 201 "\[\n
    EmotionType = emotionType;\n
    MaxValue = 1.5f;\n
    MinValue = -1.5f;\n
    MediumHigThrashold = 0.5f;\n
    LowMediumThrashold = -0.5f;\n
    Value = initialValue;\n
    Level = belongToLevel(Value);\n
\]"}
#4{10 12 "ECAEmotion"}
#4{0 1 ""}
#4{53 54 "AvailableEmotions emotionType, float initialValue = 0"}
#4{0 1 ""}
}
#5{#4{9 10 "103706872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "MediumHigThrashold"}
 1.3 0.88 7.2 1  12 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{18 19 "MediumHigThrashold"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
}
:SLSPrivateMethod.286331408{#4{8 9 "86371800"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Clamp"}
 1.3 0.88 2 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{65 66 "\[\n
    return (value < min) ? min : (value > max) ? max : value;\n
\]"}
#4{5 6 "Clamp"}
#4{12 13 "static float"}
#4{33 34 "float value, float min, float max"}
#4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "86261872"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{17 18 "public ECAEmotion"}
 19.8914 2.2 10.88 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  6.06986 3.94584 0
 0  0 #4{17 18 "public ECAEmotion"}
#4{0 7 ""}
#4{0 13 ""}
#7{16 1#4{40 41 "public event EventHandler switchedLevel;"}
}
#7{16 0}
#4{1 2 "S"}
@0 #4{0 1 ""}
}
#5{#4{8 9 "86294648"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "LowMediumThrashold"}
 1.3 0.88 7.2 1  11 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 16 "\[ get; set; \]"}
#4{18 19 "LowMediumThrashold"}
#4{5 6 "float"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86293864"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "MaxValue"}
 1.3 0.88 3.2 1  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{8 9 "MaxValue"}
#4{12 13 "static float"}
#4{0 1 ""}
#4{0 1 ""}
}
#5{#4{8 9 "86294256"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "MinValue"}
 1.3 0.88 3.2 1  10 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{23 24 "\[ get; protected set; \]"}
#4{8 9 "MinValue"}
#4{12 13 "static float"}
#4{0 1 ""}
#4{0 1 ""}
}
#11{#4{8 9 "86295040"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{13 14 "belongToLevel"}
 1.3 0.88 5.2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{192 193 "\[\n
    if (value > MediumHigThrashold)\n
        return EmotionLevel.High;\n
    else if (value < LowMediumThrashold)\n
        return EmotionLevel.Low;\n
    else\n
        return EmotionLevel.Medium;\n
\]"}
#4{13 14 "belongToLevel"}
#4{12 13 "EmotionLevel"}
#4{11 12 "float value"}
#4{0 1 ""}
}
#9{#4{9 10 "103704712"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{8 9 "ToString"}
 1.3 0.88 3.2 1  13 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{357 358 "\[\n
    return \"Emotion Type: \" + this.EmotionType.ToString() + \"\\n\" +\n
            \"Actual value = \" + this.Value + \"\\n\" +\n
            \"Actual Level = \" + this.Level.ToString() + \"\\n\" +\n
            \"Max value = \" + MaxValue + \" Min value = \" + MinValue + \" LowMediumThrashold = \" + LowMediumThrashold + \" MediumHighThrashold = \" + MediumHigThrashold + \"\\n\";\n
\]"}
#4{8 9 "ToString"}
#4{15 16 "override string"}
#4{0 1 ""}
#4{0 1 ""}
}
}
:CLSCSSem.1118481{ 56  51 @130 @3 @50 @0 #7{16 0}
#7{16 1@35 }
#7{16 2@118 @181 }
#7{16 0}
#7{16 0}
#7{16 0}
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#7{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{30@58 @11 @82 @157 @169 @145 @106 @193 @0 @0 @23 @0 @0 @0 @0 @0 @0 @0 @0 @0 @70 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@94 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#7{16 0}
 0}
:Float.17{0 }
#14{1 }
#14{0 }
#14{1 }
}
