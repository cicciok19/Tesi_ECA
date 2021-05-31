using RootMotion.FinalIK;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PressableObject : MonoBehaviour
{
    private InteractionObject interactionObj;

    private void Awake()
    {
        interactionObj = GetComponent<InteractionObject>();
    }

    public virtual InteractionObject GetInteractionObject()
    {
        return interactionObj;
    }

}
