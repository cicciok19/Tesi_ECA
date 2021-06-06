/* File InitializerDemo C# implementation of class InitializerDemo */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;


// global declaration end

public class InitializerDemo : MonoBehaviour
{

    protected ECA[] ecas = null;


    private void Awake()
    {
        //Init configuration (scenario type, language, smartAction messages, xml files name ecc)
        Configuration.Instance.Init();
    
        //Init all ecas
        ecas = FindObjectsOfType<ECA>();
        for (int i = 0; i < ecas.Length; i++)
            ecas[i].Init();
    
    }


}
