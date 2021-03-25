using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityStandardAssets.Characters.FirstPerson;

public class FPSInteractionManager : MonoBehaviour {

    //Player's camera
    [SerializeField] private Transform fpsCameraT;
    //Max Length ray
    [SerializeField] private float interactionDistance;
    //Red Dot
    [SerializeField] private Image target;
    //Position for taken objects
    [SerializeField] private GameObject takenObjPosition;

    public Interactable TakenObj { get; set; }
    public Interactable lastHitObj = null;
    
    //Ray's point of origin
    private Vector3 rayOrigin;
    //Player
    private CharacterController fpsController;

    public static FPSInteractionManager Instance { get; private set; }

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            #if UNITY_EDITOR
            Utility.LogError("ERROR!!!! you can not use more than one IntentManager");
            UnityEditor.EditorApplication.isPlaying = false;
            #else
                Application.Quit();
            #endif
        }
        else
            Instance = this;
    }

    public float InteractionDistance
    {
        get { return interactionDistance; }
        set { interactionDistance = value; }
    }
    void Start () {
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        fpsController = player.GetComponent<CharacterController>();
        fpsCameraT = player.transform.GetChild(0).GetComponent<Camera>().transform;
        StartInteractionManager = true;
        target.enabled = true;
    }	
	void Update () {

        //Leaving taken object
        //if (TakenObj != null && Input.GetKeyDown(KeyCode.E))
        if (TakenObj != null && Input.GetMouseButtonDown(0))
        {
            TakenObj.Leave();
            return;
        }

        if (TakenObj == null)
        {
            target.enabled = true;
            CheckInteraction();
        }
        else
            target.enabled = false;
    }
    private void CheckInteraction()
    {
        rayOrigin = fpsCameraT.position + fpsController.radius * fpsCameraT.forward;
        Ray ray = new Ray(rayOrigin, fpsCameraT.forward);
        RaycastHit hit;

        //hitting nothing but in the previous frame an object was hit
        if (!Physics.Raycast(ray, out hit, InteractionDistance) && lastHitObj!=null)
        {
            lastHitObj.StopWatching();
            lastHitObj = null;
            return;
        }
        if(Physics.Raycast(ray, out hit, InteractionDistance))
        {
            GameObject hittingObj = hit.transform.gameObject;
            Interactable currentHitPositionable = hittingObj.GetComponent<Interactable>();

            //disabled script
            if (currentHitPositionable != null && !currentHitPositionable.enabled)
                return;

            //stop hitting an Obj hit in the previous frame
            if (lastHitObj!=null && lastHitObj != currentHitPositionable)
            {
                lastHitObj.StopWatching();
                lastHitObj = null;
                return;
            }

            //continue hitting Obj of last frame. Therefore, check an Interaction
            else if(lastHitObj!=null && lastHitObj == currentHitPositionable)
            {
                // check if user interact with it
                //if (Input.GetKeyDown(KeyCode.E))
                if(Input.GetMouseButtonDown(0))
                {
                    //INTERACT!!!!
                    currentHitPositionable.Take();
                    StartInteractionManager = false;
                    return;
                }
            }

            //Start hitting a new obj
            else if (currentHitPositionable != null)
            {
                lastHitObj = currentHitPositionable;
                lastHitObj.Watching();
            }
        }
    }
    public bool StartInteractionManager { get; set; }
}
