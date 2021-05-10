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
    internal VendingMachine[] vendingMachines;

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
        Assert.IsNotNull(binary);
        vendingMachines = GetComponentsInChildren<VendingMachine>();
        Assert.IsNotNull(vendingMachines);


        train.Arriving += OnTrainArriving;
    }

    public LandingArea GetPlatform()
    {
        return platform;
    }

    public VendingMachine GetVendingMachine()
    {
        VendingMachine vendingMachine = null;
        int min = 0;

        foreach(VendingMachine vm in vendingMachines)
        {
            if(vm.EcasQueue <= min)
            {
                vendingMachine = vm;
                min = vm.EcasQueue;
            }
        }

        Assert.IsNotNull(vendingMachine);
        return vendingMachine;
    }


}
