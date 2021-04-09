using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoAnimationManager : ECAAnimationManager
{
    protected override void createAnimationGraph()
    {
        //SIT DOWN ANIMATION SETUP
        Transform Destination = GameObject.FindGameObjectWithTag("Destination").transform;
        Transform SitPoint = GameObject.FindGameObjectWithTag("Sit").transform;
        ECA_sitAction sitAction = new ECA_sitAction(ecaAnimator, Destination, SitPoint);
        allECAActions.Add(ECAActions.SitAction, sitAction);
        print("ANIMAZIONE AGGIUNTA");
        //AnimationGraph.Add(1, sitAction);

        //PICK UP ANIMATION SETUP
        Transform objToPick = GameObject.FindGameObjectWithTag("Pickable").transform;
        Transform Destination_2 = GameObject.FindGameObjectWithTag("Destination_2").transform;
        ECA_pickUpAction pickUpAction = new ECA_pickUpAction(ecaAnimator, Destination_2, objToPick);
        allECAActions.Add(ECAActions.PickUpAction, pickUpAction);
        //AnimationGraph.Add(1, pickUpAction);
    }
}
