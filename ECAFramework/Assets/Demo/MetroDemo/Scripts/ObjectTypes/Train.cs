/* File Train C# implementation of class Train */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor.Animations;
using UnityEngine;


// global declaration end

public class Train : MonoBehaviour
{
    public event EventHandler Arriving;
    public event EventHandler DoorsOpen;
    private Animator trainAnimator;

    private TrainDoor[] doors;
    private ECAInteractableObject[] places;

    public int passengers;
    private bool doorsOpened;
    private bool arrived;
    public bool trainStopped;

    protected void Start()
    {
        doors = GetComponentsInChildren<TrainDoor>();
        places = GetComponentsInChildren<ECAInteractableObject>();
        trainAnimator = GetComponent<Animator>();
        StartCoroutine(WaitArriving());
        //StartCoroutine(WaitDoorsOpen());

        doorsOpened = false;
        arrived = false;
    }

    private IEnumerator WaitArriving()
    {
        yield return new WaitForSeconds(10f);

        trainAnimator.SetTrigger("LaunchTrain");
        
        arrived = true;
        if (Arriving != null)
            Arriving(this, EventArgs.Empty);
        
    }

    public void NotifyDoorsOpen()
    {
        DoorsOpened = true;
        if (DoorsOpen != null)
            DoorsOpen(this, EventArgs.Empty);
    }


    private IEnumerator WaitDoorsOpen()
    {
        yield return new WaitForSeconds(10f);
        
        doorsOpened = true;

        //"apro" le porte
        foreach (var d in doors)
            d.enabled = false;

        if(DoorsOpen!=null)
            DoorsOpen(this, EventArgs.Empty);
        Utility.Log("Train is arrived, you can go in");
    }

    public TrainDoor[] GetTrainDoors()
    {
        return doors;
    }


    public ECAInteractableObject[] GetPassengerPlaces()
    {
        return places;
    }


    public Vector3 NearestDoorPosition(Vector3 ecaPosition)
    {
        return Randomize.GetRandomPosition(NearestDoor(ecaPosition).FrontDoor);
    }


    public TrainDoor NearestDoor(Vector3 ecaPosition)
    {
      TrainDoor closest = null;
      float distance = Mathf.Infinity;
    
      foreach(var door in doors)
      {
    	float distanceToDoor = Vector3.Distance(ecaPosition, door.transform.position);
    	if(distanceToDoor < distance)
    	{
    		distance = distanceToDoor;
    		closest = door;
    	}
      }
    
      return closest;
    }


    public bool DoorsOpened
    { get => doorsOpened; private set => doorsOpened=value; }


    public bool TrainArrived
    { get => arrived; private set => arrived=value; }


}
