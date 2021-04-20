/* File Chair C# implementation of class Chair */



// global declaration start


using System;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;


// global declaration end

class Chair : MonoBehaviour
{

    protected ChairSitPoint sitPoint;
    protected ChairLeftFoot leftFootPosition;
    protected ChairRightFoot rightFootPosition;
    protected ChairDestination destination;


    protected void Awake()
    {
        sitPoint = GetComponentInChildren<ChairSitPoint>();
        leftFootPosition = GetComponentInChildren<ChairLeftFoot>();
        rightFootPosition = GetComponentInChildren<ChairRightFoot>();
        destination = GetComponentInChildren<ChairDestination>();
    }




    public Transform GetDestination()
    {
      UnityEngine.Assertions.Assert.IsNotNull(destination);
      UnityEngine.Assertions.Assert.IsNotNull(destination.transform);
      return destination.transform;
    }


}
