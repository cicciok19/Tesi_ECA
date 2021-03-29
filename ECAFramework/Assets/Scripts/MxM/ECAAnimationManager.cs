using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MxM;
using UnityEngine.AI;

public class ECAAnimationManager : MonoBehaviour
{
    public ECAAnimator ecaAnimator;
    public bool strafing;

    //UTILIZZO UN DIZIONARIO COME ANIMATION GRAPH
    static public Dictionary<EventDefinitions, ECAAnimation> allAnimations = new Dictionary<EventDefinitions, ECAAnimation>();

    private float acceptanceAngle;

    void Start()
    {
        ecaAnimator = GameObject.FindGameObjectWithTag("ECA").GetComponent<ECAAnimator>();
        acceptanceAngle = 0.2f;

        createAnimationGraph();

        strafing = true;
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

}
