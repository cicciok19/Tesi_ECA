/* File SittableObject C# implementation of class SittableObject */



// global declaration start


using System;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;


// global declaration end

public class SittableObject : ECAInteractableObject
{
    public EventHandler SittableBusy;
    public EventHandler SittableFree;

    protected ChairSitPoint sitPoint;
    protected Destination destination;
    protected ChairLeftFoot leftFootTransform;
    protected ChairRightFoot rightFootTransform;


    protected void Awake()
    {
        sitPoint = GetComponentInChildren<ChairSitPoint>();
        leftFootTransform = GetComponentInChildren<ChairLeftFoot>();
        rightFootTransform = GetComponentInChildren<ChairRightFoot>();
        destination = GetComponentInChildren<Destination>();
    
        SetCorrectSitDirection();
    }




    public Transform GetDestination()
    {
      UnityEngine.Assertions.Assert.IsNotNull(destination);
      UnityEngine.Assertions.Assert.IsNotNull(destination.transform);
      return destination.transform;
    }


    public Transform GetSitPoint()
    {
        UnityEngine.Assertions.Assert.IsNotNull(sitPoint);
        UnityEngine.Assertions.Assert.IsNotNull(sitPoint.transform);
        return sitPoint.transform;
    }


    public Transform GetLeftFootTransform()
    {
        UnityEngine.Assertions.Assert.IsNotNull(leftFootTransform);
        UnityEngine.Assertions.Assert.IsNotNull(leftFootTransform.transform);
        return leftFootTransform.transform;
    }


    public Transform GetRightFootTransform()
    {
        UnityEngine.Assertions.Assert.IsNotNull(rightFootTransform);
        UnityEngine.Assertions.Assert.IsNotNull(rightFootTransform.transform);
        return rightFootTransform.transform;
    }


    public void SetCorrectSitDirection()
    {
    
        var destinationTransform = destination.transform;
        var sitPointTransform = sitPoint.transform;
    
        Vector3 dir = (destinationTransform.position - sitPointTransform.position).normalized;
        dir.y = 0;
        sitPoint.transform.forward = dir;

        Debug.DrawRay(sitPoint.transform.position, dir, Color.red, 100);
    }


    [SerializeField]
    public override bool Occupied
    { 
      get{
    	return occupied;
      } 
    
      set{
    	occupied = value;
    	if(occupied)
    	{
    		if(SittableBusy != null)
    			SittableBusy(this, EventArgs.Empty);
    	}
    	else
    	{
    		if(SittableFree != null)
    			SittableFree(this, EventArgs.Empty);
    	}
      } 
    }


}
