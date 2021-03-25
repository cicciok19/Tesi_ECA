using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour
{
    public GameObject AcceptableArea;
    public GameObject IdealArea;

    [HideInInspector] public GameObject InteractableObj;
    [HideInInspector] public Material GameObjMaterial;
    [HideInInspector] public Rigidbody GameObjRigidBody;
    [HideInInspector] public GameObject TargetPosition;
    [HideInInspector] public Collider AcceptableAreaCollider;
    [HideInInspector] public Collider IdealAreaCollider;

    public event EventHandler OnWatching;
    public event EventHandler OnStopWatcing;
    public event EventHandler OnTaking;
    public event EventHandler OnLeaving;
    public event EventHandler OnTouching;

    public virtual void Awake()
    {
        InteractableObj = this.gameObject;
        GameObjMaterial = GetComponent<Renderer>().material;
        GameObjRigidBody = GetComponent<Rigidbody>();
        TargetPosition = GameObject.FindGameObjectWithTag("TakenTarget");
        AcceptableAreaCollider = AcceptableArea.GetComponent<Collider>();
        IdealAreaCollider = IdealArea.GetComponent<Collider>();

        AcceptableArea.GetComponent<Renderer>().enabled = false;
        IdealArea.GetComponent<Renderer>().enabled = false;
    }

    public virtual void Watching()
    {
        Utility.Log("WATCHING " + this.gameObject.name);
        if (OnWatching != null)
            OnWatching(this, EventArgs.Empty);
    }

    public virtual void StopWatching()
    {
        Utility.Log("STOP TO WATCH " + this.gameObject.name);
        if (OnStopWatcing != null)
            OnStopWatcing(this, EventArgs.Empty);
    }

    public virtual void Take()
    {
        Utility.Log("WANT TO TAKE " + this.gameObject.name);
        if (OnTaking != null)
            OnTaking(this, EventArgs.Empty);
    }

    public virtual void Leave()
    {
        Utility.Log("WANT TO LEAVE " + this.gameObject.name);
        if (OnLeaving != null)
            OnLeaving(this, EventArgs.Empty);
    }

    public virtual void Touch()
    {
        Utility.Log("TOUCH " + this.gameObject.name);
        if (OnTouching != null)
            OnTouching(this, EventArgs.Empty);
    }
    
    public virtual void BehaviourOnTaken()
    {
        GameObjRigidBody.useGravity = false; //disable gravity
        InteractableObj.transform.parent = TargetPosition.transform; //make child of target position
        InteractableObj.transform.position = TargetPosition.transform.position; //set position
        InteractableObj.transform.forward = -GameObject.FindGameObjectWithTag("Player").transform.forward; //align with player forward
        GameObjMaterial.DisableKeyword("_EMISSION");
        InteractableObj.GetComponent<Collider>().enabled = false;
    }

    public virtual void BehaviourOnNoMoreGraspable()
    {
        GameObjMaterial.DisableKeyword("_EMISSION");
    }

    public virtual void BehaviourOnGraspable()
    {
        GameObjMaterial.EnableKeyword("_EMISSION");
    }

    public virtual void BehaviourOnLeave()
    {
        FPSInteractionManager.Instance.TakenObj = null;
        InteractableObj.GetComponent<Collider>().enabled = true;
        InteractableObj.transform.parent = null;
        GameObjRigidBody.useGravity = true;
    }

    public virtual void OnDisable()
    {
        AcceptableArea.GetComponent<Renderer>().enabled = false;
        IdealArea.GetComponent<Renderer>().enabled = false;
    }
    
    public virtual void OnEnable()
    {
        Utility.Log(this.GetType() + " Script enabled!!");
        /*
        AcceptableArea.GetComponent<Renderer>().enabled = true;
        IdealArea.GetComponent<Renderer>().enabled = true;
        */
    }
    
}
