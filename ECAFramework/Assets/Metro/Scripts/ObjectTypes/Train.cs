/* File Train C# implementation of class Train */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


// global declaration end

public class Train : MonoBehaviour
{
    public event EventHandler Arriving;
    public event EventHandler DoorsOpen;

    private TrainDoor[] doors;
    private ECAInteractableObject[] places;

    protected LandingArea landingArea;

    public int passengers;


    private IEnumerator WaitArriving()
    {
        yield return new WaitForSeconds(20f);
        if (Arriving != null)
            Arriving(this, EventArgs.Empty);
    
        StartCoroutine(WaitDoorsOpen());
    }


    private IEnumerator WaitDoorsOpen()
    {
        yield return new WaitForSeconds(10f);
        if (DoorsOpen != null)
            DoorsOpen(this, EventArgs.Empty);
    }




    protected void Start()
    {
        doors = GameObject.FindObjectsOfType<TrainDoor>();
        places = GameObject.FindObjectsOfType<ECAInteractableObject>();
        landingArea = GameObject.FindObjectOfType<LandingArea>();
        StartCoroutine(WaitArriving());
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


}
