using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;
using UnityEngine.AI;


/// <summary>
/// Ogni ECANode sarà definito da una o più azioni/animazioni dell'ECA. 
/// es. il nodo ECA_sitNode sarà composto da 3 animazioni:
/// 1. Raggiungi destinazione
/// 2. Voltati
/// 3. Siediti
/// Ogni animazione avrà al suo interno dei metodi che servono a rispondere a cambiamenti di stato/emozioni dovute a comportamenti dell'utente)
/// </summary>
public class ECAAnimationManager : MonoBehaviour
{
    public ECAAnimator ecaAnimator;

    //UTILIZZO UN DIZIONARIO COME ANIMATION GRAPH
    static public Dictionary<int, ECAAction> allECAActions = new Dictionary<int, ECAAction>();
    static public int idx;

    void Start()
    {
        ecaAnimator = GameObject.FindGameObjectWithTag("ECA").GetComponent<ECAAnimator>();

        idx = 0;
        createAnimationGraph();
    }

    /// <summary>
    /// Genera l'animation graph. Devo creare tutte le azioni che deve eseguire l'ECA in maniera sequenziale e corrispondente
    /// con i nodi del Game Graph (definiti nello script ECAGameManager che ho specializzato)
    /// </summary>
    protected void createAnimationGraph()
    {
        //SIT DOWN ANIMATION SETUP
        Transform Destination = GameObject.FindGameObjectWithTag("Destination").transform;
        Transform SitPoint = GameObject.FindGameObjectWithTag("Sit").transform;
        ECA_sitAction sitAction = new ECA_sitAction(ecaAnimator, Destination, SitPoint);
        allECAActions.Add(1, sitAction);

        //PICK UP ANIMATION SETUP
        Transform objToPick = GameObject.FindGameObjectWithTag("Pickable").transform;
        Transform Destination_2 = GameObject.FindGameObjectWithTag("Destination_2").transform;
        ECA_pickUpAction pickUpAction = new ECA_pickUpAction(ecaAnimator, Destination_2, objToPick);
        allECAActions.Add(2, pickUpAction);

    }

    /// <summary>
    /// Viene chiamato dai vari nodi per andare avanti nell'ECA animation graph e iniziare le azioni successive
    /// </summary>
    public static void NextECAAction()
    {
        idx++;
        allECAActions[idx].startAction();
    }


}
