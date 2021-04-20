:ArrayOb.273{6:Dictionary.4369{16 14:SLSProtectMethod.286331408{:String.17{8 9 "94862392"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{19 20 "ParseAnonymousValue"}
 1.3 0.88 7.6 37  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1523 1524 "\[\n
    if (json.Length == 0)\n
        return null;\n
    if (json[0] == '\[' && json[json.Length - 1] == '\]')\n
    \[\n
        List<string> elems = Split(json);\n
        if (elems.Count % 2 != 0)\n
            return null;\n
        var dict = new Dictionary<string, object>(elems.Count / 2);\n
        for (int i = 0; i < elems.Count; i += 2)\n
            dict.Add(elems[i].Substring(1, elems[i].Length - 2), ParseAnonymousValue(elems[i + 1]));\n
        return dict;\n
    \]\n
    if (json[0] == '[' && json[json.Length - 1] == ']')\n
    \[\n
        List<string> items = Split(json);\n
        var finalList = new List<object>(items.Count);\n
        for (int i = 0; i < items.Count; i++)\n
            finalList.Add(ParseAnonymousValue(items[i]));\n
        return finalList;\n
    \]\n
    if (json[0] == '\"' && json[json.Length - 1] == '\"')\n
    \[\n
        string str = json.Substring(1, json.Length - 2);\n
        return str.Replace(\"\\\\\", string.Empty);\n
    \]\n
    if (char.IsDigit(json[0]) || json[0] == '-')\n
    \[\n
        if (json.Contains(\".\"))\n
        \[\n
            double result;\n
            double.TryParse(json, System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out result);\n
            return result;\n
        \]\n
        else\n
        \[\n
            int result;\n
            int.TryParse(json, out result);\n
            return result;\n
        \]\n
    \]\n
    if (json == \"true\")\n
        return true;\n
    if (json == \"false\")\n
        return false;\n
    // handles json == \"null\" as well as invalid JSON\n
    return null;\n
\]"}
#4{19 20 "ParseAnonymousValue"}
#4{13 14 "static object"}
#4{11 12 "string json"}
#4{0 1 ""}
 0}
#3{#4{8 9 "94863176"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{10 11 "ParseValue"}
 1.3 0.88 4 28  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{4260 4261 "\[\n
    if (type == typeof(string))\n
    \[\n
        if (json.Length <= 2)\n
            return string.Empty;\n
        StringBuilder parseStringBuilder = new StringBuilder(json.Length);\n
        for (int i = 1; i < json.Length - 1; ++i)\n
        \[\n
            if (json[i] == '\\\\' && i + 1 < json.Length - 1)\n
            \[\n
                int j = \"\\\"\\\\nrtbf/\".IndexOf(json[i + 1]);\n
                if (j >= 0)\n
                \[\n
                    parseStringBuilder.Append(\"\\\"\\\\\\n\\r\\t\\b\\f/\"[j]);\n
                    ++i;\n
                    continue;\n
                \]\n
                if (json[i + 1] == 'u' && i + 5 < json.Length - 1)\n
                \[\n
                    UInt32 c = 0;\n
                    if (UInt32.TryParse(json.Substring(i + 2, 4), System.Globalization.NumberStyles.AllowHexSpecifier, null, out c))\n
                    \[\n
                        parseStringBuilder.Append((char)c);\n
                        i += 5;\n
                        continue;\n
                    \]\n
                \]\n
            \]\n
            parseStringBuilder.Append(json[i]);\n
        \]\n
        return parseStringBuilder.ToString();\n
    \]\n
    if (type.IsPrimitive)\n
    \[\n
        var result = Convert.ChangeType(json, type, System.Globalization.CultureInfo.InvariantCulture);\n
        return result;\n
    \]\n
    if (type == typeof(decimal))\n
    \[\n
        decimal result;\n
        decimal.TryParse(json, System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out result);\n
        return result;\n
    \]\n
    if (json == \"null\")\n
    \[\n
        return null;\n
    \]\n
    if (type.IsEnum)\n
    \[\n
        if (json[0] == '\"')\n
            json = json.Substring(1, json.Length - 2);\n
        try\n
        \[\n
            return Enum.Parse(type, json, false);\n
        \]\n
        catch\n
        \[\n
            return 0;\n
        \]\n
    \]\n
    if (type.IsArray)\n
    \[\n
        Type arrayType = type.GetElementType();\n
        if (json[0] != '[' || json[json.Length - 1] != ']')\n
            return null;\n
\n
        List<string> elems = Split(json);\n
        Array newArray = Array.CreateInstance(arrayType, elems.Count);\n
        for (int i = 0; i < elems.Count; i++)\n
            newArray.SetValue(ParseValue(arrayType, elems[i]), i);\n
        splitArrayPool.Push(elems);\n
        return newArray;\n
    \]\n
    if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(List<>))\n
    \[\n
        Type listType = type.GetGenericArguments()[0];\n
        if (json[0] != '[' || json[json.Length - 1] != ']')\n
            return null;\n
\n
        List<string> elems = Split(json);\n
        var list = (IList)type.GetConstructor(new Type[] \[ typeof(int) \]).Invoke(new object[] \[ elems.Count \]);\n
        for (int i = 0; i < elems.Count; i++)\n
            list.Add(ParseValue(listType, elems[i]));\n
        splitArrayPool.Push(elems);\n
        return list;\n
    \]\n
    if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Dictionary<,>))\n
    \[\n
        Type keyType, valueType;\n
        \[\n
            Type[] args = type.GetGenericArguments();\n
            keyType = args[0];\n
            valueType = args[1];\n
        \]\n
\n
        //Refuse to parse dictionary keys that aren't of type string\n
        if (keyType != typeof(string))\n
            return null;\n
        //Must be a valid dictionary element\n
        if (json[0] != '\[' || json[json.Length - 1] != '\]')\n
            return null;\n
        //The list is split into key/value pairs only, this means the split must be divisible by 2 to be valid JSON\n
        List<string> elems = Split(json);\n
        if (elems.Count % 2 != 0)\n
            return null;\n
\n
        var dictionary = (IDictionary)type.GetConstructor(new Type[] \[ typeof(int) \]).Invoke(new object[] \[ elems.Count / 2 \]);\n
        for (int i = 0; i < elems.Count; i += 2)\n
        \[\n
            if (elems[i].Length <= 2)\n
                continue;\n
            string keyValue = elems[i].Substring(1, elems[i].Length - 2);\n
            object val = ParseValue(valueType, elems[i + 1]);\n
            dictionary.Add(keyValue, val);\n
        \]\n
        return dictionary;\n
    \]\n
    if (type == typeof(object))\n
    \[\n
        return ParseAnonymousValue(json);\n
    \]\n
    if (json[0] == '\[' && json[json.Length - 1] == '\]')\n
    \[\n
        return ParseObject(type, json);\n
    \]\n
\n
    return null;\n
\]"}
#4{10 11 "ParseValue"}
#4{13 14 "static object"}
#4{22 23 "Type type, string json"}
#4{0 1 ""}
 0}
:SLSPublicMethod.286331408{#4{9 10 "129304968"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "FromJson<T>"}
 1.3 0.88 4.4 1  6 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{897 898 "\[\n
    // Initialize, if needed, the ThreadStatic variables\n
    if (propertyInfoCache == null) propertyInfoCache = new Dictionary<Type, Dictionary<string, PropertyInfo>>();\n
    if (fieldInfoCache == null) fieldInfoCache = new Dictionary<Type, Dictionary<string, FieldInfo>>();\n
    if (stringBuilder == null) stringBuilder = new StringBuilder();\n
    if (splitArrayPool == null) splitArrayPool = new Stack<List<string>>();\n
\n
    //Remove all whitespace not within strings to make parsing simpler\n
    stringBuilder.Length = 0;\n
    for (int i = 0; i < json.Length; i++)\n
    \[\n
        char c = json[i];\n
        if (c == '\"')\n
        \[\n
            i = AppendUntilStringEnd(true, i, json);\n
            continue;\n
        \]\n
        if (char.IsWhiteSpace(c))\n
            continue;\n
\n
        stringBuilder.Append(c);\n
    \]\n
\n
    //Parse the thing!\n
    return (T)ParseValue(typeof(T), stringBuilder.ToString());\n
\]"}
#4{11 12 "FromJson<T>"}
#4{8 9 "static T"}
#4{16 17 "this string json"}
#4{0 1 ""}
}
:JLSFriendDeclare.286331408{#4{9 10 "129750368"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{17 18 "Class Declaration"}
 0.299999 0.88 6.8 33  5 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{0 1 ""}
}
:SLSThisIcon.286331409{#4{8 9 "94272344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  52 45 0.4 0 0 #4{24 25 "public static JSONParser"}
 18.6114 2.2 15.36 4  0 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{24 25 "public static JSONParser"}
#4{0 7 ""}
#4{0 13 ""}
:OrderedCltn.4369{16 0}
#8{16 0}
#4{1 2 "S"}
@0 #4{8 9 "TinyJson"}
}
#3{#4{8 9 "94862784"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{20 21 "AppendUntilStringEnd"}
 1.3 0.88 8 10  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{549 550 "\[\n
    stringBuilder.Append(json[startIdx]);\n
    for (int i = startIdx + 1; i < json.Length; i++)\n
    \[\n
        if (json[i] == '\\\\')\n
        \[\n
            if (appendEscapeCharacter)\n
                stringBuilder.Append(json[i]);\n
            stringBuilder.Append(json[i + 1]);\n
            i++;//Skip next character as it is escaped\n
        \]\n
        else if (json[i] == '\"')\n
        \[\n
            stringBuilder.Append(json[i]);\n
            return i;\n
        \]\n
        else\n
            stringBuilder.Append(json[i]);\n
    \]\n
    return json.Length - 1;\n
\]"}
#4{20 21 "AppendUntilStringEnd"}
#4{10 11 "static int"}
#4{53 54 "bool appendEscapeCharacter, int startIdx, string json"}
#4{0 1 ""}
 0}
:SLSProtectMember.286331409{#4{9 10 "129172664"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{17 18 "propertyInfoCache"}
 0.599998 1.88 6.8 10  38 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{17 18 "propertyInfoCache"}
#4{57 58 "static Dictionary<Type, Dictionary<string, PropertyInfo>>"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{14 15 "[ThreadStatic]"}
}
:JLSGlobalDeclare.286331408{#4{9 10 "129752160"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{18 19 "Global Declaration"}
 0.299999 0.88 7.2 33  3 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 0  0 #4{1490 1491 "//\n
// Copyright (c) 2018 Alex Parker. All rights reserved.\n
// Licensed under the MIT license. See LICENSE.md file in the project root for full license information.\n
//\n
using System;\n
using System.Collections;\n
using System.Collections.Generic;\n
using System.Reflection;\n
using System.Runtime.Serialization;\n
using System.Text;\n
\n
\n
// NEXT_LINES_IN_NAMESPACE\n
\n
    // Really simple JSON parser in ~300 lines\n
    // Source: https://github.com/zanders3/json\n
    // - Attempts to parse JSON files with minimal GC allocation\n
    // - Nice and simple \"[1,2,3]\".FromJson<List<int>>() API\n
    // - Classes and structs can be parsed too!\n
    //      class Foo \[ public int Value; \]\n
    //      \"\[\\\"Value\\\":10\]\".FromJson<Foo>()\n
    // - Can parse JSON without type information into Dictionary<string,object> and List<object> e.g.\n
    //      \"[1,2,3]\".FromJson<object>().GetType() == typeof(List<object>)\n
    //      \"\[\\\"Value\\\":10\]\".FromJson<object>().GetType() == typeof(Dictionary<string,object>)\n
    // - No JIT Emit support to support AOT compilation on iOS\n
    // - Attempts are made to NOT throw an exception if the JSON is corrupted or invalid: returns null instead.\n
    // - Only public fields and property setters on classes/structs will be written to\n
    //\n
    // Limitations:\n
    // - No JIT Emit support to parse structures quickly\n
    // - Limited to parsing <2GB JSON files (due to int.MaxValue)\n
    // - Parsing of abstract classes or interfaces is NOT supported and will throw an exception.\n
"}
}
#9{#4{9 10 "129171344"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "fieldInfoCache"}
 1.2 1.88 5.6 10  35 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "fieldInfoCache"}
#4{54 55 "static Dictionary<Type, Dictionary<string, FieldInfo>>"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{14 15 "[ThreadStatic]"}
}
#9{#4{9 10 "129170024"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{14 15 "splitArrayPool"}
 1.2 1.88 5.6 10  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{14 15 "splitArrayPool"}
#4{26 27 "static Stack<List<string>>"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{14 15 "[ThreadStatic]"}
}
#3{#4{8 9 "94862000"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{11 12 "ParseObject"}
 1.3 0.88 4.4 19  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1530 1531 "\[\n
    object instance = FormatterServices.GetUninitializedObject(type);\n
\n
    //The list is split into key/value pairs only, this means the split must be divisible by 2 to be valid JSON\n
    List<string> elems = Split(json);\n
    if (elems.Count % 2 != 0)\n
        return instance;\n
\n
    Dictionary<string, FieldInfo> nameToField;\n
    Dictionary<string, PropertyInfo> nameToProperty;\n
    if (!fieldInfoCache.TryGetValue(type, out nameToField))\n
    \[\n
        nameToField = CreateMemberNameDictionary(type.GetFields(BindingFlags.Instance | BindingFlags.Public | BindingFlags.FlattenHierarchy));\n
        fieldInfoCache.Add(type, nameToField);\n
    \]\n
    if (!propertyInfoCache.TryGetValue(type, out nameToProperty))\n
    \[\n
        nameToProperty = CreateMemberNameDictionary(type.GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.FlattenHierarchy));\n
        propertyInfoCache.Add(type, nameToProperty);\n
    \]\n
