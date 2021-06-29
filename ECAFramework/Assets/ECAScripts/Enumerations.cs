using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum HandSide
{
    LeftHand,
    RightHand,
    BothHands,
    Nothing
}

public enum ScenarioType
{
    Training,
    Rehearsal,
    Examination
}

public enum AvailableTTS
{
    None,
    Azure,
    Tacotron_2
}

public enum SmartActions
{
    firstPaintProximityAction,
    secondPaintProximityAction,
    thirdPaintProximityAction,

    firstPaintInteraction,
    secondPaintInteraction,
    thirdPaintInteraction
}
public enum EventDefinitions
{
    SitDown,
    StandUp,
    PickUp,
    PickDown
}

public class Enumerations : MonoBehaviour
{

}
