/* File Station C# implementation of class Station */



// global declaration start


using System;
using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

public class Station : MonoBehaviour
{
    public event EventHandler TrainArriving;

    internal Train train;
    internal Binary binary;

    protected LandingArea platform;


    private void OnTrainArriving(object sender, EventArgs e)
    {
        Utility.Log("Train is arriving");
        if(TrainArriving != null)
    	TrainArriving(this, EventArgs.Empty);
    }




    protected void Awake()
    {
      platform = GetComponentInChildren<LandingArea>();
        Assert.IsNotNull(platform);
      train = GameObject.FindObjectOfType<Train>();
        Assert.IsNotNull(train);
        binary = GameObject.FindObjectOfType<Binary>();
    
      train.Arriving += OnTrainArriving;
    }




    public Vector3 GetPositionOnPlatform()
    {
        return Randomize.GetRandomPosition(platform);
    }


}