\n
    for (int i = 0; i < elems.Count; i += 2)\n
    \[\n
        if (elems[i].Length <= 2)\n
            continue;\n
        string key = elems[i].Substring(1, elems[i].Length - 2);\n
        string value = elems[i + 1];\n
\n
        FieldInfo fieldInfo;\n
        PropertyInfo propertyInfo;\n
        if (nameToField.TryGetValue(key, out fieldInfo))\n
            fieldInfo.SetValue(instance, ParseValue(fieldInfo.FieldType, value));\n
        else if (nameToProperty.TryGetValue(key, out propertyInfo))\n
            propertyInfo.SetValue(instance, ParseValue(propertyInfo.PropertyType, value), null);\n
    \]\n
\n
    return instance;\n
\]"}
#4{11 12 "ParseObject"}
#4{13 14 "static object"}
#4{22 23 "Type type, string json"}
#4{0 1 ""}
 0}
#3{#4{8 9 "94861608"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{29 30 "CreateMemberNameDictionary<T>"}
 1.3 0.88 11.6 10  9 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{864 865 "\[\n
            Dictionary<string, T> nameToMember = new Dictionary<string, T>(StringComparer.OrdinalIgnoreCase);\n
            for (int i = 0; i < members.Length; i++)\n
            \[\n
                T member = members[i];\n
                if (member.IsDefined(typeof(IgnoreDataMemberAttribute), true))\n
                    continue;\n
\n
                string name = member.Name;\n
                if (member.IsDefined(typeof(DataMemberAttribute), true))\n
                \[\n
                    DataMemberAttribute dataMemberAttribute = (DataMemberAttribute)Attribute.GetCustomAttribute(member, typeof(DataMemberAttribute), true);\n
                    if (!string.IsNullOrEmpty(dataMemberAttribute.Name))\n
                        name = dataMemberAttribute.Name;\n
                \]\n
\n
                nameToMember.Add(name, member);\n
            \]\n
\n
            return nameToMember;\n
\]"}
#4{29 30 "CreateMemberNameDictionary<T>"}
#4{51 52 "static Dictionary<string, T> : where T : MemberInfo"}
#4{11 12 "T[] members"}
#4{0 1 ""}
 0}
