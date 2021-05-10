using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LandingAreaCircular : LandingArea
{
    internal float radius;
    internal float innerRadius;

    protected override void Awake()
    {
        base.Awake();

        var renderer = gameObject.GetComponent<Renderer>();
        radius = renderer.bounds.size.x/2;
        innerRadius = 0;
        Debug.Log(this.name + " has radius of: " + radius);
    }

    protected override void Start()
    {
        base.Start();

        if (GetComponentsInChildren<LandingAreaCircular>().Length != 1)
            innerRadius = GetComponentsInChildren<LandingAreaCircular>()[1].radius;
    }
}
