using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PressableObject : MonoBehaviour
{
    private GameObject pressPosition = null;
    private void Awake()
    {
        pressPosition = new GameObject(name + "_PressPosition");
        pressPosition.transform.parent = transform;

        pressPosition.transform.position = Vector3.zero;
        pressPosition.transform.rotation = Quaternion.identity;
        pressPosition.transform.localScale = Vector3.one;
    }

    public GameObject GetPressPosition()
    {
        GameObject gop = Instantiate(pressPosition);
        //gop.GetComponent<Renderer>().enabled = false;
        gop.transform.parent = transform;
        gop.transform.localPosition = Vector3.zero;
        return gop;
    }
}