#9{#4{9 10 "129170464"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 2 0.4 0 0 #4{13 14 "stringBuilder"}
 1.4 1.88 5.2 19  26 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{13 14 "stringBuilder"}
#4{20 21 "static StringBuilder"}
#4{0 1 ""}
#8{16 0}
#8{16 0}
#4{0 2 ""}
@0 #4{0 1 ""}
#4{14 15 "[ThreadStatic]"}
}
#3{#4{8 9 "94864352"}
#1{2@0 @0 }
#1{2@0 @0 }
@0  8 1 0.4 0 0 #4{5 6 "Split"}
 1.3 0.88 2 19  7 #4{0 1 ""}
#4{0 1 ""}
@0  0 0 1
 1  1 #4{1025 1026 "\[\n
    List<string> splitArray = splitArrayPool.Count > 0 ? splitArrayPool.Pop() : new List<string>();\n
    splitArray.Clear();\n
    if (json.Length == 2)\n
        return splitArray;\n
    int parseDepth = 0;\n
    stringBuilder.Length = 0;\n
    for (int i = 1; i < json.Length - 1; i++)\n
    \[\n
        switch (json[i])\n
        \[\n
            case '[':\n
            case '\[':\n
                parseDepth++;\n
                break;\n
            case ']':\n
            case '\]':\n
                parseDepth--;\n
                break;\n
            case '\"':\n
                i = AppendUntilStringEnd(true, i, json);\n
                continue;\n
            case ',':\n
            case ':':\n
                if (parseDepth == 0)\n
                \[\n
                    splitArray.Add(stringBuilder.ToString());\n
                    stringBuilder.Length = 0;\n
                    continue;\n
                \]\n
                break;\n
        \]\n
\n
        stringBuilder.Append(json[i]);\n
    \]\n
\n
    splitArray.Add(stringBuilder.ToString());\n
\n
    return splitArray;\n
\]"}
#4{5 6 "Split"}
#4{19 20 "static List<string>"}
#4{11 12 "string json"}
#4{0 1 ""}
 0}
}
:CLSCSSem.1118481{ 56  51 @47 @88 @39 @0 #8{16 0}
#8{16 4@111 @150 @96 @73 }
#8{16 0}
#8{16 6@61 @165 @15 @3 @138 @126 }
#8{16 0}
#8{16 0}
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#8{16 0}
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@27 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#1{16@0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 @0 }
#4{0 1 ""}
#8{16 0}
 0}
:Float.17{0 }
#12{1 }
#12{0 }
#12{1 }
}
