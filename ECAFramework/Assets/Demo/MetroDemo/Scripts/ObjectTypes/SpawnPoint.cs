using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnPoint : MonoBehaviour
{
    private float creationInterval;
    private const int PASSENGER_NUMBER = 15;
    private int actualNumber;

    void Start()
    {
        actualNumber = 0;
        creationInterval = 2f;
        CreatePassenger();
    }

    private void CreatePassenger()
    {
        GameObject p = (GameObject)GameObject.Instantiate(Resources.Load("Prefab/Passenger"), this.transform.position, this.transform.rotation);
        p.GetComponent<Passenger>().Init();
        ActualNumber++;
    }

    private IEnumerator WaitInterval()
    {
        yield return new WaitForSeconds(creationInterval);
        CreatePassenger();
    }

    private int ActualNumber
    {
        get => actualNumber;
        set
        {
            actualNumber++;
            if (actualNumber <= PASSENGER_NUMBER)
                StartCoroutine(WaitInterval());
        }
    }

}
