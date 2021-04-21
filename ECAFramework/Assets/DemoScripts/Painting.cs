/* File Painting C# implementation of class Painting */



// global declaration start


using System;
using UnityEngine;


// global declaration end

class Painting : MonoBehaviour
{

    protected LookableObject lookable;
    protected Chair chair;


    protected void Awake()
    {
        lookable = GetComponentInChildren<LookableObject>();
        chair = GetComponentInChildren<Chair>();
    }




    public Transform GetChairDestination()
    {
        return chair.GetDestination();
    }

    public Transform GetChairSitPoint()
    {
        return chair.GetSitPoint();
    }

    public Transform[] GetChairEmpties()
    {
        var sitPoint = chair.GetSitPoint();
        var rFoot = chair.GetRightFootTransform();
        var lFoot = chair.GetLeftFootTransform();

        return new Transform[] { sitPoint, rFoot, lFoot };

    }


}
