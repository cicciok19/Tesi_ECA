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
    protected ChairLeftFoot leftFootTransform;
    protected ChairRightFoot rightFootTransform;
    protected ChairDestination destination;


    protected void Awake()
    {
        sitPoint = GetComponentInChildren<ChairSitPoint>();
        leftFootTransform = GetComponentInChildren<ChairLeftFoot>();
        rightFootTransform = GetComponentInChildren<ChairRightFoot>();
        destination = GetComponentInChildren<ChairDestination>();
    }

    //GETTERS START

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

    //GETTERS END


}
