using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TryToSitIK : MonoBehaviour
{
    public ECA_sitActionIK SitAction;
    public ECA_pointingActionIK PointingAction;
    private Transform SitPoint;
    private Transform Destination;
    private Transform Target;

    public static event EventHandler StopPointing;


    [SerializeField]public ECAAnimator EcaAnimator;

    private void Start()
    {
        SitPoint = GameObject.FindGameObjectWithTag("Sit").transform;
        Destination = GameObject.FindGameObjectWithTag("Destination").transform;
        Target = GameObject.FindGameObjectWithTag("Target").transform;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.O))
        {
            SitAction = new ECA_sitActionIK(EcaAnimator, Destination, SitPoint);
            SitAction.StartAction();
        }
        if (Input.GetKeyDown(KeyCode.P)){
            PointingAction = new ECA_pointingActionIK(EcaAnimator, Destination, Target);
            PointingAction.StartAction();
        }

        if (Input.GetMouseButtonDown(0))
        {
            if (StopPointing != null)
                StopPointing(this, EventArgs.Empty);
        }
    }

}
