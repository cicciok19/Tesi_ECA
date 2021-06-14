using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Drawer : MonoBehaviour
{
    [SerializeField] private float openingPosition = -0.25f;
    [SerializeField] private float closingPosition = 0f;
    private float actualPosition;

    private Medicine medicine;
    private GrabbableObject handle;
    private Vector3 destination;

    public event EventHandler DrawerOpened;
    public event EventHandler DrawerClosed;


    private void Start()
    {
        medicine = GetComponentInChildren<Medicine>();
        handle = GetComponentInChildren<GrabbableObject>();
        //just for debug
        //StartOpening();
    }
    public void StartOpening()
    {
        actualPosition = this.transform.localPosition.x;
        StartCoroutine(Opening());
    }

    private IEnumerator Opening()
    {   
        while(actualPosition > openingPosition)
        {
            actualPosition -= 0.01f;
            this.transform.localPosition = new Vector3(actualPosition, this.transform.localPosition.y, this.transform.localPosition.z);
            yield return new WaitForSeconds(.007f);
        }

        if (DrawerOpened != null)
            DrawerOpened(this, EventArgs.Empty);
    }

    public void StartClosing()
    {
        actualPosition = this.transform.localPosition.x;
        StartCoroutine(Closing());
    }

    private IEnumerator Closing()
    {
        while (actualPosition < closingPosition)
        {
            actualPosition += 0.01f;
            this.transform.localPosition = new Vector3(actualPosition, this.transform.localPosition.y, this.transform.localPosition.z);
            yield return new WaitForSeconds(.007f);
        }

        if (DrawerClosed != null)
            DrawerClosed(this, EventArgs.Empty);
    }

    public Medicine GetMedicine()
    {
        return medicine;
    }

    public GrabbableObject GetHandle()
    {
        return handle;
    }

    public void SetDestination(Transform d)
    {
        destination = d.position;
    }

    public Vector3 GetDestination()
    {
        return destination;
    }
}
