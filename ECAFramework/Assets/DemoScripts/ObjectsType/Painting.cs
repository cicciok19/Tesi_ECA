/* File Painting C# implementation of class Painting */



// global declaration start


using System;
using UnityEngine;


// global declaration end

class Painting : MonoBehaviour
{

    private bool occupied;

    protected LookableObject lookable;

    public int id;


    protected void Awake()
    {
        lookable = GetComponentInChildren<LookableObject>();
        chair = GetComponentInChildren<SittableObject>();
    }




    public Transform GetChairSitPoint()
    {
        return chair.GetSitPoint();
    }


    public Transform GetChairDestination()
    {
        return chair.GetDestination();
    }


    public Transform[] GetChairEmpties()
    {
        var sitPoint = chair.GetSitPoint();
        var rFoot = chair.GetRightFootTransform();
        var lFoot = chair.GetLeftFootTransform();
    
        return new Transform[] { sitPoint, rFoot, lFoot };
    }


    public Transform GetLookableObject()
    {
        return lookable.transform;
    }


    public SittableObject chair
    {
      set; get;
    }


    public bool Occupied
    { get { return occupied; } set { occupied = value; } }


}
