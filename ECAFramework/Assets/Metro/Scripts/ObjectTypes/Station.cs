/* File Station C# implementation of class Station */



// global declaration start


using System;
using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

public class Station : MonoBehaviour
{
    internal Train train;
    internal VendingMachine[] vendingMachines;
    internal Distributor[] distributors;

    protected LandingArea platform;

    protected void Awake()
    {
        platform = GetComponentInChildren<LandingArea>();
        Assert.IsNotNull(platform);
        train = GameObject.FindObjectOfType<Train>();
        Assert.IsNotNull(train);
        vendingMachines = GetComponentsInChildren<VendingMachine>();
        Assert.IsNotNull(vendingMachines);
        distributors = GetComponentsInChildren<Distributor>();
        Assert.IsNotNull(distributors);
    }




    public LandingArea GetPlatform()
    {
        return platform;
    }


    //get vending machine with less queue (to be corrected)
    public VendingMachine GetVendingMachine()
    {
        VendingMachine vendingMachine = null;
        int min = 1000000;
    
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

    //get nearest vending machine
    public VendingMachine GetVendingMachine(ECA eca)
    {
        VendingMachine vendingMachine = null;
        float min = Mathf.Infinity;
    
        foreach(VendingMachine vm in vendingMachines)
        {
            float distance = Vector3.Distance(eca.transform.position, vm.transform.position);
            if(distance <= min && !vm.Full)
            {
                vendingMachine = vm;
                min = distance;
            }
        }

        Assert.IsNotNull(vendingMachine);
        return vendingMachine;
    }

    //get nearest distributor
    public Distributor GetDistributor(ECA eca)
    {
        Distributor distributor = null;
        float min = Mathf.Infinity;

        foreach (Distributor d in distributors)
        {
            float distance = Vector3.Distance(eca.transform.position, d.transform.position);
            if (distance <= min && !d.Full)
            {
                distributor = d;
                min = distance;
            }
        }

        Assert.IsNotNull(distributor);
        return distributor;
    }


}
