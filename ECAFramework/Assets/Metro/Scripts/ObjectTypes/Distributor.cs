using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Distributor : QueueableObject
{
    private Destination[] destinations;
    private ECAButton[] buttons;
    private RetireProduct retireProduct;
    private EnterMoney enterMoney;

    // Start is called before the first frame update
    private void Awake()
    {
        destinations = GetComponentsInChildren<Destination>();
        buttons = GetComponentsInChildren<ECAButton>();
        retireProduct = GetComponentInChildren<RetireProduct>();
        enterMoney = GetComponentInChildren<EnterMoney>();
    }

    public Transform GetEnterMoney()
    {
        return enterMoney.transform;
    }

    public ECAButton GetRandomButton()
    {
        int randomIndex = Random.Range(0, buttons.Length);
        return buttons[randomIndex];
    }

    public Transform GetProduct()
    {
        GameObject bottle = (GameObject)GameObject.Instantiate(Resources.Load("Prefab/DrinkBottle"), retireProduct.transform);
        bottle.transform.localPosition = new Vector3(0, 0, 0);
        return bottle.transform;
    }

    public Transform GetBottle()
    {
        GameObject bottle = (GameObject)GameObject.Instantiate(Resources.Load("Prefab/DrinkBottle"), retireProduct.transform);
        bottle.transform.localPosition = new Vector3(0, 0, 0);
        return bottle.transform;
    }

}
