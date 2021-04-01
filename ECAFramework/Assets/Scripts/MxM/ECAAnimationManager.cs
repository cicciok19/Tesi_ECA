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
    public bool strafing;
    public bool goingTo;

    //UTILIZZO UN DIZIONARIO COME ANIMATION GRAPH
    static public Dictionary<EventDefinitions, ECAAnimation> allAnimations = new Dictionary<EventDefinitions, ECAAnimation>();

    private float acceptanceAngle;

    void Start()
    {
        ecaAnimator = GameObject.FindGameObjectWithTag("ECA").GetComponent<ECAAnimator>();
        acceptanceAngle = 0.2f;

        createAnimationGraph();

        strafing = true;
        goingTo = false;
    }

    void Update()
    {
        if (strafing)
        {
            ecaAnimator.LookAt();
        }
        
    }

    protected void createAnimationGraph()
    {
        //SIT DOWN ANIMATION SETUP
        Transform Destination = GameObject.FindGameObjectWithTag("Destination").transform;
        Transform SitPoint = GameObject.FindGameObjectWithTag("Sit").transform;
        allAnimations.Add(EventDefinitions.SitDown, new SitEvent(ecaAnimator, SitPoint, Destination));
    }

    protected void checkGoingTo()
    {
    }

}
