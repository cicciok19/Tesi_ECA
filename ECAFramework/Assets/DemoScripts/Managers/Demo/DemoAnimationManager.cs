using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DemoAnimationManager : ECAAnimationManager
{
    protected override void createAnimationGraph()
    {
        //SIT DOWN ANIMATION SETUP
        Transform Destination_2 = GameObject.FindGameObjectWithTag("Destination_2").transform;
        Transform SitPoint = GameObject.FindGameObjectWithTag("Sit").transform;
        ECA_sitAction SitAction = new ECA_sitAction(ecaAnimator, Destination_2, SitPoint);
        allECAActions.Add(ECAActions.SitAction, SitAction);
        print("ANIMAZIONE AGGIUNTA");
        //AnimationGraph.Add(1, sitAction);

        //PICK UP ANIMATION SETUP
        Transform ObjToPick = GameObject.FindGameObjectWithTag("Pickable").transform;
        Transform DestinationObject = GameObject.FindGameObjectWithTag("DestinationObject").transform;
        ECA_pickUpAction PickUpAction = new ECA_pickUpAction(ecaAnimator, DestinationObject, ObjToPick);
        allECAActions.Add(ECAActions.PickUpAction, PickUpAction);
        //AnimationGraph.Add(1, pickUpAction);

        //GO TO ACTION SETUP
        Transform Destination = GameObject.FindGameObjectWithTag("Destination").transform;
        Transform LookAtObejct = GameObject.FindGameObjectWithTag("Paint_1").transform;
        ECA_goToAction GoToAction = new ECA_goToAction(ecaAnimator, Destination, LookAtObejct);
        allECAActions.Add(ECAActions.GoToAction, GoToAction);
    }
}
