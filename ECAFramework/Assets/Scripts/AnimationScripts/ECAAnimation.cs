using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;

public class ECAAnimation : MonoBehaviour
{
    /// <summary>
    /// RICODA DI AGGIUNGERE LE VARIE AZIONI IN CONFIGURATION NELL'ENUM
    /// </summary>
    private string eventID;

    //Logica dell'evento in questione
    public virtual void actionStateUpdate()
    {
        print("ANIMATION STATE UPDATED");
    }

    public virtual void actionFinished()
    {
        print("ANIMATION ACTION FINISHED");
    }

    public virtual void actionStart()
    {
        print("ANIMATION ACTION START");
    }

    public virtual void actionLabelUpdate()
    {
        print("ANIMATION LABEL UPDATED");
    }

    
}
