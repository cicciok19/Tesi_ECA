/* File Utility C# implementation of class Utility */



// global declaration start


using System;
using System.Diagnostics;
using UnityEngine;

// global declaration end

public static class Utility
{


    public static void Log(string arg)
    {
        //if(UnityEngine.Debug.isDebugBuild)
        {
#if UNITY_EDITOR || !UNITY_WSA

            StackFrame frame = new StackFrame(1);

            var method = frame.GetMethod();
            var type = method.DeclaringType;
            var name = method.Name;

            UnityEngine.Debug.Log(type + "::" + name + " " + arg);

#else
    /*
    	StackTrace st = new StackTrace(new Exception(), true);
    
    	StackFrame frame = st.GetFrames()[1];
    
     	var method = frame.GetMethod();
    	var type = method.DeclaringType;
    	var name = method.Name;
    
    	UnityEngine.Debug.Log(type + "::" + name + " " + arg);
    */
    	UnityEngine.Debug.Log(arg);
    
#endif
        }
    }


    public static void LogWarning(string arg)
    {
        //if(UnityEngine.Debug.isDebugBuild)
        {
#if UNITY_EDITOR || !UNITY_WSA

            StackFrame frame = new StackFrame(1);

            var method = frame.GetMethod();
            var type = method.DeclaringType;
            var name = method.Name;

            UnityEngine.Debug.LogWarning(type + "::" + name + " " + arg);

#else
    	
    	UnityEngine.Debug.LogWarning(arg);
    
#endif
        }
    }


    public static void LogError(string arg)
    {
        //if(UnityEngine.Debug.isDebugBuild)
        {
#if UNITY_EDITOR || !UNITY_WSA

            StackFrame frame = new StackFrame(1);

            var method = frame.GetMethod();
            var type = method.DeclaringType;
            var name = method.Name;

            UnityEngine.Debug.LogError(type + "::" + name + " " + arg);

#else
    	
    	UnityEngine.Debug.LogError(arg);
    
#endif
        }
    }


    public static GameObject EnableAllRenderers(this GameObject go, bool enable)
    {
        Renderer[] renderers = go.GetComponentsInChildren<Renderer>(true);
        if (renderers == null)
            return go;

        for (int i = 0; i < renderers.Length; i++)
            renderers[i].enabled = enable;

        return go;
    }


    public static MonoBehaviour EnableAllRenderers(this MonoBehaviour mb, bool enable)
    {
        if (mb.gameObject == null)
            return mb;

        Renderer[] renderers = mb.gameObject.GetComponentsInChildren<Renderer>(true);
        if (renderers == null)
            return mb;

        for (int i = 0; i < renderers.Length; i++)
            renderers[i].enabled = enable;

        return mb;
    }


    public static Transform GetChildRecursive(this Transform t, string name)
    {
        int numChildren = t.childCount;
        for (int i = 0; i < numChildren; ++i)
        {
            Transform child = t.GetChild(i);
            if (child.name == name)
            {
                return child;
            }
            Transform foundIt = child.GetChildRecursive(name);
            if (foundIt != null)
            {
                return foundIt;
            }
        }
        return null;
    }


    public static float Remap(this float value, float fromMin, float fromMax, float toMin, float toMax)
    {
        return (value - fromMin) / (fromMax - fromMin) * (toMax - toMin) + toMin;
    }


}
