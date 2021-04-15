using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;
using UnityEngine.AI;



public enum ECAActions
{
    SitAction,
    PickUpAction,
    FollowAction,
    GoToAction
}
/// <summary>
/// Ogni ECAAction sarà definito da una o più azioni/animazioni dell'ECA. 
/// es. il nodo ECA_sitAction sarà composto da 3 animazioni:
/// 1. Raggiungi destinazione
/// 2. Voltati
/// 3. Siediti
/// Ogni animazione avrà al suo interno dei metodi che servono a rispondere a cambiamenti di stato/emozioni dovute a comportamenti dell'utente)
/// </summary>
public class ECAAnimationManager : MonoBehaviour
{
    public ECAAnimator ecaAnimator;

    //UTILIZZO UN DIZIONARIO COME ANIMATION GRAPH
    static public Dictionary<ECAActions, ECAAction> allECAActions = new Dictionary<ECAActions, ECAAction>();
    static public Dictionary<int, ECAAction> AnimationGraph = new Dictionary<int, ECAAction>();
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
    protected virtual void createAnimationGraph()
    {


    }

    /// <summary>
    /// Viene chiamato dai vari nodi per andare avanti nell'ECA animation graph e iniziare le azioni successive
    /// </summary>
    public static void NextECAAction()
    {
        idx++;
        AnimationGraph[idx].startAction();
    }

    /// <summary>
    /// Permette di chiamare una qualsiasi ECA Action da qualsiasi punto del codice
    /// </summary>
    /// <param name="actionID"></param>
    public static void StartECAAction(ECAActions actionID)
    {
        allECAActions[actionID].startAction();
    }


}
